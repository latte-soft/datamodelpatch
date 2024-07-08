local v0 = require(script.Parent.Parent.Dev.Promise);
local v1 = {};
v1.__index = v1;
v1.new = function()
    return (setmetatable({}, v1));
end;
v1.registerURL = function(_, _)
end;
v1.detectURL = function(_, _)
end;
v1.listenForLuaURLs = function(_, _)
end;
v1.stopListeningForLuaURLs = function(_)
end;
v1.openURL = function(v9, v10)
    v9.lastOpenedURL = v10;
    return v0.resolve(true);
end;
v1.isURLRegistered = function(_, _)
    return v0.resolve(true);
end;
return v1;
