local l_Boolean_0 = require(script.Parent.Parent.Parent.Parent.LuauPolyfill).Boolean;
local v1 = {
    __value = "null"
};
return {
    NULL = v1, 
    toJSBoolean = function(v2)
        return l_Boolean_0.toJSBoolean(v2) and v2 ~= v1;
    end
};
