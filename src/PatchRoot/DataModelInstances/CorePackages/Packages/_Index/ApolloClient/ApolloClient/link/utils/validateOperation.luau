local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Parent.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Object_0 = v2.Object;
local l_InvariantError_0 = require(l_Parent_0.jsutils.invariant).InvariantError;
local _ = require(script.Parent.Parent.core.types);
v0.validateOperation = function(v7)
    local v8 = {
        "query", 
        "operationName", 
        "variables", 
        "extensions", 
        "context"
    };
    for _, v10 in ipairs(l_Object_0.keys(v7)) do
        if l_Array_0.indexOf(v8, v10) < 0 then
            error(l_InvariantError_0.new(("illegal argument: %s"):format(v10)));
        end;
    end;
    return v7;
end;
return v0;
