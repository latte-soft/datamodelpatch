local l_Parent_0 = script.Parent.Parent;
local l_Boolean_0 = require(l_Parent_0.LuauPolyfill).Boolean;
local v2 = {};
local v3 = require(l_Parent_0.GraphQL);
local l_doTypesOverlap_0 = v3.doTypesOverlap;
local l_isCompositeType_0 = v3.isCompositeType;
local _ = require(script.Parent.types);
v2.implementsAbstractType = function(v7, v8, v9)
    if not (v9 ~= nil) or v8 == nil then
        return false;
    elseif v8 == v9 then
        return true;
    else
        local l_toJSBoolean_0 = l_Boolean_0.toJSBoolean;
        local v11 = l_isCompositeType_0(v8);
        if not l_toJSBoolean_0(if not l_Boolean_0.toJSBoolean(v11) then v11 else l_isCompositeType_0(v9)) then
            return false;
        else
            return l_doTypesOverlap_0(v7, v8, v9);
        end;
    end;
end;
return v2;
