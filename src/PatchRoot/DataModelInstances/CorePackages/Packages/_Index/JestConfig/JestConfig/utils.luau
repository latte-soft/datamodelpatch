local l_Parent_0 = script.Parent.Parent;
local l_String_0 = require(l_Parent_0.LuauPolyfill).String;
local v2 = {};
local v3 = require(l_Parent_0.ChalkLua);
local _ = require(l_Parent_0.JestTypes);
v2.BULLET = v3.bold("\226\151\143 ");
v2.DOCUMENTATION_NOTE = ("  %s\n  https://jestjs.io/docs/configuration\n"):format(v3.bold("Configuration Documentation:"));
v2.isJSONString = function(v5)
    local v6 = false;
    if v5 ~= nil then
        v6 = false;
        if typeof(v5) == "string" then
            v6 = l_String_0.startsWith(v5, "{") and l_String_0.endsWith(v5, "}");
        end;
    end;
    return v6;
end;
return v2;
