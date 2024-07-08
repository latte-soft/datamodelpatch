local l_Parent_0 = script.Parent.Parent;
local l_Boolean_0 = require(l_Parent_0.LuauPolyfill).Boolean;
local v2 = {};
local l_isObjectType_0 = require(l_Parent_0.GraphQL).isObjectType;
local _ = require(script.Parent.types);
v2.getObjectTypeFromTypeMap = function(v5, v6)
    if v6 then
        local v7 = v5:get(v6.name);
        if l_Boolean_0.toJSBoolean(l_isObjectType_0(v7)) then
            return v7;
        end;
    end;
    return nil;
end;
return v2;
