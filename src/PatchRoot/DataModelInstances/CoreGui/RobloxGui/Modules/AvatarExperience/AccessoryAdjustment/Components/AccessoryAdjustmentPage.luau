local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local v5 = require(l_CorePackages_0.Packages.t);
local l_Focusable_0 = v4.Focusable;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_withNavigation_0 = require(l_CorePackages_0.RoactNavigation).withNavigation;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v11 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local v12 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v14 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local v15 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsFullView);
local v16 = require(l_Modules_0.AvatarExperience.Common.Utils);
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v19 = require(l_Modules_0.AvatarExperience.Common.Components.Refinement.RefinementNavBar);
local v20 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Components.VerticalDrawer);
local v21 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusHandlerForPage);
local v22 = v2.PureComponent:extend("AccessoryAdjustmentPage");
v22.validateProps = v5.strictInterface({
    fullView = v5.userdata, 
    isPortrait = v5.boolean, 
    setFullView = v5.callback, 
    avatarExperienceAnalytics = v5.table, 
    navigation = v5.table
});
v22.init = function(v23)
    v23.focusController = v4.createFocusController();
    v23.verticalDrawerRef = v2.createRef();
    v23.topBarRef = v2.createRef();
    v23.adjustmentButtonRef = v2.createRef();
    v23.refinementNavBarRef = v2.createRef();
    v23.changeView = function()
        v23.props.setFullView(v23.props.avatarExperienceAnalytics, (v16.getNewFullViewEnum(v23.props.fullView)));
    end;
    v23.backButtonComponent = v12.makeBackButton(function()
        v23.props.navigation.pop();
    end);
end;
v22.renderTopBar = function(v24)
    local l_isPortrait_0 = v24.props.isPortrait;
    return l_withLocalization_0({})(function(_)
        return v2.createElement(v12.Container, {
            titleText = "Accessory Adjustment", 
            NextSelectionDown = v24.adjustmentButtonRef, 
            transparentBackground = true, 
            hideSiteMessageBanner = l_isPortrait_0, 
            leftItem = v24.backButtonComponent, 
            ref = v24.topBarRef
        });
    end);
end;
v22.render = function(v27)
    return v2.createElement(l_Focusable_0.Frame, {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        focusController = v27.focusController, 
        defaultChild = v27.refinementNavBarRef
    }, {
        TopBar = v27:renderTopBar(), 
        RefinementNavBar = v2.createElement(v19, {
            NextSelectionRight = v27.verticalDrawerRef, 
            NextSelectionUp = v27.topBarRef, 
            ref = v27.refinementNavBarRef
        }), 
        VerticalDrawer = v2.createElement(v20, {
            ref = v27.verticalDrawerRef, 
            NextSelectionLeft = v27.refinementNavBarRef
        }), 
        GamepadFocusHandlerForPage = v2.createElement(v21, {
            focusController = v27.focusController, 
            captureFocusOnMount = true
        })
    });
end;
return (l_withNavigation_0(l_RoactServices_0.connect({
    avatarExperienceAnalytics = v11
})((v3.connect(function(v28, _)
    return {
        isPortrait = v28.DeviceOrientation == l_DeviceOrientationMode_0.Portrait, 
        fullView = v15(v28, v13.AccessoryAdjustment)
    };
end, function(v30)
    return {
        setFullView = function(v31, v32)
            v30(v14(v31, v13.AccessoryAdjustment, v32));
        end
    };
end)(v22))), nil));
