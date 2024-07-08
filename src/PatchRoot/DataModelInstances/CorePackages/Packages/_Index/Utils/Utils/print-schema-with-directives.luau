local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local l_Map_0 = v1.Map;
local l_Object_0 = v1.Object;
local v7 = {};
local v8 = require(l_Parent_0.GraphQL);
local l_print_0 = v8.print;
local l_Kind_0 = v8.Kind;
local l_isSpecifiedScalarType_0 = v8.isSpecifiedScalarType;
local l_isIntrospectionType_0 = v8.isIntrospectionType;
local l_isSpecifiedDirective_0 = v8.isSpecifiedDirective;
local l_astFromValue_0 = v8.astFromValue;
local l_GraphQLDeprecatedDirective_0 = v8.GraphQLDeprecatedDirective;
local l_isObjectType_0 = v8.isObjectType;
local l_isInterfaceType_0 = v8.isInterfaceType;
local l_isUnionType_0 = v8.isUnionType;
local l_isInputObjectType_0 = v8.isInputObjectType;
local l_isEnumType_0 = v8.isEnumType;
local l_isScalarType_0 = v8.isScalarType;
local _ = require(script.Parent.types);
local l_astFromType_0 = require(script.Parent.astFromType).astFromType;
local l_getDirectivesInExtensions_0 = require(script.Parent["get-directives"]).getDirectivesInExtensions;
local l_astFromValueUntyped_0 = require(script.Parent.astFromValueUntyped).astFromValueUntyped;
local l_isSome_0 = require(script.Parent.helpers).isSome;
local l_getRootTypeMap_0 = require(script.Parent.rootTypes).getRootTypeMap;
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
local l_NULL_0 = v8.NULL;
local function v58(v45, v46)
    local l_pathToDirectivesInExtensions_0 = (if v46 ~= nil then v46 else {}).pathToDirectivesInExtensions;
    local v48 = v45:getTypeMap();
    local v49 = v28(v45, l_pathToDirectivesInExtensions_0);
    local v50 = if v49 ~= nil then {
        v49
    } else {};
    for _, v52 in (v45:getDirectives()), nil, nil do
        if not l_Boolean_0.toJSBoolean(l_isSpecifiedDirective_0(v52)) then
            table.insert(v50, v29(v52, v45, l_pathToDirectivesInExtensions_0));
        end;
    end;
    for _, v54 in v48, nil, nil do
        local v55 = v48:get(v54[1]);
        local v56 = l_isSpecifiedScalarType_0(v55);
        local v57 = l_isIntrospectionType_0(v55);
        if not (v56 or v57) then
            if not l_Boolean_0.toJSBoolean(l_isObjectType_0(v55)) then
                if not l_Boolean_0.toJSBoolean(l_isInterfaceType_0(v55)) then
                    if not l_Boolean_0.toJSBoolean(l_isUnionType_0(v55)) then
                        if not l_Boolean_0.toJSBoolean(l_isInputObjectType_0(v55)) then
                            if not l_Boolean_0.toJSBoolean(l_isEnumType_0(v55)) then
                                if not l_Boolean_0.toJSBoolean(l_isScalarType_0(v55)) then
                                    error(l_Error_0.new(("Unknown type %s."):format((tostring(v55)))));
                                else
                                    table.insert(v50, v40(v55, v45, l_pathToDirectivesInExtensions_0));
                                end;
                            else
                                table.insert(v50, v39(v55, v45, l_pathToDirectivesInExtensions_0));
                            end;
                        else
                            table.insert(v50, v38(v55, v45, l_pathToDirectivesInExtensions_0));
                        end;
                    else
                        table.insert(v50, v37(v55, v45, l_pathToDirectivesInExtensions_0));
                    end;
                else
                    table.insert(v50, v36(v55, v45, l_pathToDirectivesInExtensions_0));
                end;
            else
                table.insert(v50, v32(v55, v45, l_pathToDirectivesInExtensions_0));
            end;
        end;
    end;
    return {
        kind = l_Kind_0.DOCUMENT, 
        definitions = v50
    };
end;
v7.getDocumentNodeFromSchema = v58;
v7.printSchemaWithDirectives = function(v59, v60)
    return l_print_0((v58(v59, if v60 ~= nil then v60 else {})));
end;
v28 = function(v61, v62)
    local v63 = l_Map_0.new({
        {
            "query", 
            l_Object_0.None
        }, 
        {
            "mutation", 
            l_Object_0.None
        }, 
        {
            "subscription", 
            l_Object_0.None
        }
    });
    local v64 = {};
    if v61.astNode ~= nil then
        table.insert(v64, v61.astNode);
    end;
    if v61.extensionASTNodes ~= nil then
        for _, v66 in v61.extensionASTNodes, nil, nil do
            table.insert(v64, v66);
        end;
    end;
    for _, v68 in v64, nil, nil do
        if l_Boolean_0.toJSBoolean(v68.operationTypes) then
            for _, v70 in v68.operationTypes, nil, nil do
                v63:set(v70.operation, v70);
            end;
        end;
    end;
    local v71 = l_getRootTypeMap_0(v61);
    for _, v73 in v63, nil, nil do
        local v74, v75 = table.unpack(v73, 1, 2);
        local v76 = v71:get(v74);
        if v76 ~= nil then
            local v77 = l_astFromType_0(v76);
            if v75 ~= nil and v75 ~= l_Object_0.None then
                v75.type = v77;
            else
                v63:set(v74, {
                    kind = l_Kind_0.OPERATION_TYPE_DEFINITION, 
                    operation = v74, 
                    type = v77
                });
            end;
        end;
    end;
    local v78 = l_Array_0.filter(l_Array_0.concat({}, v63:values()), l_isSome_0);
    local v79 = v31(v61, v61, v62);
    if l_Boolean_0.toJSBoolean(#v78) or l_Boolean_0.toJSBoolean(#v79) then
        local v80 = {
            kind = if v78 ~= nil then l_Kind_0.SCHEMA_DEFINITION else l_Kind_0.SCHEMA_EXTENSION, 
            operationTypes = v78, 
            directives = v79
        };
        local l_toJSBoolean_0 = l_Boolean_0.toJSBoolean;
        local v82 = if typeof(v61.astNode) == "table" then v61.astNode.description else nil;
        v80.description = if not l_toJSBoolean_0(if v82 ~= nil then v82 else v61.description ~= nil) then nil else {
            kind = l_Kind_0.STRING, 
            value = v61.description, 
            block = true
        };
        return v80;
    else
        return nil;
    end;
end;
v7.astFromSchema = v28;
v29 = function(v83, v84, v85)
    local l_DIRECTIVE_DEFINITION_0 = l_Kind_0.DIRECTIVE_DEFINITION;
    local v87 = if typeof(v83.astNode) == "table" then v83.astNode.description else nil;
    local v88 = if v87 ~= nil then v87 else if l_Boolean_0.toJSBoolean(v83.description) then {
        kind = l_Kind_0.STRING, 
        value = v83.description
    } else nil;
    local v89 = {
        kind = l_Kind_0.NAME, 
        value = v83.name
    };
    local v91 = if typeof(v83.args) == "table" then l_Array_0.map(v83.args, function(v90)
        return v41(v90, v84, v85);
    end) else nil;
    local l_isRepeatable_0 = v83.isRepeatable;
    local v94 = if typeof(v83.locations) == "table" then l_Array_0.map(v83.locations, function(v93)
        return {
            kind = l_Kind_0.NAME, 
            value = v93
        };
    end) else nil;
    return {
        kind = l_DIRECTIVE_DEFINITION_0, 
        description = v88, 
        name = v89, 
        arguments = v91, 
        repeatable = l_isRepeatable_0, 
        locations = not not l_Boolean_0.toJSBoolean(v94) and v94 or {}
    };
end;
v7.astFromDirective = v29;
v31 = function(v95, v96, v97)
    local v98 = l_getDirectivesInExtensions_0(v95, v97);
    local v99 = {};
    if v95.astNode ~= nil then
        table.insert(v99, v95.astNode);
    end;
    if l_Array_0.indexOf(l_Object_0.keys(v95), "extensionASTNodes") ~= -1 and v95.extensionASTNodes ~= nil then
        v99 = l_Array_0.concat(v99, v95.extensionASTNodes);
    end;
    local v100 = nil;
    if v98 ~= nil then
        return (v33(v96, v98));
    else
        v100 = {};
        for _, v102 in v99, nil, nil do
            if l_Boolean_0.toJSBoolean(v102.directives) then
                v100 = l_Array_0.concat(v100, v102.directives);
            end;
        end;
        return v100;
    end;
end;
v7.getDirectiveNodes = v31;
local function v113(v103, v104, v105)
    local v106 = {};
    local v107 = nil;
    local v108 = l_getDirectivesInExtensions_0(v103, v105);
    local v109 = nil;
    v109 = if v108 ~= nil then v33(v104, v108) else if typeof(v103.astNode) == "table" then v103.astNode.directives else nil;
    if v109 ~= nil then
        v106 = l_Array_0.filter(v109, function(v110)
            return v110.name.value ~= "deprecated";
        end);
        if v103.deprecationReason ~= nil then
            v107 = if typeof(l_Array_0.filter(v109, function(v111)
                return v111.name.value == "deprecated";
            end)) == "table" then l_Array_0.filter(v109, function(v112)
                return v112.name.value == "deprecated";
            end)[1] else nil;
        end;
    end;
    if v103.deprecationReason ~= nil and v107 == nil then
        v107 = v35(v103.deprecationReason);
    end;
    if v107 == nil then
        return v106;
    else
        return (l_Array_0.concat({
            v107
        }, v106));
    end;
end;
v7.getDeprecatableDirectiveNodes = v113;
v41 = function(v114, v115, v116)
    local l_INPUT_VALUE_DEFINITION_0 = l_Kind_0.INPUT_VALUE_DEFINITION;
    local v118 = if typeof(v114.astNode) == "table" then v114.astNode.description else nil;
    return {
        kind = l_INPUT_VALUE_DEFINITION_0, 
        description = if v118 ~= nil then v118 else if l_Boolean_0.toJSBoolean(v114.description) then {
            kind = l_Kind_0.STRING, 
            value = v114.description, 
            block = true
        } else nil, 
        name = {
            kind = l_Kind_0.NAME, 
            value = v114.name
        }, 
        type = l_astFromType_0(v114.type), 
        defaultValue = if v114.defaultValue ~= nil then l_astFromValue_0(v114.defaultValue, v114.type) else nil, 
        directives = v113(v114, v115, v116)
    };
end;
v7.astFromArg = v41;
v32 = function(v119, v120, v121)
    local l_OBJECT_TYPE_DEFINITION_0 = l_Kind_0.OBJECT_TYPE_DEFINITION;
    local v123 = if typeof(v119.astNode) == "table" then v119.astNode.description else nil;
    return {
        kind = l_OBJECT_TYPE_DEFINITION_0, 
        description = if v123 ~= nil then v123 else if l_Boolean_0.toJSBoolean(v119.description) then {
            kind = l_Kind_0.STRING, 
            value = v119.description, 
            block = true
        } else nil, 
        name = {
            kind = l_Kind_0.NAME, 
            value = v119.name
        }, 
        fields = l_Array_0.map(v119:getFields():values(), function(v124)
            return v42(v124, v120, v121);
        end), 
        interfaces = l_Array_0.map(l_Object_0.values(v119:getInterfaces()), function(v125)
            return (l_astFromType_0(v125));
        end), 
        directives = v31(v119, v120, v121)
    };
end;
v7.astFromObjectType = v32;
v36 = function(v126, v127, v128)
    local l_INTERFACE_TYPE_DEFINITION_0 = l_Kind_0.INTERFACE_TYPE_DEFINITION;
    local v130 = if typeof(v126.astNode) == "table" then v126.astNode.description else nil;
    local v132 = {
        kind = l_INTERFACE_TYPE_DEFINITION_0, 
        description = if v130 ~= nil then v130 else if l_Boolean_0.toJSBoolean(v126.description) then {
            kind = l_Kind_0.STRING, 
            value = v126.description, 
            block = true
        } else nil, 
        name = {
            kind = l_Kind_0.NAME, 
            value = v126.name
        }, 
        fields = l_Array_0.map(v126:getFields():values(), function(v131)
            return v42(v131, v127, v128);
        end), 
        directives = v31(v126, v127, v128)
    };
    if v126.getInterfaces ~= nil then
        v132.interfaces = l_Array_0.map(l_Object_0.values(v126:getInterfaces()), function(v133)
            return (l_astFromType_0(v133));
        end);
    end;
    return v132;
end;
v7.astFromInterfaceType = v36;
v37 = function(v134, v135, v136)
    local l_UNION_TYPE_DEFINITION_0 = l_Kind_0.UNION_TYPE_DEFINITION;
    local v138 = if typeof(v134.astNode) == "table" then v134.astNode.description else nil;
    return {
        kind = l_UNION_TYPE_DEFINITION_0, 
        description = if v138 ~= nil then v138 else if l_Boolean_0.toJSBoolean(v134.description) then {
            kind = l_Kind_0.STRING, 
            value = v134.description, 
            block = true
        } else nil, 
        name = {
            kind = l_Kind_0.NAME, 
            value = v134.name
        }, 
        directives = v31(v134, v135, v136), 
        types = l_Array_0.map(v134:getTypes(), function(v139)
            return (l_astFromType_0(v139));
        end)
    };
end;
v7.astFromUnionType = v37;
v38 = function(v140, v141, v142)
    local l_INPUT_OBJECT_TYPE_DEFINITION_0 = l_Kind_0.INPUT_OBJECT_TYPE_DEFINITION;
    local v144 = if typeof(v140.astNode) == "table" then v140.astNode.description else nil;
    return {
        kind = l_INPUT_OBJECT_TYPE_DEFINITION_0, 
        description = if v144 ~= nil then v144 else if l_Boolean_0.toJSBoolean(v140.description) then {
            kind = l_Kind_0.STRING, 
            value = v140.description, 
            block = true
        } else nil, 
        name = {
            kind = l_Kind_0.NAME, 
            value = v140.name
        }, 
        fields = l_Array_0.map(v140:getFields():values(), function(v145)
            return v43(v145, v141, v142);
        end), 
        directives = v31(v140, v141, v142)
    };
end;
v7.astFromInputObjectType = v38;
v39 = function(v146, v147, v148)
    local l_ENUM_TYPE_DEFINITION_0 = l_Kind_0.ENUM_TYPE_DEFINITION;
    local v150 = if typeof(v146.astNode) == "table" then v146.astNode.description else nil;
    return {
        kind = l_ENUM_TYPE_DEFINITION_0, 
        description = if v150 ~= nil then v150 else if l_Boolean_0.toJSBoolean(v146.description) then {
            kind = l_Kind_0.STRING, 
            value = v146.description, 
            block = true
        } else nil, 
        name = {
            kind = l_Kind_0.NAME, 
            value = v146.name
        }, 
        values = l_Array_0.map(l_Object_0.values(v146:getValues()), function(v151)
            return v34(v151, v147, v148);
        end), 
        directives = v31(v146, v147, v148)
    };
end;
v7.astFromEnumType = v39;
v40 = function(v152, v153, v154)
    local v155 = l_getDirectivesInExtensions_0(v152, v154);
    local v156 = if not l_Boolean_0.toJSBoolean(v155) then if typeof(v152.astNode) == "table" then v152.astNode.directives else nil or {} else v33(v153, v155);
    local v157 = not not l_Boolean_0.toJSBoolean(v152.specifiedByUrl) and v152.specifiedByUrl or v152.specifiedByURL;
    if l_Boolean_0.toJSBoolean(if not l_Boolean_0.toJSBoolean(v157) then v157 else not l_Boolean_0.toJSBoolean(l_Array_0.some(v156, function(v158)
        return v158.name.value == "specifiedBy";
    end))) then
        table.insert(v156, v30("specifiedBy", {
            url = v157
        }));
    end;
    local l_SCALAR_TYPE_DEFINITION_0 = l_Kind_0.SCALAR_TYPE_DEFINITION;
    local v160 = if typeof(v152.astNode) == "table" then v152.astNode.description else nil;
    return {
        kind = l_SCALAR_TYPE_DEFINITION_0, 
        description = if v160 ~= nil then v160 else if l_Boolean_0.toJSBoolean(v152.description) then {
            kind = l_Kind_0.STRING, 
            value = v152.description, 
            block = true
        } else nil, 
        name = {
            kind = l_Kind_0.NAME, 
            value = v152.name
        }, 
        directives = v156
    };
end;
v7.astFromScalarType = v40;
v42 = function(v161, v162, v163)
    local l_FIELD_DEFINITION_0 = l_Kind_0.FIELD_DEFINITION;
    local v165 = if typeof(v161.astNode) == "table" then v161.astNode.description else nil;
    return {
        kind = l_FIELD_DEFINITION_0, 
        description = if v165 ~= nil then v165 else if l_Boolean_0.toJSBoolean(v161.description) then {
            kind = l_Kind_0.STRING, 
            value = v161.description, 
            block = true
        } else nil, 
        name = {
            kind = l_Kind_0.NAME, 
            value = v161.name
        }, 
        arguments = l_Array_0.map(v161.args, function(v166)
            return v41(v166, v162, v163);
        end), 
        type = l_astFromType_0(v161.type), 
        directives = v113(v161, v162, v163)
    };
end;
v7.astFromField = v42;
v43 = function(v167, v168, v169)
    local l_INPUT_VALUE_DEFINITION_1 = l_Kind_0.INPUT_VALUE_DEFINITION;
    local v171 = if typeof(v167.astNode) == "table" then v167.astNode.description else nil;
    local v172 = if v171 ~= nil then v171 else if l_Boolean_0.toJSBoolean(v167.description) then {
        kind = l_Kind_0.STRING, 
        value = v167.description, 
        block = true
    } else nil;
    local v173 = {
        kind = l_Kind_0.NAME, 
        value = v167.name
    };
    local v174 = l_astFromType_0(v167.type);
    local v175 = v113(v167, v168, v169);
    local v176 = l_astFromValue_0(v167.defaultValue, v167.type);
    return {
        kind = l_INPUT_VALUE_DEFINITION_1, 
        description = v172, 
        name = v173, 
        type = v174, 
        directives = v175, 
        defaultValue = if v176 ~= nil and v176 ~= l_NULL_0 then v176 else nil
    };
end;
v7.astFromInputField = v43;
v34 = function(v177, v178, v179)
    local l_ENUM_VALUE_DEFINITION_0 = l_Kind_0.ENUM_VALUE_DEFINITION;
    local v181 = if typeof(v177.astNode) == "table" then v177.astNode.description else nil;
    return {
        kind = l_ENUM_VALUE_DEFINITION_0, 
        description = if v181 ~= nil then v181 else if l_Boolean_0.toJSBoolean(v177.description) then {
            kind = l_Kind_0.STRING, 
            value = v177.description, 
            block = true
        } else nil, 
        name = {
            kind = l_Kind_0.NAME, 
            value = v177.name
        }, 
        directives = v113(v177, v178, v179)
    };
end;
v7.astFromEnumValue = v34;
v35 = function(v182)
    return v30("deprecated", {
        reason = v182
    }, l_GraphQLDeprecatedDirective_0);
end;
v7.makeDeprecatedDirective = v35;
v30 = function(v183, v184, v185)
    local v186 = {};
    if v185 ~= nil then
        for _, v188 in v185.args, nil, nil do
            local l_name_0 = v188.name;
            local v190 = v184[tostring(l_name_0)];
            if v190 ~= nil then
                local v191 = l_astFromValue_0(v190, v188.type);
                if l_Boolean_0.toJSBoolean(v191) then
                    table.insert(v186, {
                        kind = l_Kind_0.ARGUMENT, 
                        name = {
                            kind = l_Kind_0.NAME, 
                            value = l_name_0
                        }, 
                        value = v191
                    });
                end;
            end;
        end;
    else
        for v192 in v184, nil, nil do
            local v193 = l_astFromValueUntyped_0(v184[tostring(v192)]);
            if l_Boolean_0.toJSBoolean(v193) then
                table.insert(v186, {
                    kind = l_Kind_0.ARGUMENT, 
                    name = {
                        kind = l_Kind_0.NAME, 
                        value = v192
                    }, 
                    value = v193
                });
            end;
        end;
    end;
    return {
        kind = l_Kind_0.DIRECTIVE, 
        name = {
            kind = l_Kind_0.NAME, 
            value = v183
        }, 
        arguments = v186
    };
end;
v7.makeDirectiveNode = v30;
v33 = function(v194, v195)
    local v196 = {};
    for v197 in v195, nil, nil do
        local v198 = v195[tostring(v197)];
        local v199 = if typeof(v194) == "table" then v194:getDirective(v197) else nil;
        if l_Array_0.isArray(v198) and #v198 ~= 0 then
            for _, v201 in v198, nil, nil do
                table.insert(v196, v30(v197, v201, v199));
            end;
        else
            table.insert(v196, v30(v197, v198, v199));
        end;
    end;
    return v196;
end;
v7.makeDirectiveNodes = v33;
return v7;
