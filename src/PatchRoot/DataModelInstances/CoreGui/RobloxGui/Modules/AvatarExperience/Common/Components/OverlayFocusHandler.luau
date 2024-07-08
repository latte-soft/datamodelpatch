local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v5 = require(l_CorePackages_0.Promise);
local v6 = require(l_CorePackages_0.Cryo);
local v7 = require(l_CorePackages_0.Roact);
local l_withNavigationFocus_0 = require(l_CorePackages_0.RoactNavigation).withNavigationFocus;
local v9 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v9.Focusable;
local v11 = require(l_CorePackages_0.Packages.t);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.NavigationEventsLogger);
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v15 = require(l_Modules_0.AvatarExperience.Common.Debug.LogTree).logger("ax.gamepad");
local l_isGamepadInput_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).isGamepadInput;
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.BoundInputsUpdater);
local v18 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusRecovery);
local v19 = require(l_Modules_0.AvatarExperience.Common.Components.AvatarVRPanelWrapper);
local v20 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreenProperties);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local l_GetFFlagLuafiedReportEntryPoints_0 = v4.GetFFlagLuafiedReportEntryPoints;
local v23 = v7.PureComponent:extend("OverlayFocusHandler");
v23.validateProps = v11.strictInterface({
    overlayComponent = v11.union(v11.table, v11.callback), 
    arguments = v11.table, 
    navigation = v11.table, 
    isFocused = v11.boolean
});
v23.init = function(v24)
    v24:setState({
        gamepadFocused = false, 
        lastInputIsGamepad = l_isGamepadInput_0((l_UserInputService_0:GetLastInputType()))
    });
    v24.mounted = false;
    v24.focusController = v9.createFocusController();
    v24.defaultChildRef = v7.createRef();
    v24.onFocusChanged = function(v25)
        if v24.mounted then
            v24:setState({
                gamepadFocused = v25
            });
        end;
    end;
    v24.closePrompt = function()
        v14.closeOverlay(v24.props.navigation);
    end;
end;
v23.didMount = function(v26)
    v26.mounted = true;
    v26:handleUpdate(v6.Dictionary.join(v26.props, {
        isFocused = false
    }), v26.state);
end;
v23.willUnmount = function(v27)
    v27.mounted = false;
end;
v23.didUpdate = function(v28, v29, v30)
    v28:handleUpdate(v29, v30);
end;
v23.cancelCaptureFocus = function(v31)
    if v31.captureFocusPromise then
        v31.captureFocusPromise:cancel();
        v31.captureFocusPromise = nil;
    end;
end;
v23.captureFocusAfterDelay = function(v32, v33)
    v32:cancelCaptureFocus();
    v32.captureFocusPromise = v5.delay(v33):andThen(v32.focusController.captureFocus);
end;
v23.handleUpdate = function(v34, v35, v36)
    local l_lastInputIsGamepad_0 = v34.state.lastInputIsGamepad;
    local l_lastInputIsGamepad_1 = v36.lastInputIsGamepad;
    local v39 = l_lastInputIsGamepad_0 and v34.props.isFocused;
    local v40 = not l_lastInputIsGamepad_1 and l_lastInputIsGamepad_0;
    local v41 = l_lastInputIsGamepad_1 and not l_lastInputIsGamepad_0;
    local v42 = not v35.isFocused and v34.props.isFocused;
    if not v39 or not v42 and not v40 then
        if v41 then
            v15:trace("releaseFocus [Overlay]");
            v34.focusController.releaseFocus();
        end;
        return ;
    else
        v15:trace("captureFocus [Overlay], navigatedToPage: {}, acquiredGamepadInput: {}", v42, v40);
        v34.focusController.captureFocus();
        return ;
    end;
end;
v23.getChildren = function(v43)
    local l_overlayComponent_0 = v43.props.overlayComponent;
    local l_arguments_0 = v43.props.arguments;
    return {
        NavigationEventsLogger = v7.createElement(v13, {
            pageName = "[Overlay]"
        }), 
        LastInputTypeChangedConnection = v7.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.LastInputTypeChanged, 
            callback = function(v46)
                local v47 = l_isGamepadInput_0(v46);
                if v47 ~= v43.state.lastInputIsGamepad then
                    v43:setState({
                        lastInputIsGamepad = v47
                    });
                end;
            end
        }), 
        BoundInputsUpdater = if not l_IsVRAppBuild_0() then v7.createElement(v17) else nil, 
        GamepadFocusRecovery = v7.createElement(v18, {
            focusController = v43.focusController, 
            isGamepadInput = v43.state.lastInputIsGamepad, 
            debugName = "[Overlay]"
        }), 
        OverlayScreen = v7.createElement(l_overlayComponent_0, if not l_arguments_0.focusController then v6.Dictionary.join(l_arguments_0, {
            defaultChildRef = v43.defaultChildRef, 
            focusController = v43.focusController
        }) else v6.Dictionary.join(l_arguments_0, {
            defaultChildRef = v43.defaultChildRef
        }))
    };
end;
v23.render = function(v48)
    if not l_IsVRAppBuild_0() then
        return v7.createElement(l_Focusable_0.Frame, {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            focusController = v48.focusController, 
            onFocusChanged = v48.onFocusChanged, 
            defaultChild = v48.defaultChildRef, 
            inputBindings = {
                closePrompt = v9.Input.onBegin(Enum.KeyCode.ButtonB, v48.closePrompt)
            }
        }, v48:getChildren());
    else
        local l_routeName_0 = v48.props.navigation.state.routeName;
        return v7.createElement(v19, {
            panelPlacement = v20[l_routeName_0].VRPanelPlacement, 
            roundedCornersFrame = not not l_GetFFlagLuafiedReportEntryPoints_0() and v20[l_routeName_0].VRPanelRoundedCorners
        }, v48:getChildren());
    end;
end;
return l_withNavigationFocus_0(v23);
