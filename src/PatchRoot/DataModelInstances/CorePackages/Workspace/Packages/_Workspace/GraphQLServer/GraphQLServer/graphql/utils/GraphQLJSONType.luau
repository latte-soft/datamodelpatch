local l_Parent_0 = script:FindFirstAncestor("GraphQLServer").Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local v5 = {};
local v6 = require(l_Parent_0.GraphQL);
local l_GraphQLScalarType_0 = v6.GraphQLScalarType;
local l_Kind_0 = v6.Kind;
local l_print_0 = v6.print;
local v10 = nil;
local function _(v11, v12)
    return (tonumber(v11, v12));
end;
local function v15(v14)
    return v14;
end;
local function v19(v16)
    local l_toJSBoolean_0 = l_Boolean_0.toJSBoolean;
    local v18 = true;
    if typeof(v16) == "table" then
        v18 = true;
        if v16 ~= nil then
            v18 = l_Array_0.isArray(v16);
        end;
    end;
    if l_toJSBoolean_0(v18) then
        error(l_Error_0.new(("JSONObject cannot represent non-object value: %s"):format((tostring(v16)))));
    end;
    return v16;
end;
local function _(v20, v21, v22)
    local v23 = {};
    l_Array_0.forEach(v21.fields, function(v24)
        v23[v24.name.value] = v10(v20, v24.value, v22);
    end);
    return v23;
end;
v10 = function(v26, v27, v28)
    local l_kind_0 = v27.kind;
    if not (l_kind_0 ~= l_Kind_0.STRING) or l_kind_0 == l_Kind_0.BOOLEAN then
        return v27.value;
    elseif not (l_kind_0 ~= l_Kind_0.INT) or l_kind_0 == l_Kind_0.FLOAT then
        return (tonumber(v27.value, nil));
    elseif l_kind_0 == l_Kind_0.OBJECT then
        local v30 = {};
        l_Array_0.forEach(v27.fields, function(v31)
            v30[v31.name.value] = v10(v26, v31.value, v28);
        end);
        return v30;
    elseif l_kind_0 == l_Kind_0.LIST then
        return l_Array_0.map(v27.values, function(v32)
            return v10(v26, v32, v28);
        end);
    elseif l_kind_0 == l_Kind_0.NULL then
        return nil;
    elseif l_kind_0 == l_Kind_0.VARIABLE then
        if not l_Boolean_0.toJSBoolean(v28) then
            return nil;
        else
            return v28[v27.name.value];
        end;
    else
        error(l_Error_0.new(("%s cannot represent value: %s"):format(v26, l_print_0(v27))));
        return nil;
    end;
end;
local v35 = l_GraphQLScalarType_0.new({
    name = "JSON", 
    description = "The `JSON` scalar type represents JSON values as specified by [ECMA-404](http://www.ecma-international.org/publications/files/ECMA-ST/ECMA-404.pdf).", 
    specifiedByUrl = "http://www.ecma-international.org/publications/files/ECMA-ST/ECMA-404.pdf", 
    serialize = v15, 
    parseValue = v15, 
    parseLiteral = function(v33, v34)
        return v10("JSON", v33, v34);
    end
});
v5.GraphQLJSON = v35;
v5.default = v35;
v5.GraphQLJSONObject = l_GraphQLScalarType_0.new({
    name = "JSONObject", 
    description = "The `JSONObject` scalar type represents JSON objects as specified by [ECMA-404](http://www.ecma-international.org/publications/files/ECMA-ST/ECMA-404.pdf).", 
    specifiedByUrl = "http://www.ecma-international.org/publications/files/ECMA-ST/ECMA-404.pdf", 
    serialize = v19, 
    parseValue = v19, 
    parseLiteral = function(v36, v37)
        if v36.kind ~= l_Kind_0.OBJECT then
            error(l_Error_0.new(("JSONObject cannot represent non-object value: %s"):format(l_print_0(v36))));
        end;
        local v38 = {};
        local l_forEach_0 = l_Array_0.forEach;
        local l_fields_0 = v36.fields;
        local v41 = "JSONObject";
        l_forEach_0(l_fields_0, function(v42)
            v38[v42.name.value] = v10(v41, v42.value, v37);
        end);
        return v38;
    end
});
return v5;
