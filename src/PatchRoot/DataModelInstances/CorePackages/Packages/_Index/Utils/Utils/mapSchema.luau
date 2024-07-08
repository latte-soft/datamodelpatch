local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local v5 = {};
local v6 = require(l_Parent_0.GraphQL);
local l_GraphQLObjectType_0 = v6.GraphQLObjectType;
local l_GraphQLSchema_0 = v6.GraphQLSchema;
local l_isInterfaceType_0 = v6.isInterfaceType;
local l_isEnumType_0 = v6.isEnumType;
local l_isObjectType_0 = v6.isObjectType;
local l_isScalarType_0 = v6.isScalarType;
local l_isUnionType_0 = v6.isUnionType;
local l_isInputObjectType_0 = v6.isInputObjectType;
local l_GraphQLInputObjectType_0 = v6.GraphQLInputObjectType;
local l_GraphQLInterfaceType_0 = v6.GraphQLInterfaceType;
local l_isLeafType_0 = v6.isLeafType;
local l_isListType_0 = v6.isListType;
local l_isNonNullType_0 = v6.isNonNullType;
local l_isNamedType_0 = v6.isNamedType;
local l_GraphQLList_0 = v6.GraphQLList;
local l_GraphQLNonNull_0 = v6.GraphQLNonNull;
local l_GraphQLEnumType_0 = v6.GraphQLEnumType;
local l_Kind_0 = v6.Kind;
local l_getObjectTypeFromTypeMap_0 = require(script.Parent.getObjectTypeFromTypeMap).getObjectTypeFromTypeMap;
local l_MapperKind_0 = require(script.Parent.Interfaces).MapperKind;
local l_rewireTypes_0 = require(script.Parent.rewire).rewireTypes;
local v28 = require(script.Parent.transformInputValue);
local l_serializeInputValue_0 = v28.serializeInputValue;
local l_parseInputValue_0 = v28.parseInputValue;
local l_Map_0 = v1.Map;
local l_String_0 = v1.String;
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
v5.mapSchema = function(v46, v47)
    local v48 = if v47 ~= nil then v47 else {};
    local v51 = v34(v35(v33(v36(v37(v33(v36(v46:getTypeMap(), v46, l_serializeInputValue_0), v46, v48, function(v49)
        return l_isLeafType_0(v49);
    end), v46, v48), v46, l_parseInputValue_0), v46, v48, function(v50)
        return not l_Boolean_0.toJSBoolean(l_isLeafType_0(v50));
    end), v46, v48), v46, v48);
    local v52 = l_rewireTypes_0(v51, (v40(v46:getDirectives(), v46, v48)));
    local l_typeMap_0 = v52.typeMap;
    return l_GraphQLSchema_0.new(l_Object_0.assign({}, v46:toConfig(), {
        query = l_getObjectTypeFromTypeMap_0(l_typeMap_0, l_getObjectTypeFromTypeMap_0(v51, v46:getQueryType())) or l_Object_0.None, 
        mutation = l_getObjectTypeFromTypeMap_0(l_typeMap_0, l_getObjectTypeFromTypeMap_0(v51, v46:getMutationType())) or l_Object_0.None, 
        subscription = l_getObjectTypeFromTypeMap_0(l_typeMap_0, l_getObjectTypeFromTypeMap_0(v51, v46:getSubscriptionType())) or l_Object_0.None, 
        types = l_typeMap_0:values() or l_Object_0.None, 
        directives = v52.directives or l_Object_0.None
    }));
end;
v33 = function(v54, v55, v56, v57)
    local v58 = if v57 ~= nil then v57 else function()
        return true;
    end;
    local v59 = l_Map_0.new();
    for _, v61 in v54, nil, nil do
        local v62 = table.unpack(v61);
        if not l_String_0.startsWith(v62, "__") then
            local v63 = v54:get(v62);
            if (v63 ~= nil and v63 ~= l_Object_0.None) and v58(v63) then
                local v64 = v42(v55, v56, v62);
                if not (v64 ~= nil) or v64 == l_Object_0.None then
                    v59:set(v62, v63);
                else
                    local v65 = v64(v63, v55);
                    if v65 == nil then
                        v59:set(v62, v63);
                    else
                        v59:set(v62, v65);
                    end;
                end;
            else
                v59:set(v62, v63);
            end;
        end;
    end;
    return v59;
end;
v37 = function(v66, v67, v68)
    local v69 = v38(v68);
    if l_Boolean_0.toJSBoolean(v69) then
        return v33(v66, v67, {
            [tostring(l_MapperKind_0.ENUM_TYPE)] = function(v70)
                local v71 = v70:toConfig();
                local l_values_0 = v71.values;
                local v73 = l_Map_0.new();
                for _, v75 in l_values_0, nil, nil do
                    local v76 = table.unpack(v75);
                    local v77 = l_values_0:get(v76);
                    local v78 = v69(v77, v70.name, v67, v76);
                    if v78 == nil then
                        v73:set(v76, v77);
                    elseif not l_Boolean_0.toJSBoolean(l_Array_0.isArray(v78)) then
                        if v78 ~= l_Object_0.None then
                            v73:set(v76, v78);
                        end;
                    else
                        local v79, v80 = table.unpack(v78, 1, 2);
                        v73:set(v79, if v80 == nil then v77 else v80);
                    end;
                end;
                return (v45(l_GraphQLEnumType_0.new(l_Object_0.assign({}, v71, {
                    values = v73
                }))));
            end
        }, function(v81)
            return l_isEnumType_0(v81);
        end);
    else
        return v66;
    end;
end;
v36 = function(v82, v83, v84)
    local v87 = v34(v82, v83, {
        [l_MapperKind_0.ARGUMENT] = function(v85)
            if v85.defaultValue == nil then
                return v85;
            else
                local v86 = v44(v82, v85.type);
                if v86 ~= nil then
                    return l_Object_0.assign({}, v85, {
                        defaultValue = v84(v86, v85.defaultValue)
                    });
                else
                    return nil;
                end;
            end;
        end
    });
    return v35(v87, v83, {
        [l_MapperKind_0.INPUT_OBJECT_FIELD] = function(v88)
            if v88.defaultValue == nil then
                return v88;
            else
                local v89 = v44(v87, v88.type);
                if v89 ~= nil then
                    return l_Object_0.assign({}, v88, {
                        defaultValue = v84(v89, v88.defaultValue)
                    });
                else
                    return nil;
                end;
            end;
        end
    });
end;
v44 = function(v90, v91)
    if not l_Boolean_0.toJSBoolean(l_isListType_0(v91)) then
        if not l_Boolean_0.toJSBoolean(l_isNonNullType_0(v91)) then
            if not l_Boolean_0.toJSBoolean(l_isNamedType_0(v91)) then
                return nil;
            else
                local v92 = v90:get(v91.name);
                if v92 ~= nil then
                    return v92;
                else
                    return nil;
                end;
            end;
        else
            local v93 = v44(v90, v91.ofType);
            if v93 ~= nil then
                return (l_GraphQLNonNull_0.new(v93));
            else
                return nil;
            end;
        end;
    else
        local v94 = v44(v90, v91.ofType);
        if v94 ~= nil then
            return (l_GraphQLList_0.new(v94));
        else
            return nil;
        end;
    end;
end;
v35 = function(v95, v96, v97)
    local v98 = l_Map_0.new();
    for _, v100 in v95, nil, nil do
        local v101 = table.unpack(v100);
        if not l_String_0.startsWith(v101, "__") then
            local v102 = v95:get(v101);
            if (l_Boolean_0.toJSBoolean(l_isObjectType_0(v102)) or l_Boolean_0.toJSBoolean(l_isInterfaceType_0(v102))) or l_Boolean_0.toJSBoolean(l_isInputObjectType_0(v102)) then
                local v103 = v41(v96, v97, v101);
                if not (v103 ~= nil) or v103 == l_Object_0.None then
                    v98:set(v101, v102);
                else
                    local v104 = v102:toConfig();
                    local l_fields_0 = v104.fields;
                    local v106 = l_Map_0.new();
                    for _, v108 in l_fields_0, nil, nil do
                        local v109 = table.unpack(v108);
                        local v110 = l_fields_0:get(v109);
                        local v111 = v103(v110, v109, v101, v96);
                        if v111 == nil then
                            v106:set(v109, v110);
                        elseif not l_Boolean_0.toJSBoolean(l_Array_0.isArray(v111)) then
                            if v111 ~= l_Object_0.None then
                                v106:set(v109, v111);
                            end;
                        else
                            local v112, v113 = table.unpack(v111, 1, 2);
                            if v113.astNode ~= nil and v113.astNode ~= l_Object_0.None then
                                v113.astNode = l_Object_0.assign({}, v113.astNode, {
                                    name = l_Object_0.assign({}, v113.astNode.name, {
                                        value = v112
                                    })
                                });
                            end;
                            v106:set(v112, if v113 == nil then v110 else v113);
                        end;
                    end;
                    if not l_Boolean_0.toJSBoolean(l_isObjectType_0(v102)) then
                        if not l_Boolean_0.toJSBoolean(l_isInterfaceType_0(v102)) then
                            v98:set(v101, (v45(l_GraphQLInputObjectType_0.new(l_Object_0.assign({}, v104, {
                                fields = v106
                            })))));
                        else
                            v98:set(v101, (v45(l_GraphQLInterfaceType_0.new(l_Object_0.assign({}, v104, {
                                fields = v106
                            })))));
                        end;
                    else
                        v98:set(v101, (v45(l_GraphQLObjectType_0.new(l_Object_0.assign({}, v104, {
                            fields = v106
                        })))));
                    end;
                end;
            else
                v98:set(v101, v102);
            end;
        end;
    end;
    return v98;
end;
v34 = function(v114, v115, v116)
    local v117 = l_Map_0.new();
    for _, v119 in v114, nil, nil do
        local v120 = table.unpack(v119);
        if not l_String_0.startsWith(v120, "__") then
            local v121 = v114:get(v120);
            if l_Boolean_0.toJSBoolean(l_isObjectType_0(v121)) or l_Boolean_0.toJSBoolean(l_isInterfaceType_0(v121)) then
                local v122 = v43(v116);
                if not (v122 ~= nil) or v122 == l_Object_0.None then
                    v117:set(v120, v121);
                else
                    local v123 = v121:toConfig();
                    local l_fields_1 = v123.fields;
                    local v125 = l_Map_0.new();
                    for _, v127 in l_fields_1, nil, nil do
                        local v128 = table.unpack(v127);
                        local v129 = l_fields_1:get(v128);
                        local l_args_0 = v129.args;
                        if not (l_args_0 ~= nil) or l_args_0 == l_Object_0.None then
                            v125:set(v128, v129);
                        else
                            local v131 = l_args_0:keys();
                            if #v131 <= 0 then
                                v125:set(v128, v129);
                            else
                                local v132 = l_Map_0.new();
                                for _, v134 in v131, nil, nil do
                                    local v135 = l_args_0:get(v134);
                                    local v136 = v122(v135, v128, v120, v115);
                                    if v136 == nil then
                                        v132:set(v134, v135);
                                    elseif not l_Boolean_0.toJSBoolean(l_Array_0.isArray(v136)) then
                                        if v136 ~= l_Object_0.None then
                                            v132:set(v134, v136);
                                        end;
                                    else
                                        local v137, v138 = table.unpack(v136, 1, 2);
                                        v132:set(v137, v138);
                                    end;
                                end;
                                v125:set(v128, l_Object_0.assign({}, v129, {
                                    args = v132
                                }));
                            end;
                        end;
                    end;
                    if not l_Boolean_0.toJSBoolean(l_isObjectType_0(v121)) then
                        if not l_Boolean_0.toJSBoolean(l_isInterfaceType_0(v121)) then
                            v117:set(v120, l_GraphQLInputObjectType_0.new(l_Object_0.assign({}, v123, {
                                fields = v125
                            })));
                        else
                            v117:set(v120, l_GraphQLInterfaceType_0.new(l_Object_0.assign({}, v123, {
                                fields = v125
                            })));
                        end;
                    else
                        v117:set(v120, l_GraphQLObjectType_0.new(l_Object_0.assign({}, v123, {
                            fields = v125
                        })));
                    end;
                end;
            else
                v117:set(v120, v121);
            end;
        end;
    end;
    return v117;
end;
v40 = function(v139, v140, v141)
    local v142 = v39(v141);
    if not (v142 ~= nil) or v142 == l_Object_0.None then
        return l_Array_0.slice(v139);
    else
        local v143 = {};
        for _, v145 in v139, nil, nil do
            local v146 = v142(v145, v140);
            if v146 == nil then
                table.insert(v143, v145);
            elseif v146 ~= l_Object_0.None then
                table.insert(v143, v146);
            end;
        end;
        return v143;
    end;
end;
local function v151(v147, v148)
    local v149 = v147:getType(v148);
    local v150 = {
        l_MapperKind_0.TYPE
    };
    if not l_Boolean_0.toJSBoolean(l_isObjectType_0(v149)) then
        if not l_Boolean_0.toJSBoolean(l_isInputObjectType_0(v149)) then
            if not l_Boolean_0.toJSBoolean(l_isInterfaceType_0(v149)) then
                if not l_Boolean_0.toJSBoolean(l_isUnionType_0(v149)) then
                    if not l_Boolean_0.toJSBoolean(l_isEnumType_0(v149)) then
                        if l_Boolean_0.toJSBoolean(l_isScalarType_0(v149)) then
                            table.insert(v150, l_MapperKind_0.SCALAR_TYPE);
                        end;
                    else
                        table.insert(v150, l_MapperKind_0.ENUM_TYPE);
                        return v150;
                    end;
                else
                    return (l_Array_0.concat(v150, {
                        l_MapperKind_0.COMPOSITE_TYPE, 
                        l_MapperKind_0.ABSTRACT_TYPE, 
                        l_MapperKind_0.UNION_TYPE
                    }));
                end;
            else
                return (l_Array_0.concat(v150, {
                    l_MapperKind_0.COMPOSITE_TYPE, 
                    l_MapperKind_0.ABSTRACT_TYPE, 
                    l_MapperKind_0.INTERFACE_TYPE
                }));
            end;
        else
            table.insert(v150, l_MapperKind_0.INPUT_OBJECT_TYPE);
            return v150;
        end;
    else
        v150 = l_Array_0.concat(v150, {
            l_MapperKind_0.COMPOSITE_TYPE, 
            l_MapperKind_0.OBJECT_TYPE
        });
        if v148 == if typeof(v147:getQueryType()) == "table" then v147:getQueryType().name else nil then
            return (l_Array_0.concat(v150, {
                l_MapperKind_0.ROOT_OBJECT, 
                l_MapperKind_0.QUERY
            }));
        elseif v148 == if typeof(v147:getMutationType()) == "table" then v147:getMutationType().name else nil then
            return (l_Array_0.concat(v150, {
                l_MapperKind_0.ROOT_OBJECT, 
                l_MapperKind_0.MUTATION
            }));
        elseif v148 == if typeof(v147:getSubscriptionType()) == "table" then v147:getSubscriptionType().name else nil then
            return (l_Array_0.concat(v150, {
                l_MapperKind_0.ROOT_OBJECT, 
                l_MapperKind_0.SUBSCRIPTION
            }));
        end;
    end;
    return v150;
end;
v42 = function(v152, v153, v154)
    local v155 = v151(v152, v154);
    local v156 = nil;
    local v157 = l_Array_0.concat({}, v155);
    while not l_Boolean_0.toJSBoolean(v156) and #v157 > 0 do
        v156 = v153[tostring((table.remove(v157)))];
    end;
    if v156 ~= nil then
        return v156;
    else
        return nil;
    end;
end;
local function v162(v158, v159)
    local v160 = v158:getType(v159);
    local v161 = {
        l_MapperKind_0.FIELD
    };
    if not l_Boolean_0.toJSBoolean(l_isObjectType_0(v160)) then
        if not l_Boolean_0.toJSBoolean(l_isInterfaceType_0(v160)) then
            if l_Boolean_0.toJSBoolean(l_isInputObjectType_0(v160)) then
                table.insert(v161, l_MapperKind_0.INPUT_OBJECT_FIELD);
            end;
        else
            return (l_Array_0.concat(v161, {
                l_MapperKind_0.COMPOSITE_FIELD, 
                l_MapperKind_0.INTERFACE_FIELD
            }));
        end;
    else
        v161 = l_Array_0.concat(v161, {
            l_MapperKind_0.COMPOSITE_FIELD, 
            l_MapperKind_0.OBJECT_FIELD
        });
        if v159 == if typeof(v158:getQueryType()) == "table" then v158:getQueryType().name else nil then
            return (l_Array_0.concat(v161, {
                l_MapperKind_0.ROOT_FIELD, 
                l_MapperKind_0.QUERY_ROOT_FIELD
            }));
        elseif v159 == if typeof(v158:getMutationType()) == "table" then v158:getMutationType().name else nil then
            return (l_Array_0.concat(v161, {
                l_MapperKind_0.ROOT_FIELD, 
                l_MapperKind_0.MUTATION_ROOT_FIELD
            }));
        elseif v159 == if typeof(v158:getSubscriptionType()) == "table" then v158:getSubscriptionType().name else nil then
            return (l_Array_0.concat(v161, {
                l_MapperKind_0.ROOT_FIELD, 
                l_MapperKind_0.SUBSCRIPTION_ROOT_FIELD
            }));
        end;
    end;
    return v161;
end;
v41 = function(v163, v164, v165)
    local v166 = v162(v163, v165);
    local v167 = nil;
    local v168 = l_Array_0.concat({}, table.unpack(v166));
    while not l_Boolean_0.toJSBoolean(v167) and #v168 > 0 do
        v167 = v164[tostring((table.remove(v168)))];
    end;
    if v167 ~= nil then
        return v167;
    else
        return nil;
    end;
end;
v43 = function(v169)
    local v170 = v169[tostring(l_MapperKind_0.ARGUMENT)];
    if v170 ~= nil then
        return v170;
    else
        return nil;
    end;
end;
v39 = function(v171)
    local v172 = v171[tostring(l_MapperKind_0.DIRECTIVE)];
    if v172 ~= nil then
        return v172;
    else
        return nil;
    end;
end;
v38 = function(v173)
    local v174 = v173[tostring(l_MapperKind_0.ENUM_VALUE)];
    if v174 ~= nil then
        return v174;
    else
        return nil;
    end;
end;
v45 = function(v175)
    if not l_Boolean_0.toJSBoolean(l_isObjectType_0(v175)) then
        if not l_Boolean_0.toJSBoolean(l_isInterfaceType_0(v175)) then
            if not l_Boolean_0.toJSBoolean(l_isInputObjectType_0(v175)) then
                if not l_Boolean_0.toJSBoolean(l_isEnumType_0(v175)) then
                    return v175;
                else
                    local v176 = v175:toConfig();
                    if v176.astNode ~= nil then
                        local v177 = {};
                        for _, v179 in v176.values, nil, nil do
                            local v180 = v176.values:get((table.unpack(v179)));
                            if v180.astNode ~= nil then
                                table.insert(v177, v180.astNode);
                            end;
                        end;
                        v176.astNode = l_Object_0.assign({}, v176.astNode, {
                            values = v177
                        });
                    end;
                    if v176.extensionASTNodes ~= nil then
                        v176.extensionASTNodes = l_Array_0.map(v176.extensionASTNodes, function(v181)
                            return l_Object_0.assign({}, v181, {
                                values = l_Object_0.None
                            });
                        end);
                    end;
                    return l_GraphQLEnumType_0.new(v176);
                end;
            else
                local v182 = v175:toConfig();
                if v182.astNode ~= nil then
                    local v183 = {};
                    for _, v185 in v182.fields, nil, nil do
                        local v186 = v182.fields:get((table.unpack(v185)));
                        if v186.astNode ~= nil then
                            table.insert(v183, v186.astNode);
                        end;
                    end;
                    v182.astNode = l_Object_0.assign({}, v182.astNode, {
                        kind = l_Kind_0.INPUT_OBJECT_TYPE_DEFINITION, 
                        fields = v183
                    });
                end;
                if v182.extensionASTNodes ~= nil then
                    v182.extensionASTNodes = l_Array_0.map(v182.extensionASTNodes, function(v187)
                        return l_Object_0.assign({}, v187, {
                            kind = l_Kind_0.INPUT_OBJECT_TYPE_EXTENSION, 
                            fields = l_Object_0.None
                        });
                    end);
                end;
                return l_GraphQLInputObjectType_0.new(v182);
            end;
        else
            local v188 = v175:toConfig();
            if v188.astNode ~= nil then
                local v189 = {};
                for _, v191 in v188.fields, nil, nil do
                    local v192 = v188.fields:get((table.unpack(v191)));
                    if v192.astNode ~= nil then
                        table.insert(v189, v192.astNode);
                    end;
                end;
                v188.astNode = l_Object_0.assign({}, v188.astNode, {
                    kind = l_Kind_0.INTERFACE_TYPE_DEFINITION, 
                    fields = v189
                });
            end;
            if v188.extensionASTNodes ~= nil then
                v188.extensionASTNodes = l_Array_0.map(v188.extensionASTNodes, function(v193)
                    return l_Object_0.assign({}, v193, {
                        kind = l_Kind_0.INTERFACE_TYPE_EXTENSION, 
                        fields = l_Object_0.None
                    });
                end);
            end;
            return l_GraphQLInterfaceType_0.new(v188);
        end;
    else
        local v194 = v175:toConfig();
        if v194.astNode ~= nil then
            local v195 = {};
            for _, v197 in v194.fields, nil, nil do
                local v198 = v194.fields:get((table.unpack(v197)));
                if v198.astNode ~= nil then
                    table.insert(v195, v198.astNode);
                end;
            end;
            v194.astNode = l_Object_0.assign({}, v194.astNode, {
                kind = l_Kind_0.OBJECT_TYPE_DEFINITION, 
                fields = v195
            });
        end;
        if v194.extensionASTNodes ~= nil then
            v194.extensionASTNodes = l_Array_0.map(v194.extensionASTNodes, function(v199)
                return l_Object_0.assign({}, v199, {
                    kind = l_Kind_0.OBJECT_TYPE_EXTENSION, 
                    fields = l_Object_0.None
                });
            end);
        end;
        return l_GraphQLObjectType_0.new(v194);
    end;
end;
v5.correctASTNodes = v45;
return v5;
