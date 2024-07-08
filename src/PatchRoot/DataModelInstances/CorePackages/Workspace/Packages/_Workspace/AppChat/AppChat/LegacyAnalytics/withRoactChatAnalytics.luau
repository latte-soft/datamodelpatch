local v0 = require(script:FindFirstAncestor("AppChat").Parent.Roact);
local v1 = require(script.Parent.RoactChatAnalyticsConsumer);
return function(v2)
    assert(type(v2) == "function", "Expect renderCallback to be a function.");
    return v0.createElement(v1, {
        render = v2
    });
end;
