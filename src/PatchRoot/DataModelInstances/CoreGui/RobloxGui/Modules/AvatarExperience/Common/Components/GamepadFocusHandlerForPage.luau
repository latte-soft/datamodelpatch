local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local l_withNavigation_0 = require(l_CorePackages_0.RoactNavigation).withNavigation;
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarRoute);
local v7 = require(l_Modules_0.AvatarExperience.Common.Debug.LogTree).logger("ax.gamepad");
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusRecovery);
local l_withIsGamepadInput_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).withIsGamepadInput;
local v10 = v2.PureComponent:extend("GamepadFocusHandlerForPage");
v10.validateProps = v4.strictInterface({
    focusController = v4.table, 
    captureFocusOnMount = v4.optional(v4.boolean), 
    isGamepadInput = v4.optional(v4.boolean), 
    navigation = v4.table, 
    avatarRoute = v6.Interface
});
v10.defaultProps = {
    captureFocusOnMount = false
};
v10.debugName = function(v11)
    local l_state_0 = v11.props.navigation.state;
    return (l_state_0.routeName or "") .. ":" .. (l_state_0.key or "");
end;
v10.render = function(v13)
    return v2.createElement(v8, {
        focusController = v13.props.focusController, 
        isGamepadInput = v13.props.isGamepadInput, 
        debugName = v13:debugName()
    });
end;
local function _(v14)
    return v14.navigation.state.key == v14.avatarRoute.current.key;
end;
v10.canCaptureFocus = function(v16, v17)
    local l_avatarRoute_0 = v16.props.avatarRoute;
    local l_isGamepadInput_0 = v16.props.isGamepadInput;
    local l_props_0 = v16.props;
    local v21 = l_props_0.navigation.state.key == l_props_0.avatarRoute.current.key;
    l_props_0 = ((v21 and l_avatarRoute_0.isVisible) and not l_avatarRoute_0.isOverlayVisible) and l_isGamepadInput_0;
    if v17 then
        v7:trace("{} {} canCapture: {}, isCurrentScreen: {}, currentRoute: {}, " .. "isVisible: {}, isOverlayVisible: {}, isGamepadInput: {}", v16:debugName(), v17, l_props_0, v21, l_avatarRoute_0.current, l_avatarRoute_0.isVisible, l_avatarRoute_0.isOverlayVisible, l_isGamepadInput_0);
    end;
    return l_props_0;
end;
v10.didMount = function(v22)
    if not (not v22.props.captureFocusOnMount or not v22:canCaptureFocus("didMount")) then
        v7:debug("captureFocusOnMount page: {}", v22:debugName());
        v22.props.focusController.captureFocus();
    end;
end;
v10.didUpdate = function(v23, v24)
    if not v23:canCaptureFocus("didUpdate") then
        if v24.isGamepadInput and not v23.props.isGamepadInput then
            v7:debug("releaseFocus {}", v23:debugName());
            v23.props.focusController.releaseFocus();
        end;
    else
        local v25 = not (v24.navigation.state.key == v24.avatarRoute.current.key);
        local v26 = not v24.isGamepadInput;
        local v27 = not v24.avatarRoute.isVisible;
        if not (not (v25 or v26) and not v27) then
            v7:debug("captureFocus {}, navigatedToThisPage: {}, acquiredVisibility: {}", v23:debugName(), v25, v27);
            v23.props.focusController.captureFocus();
            return ;
        end;
    end;
end;
return (l_withNavigation_0((v5((l_withIsGamepadInput_0(v10))))));
