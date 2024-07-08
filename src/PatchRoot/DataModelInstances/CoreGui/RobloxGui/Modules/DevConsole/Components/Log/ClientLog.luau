local v0 = require(game:GetService("CorePackages").Roact);
local v1 = require(script.Parent.Parent.DataConsumer);
local v2 = require(script.Parent.LogOutput);
local v3 = v0.Component:extend("ClientLog");
v3.init = function(v4)
    v4.initClientLogData = function()
        return v4.props.ClientLogData:getLogData();
    end;
end;
v3.render = function(v5)
    return v0.createElement(v2, {
        layoutOrder = v5.props.layoutOrder, 
        size = v5.props.size, 
        initLogOutput = v5.initClientLogData, 
        targetSignal = v5.props.ClientLogData:Signal()
    });
end;
return v1(v3, "ClientLogData");
