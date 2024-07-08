local l_InsertService_0 = game:GetService("InsertService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.IncrementCharacterModelVersion);
local v3 = require(l_Modules_0.AvatarExperience.Catalog.Actions.IncrementTryOnCharacterModelVersion);
local v4 = require(l_Modules_0.LuaApp.mutedError);
local v5 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v6 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v8 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.PPEThumbnailType);
local v9 = require(l_Modules_0.AvatarExperience.Common.Utils);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v11 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXAvatarWidgetTryOn);
local v12 = {};
v12.__index = v12;
local function _(v13)
    return v13:IsA("Tool");
end;
local function _(v15)
    return v15:IsA("Script");
end;
local function v17(v18)
    for _, v20 in v18:GetChildren() do
        if v20:IsA("Script") then
            v20.Disabled = true;
        end;
        v17(v20);
    end;
end;
local function _(v21)
    local l_assets_0 = v21.assets;
    if l_assets_0 then
        local v23 = l_assets_0[v5.AssetTypeIdStrings.Gear];
        if v23 then
            return v23[1];
        else
            return ;
        end;
    else
        return ;
    end;
end;
v12.new = function(v25, v26, v27)
    local v28 = {};
    setmetatable(v28, v12);
    v28.store = v25;
    v28.characterManager = v27;
    v28.animationManager = v26;
    v28.animationManager:setToolManager(v28);
    v28.equippedToolModel = nil;
    v28.isCurToolTryOn = false;
    v28.destroyed = false;
    v28.curToolId = nil;
    return v28;
end;
v12.getEquippedToolModel = function(v29)
    return v29.equippedToolModel;
end;
v12.checkAndEquipTool = function(v30)
    local l_EquippedAssets_0 = v30.store:getState().AvatarExperience.AvatarEditor.Character.EquippedAssets;
    local v32 = l_EquippedAssets_0 and l_EquippedAssets_0[v5.AssetTypeIdStrings.Gear];
    if not (not v32 or not next(v32)) then
        v30:loadAndEquipTool(next(v32), false);
    end;
end;
v12.checkOutfitAndEquipTool = function(v33, v34)
    if v33.equippedToolModel then
        v33:unequipTool();
    end;
    local l_assets_1 = v34.assets;
    local v36;
    if l_assets_1 then
        local v37 = l_assets_1[v5.AssetTypeIdStrings.Gear];
        v36 = if v37 then v37[1] else nil;
    else
        v36 = nil;
    end;
    if v36 then
        v33:loadAndEquipTool(v36, true);
    end;
end;
local function _(v38, v39)
    if v38 and v39 then
        if v6.routeIsProfilePictureEditor(v38) then
            if v38.opaque.name == v7.ProfilePictureEditorFinal and v39.AvatarExperience.ProfilePictureEditor.FinalPageViewMode.finalPageViewMode == v8.FullBody then
                return false;
            else
                return true;
            end;
        else
            return false;
        end;
    else
        return false;
    end;
end;
v12.updateAvatarRoute = function(v41, v42, v43)
    v41.currentAvatarRoute = v42;
    local v44 = v42.opaque.name == v7.ProfilePictureEditorFinal;
    local v45 = v43.opaque.name == v7.ProfilePictureEditorFinal;
    local v46 = v6.routeIsProfilePictureEditor(v42);
    local v47 = v6.routeIsProfilePictureEditor(v43);
    if not (v44 == v45) or v46 ~= v47 then
        v41:update(v41.store:getState());
    end;
end;
v12.update = function(v48, v49)
    local l_curToolId_0 = v48.curToolId;
    local v51 = nil;
    for v52, v53 in v49.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems, nil, nil do
        if (not (v11() and not v53.selectedInTryOnManager) and v53.itemType == v5.ItemType.Asset) and v53.itemSubType == v5.AssetTypeIdStrings.Gear then
            if not v11() then
                v51 = v52;
            else
                v51 = v53.itemId;
            end;
        end;
    end;
    local v54 = v9.getEquippedToolId(v49);
    local l_currentAvatarRoute_0 = v48.currentAvatarRoute;
    if not (not not l_currentAvatarRoute_0 and if v49 then if v6.routeIsProfilePictureEditor(l_currentAvatarRoute_0) then l_currentAvatarRoute_0.opaque.name ~= v7.ProfilePictureEditorFinal or v49.AvatarExperience.ProfilePictureEditor.FinalPageViewMode.finalPageViewMode ~= v8.FullBody else false else false) then
        if not v51 then
            if not v54 then
                if not v48.equippedToolModel then
                    v48.curToolId = nil;
                else
                    v48:unequipTool(true);
                end;
            else
                v48:unequipTool(v48.curToolIsTryOn);
                v48:loadAndEquipTool(v54, false);
            end;
        else
            v48:unequipTool();
            v48:loadAndEquipTool(v51, true);
        end;
    else
        v48:unequipTool(true);
    end;
    local v56 = false;
    if v48.curToolId ~= nil then
        v56 = v48.curToolId ~= l_curToolId_0;
    end;
    v48.checkForChangedTool = v56;
end;
v12.loadAndEquipTool = function(v57, v58, v59)
    v57.curToolId = v58;
    task.spawn(function()
        local v60 = nil;
        local _, l_result_0 = pcall(function()
            v60 = l_InsertService_0:LoadAsset(v58);
        end);
        if not v57.destroyed then
            if not l_result_0 and v60 then
                if v58 ~= v57.curToolId then
                    warn("Tool unequipped without getting a chance to get equipped.");
                    v60:Destroy();
                    return ;
                else
                    local _, v64 = next(v60:GetChildren());
                    if not (not v64 or not v64:IsA("Tool")) then
                        v17(v64);
                        v57:equipTool(v64);
                        if v57.checkForChangedTool then
                            v57.checkForChangedTool = false;
                            local l_BoundingBox_0, v66 = v57.characterManager:getCurrentCharacter():GetBoundingBox();
                            if not (v6.isBoundingBoxVectorSane(v66) and v6.isBoundingBoxCFrameSane(l_BoundingBox_0)) then
                                v4("(Avatar Experience) bad bounding box on adding tool: " .. v58);
                            end;
                        end;
                    end;
                    if v59 then
                        v57.curToolIsTryOn = true;
                        v57.store:dispatch(v3());
                    else
                        v57.curToolIsTryOn = false;
                        v57.store:dispatch(v2());
                    end;
                    return ;
                end;
            else
                warn("Error loading tool in CharacterManager: " .. l_result_0);
                return ;
            end;
        else
            if v60 then
                v60:Destroy();
            end;
            return ;
        end;
    end);
end;
v12.equipTool = function(v67, v68)
    v67.equippedToolModel = v68;
    v67.characterManager:getCurrentCharacter().Humanoid:EquipTool(v68);
end;
v12.unequipTool = function(v69, v70)
    v69.curToolId = nil;
    local l_equippedToolModel_0 = v69.equippedToolModel;
    if l_equippedToolModel_0 then
        if v70 then
            if not v69.curToolIsTryOn then
                v69.store:dispatch(v2());
            else
                v69.store:dispatch(v3());
            end;
        end;
        v69.equippedToolModel = nil;
        v69.characterManager:getCurrentCharacter().Humanoid:UnequipTools();
        l_equippedToolModel_0:Destroy();
    end;
end;
v12.notifySwitchedAvatarType = function(v72)
    if v72.equippedToolModel then
        v72:equipTool(v72.equippedToolModel);
    end;
end;
v12.start = function(_)
end;
v12.stop = function(v74)
    local l_EquippedAssets_1 = v74.store:getState().AvatarExperience.AvatarEditor.Character.EquippedAssets;
    local v76 = l_EquippedAssets_1 and l_EquippedAssets_1[v5.AssetTypeIdStrings.Gear];
    if not (v76 and next(v76) or not v74.equippedToolModel) then
        v74:unequipTool();
    end;
    v74:checkAndEquipTool();
end;
v12.onDestroy = function(v77)
    v77.destroyed = true;
end;
return v12;
