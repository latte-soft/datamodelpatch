local l_Parent_0 = script.Parent.Parent;
local l_Boolean_0 = require(l_Parent_0.LuauPolyfill).Boolean;
local v2 = {};
local _ = require(l_Parent_0.JestTypes);
local l_default_0 = require(script.Parent.getNoTestFound).default;
local l_default_1 = require(script.Parent.getNoTestFoundPassWithNoTests).default;
local l_default_2 = require(script.Parent.getNoTestFoundVerbose).default;
local _ = require(script.Parent.types);
v2.default = function(v8, v9)
    local v10 = l_Boolean_0.toJSBoolean(v9.passWithNoTests);
    if not l_Boolean_0.toJSBoolean(v9.passWithNoTests) then
        local v11 = {
            exitWith0 = v10
        };
        local l_toJSBoolean_0 = l_Boolean_0.toJSBoolean;
        local v13 = true;
        if #v8 ~= 1 then
            v13 = v9.verbose;
        end;
        v11.message = if not l_toJSBoolean_0(v13) then l_default_0(v8, v9, v10) else l_default_2(v8, v9, v10);
        return v11;
    else
        return {
            exitWith0 = v10, 
            message = l_default_1()
        };
    end;
end;
return v2;
