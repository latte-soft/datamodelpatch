local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.UIBlox);
local v6 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_Focusable_0 = v6.Focusable;
local l_BaseMenu_0 = v5.App.Menu.BaseMenu;
local l_withStyle_0 = v5.Style.withStyle;
local l_Images_0 = v5.App.ImageSet.Images;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v13 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v14 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v15 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Services.Analytics);
local v16 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v18 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v19 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v20 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v21 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarRoute);
local v22 = require(l_Modules_0.AvatarExperience.Common.Components.NavOverlayContainer);
local v23 = l_Images_0["icons/menu/customize"];
local v24 = l_Images_0["icons/menu/shop"];
local v25 = l_Images_0["icons/menu/profilepicture"];
local v26 = v2.PureComponent:extend("AXTransitionContextualMenu");
v26.validateProps = v4.strictInterface({
    defaultChildRef = v4.optional(v4.table), 
    onOverlayClosed = v4.optional(v4.callback), 
    focusController = v4.optional(v4.table), 
    navigation = v4.table, 
    avatarRoute = v21.Interface, 
    screenSize = v4.Vector2, 
    globalGuiInset = v4.strictInterface({
        left = v4.integer, 
        top = v4.integer, 
        right = v4.integer, 
        bottom = v4.integer
    }), 
    topBarHeight = v4.number, 
    avatarAnalytics = v4.table, 
    catalogAnalytics = v4.table, 
    profilePictureEditorAnalytics = v4.table, 
    NextSelectionUp = v4.optional(v4.table), 
    NextSelectionDown = v4.optional(v4.table), 
    [v2.Ref] = v4.optional(v4.table), 
    inputBindings = v4.optional(v4.table)
});
v26.getOpaquePage = function(v27)
    return v27.props.avatarRoute.opaque.name;
end;
v26.init = function(v28)
    local v29, v30 = v2.createBinding(UDim2.fromScale(1, 1));
    v28.contextMenuSize = v29;
    v28.updateContextMenuSize = v30;
    v28.onAbsoluteSizeChanged = function(v31)
        if v31.AbsoluteSize.X > 640 then
            v28.updateContextMenuSize((UDim2.new(0, 300, 1, 0)));
            return ;
        else
            v28.updateContextMenuSize(UDim2.fromScale(1, 1));
            return ;
        end;
    end;
    v28.goToAvatarEditorPage = function()
        if v28:getOpaquePage() ~= v16.AvatarEditor then
            v20.navigateFromOverlay(v28.props.navigation, v16.AvatarEditor);
            v28.props.avatarAnalytics.catalogToAvatarButton();
        end;
    end;
    v28.goToCatalogPage = function()
        if v28:getOpaquePage() ~= v16.Catalog then
            v20.navigateFromOverlay(v28.props.navigation, v16.Catalog);
            v28.props.catalogAnalytics.avatarToCatalogButton();
        end;
    end;
    v28.goToProfilePictureEditorPage = function()
        if v28:getOpaquePage() ~= v16.ProfilePictureEditorEmotes then
            v20.navigateFromOverlay(v28.props.navigation, v16.ProfilePictureEditorEmotes);
        end;
        v28.props.profilePictureEditorAnalytics.profilePictureEditorButton();
    end;
    v28.onDismiss = function()
        v20.closeOverlay(v28.props.navigation);
    end;
end;
v26.render = function(v32)
    return l_withStyle_0(function(v33)
        return l_withLocalization_0({
            customizeText = "Feature.Catalog.Action.Customize", 
            shopText = "Feature.Avatar.Action.Marketplace", 
            profilePictureEditorText = "Feature.Avatar.Action.EditProfilePicture"
        })(function(v34)
            return v32:renderWithProviders(v33, v34);
        end);
    end);
end;
v26.renderWithProviders = function(v35, v36, v37)
    local l_Theme_0 = v36.Theme;
    return v2.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1
    }, {
        Background = v2.createElement("TextButton", {
            ZIndex = 1, 
            Text = "", 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_Theme_0.Overlay.Color, 
            BackgroundTransparency = l_Theme_0.Overlay.Transparency, 
            AutoButtonColor = false, 
            Position = UDim2.fromOffset(-v35.props.globalGuiInset.left, -v35.props.globalGuiInset.top), 
            Size = UDim2.fromOffset(v35.props.screenSize.X, v35.props.screenSize.Y), 
            [v2.Event.Activated] = v35.onDismiss
        }), 
        Container = v2.createElement(v22, {
            ZIndex = 2, 
            onAbsoluteSizeChanged = v35.onAbsoluteSizeChanged
        }, {
            SizeFrame = v2.createElement(l_Focusable_0.Frame, {
                BackgroundTransparency = 1, 
                Size = v35.contextMenuSize, 
                AnchorPoint = Vector2.new(0.5, 0), 
                Position = UDim2.fromScale(0.5, 0), 
                [v2.Ref] = v35.props.defaultChildRef
            }, {
                Menu = v2.createElement(l_BaseMenu_0, {
                    width = UDim.new(1, -24), 
                    anchorPoint = Vector2.new(0.5, 0), 
                    position = UDim2.new(0.5, 0, 0, v35.props.topBarHeight), 
                    buttonProps = {
                        {
                            icon = v23, 
                            text = v37.customizeText, 
                            onActivated = v35.goToAvatarEditorPage, 
                            selected = v35:getOpaquePage() == v16.AvatarEditor
                        }, 
                        {
                            icon = v24, 
                            text = v37.shopText, 
                            onActivated = v35.goToCatalogPage, 
                            selected = v35:getOpaquePage() == v16.Catalog
                        }, 
                        {
                            icon = v25, 
                            text = v37.profilePictureEditorText, 
                            onActivated = v35.goToProfilePictureEditorPage, 
                            selected = v35:getOpaquePage() == v16.ProfilePictureEditorEmotes
                        }
                    }
                })
            })
        })
    });
end;
return (v17((v19((v18((l_RoactServices_0.connect({
    avatarAnalytics = v13, 
    catalogAnalytics = v14, 
    profilePictureEditorAnalytics = v15
})((v3.connect(function(v39, _)
    return {
        screenSize = v39.ScreenSize, 
        topBarHeight = v39.TopBar.topBarHeight, 
        globalGuiInset = v39.GlobalGuiInset
    };
end, nil)(v26))))))))));
