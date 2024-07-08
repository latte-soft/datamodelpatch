local function _(v0, v1)
    return (tonumber(v0, v1));
end;
local function _(v3)
    local v4 = false;
    if typeof(v3) == "number" then
        v4 = false;
        if v3 ~= math.huge then
            v4 = v3 == v3;
        end;
    end;
    return v4;
end;
local v6 = require(script.Parent.Parent.Parent.LuauPolyfill);
local l_Array_0 = v6.Array;
local l_Number_0 = v6.Number;
local l_Object_0 = v6.Object;
local _ = require(script.Parent.Parent.language.ast);
local l_inspect_0 = require(script.Parent.Parent.jsutils.inspect).inspect;
local l_isObjectLike_0 = require(script.Parent.Parent.jsutils.isObjectLike).isObjectLike;
local l_Kind_0 = require(script.Parent.Parent.language.kinds).Kind;
local l_print_0 = require(script.Parent.Parent.language.printer).print;
local l_GraphQLError_0 = require(script.Parent.Parent.error.GraphQLError).GraphQLError;
local l_GraphQLScalarType_0 = require(script.Parent.definition).GraphQLScalarType;
local v17 = nil;
local v18 = nil;
local v19 = nil;
local v20 = nil;
local v21 = nil;
local _ = nil;
serializeInt = function(v23)
    local v24 = v17(v23);
    if typeof(v24) == "boolean" then
        if not v24 then
            return 0;
        else
            return 1;
        end;
    else
        local l_v24_0 = v24;
        if typeof(v24) == "string" and v24 ~= "" then
            l_v24_0 = tonumber(v24);
        end;
        if not (typeof(l_v24_0) == "number" and l_Number_0.isInteger(l_v24_0)) then
            error(l_GraphQLError_0.new(("Int cannot represent non-integer value: %s"):format(l_inspect_0(v24))));
        end;
        if not (l_v24_0 <= 2147483647) or l_v24_0 < -2147483648 then
            error(l_GraphQLError_0.new("Int cannot represent non 32-bit signed integer value: " .. l_inspect_0(v24)));
        end;
        return l_v24_0;
    end;
end;
coerceInt = function(v26)
    if not (typeof(v26) == "number" and l_Number_0.isInteger(v26)) then
        error(l_GraphQLError_0.new(("Int cannot represent non-integer value: %s"):format(l_inspect_0(v26))));
    end;
    if not (v26 <= 2147483647) or v26 < -2147483648 then
        error(l_GraphQLError_0.new(("Int cannot represent non 32-bit signed integer value: %s"):format(v26)));
    end;
    return v26;
end;
local v29 = l_GraphQLScalarType_0.new({
    name = "Int", 
    description = "The `Int` scalar type represents non-fractional signed whole numeric values. Int can represent values between -(2^31) and 2^31 - 1.", 
    serialize = serializeInt, 
    parseValue = coerceInt, 
    parseLiteral = function(v27)
        if v27.kind ~= l_Kind_0.INT then
            error(l_GraphQLError_0.new(("Int cannot represent non-integer value: %s"):format(l_print_0(v27)), v27));
        end;
        local v28 = tonumber(v27.value, 10);
        if not (v28 <= 2147483647) or v28 < -2147483648 then
            error(l_GraphQLError_0.new(("Int cannot represent non 32-bit signed integer value: %s"):format(v27.value), v27));
        end;
        return v28;
    end
});
v19 = function(v30)
    local v31 = v17(v30);
    if typeof(v31) == "boolean" then
        if not v31 then
            return 0;
        else
            return 1;
        end;
    else
        local l_v31_0 = v31;
        if typeof(v31) == "string" and v31 ~= "" then
            l_v31_0 = tonumber(v31);
        end;
        if typeof(l_v31_0) == "number" then
            local l_l_v31_0_0 = l_v31_0;
            local v34 = false;
            if typeof(l_l_v31_0_0) == "number" then
                v34 = false;
                if l_l_v31_0_0 ~= math.huge then
                    v34 = l_l_v31_0_0 == l_l_v31_0_0;
                end;
            end;
            if v34 then
                goto label0;
            end;
        end;
        error(l_GraphQLError_0.new(("Float cannot represent non numeric value: %s"):format(l_inspect_0(v31))));
        ::label0::;
        return l_v31_0;
    end;
end;
coerceFloat = function(v35)
    if typeof(v35) == "number" then
        local v36 = false;
        if typeof(v35) == "number" then
            v36 = false;
            if v35 ~= math.huge then
                v36 = v35 == v35;
            end;
        end;
        if v36 then
            goto label1;
        end;
    end;
    error(l_GraphQLError_0.new(("Float cannot represent non numeric value: %s"):format(l_inspect_0(v35))));
    ::label1::;
    return v35;
end;
local v38 = l_GraphQLScalarType_0.new({
    name = "Float", 
    description = "The `Float` scalar type represents signed double-precision fractional values as specified by [IEEE 754](https://en.wikipedia.org/wiki/IEEE_floating_point).", 
    serialize = v19, 
    parseValue = coerceFloat, 
    parseLiteral = function(v37)
        if v37.kind ~= l_Kind_0.FLOAT and v37.kind ~= l_Kind_0.INT then
            error(l_GraphQLError_0.new(("Float cannot represent non numeric value: %s"):format(l_print_0(v37)), v37));
        end;
        return (tonumber(v37.value, nil));
    end
});
v17 = function(v39)
    if l_isObjectLike_0(v39) then
        if typeof(v39.valueOf) == "function" then
            local v40 = v39:valueOf();
            if not l_isObjectLike_0(v40) then
                return v40;
            end;
        end;
        if typeof(v39.toJSON) == "function" then
            return v39:toJSON();
        end;
    end;
    return v39;
end;
v21 = function(v41)
    local v42 = v17(v41);
    if typeof(v42) == "string" then
        return v42;
    elseif typeof(v42) == "boolean" then
        if not v42 then
            return "false";
        else
            return "true";
        end;
    else
        if typeof(v42) == "number" then
            local v43 = false;
            if typeof(v42) == "number" then
                v43 = false;
                if v42 ~= math.huge then
                    v43 = v42 == v42;
                end;
            end;
            if v43 then
                return (tostring(v42));
            end;
        end;
        error(l_GraphQLError_0.new(("String cannot represent value: %s"):format(l_inspect_0(v41))));
        return ;
    end;
end;
coerceString = function(v44)
    if typeof(v44) ~= "string" then
        error(l_GraphQLError_0.new(("String cannot represent a non string value: %s"):format(l_inspect_0(v44))));
    end;
    return v44;
end;
local v46 = l_GraphQLScalarType_0.new({
    name = "String", 
    description = "The `String` scalar type represents textual data, represented as UTF-8 character sequences. The String type is most often used by GraphQL to represent free-form human-readable text.", 
    serialize = v21, 
    parseValue = coerceString, 
    parseLiteral = function(v45)
        if v45.kind ~= l_Kind_0.STRING then
            error(l_GraphQLError_0.new(("String cannot represent a non string value: %s"):format(l_print_0(v45)), v45));
        end;
        return v45.value;
    end
});
v20 = function(v47)
    local v48 = v17(v47);
    if typeof(v48) == "boolean" then
        return v48;
    else
        local v49 = false;
        if typeof(v48) == "number" then
            v49 = false;
            if v48 ~= math.huge then
                v49 = v48 == v48;
            end;
        end;
        if not v49 then
            error(l_GraphQLError_0.new(("Boolean cannot represent a non boolean value: %s"):format(l_inspect_0(v48))));
            return ;
        else
            return v48 ~= 0;
        end;
    end;
end;
coerceBoolean = function(v50)
    if typeof(v50) ~= "boolean" then
        error(l_GraphQLError_0.new(("Boolean cannot represent a non boolean value: %s"):format(l_inspect_0(v50))));
    end;
    return v50;
end;
local v52 = l_GraphQLScalarType_0.new({
    name = "Boolean", 
    description = "The `Boolean` scalar type represents `true` or `false`.", 
    serialize = v20, 
    parseValue = coerceBoolean, 
    parseLiteral = function(v51)
        if v51.kind ~= l_Kind_0.BOOLEAN then
            error(l_GraphQLError_0.new(("Boolean cannot represent a non boolean value: %s"):format(l_print_0(v51)), v51));
        end;
        return v51.value;
    end
});
v18 = function(v53)
    local v54 = v17(v53);
    if typeof(v54) == "string" then
        return v54;
    elseif not l_Number_0.isInteger(v54) then
        error(l_GraphQLError_0.new(("ID cannot represent value: %s"):format(l_inspect_0(v53))));
        return ;
    else
        return (tostring(v54));
    end;
end;
coerceID = function(v55)
    if typeof(v55) == "string" then
        return v55;
    elseif not (typeof(v55) == "number") or not l_Number_0.isInteger(v55) then
        error(l_GraphQLError_0.new(("ID cannot represent value: %s"):format(l_inspect_0(v55))));
        return ;
    else
        return (tostring(v55));
    end;
end;
local v57 = l_GraphQLScalarType_0.new({
    name = "ID", 
    description = "The `ID` scalar type represents a unique identifier, often used to refetch an object or as key for a cache. The ID type appears in a JSON response as a String; however, it is not intended to be human-readable. When expected as an input type, any string (such as `\"4\"`) or integer (such as `4`) input value will be accepted as an ID.", 
    serialize = v18, 
    parseValue = coerceID, 
    parseLiteral = function(v56)
        if v56.kind ~= l_Kind_0.STRING and v56.kind ~= l_Kind_0.INT then
            error(l_GraphQLError_0.new("ID cannot represent a non-string and non-integer value: " .. l_print_0(v56), v56));
        end;
        return v56.value;
    end
});
local v58 = l_Object_0.freeze({
    v46, 
    v29, 
    v38, 
    v52, 
    v57
});
return {
    GraphQLInt = v29, 
    GraphQLFloat = v38, 
    GraphQLString = v46, 
    GraphQLBoolean = v52, 
    GraphQLID = v57, 
    specifiedScalarTypes = v58, 
    isSpecifiedScalarType = function(v59)
        return l_Array_0.some(v58, function(v60)
            return v59.name == v60.name;
        end);
    end
};
