local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Map_0 = v1.Map;
local l_Object_0 = v1.Object;
local v6 = {};
local v7 = require(l_Parent_0.GraphQL);
local l_isObjectType_0 = v7.isObjectType;
local l_getNamedType_0 = v7.getNamedType;
local l_isUnionType_0 = v7.isUnionType;
local l_isNonNullType_0 = v7.isNonNullType;
local l_isScalarType_0 = v7.isScalarType;
local l_isListType_0 = v7.isListType;
local l_isInterfaceType_0 = v7.isInterfaceType;
local l_isEnumType_0 = v7.isEnumType;
local l_Kind_0 = v7.Kind;
local v17 = require(script.Parent.rootTypes);
local l_getDefinedRootType_0 = v17.getDefinedRootType;
local l_getRootTypeNames_0 = v17.getRootTypeNames;
local v20 = nil;
local v21 = nil;
local v22 = nil;
local v23 = nil;
local v24 = {};
local v25 = {};
local v26 = l_Map_0.new();
local function _(v27)
    table.insert(v25, v27);
end;
local function _()
    v25 = {};
end;
local function _()
    v26 = l_Map_0.new();
end;
v6.buildOperationNodeForField = function(v31)
    local l_schema_0 = v31.schema;
    local l_kind_0 = v31.kind;
    local l_field_0 = v31.field;
    local l_models_0 = v31.models;
    local v36 = if v31.ignore == nil then {} else v31.ignore;
    local l_depthLimit_0 = v31.depthLimit;
    local l_circularReferenceDepth_0 = v31.circularReferenceDepth;
    local l_argNames_0 = v31.argNames;
    local v40 = v31.selectedFields == nil and true or v31.selectedFields;
    v25 = {};
    v26 = l_Map_0.new();
    local v41 = v20({
        schema = l_schema_0, 
        fieldName = l_field_0, 
        kind = l_kind_0, 
        models = if not l_Boolean_0.toJSBoolean(l_models_0) then {} else l_models_0, 
        ignore = v36, 
        depthLimit = if not l_Boolean_0.toJSBoolean(l_depthLimit_0) then math.huge else l_depthLimit_0, 
        circularReferenceDepth = not not l_Boolean_0.toJSBoolean(l_circularReferenceDepth_0) and l_circularReferenceDepth_0 or 1, 
        argNames = l_argNames_0, 
        selectedFields = v40, 
        rootTypeNames = l_getRootTypeNames_0(l_schema_0)
    });
    v41.variableDefinitions = l_Array_0.concat({}, v25);
    v25 = {};
    v26 = l_Map_0.new();
    return v41;
end;
v20 = function(v42)
    local l_schema_1 = v42.schema;
    local l_fieldName_0 = v42.fieldName;
    local l_kind_1 = v42.kind;
    local l_models_1 = v42.models;
    local l_ignore_0 = v42.ignore;
    local l_depthLimit_1 = v42.depthLimit;
    local l_circularReferenceDepth_1 = v42.circularReferenceDepth;
    local l_argNames_1 = v42.argNames;
    local l_selectedFields_0 = v42.selectedFields;
    local l_rootTypeNames_0 = v42.rootTypeNames;
    local v53 = l_getDefinedRootType_0(l_schema_1, l_kind_1);
    local v54 = v53:getFields():get(l_fieldName_0);
    local v55 = ("%s_%s"):format(tostring(l_fieldName_0), (tostring(l_kind_1)));
    if not (not v54 or not v54.args) then
        for _, v57 in v54.args, nil, nil do
            local l_name_0 = v57.name;
            if not (l_argNames_1 and not l_Array_0.includes(l_argNames_1, l_name_0)) then
                table.insert(v25, (v21(v57, l_name_0)));
            end;
        end;
    end;
    return {
        kind = l_Kind_0.OPERATION_DEFINITION, 
        operation = l_kind_1, 
        name = {
            kind = l_Kind_0.NAME, 
            value = v55
        }, 
        variableDefinitions = {}, 
        selectionSet = {
            kind = l_Kind_0.SELECTION_SET, 
            selections = {
                v23({
                    type = v53, 
                    field = v54, 
                    models = l_models_1, 
                    firstCall = true, 
                    path = {}, 
                    ancestors = {}, 
                    ignore = l_ignore_0, 
                    depthLimit = l_depthLimit_1, 
                    circularReferenceDepth = l_circularReferenceDepth_1, 
                    schema = l_schema_1, 
                    depth = 0, 
                    argNames = l_argNames_1, 
                    selectedFields = l_selectedFields_0, 
                    rootTypeNames = l_rootTypeNames_0
                })
            }
        }
    };
end;
local function v59(v60)
    local l_parent_0 = v60.parent;
    local l_type_0 = v60.type;
    local l_models_2 = v60.models;
    local l_firstCall_0 = v60.firstCall;
    local l_path_0 = v60.path;
    local l_ancestors_0 = v60.ancestors;
    local l_ignore_1 = v60.ignore;
    local l_depthLimit_2 = v60.depthLimit;
    local l_circularReferenceDepth_2 = v60.circularReferenceDepth;
    local l_schema_2 = v60.schema;
    local l_depth_0 = v60.depth;
    local l_argNames_2 = v60.argNames;
    local l_selectedFields_1 = v60.selectedFields;
    local l_rootTypeNames_1 = v60.rootTypeNames;
    if typeof(l_selectedFields_1) == "boolean" and l_depthLimit_2 < l_depth_0 then
        return ;
    elseif not l_Boolean_0.toJSBoolean(l_isUnionType_0(l_type_0)) then
        if not l_Boolean_0.toJSBoolean(l_isInterfaceType_0(l_type_0)) then
            local l_toJSBoolean_0 = l_Boolean_0.toJSBoolean;
            local v76 = l_isObjectType_0(l_type_0);
            if not l_toJSBoolean_0(if not l_Boolean_0.toJSBoolean(v76) then v76 else not l_Boolean_0.toJSBoolean(l_rootTypeNames_1:has(l_type_0.name))) then
                return nil;
            else
                l_toJSBoolean_0 = l_Array_0.includes(l_ignore_1, l_type_0.name);
                local v77 = not not l_Boolean_0.toJSBoolean(l_toJSBoolean_0) and l_toJSBoolean_0 or l_Array_0.includes(l_ignore_1, ("%s.%s"):format(l_parent_0.name, (tostring(l_path_0[#l_path_0]))));
                v76 = l_Array_0.includes(l_models_2, l_type_0.name);
                local l_toJSBoolean_1 = l_Boolean_0.toJSBoolean;
                local v79 = not l_Boolean_0.toJSBoolean(l_firstCall_0) and v76;
                if not l_toJSBoolean_1(if not l_Boolean_0.toJSBoolean(v79) then v79 else not l_Boolean_0.toJSBoolean(v77)) then
                    l_toJSBoolean_1 = l_type_0:getFields();
                    return {
                        kind = l_Kind_0.SELECTION_SET, 
                        selections = l_Array_0.filter(l_Array_0.map(l_Array_0.filter(l_toJSBoolean_1:keys(), function(v80)
                            return not v22(l_Array_0.concat({}, l_ancestors_0, {
                                l_getNamedType_0(l_toJSBoolean_1:get(v80).type)
                            }), {
                                depth = l_circularReferenceDepth_2
                            });
                        end), function(v81)
                            local v82 = not (typeof(l_selectedFields_1) == "table") or l_selectedFields_1[tostring(v81)];
                            if not l_Boolean_0.toJSBoolean(v82) then
                                return v24;
                            else
                                return v23({
                                    type = l_type_0, 
                                    field = l_toJSBoolean_1:get(v81), 
                                    models = l_models_2, 
                                    path = l_Array_0.concat({}, l_path_0, {
                                        v81
                                    }), 
                                    ancestors = l_ancestors_0, 
                                    ignore = l_ignore_1, 
                                    depthLimit = l_depthLimit_2, 
                                    circularReferenceDepth = l_circularReferenceDepth_2, 
                                    schema = l_schema_2, 
                                    depth = l_depth_0, 
                                    argNames = l_argNames_2, 
                                    selectedFields = v82, 
                                    rootTypeNames = l_rootTypeNames_1
                                });
                            end;
                        end), function(v83)
                            if not (v83 ~= nil) or v83 == v24 then
                                return false;
                            elseif l_Array_0.indexOf(l_Object_0.keys(v83), "selectionSet") ~= -1 then
                                return l_Boolean_0.toJSBoolean(if typeof(v83.selectionSet) == "table" and typeof(v83.selectionSet.selections) == "table" then #v83.selectionSet.selections else nil);
                            else
                                return true;
                            end;
                        end)
                    };
                else
                    return {
                        kind = l_Kind_0.SELECTION_SET, 
                        selections = {
                            {
                                kind = l_Kind_0.FIELD, 
                                name = {
                                    kind = l_Kind_0.NAME, 
                                    value = "id"
                                }
                            }
                        }
                    };
                end;
            end;
        else
            return {
                kind = l_Kind_0.SELECTION_SET, 
                selections = l_Array_0.filter(l_Array_0.map(l_Array_0.filter(l_Array_0.filter(l_schema_2:getTypeMap():values(), function(v84)
                    local v85 = l_isObjectType_0(v84);
                    if not l_Boolean_0.toJSBoolean(v85) then
                        return v85;
                    else
                        return (l_Array_0.includes(v84:getInterfaces(), l_type_0));
                    end;
                end), function(v86)
                    return not v22(l_Array_0.concat({}, l_ancestors_0, {
                        v86
                    }), {
                        depth = l_circularReferenceDepth_2
                    });
                end), function(v87)
                    return {
                        kind = l_Kind_0.INLINE_FRAGMENT, 
                        typeCondition = {
                            kind = l_Kind_0.NAMED_TYPE, 
                            name = {
                                kind = l_Kind_0.NAME, 
                                value = v87.name
                            }
                        }, 
                        selectionSet = v59({
                            parent = l_type_0, 
                            type = v87, 
                            models = l_models_2, 
                            path = l_path_0, 
                            ancestors = l_ancestors_0, 
                            ignore = l_ignore_1, 
                            depthLimit = l_depthLimit_2, 
                            circularReferenceDepth = l_circularReferenceDepth_2, 
                            schema = l_schema_2, 
                            depth = l_depth_0, 
                            argNames = l_argNames_2, 
                            selectedFields = l_selectedFields_1, 
                            rootTypeNames = l_rootTypeNames_1
                        })
                    };
                end), function(v88)
                    if ((typeof(v88) == "table" and v88.selectionSet ~= v24) and typeof(v88.selectionSet) == "table") and typeof(v88.selectionSet.selections) == "table" then
                        return #v88.selectionSet.selections > 0;
                    else
                        return false;
                    end;
                end)
            };
        end;
    else
        return {
            kind = l_Kind_0.SELECTION_SET, 
            selections = l_Array_0.filter(l_Array_0.map(l_Array_0.filter(l_type_0:getTypes(), function(v89)
                return not v22(l_Array_0.concat({}, l_ancestors_0, {
                    v89
                }), {
                    depth = l_circularReferenceDepth_2
                });
            end), function(v90)
                return {
                    kind = l_Kind_0.INLINE_FRAGMENT, 
                    typeCondition = {
                        kind = l_Kind_0.NAMED_TYPE, 
                        name = {
                            kind = l_Kind_0.NAME, 
                            value = v90.name
                        }
                    }, 
                    selectionSet = v59({
                        parent = l_type_0, 
                        type = v90, 
                        models = l_models_2, 
                        path = l_path_0, 
                        ancestors = l_ancestors_0, 
                        ignore = l_ignore_1, 
                        depthLimit = l_depthLimit_2, 
                        circularReferenceDepth = l_circularReferenceDepth_2, 
                        schema = l_schema_2, 
                        depth = l_depth_0, 
                        argNames = l_argNames_2, 
                        selectedFields = l_selectedFields_1, 
                        rootTypeNames = l_rootTypeNames_1
                    })
                };
            end), function(v91)
                local v92 = false;
                if typeof(v91) == "table" then
                    v92 = false;
                    if v91.selectionSet ~= v24 then
                        v92 = false;
                        if typeof(v91.selectionSet) == "table" then
                            v92 = false;
                            if typeof(v91.selectionSet.selections) == "table" then
                                v92 = #v91.selectionSet.selections > 0;
                            end;
                        end;
                    end;
                end;
                return v92;
            end)
        };
    end;
end;
v21 = function(v93, v94)
    local function v95(v96)
        if not l_Boolean_0.toJSBoolean(l_isListType_0(v96)) then
            if not l_Boolean_0.toJSBoolean(l_isNonNullType_0(v96)) then
                return {
                    kind = l_Kind_0.NAMED_TYPE, 
                    name = {
                        kind = l_Kind_0.NAME, 
                        value = v96.name
                    }
                };
            else
                return {
                    kind = l_Kind_0.NON_NULL_TYPE, 
                    type = v95(v96.ofType)
                };
            end;
        else
            return {
                kind = l_Kind_0.LIST_TYPE, 
                type = v95(v96.ofType)
            };
        end;
    end;
    return {
        kind = l_Kind_0.VARIABLE_DEFINITION, 
        variable = {
            kind = l_Kind_0.VARIABLE, 
            name = {
                kind = l_Kind_0.NAME, 
                value = not not l_Boolean_0.toJSBoolean(v94) and v94 or v93.name
            }
        }, 
        type = v95(v93.type)
    };
end;
local function v99(v97, v98)
    return l_Array_0.join(l_Array_0.concat({}, v98, {
        v97
    }), "_");
end;
v23 = function(v100)
    local l_type_1 = v100.type;
    local l_field_1 = v100.field;
    local l_models_3 = v100.models;
    local l_firstCall_1 = v100.firstCall;
    local l_path_1 = v100.path;
    local l_ancestors_1 = v100.ancestors;
    local l_ignore_2 = v100.ignore;
    local l_depthLimit_3 = v100.depthLimit;
    local l_circularReferenceDepth_3 = v100.circularReferenceDepth;
    local l_schema_3 = v100.schema;
    local l_depth_1 = v100.depth;
    local l_argNames_3 = v100.argNames;
    local l_selectedFields_2 = v100.selectedFields;
    local l_rootTypeNames_2 = v100.rootTypeNames;
    local v115 = l_getNamedType_0(l_field_1.type);
    local v116 = {};
    local v117 = false;
    if l_Boolean_0.toJSBoolean(l_field_1.args) and #l_field_1.args ~= 0 then
        v116 = l_Array_0.filter(l_Array_0.map(l_field_1.args, function(v118)
            local v119 = v99(v118.name, l_path_1);
            if not if not l_argNames_3 then l_Boolean_0.toJSBoolean(l_argNames_3) else not l_Array_0.includes(l_argNames_3, v119) then
                if not l_Boolean_0.toJSBoolean(l_firstCall_1) then
                    table.insert(v25, (v21(v118, v119)));
                end;
                return {
                    kind = l_Kind_0.ARGUMENT, 
                    name = {
                        kind = l_Kind_0.NAME, 
                        value = v118.name
                    }, 
                    value = {
                        kind = l_Kind_0.VARIABLE, 
                        name = {
                            kind = l_Kind_0.NAME, 
                            value = v99(v118.name, l_path_1)
                        }
                    }
                };
            else
                if l_Boolean_0.toJSBoolean(l_isNonNullType_0(v118.type)) then
                    v117 = true;
                end;
                return nil;
            end;
        end), l_Boolean_0.toJSBoolean);
    end;
    if not l_Boolean_0.toJSBoolean(v117) then
        local v120 = l_Array_0.concat({}, l_path_1, {
            l_field_1.name
        });
        local v121 = l_Array_0.join(v120, ".");
        local l_name_1 = l_field_1.name;
        local l_toJSBoolean_2 = l_Boolean_0.toJSBoolean;
        local v124 = v26:has(v121);
        if l_toJSBoolean_2(if not l_Boolean_0.toJSBoolean(v124) then v124 else v26:get(v121) ~= tostring(l_field_1.type)) then
            l_name_1 = l_name_1 .. tostring(l_field_1.type):gsub("", "NonNull");
        end;
        v26:set(v121, (tostring(l_field_1.type)));
        if l_Boolean_0.toJSBoolean(l_isScalarType_0(v115)) or l_Boolean_0.toJSBoolean(l_isEnumType_0(v115)) then
            l_toJSBoolean_2 = l_Object_0.assign;
            local v125 = {};
            v124 = {
                kind = l_Kind_0.FIELD, 
                name = {
                    kind = l_Kind_0.NAME, 
                    value = l_field_1.name
                }
            };
            local v126 = false;
            if l_name_1 ~= l_field_1.name then
                v126 = {
                    alias = {
                        kind = l_Kind_0.NAME, 
                        value = l_name_1
                    }
                };
            end;
            return l_toJSBoolean_2(v125, v124, v126, {
                arguments = v116
            });
        else
            l_toJSBoolean_2 = v59({
                parent = l_type_1, 
                type = v115, 
                models = l_models_3, 
                firstCall = l_firstCall_1, 
                path = v120, 
                ancestors = l_Array_0.concat({}, l_ancestors_1, {
                    l_type_1
                }), 
                ignore = l_ignore_2, 
                depthLimit = l_depthLimit_3, 
                circularReferenceDepth = l_circularReferenceDepth_3, 
                schema = l_schema_3, 
                depth = l_depth_1 + 1, 
                argNames = l_argNames_3, 
                selectedFields = l_selectedFields_2, 
                rootTypeNames = l_rootTypeNames_2
            });
            local v127 = if not l_Boolean_0.toJSBoolean(l_toJSBoolean_2) then nil else l_toJSBoolean_2;
            v124 = l_Object_0.assign;
            local v128 = {};
            local v129 = {
                kind = l_Kind_0.FIELD, 
                name = {
                    kind = l_Kind_0.NAME, 
                    value = l_field_1.name
                }
            };
            local v130 = false;
            if l_name_1 ~= l_field_1.name then
                v130 = {
                    alias = {
                        kind = l_Kind_0.NAME, 
                        value = l_name_1
                    }
                };
            end;
            return v124(v128, v129, v130, {
                selectionSet = not not l_Boolean_0.toJSBoolean(v127) and v127 or v24, 
                arguments = v116
            });
        end;
    else
        return nil;
    end;
end;
v22 = function(v131, v132)
    local v133 = if v132 ~= nil then v132 else {
        depth = 1
    };
    local v134 = v131[#v131];
    if not l_Boolean_0.toJSBoolean(l_isScalarType_0(v134)) then
        return v133.depth < #l_Array_0.filter(v131, function(v135)
            return v135.name == v134.name;
        end);
    else
        return false;
    end;
end;
return v6;
