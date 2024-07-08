local l_Array_0 = require(script.Parent.Parent.Parent.LuauPolyfill).Array;
local l_HttpService_0 = game:GetService("HttpService");
local _ = require(script.Parent.ast);
local l_visit_0 = require(script.Parent.visitor).visit;
local l_printBlockString_0 = require(script.Parent.blockString).printBlockString;
local v5 = nil;
local v6 = nil;
local v7 = nil;
local v8 = nil;
local v9 = nil;
local v10 = nil;
local v11 = nil;
local v12 = nil;
local function v14(v13)
    return l_visit_0(v13, {
        leave = v5
    });
end;
v6 = function(v15)
    return function(_, v17)
        return v7({
            v17.description, 
            v15(v17)
        }, "\n");
    end;
end;
v5 = {
    Name = function(_, v19)
        return v19.value;
    end, 
    Variable = function(_, v21)
        return "$" .. tostring(v21.name);
    end, 
    Document = function(_, v23)
        return v7(v23.definitions, "\n\n") .. "\n";
    end, 
    OperationDefinition = function(_, v25)
        local l_operation_0 = v25.operation;
        local l_name_0 = v25.name;
        local v28 = v9("(", v7(v25.variableDefinitions, ", "), ")");
        local v29 = v7(v25.directives, " ");
        local l_selectionSet_0 = v25.selectionSet;
        if ((not l_name_0 and (not v29 or v29 == "")) and (not v28 or v28 == "")) and l_operation_0 == "query" then
            return l_selectionSet_0;
        else
            return v7({
                l_operation_0, 
                v7({
                    l_name_0, 
                    v28
                }), 
                v29, 
                l_selectionSet_0
            }, " ");
        end;
    end, 
    VariableDefinition = function(_, v32)
        return tostring(v32.variable) .. ": " .. tostring(v32.type) .. v9(" = ", v32.defaultValue) .. v9(" ", v7(v32.directives, " "));
    end, 
    SelectionSet = function(_, v34)
        return v8(v34.selections);
    end, 
    Field = function(_, v36)
        local l_alias_0 = v36.alias;
        local l_name_1 = v36.name;
        local l_arguments_0 = v36.arguments;
        local l_directives_0 = v36.directives;
        local l_selectionSet_1 = v36.selectionSet;
        local v42 = v9("", l_alias_0, ": ") .. tostring(l_name_1);
        local v43 = v42 .. v9("(", v7(l_arguments_0, ", "), ")");
        local v44 = utf8.len(v43);
        assert(v44 ~= nil, "invalid utf8 string");
        if v44 > 80 then
            v43 = v42 .. v9("(\n", v10(v7(l_arguments_0, "\n")), "\n)");
        end;
        return v7({
            v43, 
            v7(l_directives_0, " "), 
            l_selectionSet_1
        }, " ");
    end, 
    Argument = function(_, v46)
        return tostring(v46.name) .. ": " .. tostring(v46.value);
    end, 
    FragmentSpread = function(_, v48)
        return "..." .. tostring(v48.name) .. v9(" ", v7(v48.directives, " "));
    end, 
    InlineFragment = function(_, v50)
        return v7({
            "...", 
            v9("on ", v50.typeCondition), 
            v7(v50.directives, " "), 
            v50.selectionSet
        }, " ");
    end, 
    FragmentDefinition = function(_, v52)
        return "fragment " .. tostring(v52.name) .. v9("(", v7(v52.variableDefinitions, ", "), ")") .. " " .. "on " .. tostring(v52.typeCondition) .. " " .. v9("", v7(v52.directives, " "), " ") .. tostring(v52.selectionSet);
    end, 
    IntValue = function(_, v54)
        return v54.value;
    end, 
    FloatValue = function(_, v56)
        return v56.value;
    end, 
    StringValue = function(_, v58, v59)
        local l_value_0 = v58.value;
        if not v58.block then
            return (l_HttpService_0:JSONEncode(l_value_0));
        else
            return (l_printBlockString_0(l_value_0, v59 == "description" and "" or "  "));
        end;
    end, 
    BooleanValue = function(_, v62)
        if not v62.value then
            return "false";
        else
            return "true";
        end;
    end, 
    NullValue = function(_, _)
        return "null";
    end, 
    EnumValue = function(_, v66)
        return v66.value;
    end, 
    ListValue = function(_, v68)
        return "[" .. v7(v68.values, ", ") .. "]";
    end, 
    ObjectValue = function(_, v70)
        return "{" .. v7(v70.fields, ", ") .. "}";
    end, 
    ObjectField = function(_, v72)
        return v72.name .. ": " .. v72.value;
    end, 
    Directive = function(_, v74)
        return "@" .. tostring(v74.name) .. v9("(", v7(v74.arguments, ", "), ")");
    end, 
    NamedType = function(_, v76)
        return v76.name;
    end, 
    ListType = function(_, v78)
        return "[" .. tostring(v78.type) .. "]";
    end, 
    NonNullType = function(_, v80)
        return tostring(v80.type) .. "";
    end, 
    SchemaDefinition = v6(function(v81)
        return v7({
            "schema", 
            v7(v81.directives, " "), 
            v8(v81.operationTypes)
        }, " ");
    end), 
    OperationTypeDefinition = function(_, v83)
        return tostring(v83.operation) .. ": " .. tostring(v83.type);
    end, 
    ScalarTypeDefinition = v6(function(v84)
        return v7({
            "scalar", 
            v84.name, 
            v7(v84.directives, " ")
        }, " ");
    end), 
    ObjectTypeDefinition = v6(function(v85)
        return v7({
            "type", 
            v85.name, 
            v9("implements ", v7(v85.interfaces, " & ")), 
            v7(v85.directives, " "), 
            v8(v85.fields)
        }, " ");
    end), 
    FieldDefinition = v6(function(v86)
        local l_name_2 = v86.name;
        local l_arguments_1 = v86.arguments;
        return tostring(l_name_2) .. if not v12(l_arguments_1) then v9("(", v7(l_arguments_1, ", "), ")") else v9("(\n", v10(v7(l_arguments_1, "\n")), "\n)") .. ": " .. tostring(v86.type) .. v9(" ", v7(v86.directives, " "));
    end), 
    InputValueDefinition = v6(function(v89)
        return v7({
            tostring(v89.name) .. ": " .. tostring(v89.type), 
            v9("= ", v89.defaultValue), 
            v7(v89.directives, " ")
        }, " ");
    end), 
    InterfaceTypeDefinition = v6(function(v90)
        return v7({
            "interface", 
            v90.name, 
            v9("implements ", v7(v90.interfaces, " & ")), 
            v7(v90.directives, " "), 
            v8(v90.fields)
        }, " ");
    end), 
    UnionTypeDefinition = v6(function(v91)
        local l_name_3 = v91.name;
        local l_directives_1 = v91.directives;
        local l_types_0 = v91.types;
        return v7({
            "union", 
            l_name_3, 
            v7(l_directives_1, " "), 
            if not not l_types_0 and #l_types_0 ~= 0 then "= " .. v7(l_types_0, " | ") else ""
        }, " ");
    end), 
    EnumTypeDefinition = v6(function(v95)
        return v7({
            "enum", 
            v95.name, 
            v7(v95.directives, " "), 
            v8(v95.values)
        }, " ");
    end), 
    EnumValueDefinition = v6(function(v96)
        return v7({
            v96.name, 
            v7(v96.directives, " ")
        }, " ");
    end), 
    InputObjectTypeDefinition = v6(function(v97)
        return v7({
            "input", 
            v97.name, 
            v7(v97.directives, " "), 
            v8(v97.fields)
        }, " ");
    end), 
    DirectiveDefinition = v6(function(v98)
        local l_name_4 = v98.name;
        local l_arguments_2 = v98.arguments;
        return "directive @" .. tostring(l_name_4) .. if not v12(l_arguments_2) then v9("(", v7(l_arguments_2, ", "), ")") else v9("(\n", v10(v7(l_arguments_2, "\n")), "\n)") .. (not v98.repeatable and "" or " repeatable") .. " on " .. v7(v98.locations, " | ");
    end), 
    SchemaExtension = function(_, v102)
        return v7({
            "extend schema", 
            v7(v102.directives, " "), 
            v8(v102.operationTypes)
        }, " ");
    end, 
    ScalarTypeExtension = function(_, v104)
        return v7({
            "extend scalar", 
            v104.name, 
            v7(v104.directives, " ")
        }, " ");
    end, 
    ObjectTypeExtension = function(_, v106)
        return v7({
            "extend type", 
            v106.name, 
            v9("implements ", v7(v106.interfaces, " & ")), 
            v7(v106.directives, " "), 
            v8(v106.fields)
        }, " ");
    end, 
    InterfaceTypeExtension = function(_, v108)
        return v7({
            "extend interface", 
            v108.name, 
            v9("implements ", v7(v108.interfaces, " & ")), 
            v7(v108.directives, " "), 
            v8(v108.fields)
        }, " ");
    end, 
    UnionTypeExtension = function(_, v110)
        local l_name_5 = v110.name;
        local l_directives_2 = v110.directives;
        local l_types_1 = v110.types;
        return v7({
            "extend union", 
            l_name_5, 
            v7(l_directives_2, " "), 
            if not not l_types_1 and #l_types_1 ~= 0 then "= " .. v7(l_types_1, " | ") else ""
        }, " ");
    end, 
    EnumTypeExtension = function(_, v115)
        return v7({
            "extend enum", 
            v115.name, 
            v7(v115.directives, " "), 
            v8(v115.values)
        }, " ");
    end, 
    InputObjectTypeExtension = function(_, v117)
        return v7({
            "extend input", 
            v117.name, 
            v7(v117.directives, " "), 
            v8(v117.fields)
        }, " ");
    end
};
v7 = function(v118, v119)
    v119 = v119 or "";
    if not v118 then
        return "";
    else
        return l_Array_0.join(l_Array_0.filter(v118, function(v120)
            return tostring(v120) and v120 ~= "";
        end), v119);
    end;
end;
v8 = function(v121)
    return v9("{\n", v10(v7(v121, "\n")), "\n}");
end;
v9 = function(v122, v123, v124)
    v124 = v124 or "";
    if v123 ~= nil and v123 ~= "" then
        return v122 .. tostring(v123) .. tostring(v124);
    else
        return "";
    end;
end;
v10 = function(v125)
    return v9("  ", (v125:gsub("\n", "\n  ")));
end;
v11 = function(v126)
    return string.find(tostring(v126), "\n") ~= nil;
end;
v12 = function(v127)
    local v128 = false;
    if v127 ~= nil then
        v128 = l_Array_0.some(v127, v11);
    end;
    return v128;
end;
return {
    print = v14
};
