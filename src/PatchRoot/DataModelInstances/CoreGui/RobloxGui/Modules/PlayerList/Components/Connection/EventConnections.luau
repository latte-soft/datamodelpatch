local v0 = require(game:GetService("CorePackages").Roact);
local v1 = require(script.Parent.PlayerServiceConnector);
local v2 = require(script.Parent.TeamServiceConnector);
local v3 = require(script.Parent.LeaderstatsConnector);
local v4 = require(script.Parent.CoreGuiConnector);
local v5 = require(script.Parent.SocialConnector);
local v6 = require(script.Parent.GuiServiceConnector);
local v7 = require(script.Parent.UserInputServiceConnector);
local v8 = require(script.Parent.ScreenSizeConnector);
local v9 = v0.PureComponent:extend("EventConnections");
v9.render = function(_)
    return v0.createFragment({
        PlayerServiceConnector = v0.createElement(v1), 
        TeamServiceConnector = v0.createElement(v2), 
        LeaderstatsConnector = v0.createElement(v3), 
        CoreGuiConnector = v0.createElement(v4), 
        SocialConnector = v0.createElement(v5), 
        GuiServiceConnector = v0.createElement(v6), 
        UserInputServiceConnector = v0.createElement(v7), 
        ScreenSizeConnector = v0.createElement(v8)
    });
end;
return v9;
