local v0 = require(script:FindFirstAncestor("AppChat").Parent.Promise);
local v1 = {};
v1.__index = v1;
v1.onBeforeSendingMessage = function(_, _)
end;
v1.sendMessage = function(_, _)
    return v0.reject("Not implemented");
end;
v1.onSuccess = function(_, _, v8)
    return v8;
end;
v1.onFailure = function(_, _, v11)
    return v11;
end;
return v1;
