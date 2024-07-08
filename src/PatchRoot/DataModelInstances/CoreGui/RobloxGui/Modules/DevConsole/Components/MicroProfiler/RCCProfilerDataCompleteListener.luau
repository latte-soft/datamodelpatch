local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(script.Parent.Parent.Parent.Util.getClientReplicator);
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(script.Parent.Parent.Parent.Actions.SetRCCProfilerState);
local v5 = v2.Component:extend("RCCProfilerDataCompleteListener");
v5.didMount = function(v6)
    local v7 = v1();
    if v7 then
        v6.completeSignal = v7.RCCProfilerDataComplete:Connect(function(v8, v9)
            if v6.props.waitingForRecording then
                if v8 then
                    v6.props.dispatchSetRCCProfilerState(false, v9);
                else
                    warn(v9);
                    v6.props.dispatchSetRCCProfilerState(false);
                    return ;
                end;
            end;
        end);
    end;
end;
v5.willUnmount = function(v10)
    if v10.completeSignal then
        v10.completeSignal:Disconnect();
        v10.completeSignal = nil;
    end;
end;
v5.render = function(_)
    return nil;
end;
return v3.UNSTABLE_connect2(function(v12, _)
    return {
        waitingForRecording = v12.MicroProfiler.waitingForRecording
    };
end, function(v14)
    return {
        dispatchSetRCCProfilerState = function(v15, v16)
            v14(v4(v15, v16));
        end
    };
end)(v5);
