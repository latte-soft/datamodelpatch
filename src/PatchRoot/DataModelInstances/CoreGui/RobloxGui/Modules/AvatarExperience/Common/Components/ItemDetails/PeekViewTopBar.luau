local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.Cryo);
local v6 = require(l_CorePackages_0.Roact);
local l_withNavigation_0 = require(l_CorePackages_0.RoactNavigation).withNavigation;
local v8 = require(l_CorePackages_0.RoactRodux);
local v9 = require(l_CorePackages_0.UIBlox);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local l_Images_0 = v9.App.ImageSet.Images;
local l_withStyle_0 = v9.Style.withStyle;
local l_ImageSetLabel_0 = v9.Core.ImageSet.ImageSetLabel;
local l_withSelectionCursorProvider_0 = v9.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v9.App.SelectionImage.CursorKind;
local v16 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v17 = require(l_Modules_0.AvatarExperience.Common.Utils);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v19 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v20 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local v22 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v23 = require(l_Modules_0.AvatarExperience.Common.Thunks.CloseFocusedScreen);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v25 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v26 = require(l_Modules_0.AvatarExperience.Common.Thunks.ToggleTryOnThunk);
local v27 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v28 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v29 = require(l_Modules_0.AvatarExperience.Common.Validators.DEPRECATED_ItemDataValidator);
local v30 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableItemDetailsTopBarBackButtonFix);
local v31 = require(l_Modules_0.AvatarExperience.Common.Models.ItemInfo);
local v32 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixItemTypeHandling);
local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
local v34 = true;
if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.Windows then
    v34 = l_l_UserInputService_0_Platform_0 == Enum.Platform.OSX;
end;
local v35 = l_Images_0["icons/navigation/close"];
local v36 = l_Images_0["icons/navigation/pushBack"];
local v37 = not v34 and 0 or 0.5;
local v38 = v6.PureComponent:extend("PeekViewTopBar");
v38.validateProps = v4.strictInterface({
    forwardRef = v4.optional(v4.table), 
    NextSelectionDown = v4.optional(v4.table), 
    DEPRECATED_itemId = if not v32 then v4.optional(v4.string) else nil, 
    DEPRECATED_itemType = if not v32 then v4.optional(v4.string) else nil, 
    DEPRECATED_itemData = if not v32 then v4.optional(v29) else nil, 
    itemInfo = if not v32 then nil else v4.optional(v31.Validator), 
    topBarHeight = v4.number, 
    statusBarHeight = v4.number, 
    isPortrait = v4.optional(v4.boolean), 
    closeFocusedScreen = v4.callback, 
    toggleTryOn = v4.optional(v4.callback), 
    navigation = v4.table, 
    networking = v4.callback, 
    catalogAnalytics = v4.table, 
    appAnalytics = v4.table, 
    avatarRoute = v4.table
});
v38.init = function(v39)
    v39.navigateBack = function()
        v39.props.closeFocusedScreen(v39.props.navigation);
    end;
    v39.closeFiltersAndItemDetails = function()
        local l_navigation_0 = v39.props.navigation;
        local v41 = nil;
        local _ = nil;
        local v43 = nil;
        if not v32 then
            v41 = v39.props.DEPRECATED_itemData;
            v43 = v41 ~= nil;
        else
            v43 = v39.props.itemInfo ~= nil;
        end;
        if v43 then
            local v44 = nil;
            local v45 = nil;
            local v46 = nil;
            if not v32 then
                v44 = v39.props.DEPRECATED_itemId;
                v45 = v39.props.DEPRECATED_itemType;
                v46 = v25.DEPRECATED_GetItemSubType(v45, v41);
            else
                v44 = v39.props.itemInfo.itemId;
                v45 = v39.props.itemInfo.itemType;
                v46 = v39.props.itemInfo.itemSubType;
            end;
            v39.props.toggleTryOn(v39.props.networking, v39.props.catalogAnalytics, v45, v46, v44, true, v39.props.avatarRoute, l_navigation_0);
        end;
        v22.closeFiltersAndItemDetails(l_navigation_0);
    end;
    v39.buttonRef = v39.props.forwardRef or v6.createRef();
    v39.secondaryButtonRef = v6.createRef();
end;
v38.renderBothButtons = function(v47, v48, v49)
    return v6.createFragment({
        UIListLayout = v6.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, 15)
        }), 
        UIPadding = v6.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 15)
        }), 
        BackButton = v6.createElement(l_Focusable_0.TextButton, {
            LayoutOrder = 1, 
            AnchorPoint = Vector2.new(0, v37), 
            Size = UDim2.new(0, 36, 0, 36), 
            BackgroundTransparency = 1, 
            Text = "", 
            [v6.Event.Activated] = v47.navigateBack, 
            [v6.Ref] = v47.buttonRef, 
            NextSelectionRight = v47.secondaryButtonRef, 
            SelectionImageObject = v49(l_CursorKind_0.RoundedRectNoInset)
        }, {
            BackButtonIcon = v6.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                Size = UDim2.new(0, 36, 0, 36), 
                Image = v36, 
                ImageColor3 = v48
            })
        }), 
        CloseButton = v6.createElement(l_Focusable_0.TextButton, {
            LayoutOrder = 2, 
            AnchorPoint = Vector2.new(0, v37), 
            Size = UDim2.new(0, 36, 0, 36), 
            BackgroundTransparency = 1, 
            Text = "", 
            [v6.Event.Activated] = v47.closeFiltersAndItemDetails, 
            [v6.Ref] = v47.secondaryButtonRef, 
            NextSelectionLeft = v47.buttonRef, 
            SelectionImageObject = v49(l_CursorKind_0.RoundedRectNoInset)
        }, {
            CloseButtonIcon = v6.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                Size = UDim2.new(0, 36, 0, 36), 
                Image = v35, 
                ImageColor3 = v48
            })
        })
    });
end;
v38.isFirstItemDetailVisible = function(v50)
    if v30() then
        local l_previousPages_0 = v50.props.avatarRoute.previousPages;
        local v52 = 0;
        if #l_previousPages_0 == 0 then
            return nil;
        else
            for _, v54 in pairs(l_previousPages_0) do
                if v54.name == v16.ItemDetails then
                    v52 = v52 + 1;
                end;
            end;
            local v55 = false;
            if v52 == 0 then
                v55 = v22.isFirstItemDetailsPage(v50.props.navigation);
            end;
            return v55;
        end;
    else
        return nil;
    end;
end;
v38.render = function(v56)
    local l_statusBarHeight_0 = v56.props.statusBarHeight;
    local l_topBarHeight_0 = v56.props.topBarHeight;
    local v59 = v22.isFirstItemDetailsPage(v56.props.navigation);
    local v60 = v56.props.navigation.getParam("fromProfile");
    local v61 = v56.props.navigation.getParam("showFullWithNoPeekView");
    local v62 = v61 and not v59;
    local v63 = v56:isFirstItemDetailVisible();
    return l_withStyle_0(function(v64)
        return l_withSelectionCursorProvider_0(function(v65)
            local v66 = if v60 or v61 then v64.Theme.SystemPrimaryDefault.Color else Color3.new(1, 1, 1);
            local v67 = 1;
            local v68 = nil;
            if not (not v61 or not v56.props.isPortrait) then
                v67 = 0;
                v68 = v64.Theme.BackgroundDefault.Color;
            end;
            local _ = nil;
            return v6.createElement(l_Focusable_0.Frame, {
                Active = true, 
                Position = UDim2.new(0, 0, 0, 0), 
                Size = UDim2.new(1, 0, 0, l_topBarHeight_0), 
                BorderSizePixel = 0, 
                BackgroundTransparency = v67, 
                BackgroundColor3 = v68, 
                NextSelectionLeft = v56.props.NextSelectionLeft, 
                NextSelectionRight = v56.props.NextSelectionRight, 
                NextSelectionUp = v56.props.NextSelectionUp, 
                NextSelectionDown = v56.props.NextSelectionDown
            }, if not v62 then {
                TouchFriendlyNavigationButton = v6.createElement(l_Focusable_0.TextButton, {
                    AnchorPoint = Vector2.new(0, v37), 
                    Position = UDim2.new(0, 15, v37, l_statusBarHeight_0), 
                    Size = UDim2.new(0, 36, 0, 36), 
                    BackgroundTransparency = 1, 
                    Text = "", 
                    [v6.Event.Activated] = v56.navigateBack, 
                    [v6.Ref] = v56.buttonRef, 
                    Visible = v63, 
                    NextSelectionDown = v56.props.NextSelectionDown, 
                    SelectionImageObject = v65(l_CursorKind_0.RoundedRectNoInset)
                }, {
                    CloseButton = v59 and v6.createElement(l_ImageSetLabel_0, {
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        BackgroundTransparency = 1, 
                        Position = UDim2.new(0.5, 0, 0.5, 0), 
                        Size = UDim2.new(0, 36, 0, 36), 
                        Image = v35, 
                        ImageColor3 = v66
                    }), 
                    BackButton = not v59 and v6.createElement(l_ImageSetLabel_0, {
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        BackgroundTransparency = 1, 
                        Position = UDim2.new(0.5, 0, 0.5, 0), 
                        Size = UDim2.new(0, 36, 0, 36), 
                        Image = v36, 
                        ImageColor3 = v66
                    })
                })
            } else v56:renderBothButtons(v66, v65));
        end);
    end);
end;
v38 = v27((v8.connect(function(v70, _)
    return {
        topBarHeight = v17.getTopBarHeightAvatarScene(v70), 
        statusBarHeight = v70.TopBar.statusBarHeight, 
        isPortrait = v70.DeviceOrientation == l_DeviceOrientationMode_0.Portrait
    };
end, function(v72)
    return {
        closeFocusedScreen = function(v73)
            v72(v23(v73));
        end, 
        toggleTryOn = function(v74, v75, v76, v77, v78, v79, v80, v81)
            v72(v26(v74, v75, v76, v77, v78, v79, v80, v81));
        end
    };
end)((l_RoactServices_0.connect({
    catalogAnalytics = v28, 
    appAnalytics = v20, 
    networking = v19
})((l_withNavigation_0(v38)))))));
return v6.forwardRef(function(v82, v83)
    return v6.createElement(v38, v5.Dictionary.join(v82, {
        forwardRef = v83
    }));
end);
