local v0 = require(script.Parent.Parent.Parent.LuauPolyfill);
local l_Array_0 = v0.Array;
local l_Boolean_0 = v0.Boolean;
local l_inspect_0 = require(script.Parent.Parent.jsutils.inspect).inspect;
local l_invariant_0 = require(script.Parent.Parent.jsutils.invariant).invariant;
local l_print_0 = require(script.Parent.Parent.language.printer).print;
local l_printBlockString_0 = require(script.Parent.Parent.language.blockString).printBlockString;
local l_isIntrospectionType_0 = require(script.Parent.Parent.type.introspection).isIntrospectionType;
local l_GraphQLString_0 = require(script.Parent.Parent.type.scalars).GraphQLString;
local l_isSpecifiedScalarType_0 = require(script.Parent.Parent.type.scalars).isSpecifiedScalarType;
local v10 = require(script.Parent.Parent.type.directives);
local l_DEFAULT_DEPRECATION_REASON_0 = v10.DEFAULT_DEPRECATION_REASON;
local l_isSpecifiedDirective_0 = v10.isSpecifiedDirective;
local v13 = require(script.Parent.Parent.type.definition);
local l_isScalarType_0 = v13.isScalarType;
local l_isObjectType_0 = v13.isObjectType;
local l_isInterfaceType_0 = v13.isInterfaceType;
local l_isUnionType_0 = v13.isUnionType;
local l_isEnumType_0 = v13.isEnumType;
local l_isInputObjectType_0 = v13.isInputObjectType;
local _ = require(script.Parent.Parent.type.schema);
local _ = require(script.Parent.Parent.language.ast);
local l_astFromValue_0 = require(script.Parent.astFromValue).astFromValue;
local l_NULL_0 = require(script.Parent.astFromValue).NULL;
local v24 = require(script.Parent.Parent.luaUtils.isNillish);
local l_isNillish_0 = v24.isNillish;
local l_isNotNillish_0 = v24.isNotNillish;
local v27 = nil;
local v28 = nil;
local v29 = nil;
local v30 = nil;
local v31 = nil;
local v32 = nil;
local v33 = nil;
local v34 = nil;
local v35 = nil;
local v36 = nil;
local v37 = nil;
local v38 = nil;
local v39 = nil;
local v40 = nil;
local v41 = nil;
local v42 = nil;
local v43 = nil;
local v44 = nil;
local v45 = nil;
local function v48(v46)
    return v29(v46, function(v47)
        return not l_isSpecifiedDirective_0(v47);
    end, v30);
end;
local function v50(v49)
    return v29(v49, l_isSpecifiedDirective_0, l_isIntrospectionType_0);
end;
v30 = function(v51)
    return not l_isSpecifiedScalarType_0(v51) and not l_isIntrospectionType_0(v51);
end;
v29 = function(v52, v53, v54)
    return l_Array_0.join(l_Array_0.filter(l_Array_0.concat({
        v31(v52)
    }, l_Array_0.map(l_Array_0.filter(v52:getDirectives(), v53), function(v55)
        return v32(v55);
    end), l_Array_0.map(l_Array_0.filter(v52:getTypeMap():values(), v54), function(v56)
        return v33(v56);
    end)), function(v57)
        return l_Boolean_0.toJSBoolean(v57);
    end), "\n\n") .. "\n";
end;
v31 = function(v58)
    if not l_isNillish_0(v58.description) or not v34(v58) then
        local v59 = {};
        local v60 = v58:getQueryType();
        if l_isNotNillish_0(v60) then
            table.insert(v59, ("  query: %s"):format(v60.name));
        end;
        local v61 = v58:getMutationType();
        if l_isNotNillish_0(v61) then
            table.insert(v59, ("  mutation: %s"):format(v61.name));
        end;
        local v62 = v58:getSubscriptionType();
        if l_isNotNillish_0(v62) then
            table.insert(v59, ("  subscription: %s"):format(v62.name));
        end;
        return v28(v58) .. ("schema {\n%s\n}"):format(l_Array_0.join(v59, "\n"));
    else
        return ;
    end;
end;
v34 = function(v63)
    local v64 = v63:getQueryType();
    if l_isNotNillish_0(v64) and v64.name ~= "Query" then
        return false;
    else
        local v65 = v63:getMutationType();
        if l_isNotNillish_0(v65) and v65.name ~= "Mutation" then
            return false;
        else
            local v66 = v63:getSubscriptionType();
            if l_isNotNillish_0(v66) and v66.name ~= "Subscription" then
                return false;
            else
                return true;
            end;
        end;
    end;
end;
v33 = function(v67)
    if not l_isScalarType_0(v67) then
        if not l_isObjectType_0(v67) then
            if not l_isInterfaceType_0(v67) then
                if not l_isUnionType_0(v67) then
                    if not l_isEnumType_0(v67) then
                        if not l_isInputObjectType_0(v67) then
                            l_invariant_0(false, "Unexpected type: " .. l_inspect_0(v67));
                            return "";
                        else
                            return v43(v67);
                        end;
                    else
                        return v42(v67);
                    end;
                else
                    return v41(v67);
                end;
            else
                return v40(v67);
            end;
        else
            return v35(v67);
        end;
    else
        return v27(v67);
    end;
end;
v27 = function(v68)
    return v28(v68) .. ("scalar %s"):format(v68.name) .. v44(v68);
end;
local function v72(v69)
    local v70 = v69:getInterfaces();
    if #v70 > 0 then
        return " implements " .. l_Array_0.join(l_Array_0.map(v70, function(v71)
            return v71.name;
        end), " & ");
    else
        return "";
    end;
end;
v35 = function(v73)
    return v28(v73) .. ("type %s"):format(v73.name) .. v72(v73) .. v45(v73);
end;
v40 = function(v74)
    return v28(v74) .. ("interface %s"):format(v74.name) .. v72(v74) .. v45(v74);
end;
v41 = function(v75)
    local v76 = v75:getTypes();
    return v28(v75) .. "union " .. v75.name .. if #v76 > 0 then " = " .. l_Array_0.join(v76, " | ") else "";
end;
v42 = function(v77)
    return v28(v77) .. ("enum %s"):format(v77.name) .. v39((l_Array_0.map(v77:getValues(), function(v78, v79)
        return v28(v78, "  ", v79 == 1) .. "  " .. v78.name .. v38(v78.deprecationReason);
    end)));
end;
v43 = function(v80)
    return v28(v80) .. ("input %s"):format(v80.name) .. v39((l_Array_0.map(v80:getFields():values(), function(v81, v82)
        return v28(v81, "  ", v82 == 1) .. "  " .. v37(v81);
    end)));
end;
v45 = function(v83)
    return v39((l_Array_0.map(v83:getFields():values(), function(v84, v85)
        return v28(v84, "  ", v85 == 1) .. "  " .. v84.name .. v36(v84.args, "  ") .. ": " .. tostring(v84.type) .. v38(v84.deprecationReason);
    end)));
end;
v39 = function(v86)
    if #v86 ~= 0 then
        return " {\n" .. l_Array_0.join(v86, "\n") .. "\n}";
    else
        return "";
    end;
end;
v36 = function(v87, v88)
    local v89 = if v88 ~= nil then v88 else "";
    if #v87 == 0 then
        return "";
    elseif not l_Array_0.every(v87, function(v90)
        return l_isNillish_0(v90.description);
    end) then
        return "(\n" .. l_Array_0.join(l_Array_0.map(v87, function(v91, v92)
            return v28(v91, "  " .. v89, v92 == 1) .. "  " .. v89 .. v37(v91);
        end), "\n") .. "\n" .. v89 .. ")";
    else
        return "(" .. l_Array_0.join(l_Array_0.map(v87, v37), ", ") .. ")";
    end;
end;
v37 = function(v93)
    local v94 = l_astFromValue_0(v93.defaultValue, v93.type);
    local v95 = v93.name .. ": " .. tostring(v93.type);
    if l_isNotNillish_0(v94) then
        v95 = v95 .. (" = %s"):format(l_print_0(v94));
    end;
    return v95 .. v38(v93.deprecationReason);
end;
v32 = function(v96)
    return v28(v96) .. "directive @" .. v96.name .. v36(v96.args) .. (not v96.isRepeatable and "" or " repeatable") .. " on " .. l_Array_0.join(v96.locations, " | ");
end;
v38 = function(v97)
    if not l_isNillish_0(v97) then
        local v98 = l_astFromValue_0(v97, l_GraphQLString_0);
        if v98 and v97 ~= l_DEFAULT_DEPRECATION_REASON_0 then
            return " @deprecated(reason: " .. l_print_0(v98) .. ")";
        else
            return " @deprecated";
        end;
    else
        return "";
    end;
end;
v44 = function(v99)
    if not l_isNillish_0(v99.specifiedByUrl) then
        local v100 = l_astFromValue_0(v99.specifiedByUrl, l_GraphQLString_0);
        l_invariant_0(v100, "Unexpected null value returned from `astFromValue` for specifiedByUrl");
        return " @specifiedBy(url: " .. l_print_0(v100) .. ")";
    else
        return "";
    end;
end;
v28 = function(v101, v102, v103)
    local v104 = if v102 ~= nil then v102 else "";
    local v105 = not (v103 ~= nil) or v103;
    local l_description_0 = v101.description;
    if not l_isNillish_0(l_description_0) then
        local v107 = l_printBlockString_0(l_description_0, "", string.len(l_description_0) > 70);
        local v108 = if not l_Boolean_0.toJSBoolean(v104) or v105 then v104 else "\n" .. v104;
        local v109, _ = string.gsub(v107, "\n", "\n" .. v104);
        return v108 .. v109 .. "\n";
    else
        return "";
    end;
end;
return {
    printSchema = v48, 
    printIntrospectionSchema = v50, 
    printType = v33, 
    NULL = l_NULL_0
};
