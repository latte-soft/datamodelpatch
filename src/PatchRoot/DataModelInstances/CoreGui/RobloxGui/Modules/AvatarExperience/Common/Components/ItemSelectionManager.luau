local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.Cryo);
local v6 = require(l_CorePackages_0.tutils);
local v7 = require(l_Modules_0.AvatarExperience.Common.Thunks.ToggleTryOnThunk);
local v8 = require(l_Modules_0.AvatarExperience.Common.Actions.ClearAnimationPreview);
local v9 = require(l_Modules_0.AvatarExperience.Common.Actions.ClearTryOns);
local v10 = require(l_Modules_0.AvatarExperience.Common.Thunks.StoreAndClearTryOns);
local v11 = require(l_Modules_0.AvatarExperience.Catalog.Actions.ClearAllResultsListFocusedWidgets);
local v12 = require(l_Modules_0.LuaApp.AppPage);
local v13 = require(l_Modules_0.AvatarExperience.Common.Actions.SetOutfitTryOns);
local v14 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v15 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAppRoute);
local v16 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreenProperties);
local v18 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v20 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v21 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v22 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v24 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAccessoryAdjustmentEnabled);
local v25 = require(l_Modules_0.AvatarExperience.Common.Selectors.DEPRECATED_ItemData);
local v26 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectItemInfo);
local v27 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixItemTypeHandling);
local v28 = v2.PureComponent:extend("ItemSelectionManager");
v28.validateProps = v4.strictInterface({
    avatarRoute = v4.table, 
    itemSubType = v4.optional(v4.string), 
    selectedAnimationPreview = v4.optional(v4.string), 
    lastToggledItem = v4.optional(v4.table), 
    lastSavedTriedOnOutfit = v4.optional(v4.table), 
    tryOnItems = v4.optional(v4.table), 
    clearTryOns = v4.callback, 
    storeAndClearTryOns = v4.callback, 
    setOutfitTryOns = v4.callback, 
    clearAnimationPreview = v4.callback, 
    toggleTryOn = v4.callback, 
    clearAllResultsListFocusedWidget = v4.callback, 
    networking = v4.callback, 
    appAnalytics = v4.table, 
    catalogAnalytics = v4.table
});
v28.defaultProps = {
    lastToggledItem = {}
};
v28.render = function(_)
    return nil;
end;
local v30 = {
    [v16.ItemDetails] = true, 
    [v16.TryOnItem] = true
};
local v31 = {
    [v16.LayeredClothingSort] = true, 
    [v16.AccessoryAdjustment] = v24()
};
local function _(v32)
    local l_current_0 = v32.avatarRoute.current;
    if not v30[l_current_0.name] then
        return nil, nil;
    else
        return l_current_0.params.itemId, l_current_0.params.itemType;
    end;
end;
local function _(v35)
    if not v35.isUnequipped then
        if v35.itemType == v18.ItemType.Asset then
            return v18.AssetTypeIdToCategory[v35.itemSubType] ~= v18.AssetCategories.Animation;
        else
            return v35.itemSubType ~= v18.BundleTypeIdStrings.Animations;
        end;
    else
        return true;
    end;
end;
local function _(v37)
    local l_avatarRoute_0 = v37.avatarRoute;
    return v17[l_avatarRoute_0.opaque.name] and not v17[l_avatarRoute_0.opaque.name].isMultiTryOn;
end;
v28.willUpdate = function(v40, v41)
    if not v31[v41.avatarRoute.current.name] then
        local l_current_1 = v41.avatarRoute.current;
        local v43, v44;
        if not v30[l_current_1.name] then
            v43 = nil;
            v44 = nil;
        else
            v43 = l_current_1.params.itemId;
            v44 = l_current_1.params.itemType;
        end;
        l_current_1 = v41.itemSubType;
        local l_avatarRoute_1 = v41.avatarRoute;
        local v46 = v17[l_avatarRoute_1.opaque.name] and not v17[l_avatarRoute_1.opaque.name].isMultiTryOn;
        local l_avatarRoute_2 = v40.props.avatarRoute;
        l_avatarRoute_1 = v17[l_avatarRoute_2.opaque.name] and not v17[l_avatarRoute_2.opaque.name].isMultiTryOn;
        if not (not v46 or l_avatarRoute_1) then
            local l_lastToggledItem_0 = v41.lastToggledItem;
            if not (l_lastToggledItem_0.itemId == v43 and l_lastToggledItem_0.itemType == v44) or l_lastToggledItem_0.itemSubType ~= l_current_1 then
                if v43 ~= nil then
                    v40.props.toggleTryOn(v40.props.networking, v40.props.catalogAnalytics, v44, l_current_1, v43, true, v41.avatarRoute, nil);
                    return ;
                else
                    v40.props.clearTryOns();
                end;
            end;
        end;
        return ;
    else
        return ;
    end;
end;
v28.didUpdate = function(v49, v50)
    if v49.props.selectedAnimationPreview and v49.props.lastToggledItem ~= v50.lastToggledItem then
        local l_lastToggledItem_1 = v49.props.lastToggledItem;
        if not not l_lastToggledItem_1.isUnequipped or if l_lastToggledItem_1.itemType == v18.ItemType.Asset then v18.AssetTypeIdToCategory[l_lastToggledItem_1.itemSubType] ~= v18.AssetCategories.Animation else l_lastToggledItem_1.itemSubType ~= v18.BundleTypeIdStrings.Animations then
            v49.props.clearAnimationPreview();
        end;
    end;
    local l_name_0 = v49.props.avatarRoute.opaque.name;
    local v53 = v17[l_name_0] and v17[l_name_0].isTryOnOutfitResetPage;
    local l_name_1 = v50.avatarRoute.opaque.name;
    local v55 = v17[l_name_1] and v17[l_name_1].isMultiTryOn;
    local v56 = v17[l_name_1] and v17[l_name_1].isRefinementPage;
    if not (not (v53 and l_name_0 ~= l_name_1) or v56) then
        if not v55 then
            v49.props.clearTryOns();
        else
            v49.props.catalogAnalytics.avatarShopLeave(not v49.props.tryOnItems and 0 or v6.fieldCount(v49.props.tryOnItems), l_name_0);
            v49.props.storeAndClearTryOns();
        end;
    end;
    if not ((((not (v17[l_name_0] and v17[l_name_0].isMultiTryOn) or v55) or v17[l_name_0].isRefinementPage) or not v49.props.lastSavedTriedOnOutfit) or v5.isEmpty(v49.props.lastSavedTriedOnOutfit)) then
        v49.props.setOutfitTryOns(v49.props.lastSavedTriedOnOutfit);
    end;
    local v57 = v17[l_name_0] and v17[l_name_0].isRefinementPage;
    if not ((not ((l_name_0 ~= l_name_1 and l_name_1 == v16.Catalog) and l_name_0 ~= v12.ExperienceDetail) or v53) or v57) then
        v49.props.clearAllResultsListFocusedWidget();
    end;
end;
return (v15((l_RoactServices_0.connect({
    catalogAnalytics = v22, 
    appAnalytics = v20, 
    networking = v21
})((v3.connect(function(v58, v59)
    local l_current_2 = v59.avatarRoute.current;
    local v61, v62;
    if not v30[l_current_2.name] then
        v62 = nil;
        v61 = nil;
    else
        v62 = l_current_2.params.itemId;
        v61 = l_current_2.params.itemType;
    end;
    l_current_2 = nil;
    if not v27 then
        l_current_2 = v14.DEPRECATED_GetItemSubType(v61, (v25(v58.AvatarExperience.Common, v62, v61)));
    elseif not (not v62 or not v61) then
        local v63 = v18.confirmItemType(v61);
        if v63 then
            local v64 = v26(v58.AvatarExperience, v62, v63);
            l_current_2 = if not v64 then nil else v64.itemSubType;
        end;
    end;
    return {
        itemSubType = l_current_2, 
        lastToggledItem = v58.AvatarExperience.AvatarScene.OutfitTryOn.LastToggledItem, 
        lastSavedTriedOnOutfit = v58.AvatarExperience.AvatarScene.LastSavedTriedOnOutfit, 
        tryOnItems = v58.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems, 
        selectedAnimationPreview = v58.AvatarExperience.AvatarScene.TryOn.AnimationPreview
    };
end, function(v65)
    return {
        clearTryOns = function()
            v65(v9());
        end, 
        storeAndClearTryOns = function()
            v65(v10());
        end, 
        setOutfitTryOns = function(v66)
            v65(v13(v66));
        end, 
        clearAnimationPreview = function()
            v65(v8());
        end, 
        clearAllResultsListFocusedWidget = function()
            return v65(v11());
        end, 
        toggleTryOn = function(v67, v68, v69, v70, v71, v72, v73, v74)
            v65(v7(v67, v68, v69, v70, v71, v72, v73, v74));
        end
    };
end)(v28))))));
