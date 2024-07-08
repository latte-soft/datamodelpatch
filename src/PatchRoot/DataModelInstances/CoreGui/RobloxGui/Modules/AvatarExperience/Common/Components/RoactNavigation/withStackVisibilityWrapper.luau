local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local v4 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v6 = require(l_CorePackages_0.Cryo);
local v7 = require(l_CorePackages_0.Roact);
local v8 = require(l_CorePackages_0.Packages.t);
local l_withNavigation_0 = require(l_CorePackages_0.RoactNavigation).withNavigation;
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.AfterAvatarExperienceLoaded);
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarRoute);
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Utils.isAvatarRouteVisible);
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.AvatarVRPanelWrapper);
local v15 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreenProperties);
local v16 = require(l_Modules_0.AvatarExperience.Common.Debug.LogTree).logger("ax.rn.stackvis");
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v18 = require(l_Modules_0.AvatarExperience.Common.Components.with10ftUIPadding);
local l_FocusNavigationEventNameEnum_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum;
local l_useEventMap_0 = require(l_CorePackages_0.Workspace.Packages.ReactFocusNavigation).useEventMap;
local l_GetFFlagEnableUseShowTopBar_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableUseShowTopBar;
local v22 = v7.PureComponent:extend("StackVisibilityWrapper");
v22.validateProps = v8.strictInterface({
    component = v8.union(v8.callback, v8.table), 
    innerProps = v8.optional(v8.table), 
    navigation = v8.table, 
    designTokens = v8.any, 
    eventMapRef = if not l_GetFFlagEnableUseShowTopBar_0() then nil else v8.any, 
    guiService = v8.optional(v8.union(v8.Instance, v8.table)), 
    avatarRoute = v11.Interface
});
v22.getRouteName = function(v23)
    return v23.props.navigation.state.routeName;
end;
v22.render = function(v24)
    local v25 = v24:getRouteName();
    local l_navigation_0 = v24.props.navigation;
    local l_avatarRoute_0 = v24.props.avatarRoute;
    local l_component_0 = v24.props.component;
    local l_innerProps_0 = v24.props.innerProps;
    local l_designTokens_0 = v24.props.designTokens;
    local l_topPadding_0 = l_designTokens_0.topPadding;
    local l_leftPadding_0 = l_designTokens_0.leftPadding;
    local l_bottomPadding_0 = l_designTokens_0.bottomPadding;
    local l_rightPadding_0 = l_designTokens_0.rightPadding;
    local v35 = if not l_GetFFlagEnableUseShowTopBar_0() then nil else v24.props.eventMapRef;
    local v36 = v13(v24.props);
    l_innerProps_0 = v6.Dictionary.join(l_innerProps_0, {
        navigation = l_navigation_0, 
        avatarRoute = l_avatarRoute_0
    });
    v16:trace("[{}]: {}", not v36 and "NOT VISIBLE" or "VISIBLE", v25);
    if not l_IsVRAppBuild_0() then
        return v7.createElement("Frame", {
            Size = UDim2.new(1, l_rightPadding_0, 1, l_bottomPadding_0), 
            Position = UDim2.fromOffset(l_leftPadding_0, l_topPadding_0), 
            BackgroundTransparency = 1, 
            ClipsDescendants = false, 
            BorderSizePixel = 0, 
            Visible = v36, 
            ref = v35
        }, {
            StackScreen = v7.createElement(l_component_0, l_innerProps_0)
        });
    else
        return v7.createElement(v14, {
            visible = v36, 
            roundedCornersFrame = v15[v25].VRPanelRoundedCorners, 
            panelPlacement = v15[v25].VRPanelPlacement
        }, {
            StackScreen = v7.createElement(l_component_0, l_innerProps_0)
        });
    end;
end;
v22.didMount = function(v37)
    local v38 = v37:getRouteName();
    local l_guiService_0 = v37.props.guiService;
    if not (not l_guiService_0 or not v13(v37.props)) then
        l_guiService_0:BroadcastNotification(v38, v4.APP_READY);
    end;
end;
v22.didUpdate = function(v40, v41, _)
    local l_guiService_1 = v40.props.guiService;
    if not ((not l_guiService_1 or v13(v41)) or not v13(v40.props)) then
        l_guiService_1:BroadcastNotification(v40:getRouteName(), v4.APP_READY);
    end;
end;
v22 = v18((l_withNavigation_0((v12((l_RoactServices_0.connect({
    guiService = l_AppGuiService_0
})(v22)))))));
if l_GetFFlagEnableUseShowTopBar_0() then
    local v44 = {
        [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NoOpEvent, 
        [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NoOpEvent
    };
    local l_v22_0 = v22;
    v22 = function(v46)
        return v7.createElement(l_v22_0, v6.Dictionary.join(v46, {
            eventMapRef = l_useEventMap_0(v44)
        }));
    end;
end;
return function(v47)
    v47 = v10(v47);
    return function(v48)
        return v7.createElement(v22, {
            component = v47, 
            innerProps = v48, 
            navigation = v48.navigation
        });
    end;
end;
