local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CorePackages_0.Cryo);
local v8 = require(l_CorePackages_0.UIBlox);
local l_withNavigationFocus_0 = require(l_CorePackages_0.RoactNavigation).withNavigationFocus;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_withStyle_0 = v8.Style.withStyle;
local l_withTooltip_0 = v8.App.Dialog.TooltipV2.withTooltip;
local l_TooltipOrientation_0 = v8.App.Dialog.Enum.TooltipOrientation;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v15 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAppRoute);
local v16 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v17 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v18 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Components.LayeredClothingSortEntryButton);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v20 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local v21 = v3.PureComponent:extend("AvatarRefinementButtons");
v21.validateProps = v6.strictInterface({
    isUIFullView = v6.optional(v6.boolean), 
    isSceneFullView = v6.optional(v6.boolean), 
    layoutOrder = v6.optional(v6.number), 
    topBarHeight = v6.number, 
    isPortrait = v6.boolean, 
    equippedAssets = v6.optional(v6.table), 
    avatarRoute = v6.table, 
    navigation = v6.table, 
    isFocused = v6.boolean, 
    NextSelectionRight = v6.optional(v6.table), 
    NextSelectionLeft = v6.optional(v6.table), 
    NextSelectionUp = v6.optional(v6.table), 
    NextSelectionDown = v6.optional(v6.table), 
    forwardRef = v6.optional(v6.table)
});
v21.init = function(v22)
    v22.lcSortEntryRef = v3.createRef();
    v22:setState({
        showToolTip = l_AppStorageService_0:GetItem("ShowTooltipLCSortEntry") == "true"
    });
    v22.onTooltipDismiss = function()
        v22:setState({
            showToolTip = false
        });
        l_AppStorageService_0:SetItem("ShowTooltipLCSortEntry", "false");
        l_AppStorageService_0:flush();
    end;
end;
v21.didUpdate = function(v23, v24, v25)
    if not (not v23.props.isFocused or v24.isFocused) then
        local v26 = l_AppStorageService_0:GetItem("ShowTooltipLCSortEntry") == "true";
        if v26 ~= v25.showToolTip then
            v23:setState({
                showToolTip = v26
            });
        end;
    end;
end;
v21.render = function(v27)
    return l_withStyle_0(function(v28)
        return l_withLocalization_0({
            tooltipText = "Feature.Avatar.Message.LCSortEntry"
        })(function(v29)
            return v27:renderWithProviders(v28, v29);
        end);
    end);
end;
v21.renderWithProviders = function(v30, v31, v32)
    local l_Theme_0 = v31.Theme;
    local l_SceneButtonSize_0 = v16.SceneButtonSize;
    local v35 = nil;
    v35 = if not l_IsVRAppBuild_0() then v30.state.showToolTip and v30.props.equippedAssets ~= nil else false;
    local v36 = not v30.props.equippedAssets;
    local v37 = v17.isAvatarSceneButtonsVisible(v30.props.avatarRoute, v30.props.isFocused, v30.props.isUIFullView, v30.props.isSceneFullView, v30.props.navigation);
    return l_withTooltip_0({
        bodyText = v32.tooltipText, 
        useLargeDropShadow = true
    }, {
        preferredOrientation = l_TooltipOrientation_0.Right, 
        guiTarget = l_CoreGui_0, 
        active = v37 and v35
    }, function(v38)
        return v3.createElement(v5.Focusable.Frame, {
            Size = UDim2.fromOffset(l_SceneButtonSize_0, l_SceneButtonSize_0), 
            Visible = v37, 
            BackgroundColor3 = l_Theme_0.BackgroundMuted.Color, 
            BackgroundTransparency = if not v36 then l_Theme_0.BackgroundMuted.Transparency else 0.5, 
            LayoutOrder = v30.props.layoutOrder, 
            [v3.Ref] = v30.props.forwardRef, 
            [v3.Change.AbsoluteSize] = v38, 
            [v3.Change.AbsolutePosition] = v38, 
            NextSelectionLeft = v30.props.NextSelectionLeft, 
            defaultChild = v30.lcSortEntryRef
        }, {
            Corner = v3.createElement("UICorner", {
                CornerRadius = v16.SceneButtonCornerRadius
            }), 
            LayeredClothingSortEntryButton = v3.createElement(v18, {
                disabled = v36, 
                onTooltipDismiss = v30.onTooltipDismiss, 
                [v3.Ref] = v30.lcSortEntryRef
            })
        });
    end);
end;
v21 = v15((l_withNavigationFocus_0((v4.connect(function(v39, _)
    local _ = nil;
    local _ = nil;
    return {
        isPortrait = v20(v39), 
        topBarHeight = if not l_IsVRAppBuild_0() then v39.TopBar.topBarHeight else 0, 
        equippedAssets = v39.AvatarExperience.AvatarEditor.Character.EquippedAssets
    };
end, nil)(v21)))));
return v3.forwardRef(function(v43, v44)
    return v3.createElement(v21, v7.Dictionary.join(v43, {
        forwardRef = v44
    }));
end);
