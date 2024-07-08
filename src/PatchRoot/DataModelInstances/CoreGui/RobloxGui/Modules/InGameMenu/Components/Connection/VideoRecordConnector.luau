local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = settings():WaitForChild("Game Options");
local l_Parent_0 = script.Parent.Parent.Parent;
local v3 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v3.Roact;
local l_RoactRodux_0 = v3.RoactRodux;
local v6 = require(l_Parent_0.Actions.SetVideoRecording);
local v7 = require(l_Parent_0.Utility.ExternalEventConnection);
local v8 = l_Roact_0.PureComponent:extend("VideoRecordConnector");
v8.init = function(v9)
    v9.props.setVideoRecording(v1.VideoRecording);
end;
v8.render = function(v10)
    return l_Roact_0.createElement(v7, {
        event = v1:GetPropertyChangedSignal("VideoRecording"), 
        callback = function()
            v10.props.setVideoRecording(v1.VideoRecording);
        end
    });
end;
return l_RoactRodux_0.UNSTABLE_connect2(nil, function(v11)
    return {
        setVideoRecording = function(v12)
            return v11(v6(v12));
        end
    };
end)(v8);
