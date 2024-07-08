local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local v5 = require(l_CorePackages_0.UIBlox);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CorePackages_0.Cryo);
local l_withNavigation_0 = require(l_CorePackages_0.RoactNavigation).withNavigation;
local v9 = require(l_CorePackages_0.tutils);
local l_withStyle_0 = v5.Core.Style.withStyle;
local l_Images_0 = v5.App.ImageSet.Images;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v13 = require(l_Modules_0.AvatarExperience.Catalog.Components.ActionBar.BuyActionBar);
local v14 = require(l_Modules_0.AvatarExperience.Common.Selectors.DEPRECATED_ItemData);
local v15 = require(l_Modules_0.AvatarExperience.Common.Models.ItemInfo);
local v16 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v18 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v19 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v20 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v21 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local v23 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v24 = require(l_Modules_0.LuaApp.Constants);
local v25 = require(l_Modules_0.AvatarExperience.Catalog.Components.ActionBar.ActionButton);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v27 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateWithLock);
local v28 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v29 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v30 = require(l_Modules_0.AvatarExperience.Common.Validators.DEPRECATED_ItemDataValidator);
local v31 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectItemInfo);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v33 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixItemTypeHandling);
local l_ActionBarHeight_0 = v23.ActionBar.ActionBarHeight;
local v35 = l_Images_0["icons/menu/shop_large"];
local v36 = v2.PureComponent:extend("MultiTryOnBottomBar");
v36.validateProps = v6.strictInterface({
    bottomBarRef = v6.optional(v6.table), 
    NextSelectionLeft = v6.optional(v6.table), 
    Visible = v6.optional(v6.boolean), 
    isConsoleWithGamepad = v6.optional(v6.boolean), 
    lastToggledItem = v6.table, 
    isPortrait = v6.boolean, 
    tryOnItems = v6.optional(v6.table), 
    DEPRECATED_itemData = if not v33 then v6.optional(v30) else nil, 
    itemInfo = if not v33 then nil else v6.optional(v15.Validator), 
    itemId = v6.optional(v6.string), 
    itemType = v6.optional(v6.string), 
    boundInputs = v6.optional(v6.table), 
    fetchItemData = v6.callback, 
    navigateWithLock = v6.callback, 
    networking = v6.callback, 
    appAnalytics = v6.table, 
    catalogAnalytics = v6.table, 
    localization = v6.table, 
    navigation = v6.table
});
v36.defaultProps = {
    Visible = true, 
    lastToggledItem = {}
};
v36.init = function(v37)
    v37.fetchItemData = function()
        local l_lastToggledItem_0 = v37.props.lastToggledItem;
        if not l_lastToggledItem_0.isUnequipped then
            v37.props.fetchItemData(v37.props.networking, v37.props.appAnalytics, l_lastToggledItem_0.itemId, l_lastToggledItem_0.itemType);
        end;
    end;
    v37.onOutfitButtonActivated = function()
        v37.props.catalogAnalytics.openOutfitScreen((v9.fieldCount(v37.props.tryOnItems)));
        local l_navigation_0 = v37.props.navigation;
        v37.props.navigateWithLock(function()
            v29.closeFiltersAndItemDetails(l_navigation_0);
            l_navigation_0.navigate(v28.TryOnManager);
        end);
    end;
end;
v36.getGamepadBottomBarHeight = function(v40)
    if not v40.props.isConsoleWithGamepad or v7.isEmpty(v40.props.boundInputs) then
        return 0;
    else
        return v24.GAMEPAD_BOTTOM_BAR_SIZE;
    end;
end;
v36.renderActionBar = function(v41)
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, 0), 
        Position = UDim2.new(0, 0, 1, -v41:getGamepadBottomBarHeight()), 
        AnchorPoint = Vector2.new(0, 1), 
        ZIndex = 3
    }, {
        BuyActionBar = v2.createElement(v13, {
            hideGradient = true, 
            itemId = v41.props.itemId, 
            itemType = v41.props.itemType, 
            headerPadding = 24, 
            leftPadding = 10, 
            bottomPadding = 20, 
            rightPadding = 10, 
            topPadding = 10, 
            ZIndex = 1
        })
    });
end;
v36.renderOutfitBar = function(v42, v43)
    local l_Theme_0 = v43.Theme;
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        ZIndex = 3
    }, {
        ActionBarFrame = v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = 0, 
            BorderSizePixel = 0
        }, {
            Padding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 10), 
                PaddingRight = UDim.new(0, 10), 
                PaddingTop = UDim.new(0, 10)
            }), 
            ActionButton = v2.createElement(v25, {
                Size = UDim2.new(1, 0, 0, l_ActionBarHeight_0), 
                Font = v43.Font, 
                buttonProps = {
                    buttonText = v42.props.localization:Format("Feature.Catalog.Label.TryOnsMultiple", (v9.fieldCount(v42.props.tryOnItems))), 
                    buttonIcon = v35, 
                    buttonIconPadding = 5, 
                    buttonIconSize = 30, 
                    buttonColor = l_Theme_0.ContextualPrimaryDefault.Color, 
                    buttonTextColor = l_Theme_0.ContextualPrimaryContent.Color, 
                    onActivated = v42.onOutfitButtonActivated
                }
            })
        })
    });
end;
v36.renderWithProviders = function(v45, v46)
    local v47 = not v45.props.isPortrait and 0.4 or 1;
    local v48 = not v45.props.isPortrait and 0.6 or 0;
    local v49 = nil;
    v49 = if not v33 then v45.props.DEPRECATED_itemData else v45.props.itemInfo ~= nil;
    local v50 = l_ActionBarHeight_0 + 20;
    local v51 = nil;
    if v45.props.Visible then
        v51 = if not v49 then v45:renderOutfitBar(v46) else v45:renderActionBar();
    end;
    local v52 = v50 + v45:getGamepadBottomBarHeight();
    return v2.createElement(v4.Focusable.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.new(v47, 0, 0, v52), 
        Position = UDim2.new(v48, 0, 1, -v52), 
        ZIndex = 3, 
        ref = v45.props.bottomBarRef, 
        NextSelectionLeft = v45.props.NextSelectionLeft, 
        Visible = v45.props.Visible
    }, {
        BottomBar = v51
    });
end;
v36.render = function(v53)
    return l_withStyle_0(function(v54)
        return v53:renderWithProviders(v54);
    end);
end;
v36.didUpdate = function(v55, v56)
    if not (not v55.props.Visible or not (v55.props.lastToggledItem ~= v56.lastToggledItem and not v55.props.lastToggledItem.isUnequipped) and v56.Visible) then
        v55.fetchItemData();
    end;
end;
return (l_RoactServices_0.connect({
    catalogAnalytics = v21, 
    appAnalytics = v19, 
    networking = v18, 
    localization = v20
})((v3.connect(function(v57)
    local l_TryOnItems_0 = v57.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
    local v59 = nil;
    local v60 = nil;
    local v61 = nil;
    local v62 = nil;
    if v9.fieldCount(l_TryOnItems_0) == 1 then
        local v63, v64 = next(l_TryOnItems_0, nil);
        v62 = v63;
        v61 = v64.itemType;
        if not v33 then
            v59 = v14(v57.AvatarExperience.Common, v62, v61);
        else
            v60 = v31(v57.AvatarExperience, v62, v61);
        end;
    end;
    return {
        isPortrait = v57.DeviceOrientation == l_DeviceOrientationMode_0.Portrait, 
        tryOnItems = l_TryOnItems_0, 
        lastToggledItem = v57.AvatarExperience.AvatarScene.OutfitTryOn.LastToggledItem, 
        DEPRECATED_itemData = v59, 
        itemInfo = v60, 
        itemId = v62, 
        itemType = v61, 
        boundInputs = v57.GamepadBottomBar.boundInputs
    };
end, function(v65)
    return {
        navigateWithLock = function(v66)
            v65(v27(v66));
        end, 
        fetchItemData = function(v67, v68, v69, v70)
            return v65(v16(v67, v68, v69, v70));
        end
    };
end)((l_withNavigation_0(v36, nil))))));
