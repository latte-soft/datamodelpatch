local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.UIBlox);
local v5 = require(l_CorePackages_0.Packages.t);
local l_ContextualMenu_0 = v4.App.Menu.ContextualMenu;
local l_MenuDirection_0 = v4.App.Menu.MenuDirection;
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v14 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v15 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Constants);
local v16 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v18 = not l_IsVRAppBuild_0() and 0 or 120;
local v19 = v2.PureComponent:extend("LCSortContextFrame");
v19.validateProps = v5.strictInterface({
    navigation = v5.table, 
    asset = v5.table, 
    onUnequip = v5.optional(v5.callback), 
    tilePositionY = v5.number, 
    avatarRoute = v5.table, 
    screenSize = v5.Vector2, 
    isPortrait = v5.boolean, 
    globalGuiInset = v5.table, 
    focusController = v5.optional(v5.table), 
    defaultChildRef = v5.optional(v5.table)
});
v19.init = function(v20)
    local v21, v22 = v2.createBinding(UDim2.fromScale(1, 1));
    v20.contextMenuSize = v21;
    v20.updateContextMenuSize = v22;
    v20.openUnequipPrompt = function()
        v13.navigateToNextOverlay(v20.props.navigation, v12.RemoveItemPrompt, {
            asset = v20.props.asset, 
            onUnequip = v20.props.onUnequip
        });
    end;
    v20.closePrompt = function()
        v13.closeOverlay(v20.props.navigation);
    end;
end;
v19.renderLocalized = function(v23, v24)
    local l_closePrompt_0 = v23.closePrompt;
    local l_screenSize_0 = v23.props.screenSize;
    local v27 = {};
    table.insert(v27, {
        icon = nil, 
        text = v24.unequip, 
        onActivated = function()
            v23.openUnequipPrompt();
        end
    });
    local l_isPortrait_0 = v23.props.isPortrait;
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Position = UDim2.new(if not l_isPortrait_0 then v14.LandscapeNavWidth else 0, not l_IsVRAppBuild_0() and 0 or v15.VerticalList.Width + v15.Tile.ContextWidth, 0, 0), 
        Size = UDim2.fromScale(if not l_isPortrait_0 then v14.LandscapeSceneWidth else 1, 1)
    }, {
        SizeFrame = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.fromScale(0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0), 
            Size = v23.contextMenuSize
        }, {
            ContextMenu = v2.createElement(l_ContextualMenu_0, {
                buttonProps = v27, 
                open = true, 
                menuDirection = l_MenuDirection_0.Up, 
                openPositionY = UDim.new(1, (((((v23.props.tilePositionY - v23.props.screenSize.Y) + v15.Tile.SelectedSize) + 56) + 11) + v23.props.globalGuiInset.bottom) + v18), 
                closeBackgroundVisible = not l_IsVRAppBuild_0() and true or false, 
                screenSize = l_screenSize_0, 
                onDismiss = l_closePrompt_0
            })
        })
    });
end;
v19.render = function(v29)
    return l_withLocalization_0({
        unequip = "Feature.Avatar.Action.Unequip"
    })(function(v30)
        return v29:renderLocalized(v30);
    end);
end;
return (v11((v9((v8((v3.connect(function(v31, _)
    return {
        screenSize = v31.ScreenSize, 
        globalGuiInset = v31.GlobalGuiInset, 
        isPortrait = v16(v31)
    };
end, nil)(v19))))))));
