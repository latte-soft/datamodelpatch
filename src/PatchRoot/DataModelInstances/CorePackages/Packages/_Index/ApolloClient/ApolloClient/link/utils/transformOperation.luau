local v0 = {};
local l_Boolean_0 = require(script.Parent.Parent.Parent.Parent.LuauPolyfill).Boolean;
local _ = require(script.Parent.Parent.core.types);
local l_getOperationName_0 = require(script.Parent.Parent.Parent.utilities).getOperationName;
v0.transformOperation = function(v4)
    local v5 = {
        variables = not not l_Boolean_0.toJSBoolean(v4.variables) and v4.variables or {}, 
        extensions = not not l_Boolean_0.toJSBoolean(v4.extensions) and v4.extensions or {}, 
        operationName = v4.operationName, 
        query = v4.query
    };
    if not l_Boolean_0.toJSBoolean(v5.operationName) then
        if typeof(v5.query) ~= "string" then
            v5.operationName = not not l_Boolean_0.toJSBoolean(l_getOperationName_0(v5.query)) and l_getOperationName_0(v5.query) or nil;
            return v5;
        else
            v5.operationName = "";
        end;
    end;
    return v5;
end;
return v0;
