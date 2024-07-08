local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.tutils);
local v4 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.ToggleEquipAsset);
local v5 = require(l_Modules_0.AvatarExperience.Common.Actions.ClearTryOns);
local v6 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v8 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v9 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.ClearCurrentSort);
local v10 = require(l_Modules_0.AvatarExperience.Common.Actions.StartedWaitingOnLCUpdate);
local v11 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v14 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXRestrictBodyRemoval);
local l_MaxHats_0 = v7.MaxHats;
local v16 = {
    toastMessage = "Feature.Avatar.Message.HatLimitTooltip", 
    isLocalized = false, 
    toastType = v11.InformationMessage
};
local v17 = {
    toastMessage = "Feature.Avatar.EmoteAlreadyAssigned", 
    isLocalized = false, 
    toastType = v11.InformationMessage
};
local v18 = not not v14() and {
    [v6.AssetTypeIdStrings.Head] = true, 
    [v6.AssetTypeIdStrings.DynamicHead] = true, 
    [v6.AssetTypeIdStrings.LeftArm] = true, 
    [v6.AssetTypeIdStrings.RightArm] = true, 
    [v6.AssetTypeIdStrings.LeftLeg] = true, 
    [v6.AssetTypeIdStrings.RightLeg] = true, 
    [v6.AssetTypeIdStrings.Torso] = true
} or nil;
local function _(v19, v20, v21)
    if v18[v19] then
        if not ((v21[v19] and next(v21[v19])) == v20) then
            return false;
        else
            return true;
        end;
    else
        return false;
    end;
end;
return function(v23, v24, v25, v26, v27)
    return function(v28)
        local l_EquippedAssets_0 = v28:getState().AvatarExperience.AvatarEditor.Character.EquippedAssets;
        if l_EquippedAssets_0 then
            if not v28:getState().AvatarExperience.LayeredClothingSort.CharacterUpdatesLocked then
                if v14() then
                    local l_v23_0 = v23;
                    if if v18[l_v23_0] then (l_EquippedAssets_0[l_v23_0] and next(l_EquippedAssets_0[l_v23_0])) == v24 else false then
                        return false;
                    end;
                end;
                if not (v26 or v2.isEmpty(v28:getState().AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems)) then
                    v28:dispatch(v5());
                    if v25 then
                        v12.closeFiltersAndItemDetails(v25);
                    end;
                end;
                if v23 == v6.AssetTypeIdStrings.EmoteAnimation then
                    local l_EquippedEmotes_0 = v28:getState().AvatarExperience.AvatarEditor.EquippedEmotes;
                    local v32 = l_EquippedEmotes_0.slotInfo[l_EquippedEmotes_0.selectedSlot];
                    if not (v32 and v32.assetId == v24) then
                        for _, v34 in l_EquippedEmotes_0.slotInfo, nil, nil do
                            if v34.assetId == v24 then
                                v28:dispatch(v8(v17));
                                return ;
                            end;
                        end;
                    end;
                end;
                local v35 = l_EquippedAssets_0[v6.AssetTypeIdStrings.Hat];
                local v36 = 0;
                if v35 then
                    v36 = v3.fieldCount(v35);
                end;
                if not (not (v23 == v6.AssetTypeIdStrings.Hat) or not v35) and l_MaxHats_0 <= v36 then
                    v35 = v35 or {};
                    local v37 = false;
                    if v35[v24] then
                        v37 = true;
                    end;
                    if not v37 then
                        v28:dispatch(v8(v16));
                    end;
                end;
                if #v28:getState().AvatarExperience.LayeredClothingSort.CurrentSort.OrderedList ~= 0 then
                    v28:dispatch(v9());
                end;
                if v6.LayeredAssetTypes[v23] ~= nil then
                    v28:dispatch(v10());
                end;
                v28:dispatch(v4(v23, v24, v27));
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
end;
