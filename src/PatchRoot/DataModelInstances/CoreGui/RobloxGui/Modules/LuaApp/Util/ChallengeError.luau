local l_CoreGui_0 = game:GetService("CoreGui");
local v1 = require(game:GetService("CorePackages").Packages.LuauPolyfill);
local v2 = require(l_CoreGui_0.RobloxGui.Modules.LuaApp.Enum.Challenge.ErrorKind);
local v3 = {};
v3.__index = v3;
v3.new = function(_, v5, v6)
    local v7 = {};
    setmetatable(v7, v3);
    v7.kind = v5;
    v7.data = v6;
    return v7;
end;
v3.match = function(v8)
    return v1.instanceof(v8, v3);
end;
v3.matchAbandoned = function(v9)
    return v3.match(v9) and v9.kind == v2.Abandoned;
end;
return v3;
