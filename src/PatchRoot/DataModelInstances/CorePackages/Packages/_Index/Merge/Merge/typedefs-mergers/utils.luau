local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Boolean_0 = v1.Boolean;
local l_instanceof_0 = v1.instanceof;
local v4 = {};
local v5 = require(l_Parent_0.GraphQL);
local l_Source_0 = v5.Source;
local l_Kind_0 = v5.Kind;
v4.isStringTypes = function(v8)
    return typeof(v8) == "string";
end;
v4.isSourceTypes = function(v9)
    return l_instanceof_0(v9, l_Source_0);
end;
v4.extractType = function(v10)
    local l_v10_0 = v10;
    while not (l_v10_0.kind ~= l_Kind_0.LIST_TYPE) or l_v10_0.kind == "NonNullType" do
        l_v10_0 = l_v10_0.type;
    end;
    return l_v10_0;
end;
v4.isWrappingTypeNode = function(v12)
    return v12.kind ~= l_Kind_0.NAMED_TYPE;
end;
v4.isListTypeNode = function(v13)
    return v13.kind == l_Kind_0.LIST_TYPE;
end;
v4.isNonNullTypeNode = function(v14)
    return v14.kind == l_Kind_0.NON_NULL_TYPE;
end;
local function v15(v16)
    if not l_Boolean_0.toJSBoolean(v16.kind == l_Kind_0.LIST_TYPE) then
        if not l_Boolean_0.toJSBoolean(v16.kind == l_Kind_0.NON_NULL_TYPE) then
            return v16.name.value;
        else
            return ("%sformat(v15(v16.type));
        end;
    else
        return ("[%s]"):format(v15(v16.type));
    end;
end;
v4.printTypeNode = v15;
local v17 = {
    A_SMALLER_THAN_B = -1, 
    A_EQUALS_B = 0, 
    A_GREATER_THAN_B = 1
};
v4.CompareVal = v17;
v4.defaultStringComparator = function(v18, v19)
    if v18 == nil and v19 == nil then
        return v17.A_EQUALS_B;
    elseif v18 == nil then
        return v17.A_SMALLER_THAN_B;
    elseif v19 == nil then
        return v17.A_GREATER_THAN_B;
    elseif v18 < v19 then
        return v17.A_SMALLER_THAN_B;
    elseif v19 < v18 then
        return v17.A_GREATER_THAN_B;
    else
        return v17.A_EQUALS_B;
    end;
end;
return v4;
