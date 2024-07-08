local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local v5 = {};
local _ = require(script.Parent.types);
local v7 = require(l_Parent_0.GraphQL);
local l_visit_0 = v7.visit;
local l_TokenKind_0 = v7.TokenKind;
local _ = require(l_Parent_0.GraphQL);
local v11 = nil;
local v12 = nil;
local v13 = nil;
local v14 = nil;
local v15 = nil;
local v16 = nil;
local v17 = nil;
local v18 = nil;
local l_String_0 = v1.String;
local v20 = {};
v5.resetComments = function()
    v20 = {};
end;
v5.collectComment = function(v21)
    local v22 = if typeof(v21.name) == "table" then v21.name.value else nil;
    if v22 == nil then
        return ;
    else
        v11(v21, v22);
        local l_kind_0 = v21.kind;
        if l_kind_0 == "EnumTypeDefinition" then
            if l_Boolean_0.toJSBoolean(v21.values) then
                for _, v25 in v21.values, nil, nil do
                    v11(v25, v22, v25.name.value);
                end;
                return ;
            end;
        elseif not (not (not (l_kind_0 ~= "ObjectTypeDefinition" and l_kind_0 ~= "InputObjectTypeDefinition") or l_kind_0 == "InterfaceTypeDefinition") or not l_Boolean_0.toJSBoolean(v21.fields)) then
            for _, v27 in v21.fields, nil, nil do
                v11(v27, v22, v27.name.value);
                local l_toJSBoolean_0 = l_Boolean_0.toJSBoolean;
                local v29 = v12(v27);
                if l_toJSBoolean_0(if not l_Boolean_0.toJSBoolean(v29) then v29 else v27.arguments) then
                    for _, v31 in v27.arguments, nil, nil do
                        v11(v31, v22, v27.name.value, v31.name.value);
                    end;
                end;
            end;
        end;
        return ;
    end;
end;
v11 = function(v32, v33, v34, v35)
    local v36 = v13(v32);
    if not (typeof(v36) == "string") or #v36 == 0 then
        return ;
    else
        local v37 = {
            v33
        };
        if l_Boolean_0.toJSBoolean(v34) then
            table.insert(v37, v34);
            if l_Boolean_0.toJSBoolean(v35) then
                table.insert(v37, v35);
            end;
        end;
        local v38 = l_Array_0.join(v37, ".");
        if not l_Boolean_0.toJSBoolean(v20[tostring(v38)]) then
            v20[tostring(v38)] = {};
        end;
        table.insert(v20[v38], v36);
        return ;
    end;
end;
v5.pushComment = v11;
local function v40(v39)
    return "\n# " .. v39:gsub("\n", "\n# ");
end;
v5.printComment = v40;
local function v44(v41, v42)
    if not l_Boolean_0.toJSBoolean(v41) then
        return "";
    else
        return (l_Array_0.join(l_Array_0.filter(v41, function(v43)
            return l_Boolean_0.toJSBoolean(v43);
        end), not not l_Boolean_0.toJSBoolean(v42) and v42 or ""));
    end;
end;
local function _(v45)
    local v47 = if typeof(v45) == "table" then l_Array_0.some(v45, function(v46)
        return l_String_0.includes(v46, "\n");
    end) else nil;
    if v47 ~= nil then
        return v47;
    else
        return false;
    end;
end;
local function _(v49)
    return function(v50, v51, v52, v53, v54, v55)
        local v56 = {};
        local v59 = l_Array_0.reduce(v54, function(v57, v58)
            if not ((not (v58 ~= l_Object_0.None) or not l_Array_0.includes({
                "fields", 
                "arguments", 
                "values"
            }, v58)) or not l_Boolean_0.toJSBoolean(v57.name)) then
                table.insert(v56, v57.name.value);
            end;
            if v57 == l_Object_0.None then
                return v58;
            else
                return v57[v58];
            end;
        end, v55[1] or l_Object_0.None);
        local v60 = l_Array_0.join(l_Array_0.filter(l_Array_0.concat({}, v56, {
            if typeof(if typeof(v59) == "table" then v59.name else nil) == "table" then (if typeof(v59) == "table" then v59.name else nil).value else nil
        }), l_Boolean_0.toJSBoolean), ".");
        local v61 = {};
        if not (not l_String_0.includes(v51.kind, "Definition") or not l_Boolean_0.toJSBoolean(v20[v60])) then
            v61 = l_Array_0.concat(v61, v20[v60]);
        end;
        return (v44(l_Array_0.concat({}, l_Array_0.map(v61, v40), {
            v51.description or "", 
            (v49(v50, v51, v52, v53, v54, v55))
        }), "\n"));
    end;
end;
local function v64(v63)
    if not l_Boolean_0.toJSBoolean(v63) then
        return v63;
    else
        return ("  %s"):format((v63:gsub("\n", "\n  ")));
    end;
end;
local function _(v65)
    if v65 and #v65 ~= 0 then
        return (("{\n%s\n}"):format(v64((v44(v65, "\n")))));
    else
        return "";
    end;
end;
local function _(v67, v68, v69)
    if not l_Boolean_0.toJSBoolean(v68) then
        return "";
    else
        return v67 .. tostring(v68) .. (not not l_Boolean_0.toJSBoolean(v69) and v69 or "");
    end;
end;
local function v75(v71, v72)
    local v73 = if v72 ~= nil then v72 else false;
    local v74 = v71:gsub("\"", "\\\"\"\"");
    if (not (v71:sub(1, 1) ~= " ") or v71:sub(1, 1) == "\t") and l_String_0.indexOf(v71, "\n") == -1 then
        return ("\"\"\"%s\"\"\""):format((v74:gsub("\"$", "\"\n")));
    else
        return ("\"\"\"\n%s\n\"\"\""):format(if not l_Boolean_0.toJSBoolean(v73) then if l_Boolean_0.toJSBoolean(v74) then ("  %s"):format((v74:gsub("\n", "\n  "))) else v74 else v74);
    end;
end;
local v350 = {
    Name = {
        leave = function(_, v77)
            return v77.value;
        end
    }, 
    Variable = {
        leave = function(_, v79)
            return "$" .. tostring(v79.name);
        end
    }, 
    Document = {
        leave = function(_, v81)
            return (v44(v81.definitions, "\n\n"));
        end
    }, 
    OperationDefinition = {
        leave = function(_, v83)
            local v84 = v44(v83.variableDefinitions, ", ");
            return tostring((v44({
                v83.operation, 
                v44({
                    v83.name, 
                    not l_Boolean_0.toJSBoolean(v84) and "" or "(" .. tostring(v84) .. (not l_Boolean_0.toJSBoolean(")") and "" or ")")
                }), 
                (v44(v83.directives, " "))
            }, " "))) .. " " .. tostring(v83.selectionSet);
        end
    }, 
    VariableDefinition = {
        leave = function(_, v86)
            local l_variable_0 = v86.variable;
            local l_type_0 = v86.type;
            local l_defaultValue_0 = v86.defaultValue;
            local l_directives_0 = v86.directives;
            local v91 = tostring(l_variable_0);
            local v92 = ": ";
            local v93 = tostring(l_type_0);
            local v94;
            if not l_Boolean_0.toJSBoolean(l_defaultValue_0) then
                v94 = "";
            else
                local v95 = " = ";
                local v96 = tostring(l_defaultValue_0);
                v94 = if not l_Boolean_0.toJSBoolean(nil) then v95 .. v96 .. "" else v95 .. v96 .. "";
            end;
            local v97 = tostring(v94);
            v94 = v44(l_directives_0, " ");
            local v98;
            if not l_Boolean_0.toJSBoolean(v94) then
                v98 = "";
            else
                local v99 = " ";
                local v100 = tostring(v94);
                v98 = if not l_Boolean_0.toJSBoolean(nil) then v99 .. v100 .. "" else v99 .. v100 .. "";
            end;
            return v91 .. v92 .. v93 .. v97 .. tostring(v98);
        end
    }, 
    SelectionSet = {
        leave = function(_, v102)
            local l_selections_0 = v102.selections;
            if l_selections_0 and #l_selections_0 ~= 0 then
                return (("{\n%s\n}"):format(v64((v44(l_selections_0, "\n")))));
            else
                return "";
            end;
        end
    }, 
    Field = {
        leave = function(_, v105)
            local l_alias_0 = v105.alias;
            local l_name_0 = v105.name;
            local l_arguments_0 = v105.arguments;
            local l_directives_1 = v105.directives;
            local l_selectionSet_0 = v105.selectionSet;
            local v111 = (not l_Boolean_0.toJSBoolean(l_alias_0) and "" or "" .. tostring(l_alias_0) .. (not l_Boolean_0.toJSBoolean(": ") and "" or ": ")) .. l_name_0;
            local l_v111_0 = v111;
            local v113 = v44(l_arguments_0, ", ");
            local v114 = l_v111_0 .. (not l_Boolean_0.toJSBoolean(v113) and "" or "(" .. tostring(v113) .. (not l_Boolean_0.toJSBoolean(")") and "" or ")"));
            if v114.length > 80 then
                l_v111_0 = v111;
                local v115 = v44(l_arguments_0, "\n");
                v113 = if not l_Boolean_0.toJSBoolean(v115) then v115 else ("  %s"):format((v115:gsub("\n", "\n  ")));
                v114 = l_v111_0 .. (not l_Boolean_0.toJSBoolean(v113) and "" or "(\n" .. tostring(v113) .. (not l_Boolean_0.toJSBoolean("\n)") and "" or "\n)"));
            end;
            return (v44({
                v114, 
                v44(l_directives_1, " "), 
                l_selectionSet_0
            }, " "));
        end
    }, 
    Argument = {
        leave = function(_, v117)
            return tostring(v117.name) .. ": " .. tostring(v117.value);
        end
    }, 
    FragmentSpread = {
        leave = function(_, v119)
            local l_name_1 = v119.name;
            local l_directives_2 = v119.directives;
            local v122 = "...";
            local v123 = tostring(l_name_1);
            local v124 = v44(l_directives_2, " ");
            local v125;
            if not l_Boolean_0.toJSBoolean(v124) then
                v125 = "";
            else
                local v126 = " ";
                local v127 = tostring(v124);
                v125 = if not l_Boolean_0.toJSBoolean(nil) then v126 .. v127 .. "" else v126 .. v127 .. "";
            end;
            return v122 .. v123 .. tostring(v125);
        end
    }, 
    InlineFragment = {
        leave = function(_, v129)
            local l_typeCondition_0 = v129.typeCondition;
            local l_directives_3 = v129.directives;
            local l_selectionSet_1 = v129.selectionSet;
            local l_v44_0 = v44;
            local v134 = {};
            local v135 = "...";
            local v136;
            if not l_Boolean_0.toJSBoolean(l_typeCondition_0) then
                v136 = "";
            else
                local v137 = "on ";
                local v138 = tostring(l_typeCondition_0);
                v136 = if not l_Boolean_0.toJSBoolean(nil) then v137 .. v138 .. "" else v137 .. v138 .. "";
            end;
            local v139 = v44(l_directives_3, " ");
            local l_l_selectionSet_1_0 = l_selectionSet_1;
            setlist { ['R006[1 to 4]'] = 'R007 to R010' };
            return (l_v44_0(v134, " "));
        end
    }, 
    FragmentDefinition = {
        leave = function(_, v142)
            local l_name_2 = v142.name;
            local l_typeCondition_1 = v142.typeCondition;
            local l_variableDefinitions_0 = v142.variableDefinitions;
            local l_directives_4 = v142.directives;
            local l_selectionSet_2 = v142.selectionSet;
            local v148 = "fragment %s%s ";
            local v149 = tostring(l_name_2);
            local v150 = v44(l_variableDefinitions_0, ", ");
            local v151 = v148:format(v149, not l_Boolean_0.toJSBoolean(v150) and "" or "(" .. tostring(v150) .. (not l_Boolean_0.toJSBoolean(")") and "" or ")"));
            v148 = "on %s %s";
            v149 = tostring(l_typeCondition_1);
            local v152 = v44(l_directives_4, " ");
            return v151 .. v148:format(v149, (tostring(not l_Boolean_0.toJSBoolean(v152) and "" or "" .. tostring(v152) .. (not l_Boolean_0.toJSBoolean(" ") and "" or " ")))) .. tostring(l_selectionSet_2);
        end
    }, 
    IntValue = {
        leave = function(_, v154)
            return v154.value;
        end
    }, 
    FloatValue = {
        leave = function(_, v156)
            return v156.value;
        end
    }, 
    StringValue = {
        leave = function(_, v158)
            local l_value_0 = v158.value;
            if not l_Boolean_0.toJSBoolean(v158.block) then
                return "'" .. l_value_0:gsub("'", "\\'") .. "'";
            else
                return v75(l_value_0);
            end;
        end
    }, 
    BooleanValue = {
        leave = function(_, v161)
            if not l_Boolean_0.toJSBoolean(v161.value) then
                return "false";
            else
                return "true";
            end;
        end
    }, 
    NullValue = {
        leave = function()
            return "null";
        end
    }, 
    EnumValue = {
        leave = function(_, v163)
            return v163.value;
        end
    }, 
    ListValue = {
        leave = function(_, v165)
            return "[" .. tostring((v44(v165.values, ", "))) .. "]";
        end
    }, 
    ObjectValue = {
        leave = function(_, v167)
            return "{" .. tostring((v44(v167.fields, ", "))) .. "}";
        end
    }, 
    ObjectField = {
        leave = function(_, v169)
            return tostring(v169.name) .. ": " .. tostring(v169.value);
        end
    }, 
    Directive = {
        leave = function(_, v171)
            local l_name_3 = v171.name;
            local l_arguments_1 = v171.arguments;
            local v174 = "@";
            local v175 = tostring(l_name_3);
            local v176 = v44(l_arguments_1, ", ");
            return v174 .. v175 .. tostring(not l_Boolean_0.toJSBoolean(v176) and "" or "(" .. tostring(v176) .. (not l_Boolean_0.toJSBoolean(")") and "" or ")"));
        end
    }, 
    NamedType = {
        leave = function(_, v178)
            return v178.name;
        end
    }, 
    ListType = {
        leave = function(_, v180)
            return "[" .. tostring(v180.type) .. "]";
        end
    }, 
    NonNullType = {
        leave = function(_, v182)
            return tostring(v182.type) .. "";
        end
    }, 
    SchemaDefinition = {
        leave = function(_, v184)
            local l_directives_5 = v184.directives;
            local l_operationTypes_0 = v184.operationTypes;
            return (v44({
                "schema", 
                v44(l_directives_5, " "), 
                if not not l_operationTypes_0 and #l_operationTypes_0 ~= 0 then ("{\n%s\n}"):format(v64((v44(l_operationTypes_0, "\n")))) else ""
            }, " "));
        end
    }, 
    OperationTypeDefinition = {
        leave = function(_, v188)
            return tostring(v188.operation) .. ": " .. tostring(v188.type);
        end
    }, 
    ScalarTypeDefinition = {
        leave = function(_, v190)
            return (v44({
                "scalar", 
                v190.name, 
                (v44(v190.directives, " "))
            }, " "));
        end
    }, 
    ObjectTypeDefinition = {
        leave = function(_, v192)
            local l_name_4 = v192.name;
            local l_interfaces_0 = v192.interfaces;
            local l_directives_6 = v192.directives;
            local l_fields_0 = v192.fields;
            local l_v44_1 = v44;
            local v198 = {};
            local v199 = "type";
            local l_l_name_4_0 = l_name_4;
            local v201 = v44(l_interfaces_0, " & ");
            local v202;
            if not l_Boolean_0.toJSBoolean(v201) then
                v202 = "";
            else
                local v203 = "implements ";
                local v204 = tostring(v201);
                v202 = if not l_Boolean_0.toJSBoolean(nil) then v203 .. v204 .. "" else v203 .. v204 .. "";
            end;
            v201 = v44(l_directives_6, " ");
            local v205 = if not not l_fields_0 and #l_fields_0 ~= 0 then ("{\n%s\n}"):format(v64((v44(l_fields_0, "\n")))) else "";
            setlist { ['R007[1 to 5]'] = 'R008 to R012' };
            return (l_v44_1(v198, " "));
        end
    }, 
    FieldDefinition = {
        leave = function(_, v207)
            local l_name_5 = v207.name;
            local l_arguments_2 = v207.arguments;
            local l_type_1 = v207.type;
            local l_directives_7 = v207.directives;
            local v212 = tostring(l_name_5);
            local v214 = if typeof(l_arguments_2) == "table" then l_Array_0.some(l_arguments_2, function(v213)
                return l_String_0.includes(v213, "\n");
            end) else nil;
            local v215;
            if not if v214 ~= nil then v214 else false then
                local v216 = v44(l_arguments_2, ", ");
                v215 = not l_Boolean_0.toJSBoolean(v216) and "" or "(" .. tostring(v216) .. (not l_Boolean_0.toJSBoolean(")") and "" or ")");
            else
                v214 = v44(l_arguments_2, "\n");
                local v217 = if not l_Boolean_0.toJSBoolean(v214) then v214 else ("  %s"):format((v214:gsub("\n", "\n  ")));
                v215 = not l_Boolean_0.toJSBoolean(v217) and "" or "(\n" .. tostring(v217) .. (not l_Boolean_0.toJSBoolean("\n)") and "" or "\n)");
            end;
            local v218 = ": ";
            local v219 = tostring(l_type_1);
            local v220 = v44(l_directives_7, " ");
            local v221;
            if not l_Boolean_0.toJSBoolean(v220) then
                v221 = "";
            else
                v214 = " ";
                local v222 = tostring(v220);
                v221 = if not l_Boolean_0.toJSBoolean(nil) then v214 .. v222 .. "" else v214 .. v222 .. "";
            end;
            return v212 .. v215 .. v218 .. v219 .. v221;
        end
    }, 
    InputValueDefinition = {
        leave = function(_, v224)
            local l_name_6 = v224.name;
            local l_type_2 = v224.type;
            local l_defaultValue_1 = v224.defaultValue;
            local l_directives_8 = v224.directives;
            local l_v44_2 = v44;
            local v230 = {};
            local v231 = tostring(l_name_6) .. ": " .. tostring(l_type_2);
            local v232;
            if not l_Boolean_0.toJSBoolean(l_defaultValue_1) then
                v232 = "";
            else
                local v233 = "= ";
                local v234 = tostring(l_defaultValue_1);
                v232 = if not l_Boolean_0.toJSBoolean(nil) then v233 .. v234 .. "" else v233 .. v234 .. "";
            end;
            local v235 = v44(l_directives_8, " ");
            setlist { ['R007[1 to 3]'] = 'R008 to R010' };
            return (l_v44_2(v230, " "));
        end
    }, 
    InterfaceTypeDefinition = {
        leave = function(_, v237)
            local l_name_7 = v237.name;
            local l_interfaces_1 = v237.interfaces;
            local l_directives_9 = v237.directives;
            local l_fields_1 = v237.fields;
            local l_v44_3 = v44;
            local v243 = {};
            local v244 = "interface";
            local l_l_name_7_0 = l_name_7;
            local v246 = v44(l_interfaces_1, " & ");
            local v247;
            if not l_Boolean_0.toJSBoolean(v246) then
                v247 = "";
            else
                local v248 = "implements ";
                local v249 = tostring(v246);
                v247 = if not l_Boolean_0.toJSBoolean(nil) then v248 .. v249 .. "" else v248 .. v249 .. "";
            end;
            v246 = v44(l_directives_9, " ");
            local v250 = if not not l_fields_1 and #l_fields_1 ~= 0 then ("{\n%s\n}"):format(v64((v44(l_fields_1, "\n")))) else "";
            setlist { ['R007[1 to 5]'] = 'R008 to R012' };
            return (l_v44_3(v243, " "));
        end
    }, 
    UnionTypeDefinition = {
        leave = function(_, v252)
            local l_name_8 = v252.name;
            local l_directives_10 = v252.directives;
            local l_types_0 = v252.types;
            local l_v44_4 = v44;
            local v257 = {};
            local v258 = "union";
            local l_l_name_8_0 = l_name_8;
            local v260 = v44(l_directives_10, " ");
            local v261 = v44(l_types_0, " | ");
            local v262;
            if not l_Boolean_0.toJSBoolean(v261) then
                v262 = "";
            else
                local v263 = "= ";
                local v264 = tostring(v261);
                v262 = if not l_Boolean_0.toJSBoolean(nil) then v263 .. v264 .. "" else v263 .. v264 .. "";
            end;
            setlist { ['R006[1 to 4]'] = 'R007 to R010' };
            return (l_v44_4(v257, " "));
        end
    }, 
    EnumTypeDefinition = {
        leave = function(_, v266)
            local l_name_9 = v266.name;
            local l_directives_11 = v266.directives;
            local l_values_0 = v266.values;
            return (v44({
                "enum", 
                l_name_9, 
                v44(l_directives_11, " "), 
                if not not l_values_0 and #l_values_0 ~= 0 then ("{\n%s\n}"):format(v64((v44(l_values_0, "\n")))) else ""
            }, " "));
        end
    }, 
    EnumValueDefinition = {
        leave = function(_, v271)
            return (v44({
                v271.name, 
                (v44(v271.directives, " "))
            }, " "));
        end
    }, 
    InputObjectTypeDefinition = {
        leave = function(_, v273)
            local l_name_10 = v273.name;
            local l_directives_12 = v273.directives;
            local l_fields_2 = v273.fields;
            return (v44({
                "input", 
                l_name_10, 
                v44(l_directives_12, " "), 
                if not not l_fields_2 and #l_fields_2 ~= 0 then ("{\n%s\n}"):format(v64((v44(l_fields_2, "\n")))) else ""
            }, " "));
        end
    }, 
    DirectiveDefinition = {
        leave = function(_, v278)
            local l_name_11 = v278.name;
            local l_arguments_3 = v278.arguments;
            local l_repeatable_0 = v278.repeatable;
            local l_locations_0 = v278.locations;
            local v283 = "directive @";
            local v284 = tostring(l_name_11);
            local l_toJSBoolean_1 = l_Boolean_0.toJSBoolean;
            local v287 = if typeof(l_arguments_3) == "table" then l_Array_0.some(l_arguments_3, function(v286)
                return l_String_0.includes(v286, "\n");
            end) else nil;
            local v288;
            if not l_toJSBoolean_1(if v287 ~= nil then v287 else false) then
                l_toJSBoolean_1 = v44(l_arguments_3, ", ");
                v288 = not l_Boolean_0.toJSBoolean(l_toJSBoolean_1) and "" or "(" .. tostring(l_toJSBoolean_1) .. (not l_Boolean_0.toJSBoolean(")") and "" or ")");
            else
                local v289 = v44(l_arguments_3, "\n");
                l_toJSBoolean_1 = if not l_Boolean_0.toJSBoolean(v289) then v289 else ("  %s"):format((v289:gsub("\n", "\n  ")));
                v288 = not l_Boolean_0.toJSBoolean(l_toJSBoolean_1) and "" or "(\n" .. tostring(l_toJSBoolean_1) .. (not l_Boolean_0.toJSBoolean("\n)") and "" or "\n)");
            end;
            return v283 .. v284 .. tostring(v288) .. (not l_Boolean_0.toJSBoolean(l_repeatable_0) and "" or " repeatable") .. " on " .. tostring((v44(l_locations_0, " | ")));
        end
    }, 
    SchemaExtension = {
        leave = function(_, v291)
            local l_directives_13 = v291.directives;
            local l_operationTypes_1 = v291.operationTypes;
            return (v44({
                "extend schema", 
                v44(l_directives_13, " "), 
                if not not l_operationTypes_1 and #l_operationTypes_1 ~= 0 then ("{\n%s\n}"):format(v64((v44(l_operationTypes_1, "\n")))) else ""
            }, " "));
        end
    }, 
    ScalarTypeExtension = {
        leave = function(_, v295)
            return (v44({
                "extend scalar", 
                v295.name, 
                (v44(v295.directives, " "))
            }, " "));
        end
    }, 
    ObjectTypeExtension = {
        leave = function(_, v297)
            local l_name_12 = v297.name;
            local l_interfaces_2 = v297.interfaces;
            local l_directives_14 = v297.directives;
            local l_fields_3 = v297.fields;
            local l_v44_5 = v44;
            local v303 = {};
            local v304 = "extend type";
            local l_l_name_12_0 = l_name_12;
            local v306 = v44(l_interfaces_2, " & ");
            local v307;
            if not l_Boolean_0.toJSBoolean(v306) then
                v307 = "";
            else
                local v308 = "implements ";
                local v309 = tostring(v306);
                v307 = if not l_Boolean_0.toJSBoolean(nil) then v308 .. v309 .. "" else v308 .. v309 .. "";
            end;
            v306 = v44(l_directives_14, " ");
            local v310 = if not not l_fields_3 and #l_fields_3 ~= 0 then ("{\n%s\n}"):format(v64((v44(l_fields_3, "\n")))) else "";
            setlist { ['R007[1 to 5]'] = 'R008 to R012' };
            return (l_v44_5(v303, " "));
        end
    }, 
    InterfaceTypeExtension = {
        leave = function(_, v312)
            local l_name_13 = v312.name;
            local l_interfaces_3 = v312.interfaces;
            local l_directives_15 = v312.directives;
            local l_fields_4 = v312.fields;
            local l_v44_6 = v44;
            local v318 = {};
            local v319 = "extend interface";
            local l_l_name_13_0 = l_name_13;
            local v321 = v44(l_interfaces_3, " & ");
            local v322;
            if not l_Boolean_0.toJSBoolean(v321) then
                v322 = "";
            else
                local v323 = "implements ";
                local v324 = tostring(v321);
                v322 = if not l_Boolean_0.toJSBoolean(nil) then v323 .. v324 .. "" else v323 .. v324 .. "";
            end;
            v321 = v44(l_directives_15, " ");
            local v325 = if not not l_fields_4 and #l_fields_4 ~= 0 then ("{\n%s\n}"):format(v64((v44(l_fields_4, "\n")))) else "";
            setlist { ['R007[1 to 5]'] = 'R008 to R012' };
            return (l_v44_6(v318, " "));
        end
    }, 
    UnionTypeExtension = {
        leave = function(_, v327)
            local l_name_14 = v327.name;
            local l_directives_16 = v327.directives;
            local l_types_1 = v327.types;
            local l_v44_7 = v44;
            local v332 = {};
            local v333 = "extend union";
            local l_l_name_14_0 = l_name_14;
            local v335 = v44(l_directives_16, " ");
            local v336 = v44(l_types_1, " | ");
            local v337;
            if not l_Boolean_0.toJSBoolean(v336) then
                v337 = "";
            else
                local v338 = "= ";
                local v339 = tostring(v336);
                v337 = if not l_Boolean_0.toJSBoolean(nil) then v338 .. v339 .. "" else v338 .. v339 .. "";
            end;
            setlist { ['R006[1 to 4]'] = 'R007 to R010' };
            return (l_v44_7(v332, " "));
        end
    }, 
    EnumTypeExtension = {
        leave = function(_, v341)
            local l_name_15 = v341.name;
            local l_directives_17 = v341.directives;
            local l_values_1 = v341.values;
            return (v44({
                "extend enum", 
                l_name_15, 
                v44(l_directives_17, " "), 
                if not not l_values_1 and #l_values_1 ~= 0 then ("{\n%s\n}"):format(v64((v44(l_values_1, "\n")))) else ""
            }, " "));
        end
    }, 
    InputObjectTypeExtension = {
        leave = function(_, v346)
            local l_name_16 = v346.name;
            local l_directives_18 = v346.directives;
            local l_fields_5 = v346.fields;
            return (v44({
                "extend input", 
                l_name_16, 
                v44(l_directives_18, " "), 
                if not not l_fields_5 and #l_fields_5 ~= 0 then ("{\n%s\n}"):format(v64((v44(l_fields_5, "\n")))) else ""
            }, " "));
        end
    }
};
local v371 = l_Array_0.reduce(l_Object_0.keys(v350), function(v351, v352)
    local l_assign_0 = l_Object_0.assign;
    local v354 = {};
    local l_v351_0 = v351;
    local v356 = {};
    local v357 = {};
    local l_leave_0 = v350[v352].leave;
    v357.leave = function(v359, v360, v361, v362, v363, v364)
        local v365 = {};
        local v368 = l_Array_0.reduce(v363, function(v366, v367)
            if not ((not (v367 ~= l_Object_0.None) or not l_Array_0.includes({
                "fields", 
                "arguments", 
                "values"
            }, v367)) or not l_Boolean_0.toJSBoolean(v366.name)) then
                table.insert(v365, v366.name.value);
            end;
            if v366 == l_Object_0.None then
                return v367;
            else
                return v366[v367];
            end;
        end, v364[1] or l_Object_0.None);
        local v369 = l_Array_0.join(l_Array_0.filter(l_Array_0.concat({}, v365, {
            if typeof(if typeof(v368) == "table" then v368.name else nil) == "table" then (if typeof(v368) == "table" then v368.name else nil).value else nil
        }), l_Boolean_0.toJSBoolean), ".");
        local v370 = {};
        if not (not l_String_0.includes(v360.kind, "Definition") or not l_Boolean_0.toJSBoolean(v20[v369])) then
            v370 = l_Array_0.concat(v370, v20[v369]);
        end;
        return (v44(l_Array_0.concat({}, l_Array_0.map(v370, v40), {
            v360.description or "", 
            (l_leave_0(v359, v360, v361, v362, v363, v364))
        }), "\n"));
    end;
    v356[v352] = v357;
    return (l_assign_0(v354, l_v351_0, v356));
end, {});
v5.printWithComments = function(v372)
    return (l_visit_0(v372, v371));
end;
v12 = function(v373)
    return v373.kind == "FieldDefinition";
end;
v5.getDescription = function(v374, v375)
    if v374.description ~= nil then
        return v374.description.value;
    elseif not l_Boolean_0.toJSBoolean(if typeof(v375) == "table" then v375.commentDescriptions else nil) then
        return nil;
    else
        return v13(v374);
    end;
end;
v13 = function(v376)
    local v377 = v14(v376);
    if v377 ~= nil then
        return v15(("\n%s"):format((tostring(v377))));
    else
        return nil;
    end;
end;
v5.getComment = v13;
v14 = function(v378)
    local l_loc_0 = v378.loc;
    if l_Boolean_0.toJSBoolean(l_loc_0) then
        local v380 = {};
        local l_prev_0 = l_loc_0.startToken.prev;
        while ((((l_prev_0 ~= nil and l_prev_0.kind == l_TokenKind_0.COMMENT) and l_prev_0.next ~= nil) and l_prev_0.prev ~= nil) and l_prev_0.line + 1 == l_prev_0.next.line) and l_prev_0.line ~= l_prev_0.prev.line do
            table.insert(v380, (tostring(l_prev_0.value)));
            l_prev_0 = l_prev_0.prev;
        end;
        if #v380 > 0 then
            return (l_Array_0.join(l_Array_0.reverse(v380), "\n"));
        else
            return nil;
        end;
    else
        return ;
    end;
end;
v5.getLeadingCommentBlock = v14;
v15 = function(v382)
    local v383 = l_String_0.split(v382, {
        "\r\n", 
        "\n", 
        "\r"
    });
    local v384 = v16(v383);
    if v384 ~= 0 then
        local v385 = 2;
        while v385 <= #v383 do
            v383[v385] = l_String_0.slice(v383[v385], v384 + 1);
            v385 = v385 + 1;
        end;
    end;
    while not (not (#v383 > 0) or not v17(v383[1])) do
        table.remove(v383, 1);
    end;
    while not (not (#v383 > 0) or not v17(v383[#v383])) do
        table.remove(v383);
    end;
    return l_Array_0.join(v383, "\n");
end;
v5.dedentBlockStringValue = v15;
v16 = function(v386)
    local v387 = nil;
    local v388 = 2;
    while v388 <= #v386 do
        local v389 = v386[v388];
        local v390 = v18(v389);
        if v390 == #v389 then
            v388 = v388 + 1;
        else
            if not (v387 ~= nil) or v390 < v387 then
                v387 = v390;
                if not (v387 ~= 0) then
                    break;
                end;
            end;
            v388 = v388 + 1;
        end;
    end;
    if v387 == nil then
        return 0;
    else
        return v387;
    end;
end;
v5.getBlockStringIndentation = v16;
v18 = function(v391)
    local v392 = 0;
    while v392 < #v391 and (not (v391:sub(v392 + 1, v392 + 1) ~= " ") or v391:sub(v392 + 1, v392 + 1) == "\t") do
        v392 = v392 + 1;
    end;
    return v392;
end;
v17 = function(v393)
    return v18(v393) == #v393;
end;
return v5;
