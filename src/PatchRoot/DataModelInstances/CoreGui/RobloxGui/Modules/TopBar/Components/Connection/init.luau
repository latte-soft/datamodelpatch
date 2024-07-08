local v0 = require(game:GetService("CorePackages").Roact);
local v1 = require(script.CoreGuiConnector);
local v2 = require(script.MenuConnector);
local v3 = require(script.ChatConnector);
local v4 = require(script.HealthConnector);
local v5 = require(script.EnabledNotifier);
local v6 = require(script.OpenUIConnector);
local v7 = require(script.LastInputTypeConnector);
local v8 = v0.PureComponent:extend("Connection");
v8.render = function(_)
    return v0.createFragment({
        CoreGuiConnector = v0.createElement(v1), 
        MenuConnector = v0.createElement(v2), 
        ChatConnector = v0.createElement(v3), 
        HealthConnector = v0.createElement(v4), 
        EnabledNotifier = v0.createElement(v5), 
        OpenUIConnector = v0.createElement(v6), 
        LastInputTypeConnector = v0.createElement(v7)
    });
end;
return v8;
