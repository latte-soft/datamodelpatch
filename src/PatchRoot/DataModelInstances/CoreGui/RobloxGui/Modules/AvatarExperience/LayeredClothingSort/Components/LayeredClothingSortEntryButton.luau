local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.Cryo);
local v7 = require(l_CorePackages_0.UIBlox);
local l_withNavigation_0 = require(l_CorePackages_0.RoactNavigation).withNavigation;
local l_Images_0 = v7.App.ImageSet.Images;
local l_ImageSetButton_0 = v7.Core.ImageSet.ImageSetButton;
local l_withStyle_0 = v7.Style.withStyle;
local l_IconSize_0 = v7.App.Constant.IconSize;
local l_IconSize_1 = v7.App.ImageSet.Enum.IconSize;
local l_getIconSize_0 = v7.App.ImageSet.getIconSize;
local l_withSelectionCursorProvider_0 = v7.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v7.App.SelectionImage.CursorKind;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v18 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAppRoute);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v20 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Services.Analytics);
local v21 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Thunks.NavigateIntoRefinementPage);
local v22 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixLayeredClothingEntryIconSize10ft);
local v23 = l_Images_0["icons/actions/adjust"];
local v24 = v2.PureComponent:extend("LayeredClothingSortEntryButton");
v24.validateProps = v5.strictInterface({
    disabled = v5.optional(v5.boolean), 
    onTooltipDismiss = v5.optional(v5.callback), 
    waitingOnLCUpdates = v5.boolean, 
    navigateIntoRefinementPage = v5.callback, 
    navigation = v5.table, 
    avatarRoute = v5.table, 
    analytics = v5.table, 
    forwardRef = v5.optional(v5.table)
});
v24.defaultProps = {
    disabled = false
};
v24.init = function(v25)
    v25.navigateToLCSort = function()
        v25.props.navigateIntoRefinementPage(v25.props.navigation, v25.props.avatarRoute, v25.props.analytics, v25.props.onTooltipDismiss);
    end;
end;
v24.isDisabled = function(v26)
    return v26.props.disabled or v26.props.waitingOnLCUpdates;
end;
v24.render = function(v27)
    return l_withStyle_0(function(v28)
        return l_withSelectionCursorProvider_0(function(v29)
            return v27:renderWithProviders(v28, v29);
        end);
    end);
end;
v24.renderWithProviders = function(v30, v31, v32)
    local l_Theme_0 = v31.Theme;
    local v34 = v30:isDisabled();
    local v35 = if not v22 then l_IconSize_0.Regular else l_getIconSize_0(l_IconSize_1.Medium, v31);
    return v2.createElement(v4.Focusable[l_ImageSetButton_0], {
        Position = UDim2.fromScale(0.5, 0.5), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Size = UDim2.fromOffset(v35, v35), 
        BackgroundTransparency = 1, 
        Image = v23, 
        ImageColor3 = l_Theme_0.IconEmphasis.Color, 
        ImageTransparency = not v34 and 0 or 0.5, 
        ZIndex = 2, 
        [v2.Event.Activated] = v30.navigateToLCSort, 
        [v2.Ref] = v30.props.forwardRef, 
        SelectionImageObject = v32(l_CursorKind_0.RoundedRect)
    });
end;
v24 = l_RoactServices_0.connect({
    analytics = v20
})((v3.connect(function(v36, _)
    return {
        waitingOnLCUpdates = v36.AvatarExperience.AvatarScene.Character.WaitingOnLayeredClothingUpdates
    };
end, function(v38)
    return {
        navigateIntoRefinementPage = function(v39, v40, v41, v42)
            v38(v21(v39, v40, v41, v42));
        end
    };
end)((v18((l_withNavigation_0(v24)))))));
return v2.forwardRef(function(v43, v44)
    return v2.createElement(v24, v6.Dictionary.join(v43, {
        forwardRef = v44
    }));
end);
