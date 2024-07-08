local l_Boolean_0 = require(script.Parent.Parent.Parent.Parent.LuauPolyfill).Boolean;
local v1 = {};
local _ = require(script.Parent.Parent.core.types);
v1.selectURI = function(v3, v4)
    local l_uri_0 = v3:getContext().uri;
    if not l_Boolean_0.toJSBoolean(l_uri_0) then
        if typeof(v4) == "function" then
            return v4(v3);
        else
            return not not l_Boolean_0.toJSBoolean(v4) and v4 or "/graphql";
        end;
    else
        return l_uri_0;
    end;
end;
return v1;
