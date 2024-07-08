local v0 = require(script.Parent.SendMessageUsingPolicy);
local v1 = require(script.Parent.SendPolicies.SendChatTextMessagePolicy);
return function(v2, v3, v4)
    return v0((v1:new(v2, v3, v4)));
end;
