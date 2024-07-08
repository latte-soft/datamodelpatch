local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_GuiService_0 = game:GetService("GuiService");
local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local v3 = require(game:GetService("CorePackages").Cryo);
local v4 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v5 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.ToggleEquipAsset);
local v7 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v8 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v9 = require(l_Modules_0.AvatarExperience.Common.Actions.RemoveSaveDelay);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v11 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
local v12 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v13 = require(l_Modules_0.AvatarExperience.Common.Analytics.reportAvatarEventCounterNoAnalyticsArgument);
local v14 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v15 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging);
local v16 = require(l_Modules_0.AvatarExperience.Common.Actions.IncrementSavedCharacterModelVersion);
local v17 = require(l_Modules_0.AvatarExperience.Flags.ColorPickerSliderIXPTest);
local v18 = l_GuiService_0:IsTenFootInterface();
local v19 = {
    toastMessage = "Feature.Avatar.Message.InvalidAssetsEquipped", 
    isLocalized = false, 
    toastType = v8.InformationMessage
};
local v20 = nil;
if v18 then
    v20 = require(l_Modules_0.Shell.EventHub);
end;
local v21 = {};
v21.__index = v21;
local v22 = game:DefineFastInt("AvatarEditorTimeBetweenSaves", 5);
v21.setLastSavedVariables = function(v23)
    local v24 = v23.store:getState();
    local v25 = v11.readTestVariable(v17.EnabledForUser);
    v23.DEPRECATED_lastSavedBodyColors = if v25 then nil else v24.AvatarExperience.AvatarEditor.Character.BodyColors;
    v23.lastSavedBodyColor3s = if not v25 then nil else v24.AvatarExperience.AvatarEditor.Character.BodyColor3s;
    v23.lastSavedAvatarType = v24.AvatarExperience.AvatarEditor.Character.AvatarType;
    v23.lastSavedScales = v24.AvatarExperience.AvatarEditor.Character.AvatarScales;
    v23.lastSavedAssets = v24.AvatarExperience.AvatarEditor.Character.EquippedAssets;
    v23.lastSavedEmotes = v24.AvatarExperience.AvatarEditor.EquippedEmotes.slotInfo;
end;
v21.new = function(v26, v27, v28)
    local v29 = {
        store = v26, 
        connections = {}, 
        networking = v27, 
        analytics = v28
    };
    setmetatable(v29, v21);
    v29.timeOfLastSave = 0;
    v29:setLastSavedVariables();
    return v29;
end;
v21.start = function(v30)
    table.insert(v30.connections, (v30.store.changed:connect(function(v31, v32)
        v30:update(v31, v32);
    end)));
    v30.timeOfLastSave = 0;
    v30.waitingForSave = false;
    v30.characterUpdated = false;
    v30.characterEquipped = false;
    v30:setLastSavedVariables();
end;
v21.update = function(v33, v34, _)
    local v36 = v11.readTestVariable(v17.EnabledForUser);
    local l_BodyColors_0 = v34.AvatarExperience.AvatarEditor.Character.BodyColors;
    local v38 = if not v36 then nil else v34.AvatarExperience.AvatarEditor.Character.BodyColor3s;
    local l_AvatarType_0 = v34.AvatarExperience.AvatarEditor.Character.AvatarType;
    local l_AvatarScales_0 = v34.AvatarExperience.AvatarEditor.Character.AvatarScales;
    local l_EquippedAssets_0 = v34.AvatarExperience.AvatarEditor.Character.EquippedAssets;
    local l_slotInfo_0 = v34.AvatarExperience.AvatarEditor.EquippedEmotes.slotInfo;
    local v43 = false;
    local _ = nil;
    if not (((not if not v36 then l_BodyColors_0 ~= v33.DEPRECATED_lastSavedBodyColors else v38 ~= v33.lastSavedBodyColor3s and l_AvatarType_0 == v33.lastSavedAvatarType) and l_AvatarScales_0 == v33.lastSavedScales) and l_EquippedAssets_0 == v33.lastSavedAssets) or l_slotInfo_0 ~= v33.lastSavedEmotes then
        v43 = true;
    end;
    if not (not v43 or v33.saving) then
        v33:save(false);
    end;
end;
v21.stop = function(v45)
    v45:save(true);
    for _, v47 in v45.connections, nil, nil do
        v47:disconnect();
    end;
    v45.connections = {};
    if v18 then
        spawn(function()
            if v45.characterUpdated then
                v20:dispatchEvent(v20.Notifications.CharacterUpdated);
            end;
            if v45.characterEquipped then
                v20:dispatchEvent(v20.Notifications.CharacterEquipped, v45.store:getState().AvatarExperience.AvatarEditor.Character.EquippedAssets, v45.characterUpdated);
            end;
            v45.characterUpdated = false;
            v45.characterEquipped = false;
        end);
    end;
end;
local function _(v48)
    v48:dispatch(v7(v19));
end;
local function v59(v50)
    local v51 = {};
    local v52 = {};
    for v53, v54 in v5.AssetTypeIdStringToHumanoidDescriptionProp, nil, nil do
        if v5.AssetTypeIdToAccessoryTypeEnum[v53] == nil then
            local v55 = v50[v54];
            if typeof(v55) == "number" and v55 > 0 then
                table.insert(v51, v55);
                v52[v55] = tostring(v53);
            elseif typeof(v55) == "string" and v55 ~= "" then
                for v56 in v55:gmatch("([%d]+),?") do
                    table.insert(v51, (tonumber(v56)));
                    v52[tonumber(v56)] = tostring(v53);
                end;
            end;
        end;
    end;
    for _, v58 in (v50:GetAccessories(true)), nil, nil do
        table.insert(v51, v58.AssetId);
        v52[v58.AssetId] = v5.AccessoryTypeEnumToAssetTypeId[v58.AccessoryType];
    end;
    return v51, v52;
end;
local function v71(v60, v61, v62, v63)
    local v64, v65 = v59(v61);
    local v66 = v3.List.toSet((v59(v62)));
    local v68 = v3.List.filter(v64, function(v67)
        return v66[v67] == nil;
    end);
    for _, v70 in v68, nil, nil do
        if v4.isAssetEquipped(tostring(v70), v65[v70], v63) then
            v60:dispatch(v6(v65[v70], (tostring(v70))));
        end;
    end;
    if #v68 > 0 then
        v60:dispatch(v7(v19));
    end;
end;
v21.shouldDelaySaveManager = function(v72)
    return v72.store:getState().AvatarExperience.AvatarScene.Character.ShouldDelaySaveManager;
end;
v21.save = function(v73, v74)
    v73.saving = true;
    local v75 = v11.readTestVariable(v17.EnabledForUser);
    task.spawn(function()
        local v76 = tick() - v73.timeOfLastSave;
        if not v74 and v76 < v22 then
            task.wait(v22 - v76);
            if v73:shouldDelaySaveManager() then
                v73.store:dispatch(v9());
            end;
        elseif v73:shouldDelaySaveManager() then
            wait(v22);
            v73.store:dispatch(v9());
        end;
        local v77 = nil;
        local v78 = nil;
        if not v75 then
            v77 = v73.store:getState().AvatarExperience.AvatarEditor.Character.BodyColors;
        else
            v78 = v73.store:getState().AvatarExperience.AvatarEditor.Character.BodyColor3s;
        end;
        local l_AvatarType_1 = v73.store:getState().AvatarExperience.AvatarEditor.Character.AvatarType;
        local l_AvatarScales_1 = v73.store:getState().AvatarExperience.AvatarEditor.Character.AvatarScales;
        local l_EquippedAssets_1 = v73.store:getState().AvatarExperience.AvatarEditor.Character.EquippedAssets;
        local l_slotInfo_1 = v73.store:getState().AvatarExperience.AvatarEditor.EquippedEmotes.slotInfo;
        local v83 = {};
        if not v75 then
            v83.BodyColors = v77 ~= v73.DEPRECATED_lastSavedBodyColors;
        else
            v83.BodyColors = v78 ~= v73.lastSavedBodyColor3s;
        end;
        v83.AvatarType = l_AvatarType_1 ~= v73.lastSavedAvatarType;
        v83.Scales = l_AvatarScales_1 ~= v73.lastSavedScales;
        v83.Assets = l_EquippedAssets_1 and l_EquippedAssets_1 ~= v73.lastSavedAssets;
        v83.Emotes = l_slotInfo_1 ~= v73.lastSavedEmotes;
        if (((v83.BodyColors or v83.AvatarType) or v83.Scales) or v83.Assets) or v83.Emotes then
            local v84 = v4.getHumanoidDescriptionFromState(v73.store:getState().AvatarExperience);
            local v85 = Enum.HumanoidRigType[l_AvatarType_1];
            task.spawn(function()
                local v86 = 0;
                if v83.Assets then
                    local v87 = l_EquippedAssets_1[tostring(Enum.AssetType.Gear.Value)];
                    if v87 then
                        local v88, _ = next(v87);
                        if v88 then
                            v86 = tonumber(v88);
                        end;
                    end;
                end;
                local v90 = l_AvatarEditorService_0:NoPromptSaveAvatar(v84, v85, v83, v86);
                while not v90 do
                    l_AvatarEditorService_0.PromptSaveAvatarCompleted:Wait();
                    v90 = l_AvatarEditorService_0:NoPromptSaveAvatar(v84, v85, v83);
                    if v15() then
                        v13(v14.Counter.AvatarEditorServiceErrors.NoPromptSaveAvatar);
                    end;
                end;
                local v91, v92 = l_AvatarEditorService_0.PromptSaveAvatarCompleted:Wait();
                if v91 == Enum.AvatarPromptResult.Success then
                    if not v75 then
                        if v77 ~= v73.DEPRECATED_lastSavedBodyColors then
                            v73.DEPRECATED_lastSavedBodyColors = v77;
                            v73.characterUpdated = true;
                        end;
                    elseif v78 ~= v73.lastSavedBodyColor3s then
                        v73.lastSavedBodyColor3s = v78;
                        v73.characterUpdated = true;
                    end;
                    if l_AvatarType_1 ~= v73.lastSavedAvatarType then
                        v73.lastSavedAvatarType = l_AvatarType_1;
                        v73.characterUpdated = true;
                    end;
                    if l_AvatarScales_1 ~= v73.lastSavedScales then
                        v73.lastSavedScales = l_AvatarScales_1;
                        v73.characterUpdated = true;
                    end;
                    if l_EquippedAssets_1 and l_EquippedAssets_1 ~= v73.lastSavedAssets then
                        v73.lastSavedAssets = l_EquippedAssets_1;
                        v73.characterUpdated = true;
                        v73.characterEquipped = true;
                        v71(v73.store, v84, v92, l_EquippedAssets_1);
                    end;
                    if l_slotInfo_1 ~= v73.lastSavedEmotes then
                        v73.lastSavedEmotes = l_slotInfo_1;
                        v73.characterUpdated = true;
                        v73.characterEquipped = true;
                    end;
                else
                    warn("Failure saving.");
                    if v15() then
                        v13(v14.Counter.AvatarEditorServiceErrors.PromptSaveAvatarCompleted);
                    end;
                end;
                v73.store:dispatch(v16());
                v73.timeOfLastSave = tick();
                v73.saving = false;
            end);
            return ;
        else
            v73.timeOfLastSave = tick();
            v73.saving = false;
            return ;
        end;
    end);
end;
v21.updateAvatarRoute = function(v93, v94, v95)
    if v12.didLeaveAvatarEditor(v94, v95) then
        v93:save(true);
    end;
end;
v21.onDestroy = function(_)
end;
return v21;
