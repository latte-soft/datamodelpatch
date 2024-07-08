local v0 = require(game:GetService("CorePackages").Logging);
v0.warn("Lua App Bootcamp Enabled");
local v1 = {};
local v2 = require(script.Parent.Parent.LuaAppIntroBootcamp);
v1.runBootcamp = function(_)
    for _, v5 in ipairs(v2) do
        v0.warn(v5);
    end;
end;
return v1;
