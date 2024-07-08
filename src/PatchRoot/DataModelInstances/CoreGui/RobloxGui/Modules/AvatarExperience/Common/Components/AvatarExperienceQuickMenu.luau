local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v5 = require(l_CorePackages_0.UIBlox);
local v6 = require(l_CorePackages_0.Packages.t);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v8 = require(l_CorePackages_0.AvatarExperienceDeps);
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarRoute);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v14 = require(l_Modules_0.AvatarExperience.Common.Utils);
local l_RoactFitComponents_0 = v8.RoactFitComponents;
local l_FitFrameOnAxis_0 = l_RoactFitComponents_0.FitFrameOnAxis;
local l_FitTextLabel_0 = l_RoactFitComponents_0.FitTextLabel;
local l_Images_0 = v5.App.ImageSet.Images;
local l_BaseMenu_0 = v5.App.Menu.BaseMenu;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_withStyle_0 = v5.Style.withStyle;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v23 = require(l_Modules_0.LuaApp.Context.withTopBarSearchSignal);
local v24 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local v25 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local v26 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.SetEntryPage);
local v27 = require(l_Modules_0.LuaApp.AppPage);
local v28 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v29 = game:DefineFastFlag("FixManageOutfitsEnabledForConsole", false);
local v30 = l_Images_0["component_assets/circle_17"];
local v31 = l_Images_0["icons/menu/customize"];
local v32 = l_Images_0["icons/menu/shop"];
local v33 = l_Images_0["icons/menu/profilepicture"];
local v34 = l_Images_0["icons/common/settings"];
local v35 = l_Images_0["icons/common/search"];
local v36 = l_Images_0["icons/actions/adjust"];
local v37 = l_Images_0["icons/common/goldrobux"];
local v38 = l_Images_0["icons/navigation/close"];
local v39 = v2.PureComponent:extend("AvatarExperienceQuickMenu");
v39.validateProps = v6.strictInterface({
    onOverlayClosed = v6.optional(v6.callback), 
    defaultChildRef = v6.optional(v6.table), 
    focusController = v6.optional(v6.table), 
    ManageOutfitsEnabled = if not v29 then v6.boolean else nil, 
    manageOutfitsEnabled = if not v29 then nil else v6.boolean, 
    isAvatarEditorSceneFullView = v6.boolean, 
    isCatalogSceneFullView = v6.boolean, 
    isProfilePictureEditorEmotesSceneFullView = v6.boolean, 
    purchaseRobux = v6.callback, 
    setEntryPage = v6.callback, 
    avatarExperienceAnalytics = v6.table, 
    navigation = v6.table, 
    avatarRoute = v9.Interface
});
v39.init = function(v40)
    v40.onActivatedShop = function()
        v13.navigateFromOverlay(v40.props.navigation, v10.Catalog);
    end;
    v40.onActivatedEditProfilePicture = function()
        v13.navigateFromOverlay(v40.props.navigation, v10.ProfilePictureEditorEmotes);
    end;
    v40.onActivatedManage = function()
        v13.navigateFromOverlay(v40.props.navigation, v10.ManageOutfitPage);
    end;
    v40.onActivatedCustomizeAvatar = function()
        v13.navigateFromOverlay(v40.props.navigation, v10.AvatarEditor);
    end;
    v40.onActivatedRefinement = function()
        v40.props.setEntryPage(v40.props.avatarRoute.opaque.name);
        v13.navigateFromOverlay(v40.props.navigation, v10.LayeredClothingSort);
    end;
    v40.onActivatedBuyRobux = function()
        v40.closePrompt();
        v40.props.purchaseRobux();
    end;
    v40.closePrompt = function()
        v13.closeOverlay(v40.props.navigation);
    end;
    local v41, v42 = v2.createBinding(UDim2.fromScale(0.35, 0.5));
    v40.sizeBinding = v41;
    v40.updateSizeBinding = v42;
    v40.onContentSizeChanged = function(v43)
        v40.updateSizeBinding(UDim2.new(0.35, 0, 0, v43.AbsoluteContentSize.Y));
    end;
end;
v39.gatherElements = function(v44, v45, v46)
    local v47 = {};
    local l_name_0 = v44.props.avatarRoute.opaque.name;
    if not (l_name_0 ~= v10.AvatarExperienceLandingPage and l_name_0 ~= v10.Catalog) or l_name_0 == v10.ProfilePictureEditorEmotes then
        table.insert(v47, {
            icon = v31, 
            text = v45.customizeAvatar, 
            onActivated = v44.onActivatedCustomizeAvatar
        });
    end;
    if not (l_name_0 ~= v10.AvatarExperienceLandingPage and l_name_0 ~= v10.AvatarEditor) or l_name_0 == v10.ProfilePictureEditorEmotes then
        table.insert(v47, {
            icon = v32, 
            text = v45.shop, 
            onActivated = v44.onActivatedShop
        });
    end;
    if not (l_name_0 ~= v10.AvatarExperienceLandingPage and l_name_0 ~= v10.AvatarEditor) or l_name_0 == v10.Catalog then
        table.insert(v47, {
            icon = v33, 
            text = v45.editProfilePicture, 
            onActivated = v44.onActivatedEditProfilePicture
        });
    end;
    if v44.props.manageOutfitsEnabled and l_name_0 == v10.AvatarEditor then
        table.insert(v47, {
            icon = v34, 
            text = v45.manage, 
            onActivated = v44.onActivatedManage
        });
    end;
    local v49 = (v44.props.isAvatarEditorSceneFullView or v44.props.isCatalogSceneFullView) or v44.props.isProfilePictureEditorEmotesSceneFullView;
    if not (not (l_name_0 == v10.Catalog) or v49) then
        table.insert(v47, {
            icon = v35, 
            text = v45.search, 
            onActivated = function()
                v44.closePrompt();
                v46:fire(l_name_0);
            end
        });
    end;
    table.insert(v47, {
        icon = v36, 
        text = v45.avatarAdjustment, 
        onActivated = v44.onActivatedRefinement
    });
    table.insert(v47, {
        icon = v37, 
        text = v45.buyRobux, 
        onActivated = v44.onActivatedBuyRobux
    });
    table.insert(v47, {
        icon = v38, 
        text = v45.cancel, 
        onActivated = v44.closePrompt
    });
    return v47;
end;
v39.renderWithProviders = function(v50, v51, v52, v53)
    local l_Font_0 = v52.Font;
    local l_Theme_0 = v52.Theme;
    local l_Font_1 = l_Font_0.Header1.Font;
    local v57 = l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize;
    local v58 = v50:gatherElements(v51, v53);
    local l_name_1 = v50.props.avatarRoute.current.name;
    local _ = nil;
    return v2.createElement(l_Focusable_0[l_ImageSetLabel_0], {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Size = v50.sizeBinding, 
        Position = UDim2.fromScale(0.5, 0.5), 
        BackgroundTransparency = 1, 
        Image = v30, 
        ImageColor3 = l_Theme_0.BackgroundUIDefault.Color, 
        ImageTransparency = l_Theme_0.BackgroundUIDefault.Transparency, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(8, 8, 9, 9), 
        [v2.Ref] = v50.props.defaultChildRef
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 20), 
            [v2.Change.AbsoluteContentSize] = v50.onContentSizeChanged
        }), 
        UIPadding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 20)
        }), 
        TextContainer = v2.createElement(l_FitFrameOnAxis_0, {
            axis = l_FitFrameOnAxis_0.Axis.Both, 
            margin = {
                top = 0, 
                bottom = 0, 
                left = 20, 
                right = 0
            }, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, {
            TitleText = v2.createElement(l_FitTextLabel_0, {
                width = l_FitTextLabel_0.Width.FitToText, 
                Text = if l_name_1 == v10.AvatarExperienceLandingPage then v51.avatarOptions else if l_name_1 == v10.AvatarEditor then v51.customizeOptions else v51.shopOptions, 
                Font = l_Font_1, 
                TextSize = v57, 
                BackgroundTransparency = 1, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextTransparency = l_Theme_0.TextEmphasis.Transparency
            })
        }), 
        BaseMenu = v2.createElement(l_BaseMenu_0, {
            buttonProps = v58, 
            layoutOrder = 2, 
            topElementRounded = false
        })
    });
end;
v39.render = function(v61)
    return l_withLocalization_0({
        avatarOptions = "Feature.Avatar.Label.QuickMenuLandingPageTitle", 
        shopOptions = "Feature.Catalog.Label.QuickMenuMarketplaceTitle", 
        customizeOptions = "Feature.Avatar.Label.QuickMenuCustomizeTitle", 
        shop = "Feature.Avatar.Action.Marketplace", 
        manage = "Feature.Avatar.Label.ManageItems", 
        customizeAvatar = "Feature.Catalog.Label.CustomizeAvatar", 
        editProfilePicture = "Feature.Avatar.Action.EditProfilePicture", 
        search = "Feature.Catalog.Label.Search", 
        buyRobux = "Feature.Catalog.Label.BuyRobux", 
        cancel = "Feature.Catalog.Action.Cancel", 
        avatarAdjustment = "Feature.Avatar.Label.AvatarAdjustment"
    })(function(v62)
        return l_withStyle_0(function(v63)
            return v23(function(v64)
                return v61:renderWithProviders(v62, v63, v64);
            end);
        end);
    end);
end;
return (v11((v12((l_RoactServices_0.connect({
    avatarExperienceAnalytics = v25
})((v3.connect(function(v65, _)
    return {
        manageOutfitsEnabled = v14.getAvatarEditorCategoryInfoFromState(v65).ManageOutfitsEnabled == true, 
        isAvatarEditorSceneFullView = v65.AvatarExperience.Common.FullView[v10.AvatarEditor] == v24.SceneFullView, 
        isCatalogSceneFullView = v65.AvatarExperience.Common.FullView[v10.Catalog] == v24.SceneFullView, 
        isProfilePictureEditorEmotesSceneFullView = v65.AvatarExperience.Common.FullView[v10.ProfilePictureEditorEmotes] == v24.SceneFullView
    };
end, function(v67)
    return {
        purchaseRobux = function()
            v67(v28({
                name = v27.PurchaseRobux
            }));
        end, 
        setEntryPage = function(v68)
            v67(v26(v68));
        end
    };
end)(v39))))))));
