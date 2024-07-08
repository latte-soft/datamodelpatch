local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Boolean_0 = require(l_Parent_0.LuauPolyfill).Boolean;
local _ = require(l_Parent_0.GraphQL);
v0.graphQLResultHasError = function(v4)
    local v5;
    if l_Boolean_0.toJSBoolean(v4.errors) then
        v5 = true;
        if not (#v4.errors <= 0) then
            goto label0;
        end;
    end;
    v5 = false;
    ::label0::;
    return v5;
end;
return v0;
