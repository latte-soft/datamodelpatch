local v0 = require(game:GetService("CorePackages").Roact);
local v1 = require(script.Parent.Parent.DataConsumer);
local l_CommandLineHeight_0 = require(script.Parent.Parent.Parent.Constants).LogFormatting.CommandLineHeight;
local v3 = require(script.Parent.DevConsoleCommandLine);
local v4 = require(script.Parent.LogOutput);
local v5 = v0.Component:extend("ServerLog");
v5.init = function(v6)
    v6.initServerLogData = function()
        return v6.props.ServerLogData:getLogData();
    end;
end;
v5.render = function(v7)
    return v0.createElement("Frame", {
        Size = v7.props.size, 
        BackgroundTransparency = 1, 
        LayoutOrder = v7.props.layoutOrder
    }, {
        Scroll = v0.createElement(v4, {
            size = UDim2.new(1, 0, 1, -(l_CommandLineHeight_0 + 4)), 
            targetSignal = v7.props.ServerLogData:Signal(), 
            initLogOutput = v7.initServerLogData
        }), 
        CommandLine = v0.createElement(v3, {
            pos = UDim2.new(0, 0, 1, -l_CommandLineHeight_0), 
            height = l_CommandLineHeight_0
        })
    });
end;
return v1(v5, "ServerLogData");
