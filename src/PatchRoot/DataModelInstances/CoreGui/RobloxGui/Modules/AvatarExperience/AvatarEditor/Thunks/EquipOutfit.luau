local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.EquipOutfit);
local v3 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.UnequipOutfit);
local v4 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetAvatarType);
local v5 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetAvatarScales);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetBodyColors);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SetBodyColor3sFromOutfit);
local v8 = require(l_Modules_0.AvatarExperience.Common.Actions.ClearTryOns);
local v9 = require(l_Modules_0.AvatarExperience.Common.Actions.StartedWaitingOnLCUpdate);
local v10 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v11 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v13 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v15 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
local v16 = require(l_Modules_0.AvatarExperience.Flags.ColorPickerSliderIXPTest);
local v17 = {
    Torso = "27", 
    RightArm = "28", 
    LeftArm = "29", 
    LeftLeg = "30", 
    RightLeg = "31"
};
local _ = function(v18)
    for _, v20 in v17, nil, nil do
        if not v18[v20] then
            return false;
        end;
    end;
    return true;
end;
return function(v22)
    local l_outfitInfo_0 = v22.outfitInfo;
    local l_analytics_0 = v22.analytics;
    local l_navigation_0 = v22.navigation;
    local l_isSelected_0 = v22.isSelected;
    local l_fromOutfitPurchase_0 = v22.fromOutfitPurchase;
    local l_tryOnBundleInfo_0 = v22.tryOnBundleInfo;
    local l_blockFullReset_0 = v22.blockFullReset;
    return function(v30)
        v11.isType(l_outfitInfo_0, "table", "EquipOutfit thunk expects outfitInfo to be a table");
        v11.isType(l_analytics_0, "table", "EquipOutfit thunk expects analytics");
        v11.isType(l_navigation_0, "table", "EquipOutfit thunk expects navigation");
        v11.isTypeOrNil(l_blockFullReset_0, "boolean", "EquipOutfit thunk expects blockFullReset");
        local l_isEditable_0 = l_outfitInfo_0.isEditable;
        if not l_isEditable_0 then
            local l_assets_0 = l_outfitInfo_0.assets;
            for _, v34 in v17, nil, nil do
                if not l_assets_0[v34] then
                    l_isEditable_0 = false;
                    goto label0 --[[  true, false  ]];
                end;
            end;
            l_isEditable_0 = true;
        end;
        ::label0::;
        if l_analytics_0 then
            l_analytics_0.outfitClicked(l_outfitInfo_0.outfitId, l_outfitInfo_0.outfitType);
        end;
        local v35 = l_outfitInfo_0.outfitType == v13.OutfitTypes.DynamicHead;
        if v35 then
            for v36, _ in v13.DynamicHeadAssetTypes, nil, nil do
                if not l_outfitInfo_0.assets[v36] then
                    l_outfitInfo_0.assets[v36] = {};
                end;
            end;
            l_outfitInfo_0.assets[v13.AssetTypeIdStrings.Head] = {};
        end;
        if not v35 or not l_isSelected_0 then
            v30:dispatch(v9());
            if not l_tryOnBundleInfo_0 then
                v30:dispatch(v2(v10.removeEmoteAnimationAsset(l_outfitInfo_0.assets), l_isEditable_0));
            else
                local v38 = {};
                for v39, v40 in l_outfitInfo_0.assets, nil, nil do
                    local v41 = {};
                    for v42, v43 in v40, nil, nil do
                        if not ((not v43.order or not l_tryOnBundleInfo_0[v42]) or not l_tryOnBundleInfo_0[v42].order) then
                            v43.order = l_tryOnBundleInfo_0[v42].order;
                        end;
                        v41[v42] = v43;
                    end;
                    v38[v39] = v41;
                end;
                local l_l_isEditable_0_0 = l_isEditable_0;
                if l_blockFullReset_0 then
                    l_l_isEditable_0_0 = false;
                end;
                v30:dispatch(v2(v10.removeEmoteAnimationAsset(v38), l_l_isEditable_0_0));
            end;
            if not l_fromOutfitPurchase_0 then
                v30:dispatch(v8());
                v12.closeFiltersAndItemDetails(l_navigation_0);
            end;
            local l_DefaultBodyColorRanges_0 = v30:getState().AvatarExperience.AvatarEditor.DefaultBodyColorRanges;
            if l_isEditable_0 then
                if not v10.isPresetOutfit(l_outfitInfo_0) then
                    if not v15.readTestVariable(v16.EnabledForUser) then
                        v30:dispatch(v6(l_outfitInfo_0.bodyColors));
                    else
                        v30:dispatch(v7(l_outfitInfo_0.bodyColor3s, l_DefaultBodyColorRanges_0));
                    end;
                end;
                v30:dispatch(v5(l_outfitInfo_0.scales));
                v30:dispatch(v4(l_outfitInfo_0.avatarType));
            end;
            return ;
        else
            v30:dispatch(v3(l_outfitInfo_0.assets));
            return ;
        end;
    end;
end;
