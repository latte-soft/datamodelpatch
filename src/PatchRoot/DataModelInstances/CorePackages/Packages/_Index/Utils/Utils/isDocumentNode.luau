local l_Parent_0 = script.Parent.Parent;
local l_Boolean_0 = require(l_Parent_0.LuauPolyfill).Boolean;
local v2 = {};
local l_Kind_0 = require(l_Parent_0.GraphQL).Kind;
v2.isDocumentNode = function(v4)
    local v5 = l_Boolean_0.toJSBoolean(v4);
    if v5 then
        v5 = false;
        if typeof(v4) == "table" then
            v5 = l_Boolean_0.toJSBoolean(v4.kind) and v4.kind == l_Kind_0.DOCUMENT;
        end;
    end;
    return v5;
end;
return v2;
