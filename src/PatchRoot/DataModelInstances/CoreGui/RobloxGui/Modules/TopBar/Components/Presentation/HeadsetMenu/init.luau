local l_CorePackages_0 = game:GetService("CorePackages");
local _ = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local l_VRService_0 = game:GetService("VRService");
local v5 = require(l_CorePackages_0.Roact);
local v6 = require(l_CorePackages_0.RoactRodux);
local v7 = require(l_CorePackages_0.Packages.t);
local v8 = require(script.Parent.Parent.Parent.Parent.Common.EventConnection);
local l_isSubjectToDesktopPolicies_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies;
local v10 = require(script.DisconnectedDialog);
local v11 = v5.PureComponent:extend("HeadsetMenu");
v11.validateProps = v7.strictInterface({
    screenSize = v7.Vector2, 
    vrService = v7.optional(v7.union(v7.instanceOf("VRService"), v7.table)), 
    guiService = v7.optional(v7.union(v7.instanceOf("GuiService"), v7.table))
});
v11.defaultProps = {
    vrService = l_VRService_0, 
    guiService = l_GuiService_0
};
v11.init = function(v12)
    v12.state = {
        vrDeviceAvailable = false, 
        shouldShowDisconnectDialog = false
    };
    v12.restartApp = function()
        local l_NotificationTypeList_0 = v12.props.guiService:GetNotificationTypeList();
        if not l_isSubjectToDesktopPolicies_0() then
            l_RunService_0.Heartbeat:Wait();
            game:Shutdown();
        elseif not game:GetEngineFeature("EnableLuaControlsRestartApp") then
            v12.props.guiService:BroadcastNotification("", l_NotificationTypeList_0.NATIVE_EXIT);
        else
            v12.props.guiService:BroadcastNotification("", l_NotificationTypeList_0.RESTART_APP);
        end;
        v12:setState({
            shouldShowDisconnectDialog = false
        });
    end;
end;
v11.render = function(v14)
    return v5.createFragment({
        HeadsetConnection = v5.createElement(v8, {
            event = v14.props.vrService:GetPropertyChangedSignal("VRDeviceAvailable"), 
            callback = function()
                v14:setState({
                    vrDeviceAvailable = v14.props.vrService.VRDeviceAvailable
                });
            end
        }, {
            HeadsetDisconnectedDialog = v5.createElement(v10, {
                visible = v14.state.shouldShowDisconnectDialog, 
                screenSize = v14.props.screenSize, 
                onConfirm = v14.restartApp, 
                guiService = v14.props.guiService
            })
        })
    });
end;
v11.didMount = function(v15)
    v15:setState({
        vrDeviceAvailable = v15.props.vrService.VRDeviceAvailable
    });
end;
v11.didUpdate = function(v16, _, v18)
    if not (not (v16.state.vrDeviceAvailable ~= v18.vrDeviceAvailable) or v16.state.vrDeviceAvailable) then
        v16:setState({
            shouldShowDisconnectDialog = true
        });
    end;
end;
return (v6.connect(function(v19)
    return {
        screenSize = v19.displayOptions.screenSize
    };
end)(v11));
