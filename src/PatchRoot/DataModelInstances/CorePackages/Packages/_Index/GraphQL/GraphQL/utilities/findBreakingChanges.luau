local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
local l_keyMapOrdered_0 = require(l_Parent_0.luaUtils.keyMapOrdered).keyMapOrdered;
local l_jsutils_0 = l_Parent_0.jsutils;
local l_inspect_0 = require(l_jsutils_0.inspect).inspect;
local l_invariant_0 = require(l_jsutils_0.invariant).invariant;
local l_naturalCompare_0 = require(l_jsutils_0.naturalCompare).naturalCompare;
local l_language_0 = l_Parent_0.language;
local l_print_0 = require(l_language_0.printer).print;
local l_visit_0 = require(l_language_0.visitor).visit;
local _ = require(l_language_0.ast);
local l_type_0 = l_Parent_0.type;
local _ = require(l_type_0.schema);
local v15 = require(l_type_0.definition);
local l_isSpecifiedScalarType_0 = require(l_type_0.scalars).isSpecifiedScalarType;
local l_isScalarType_0 = v15.isScalarType;
local l_isObjectType_0 = v15.isObjectType;
local l_isInterfaceType_0 = v15.isInterfaceType;
local l_isUnionType_0 = v15.isUnionType;
local l_isEnumType_0 = v15.isEnumType;
local l_isInputObjectType_0 = v15.isInputObjectType;
local l_isNonNullType_0 = v15.isNonNullType;
local l_isListType_0 = v15.isListType;
local l_isNamedType_0 = v15.isNamedType;
local l_isRequiredArgument_0 = v15.isRequiredArgument;
local l_isRequiredInputField_0 = v15.isRequiredInputField;
local l_astFromValue_0 = require(script.Parent.astFromValue).astFromValue;
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
local v43 = l_Object_0.freeze({
    TYPE_REMOVED = "TYPE_REMOVED", 
    TYPE_CHANGED_KIND = "TYPE_CHANGED_KIND", 
    TYPE_REMOVED_FROM_UNION = "TYPE_REMOVED_FROM_UNION", 
    VALUE_REMOVED_FROM_ENUM = "VALUE_REMOVED_FROM_ENUM", 
    REQUIRED_INPUT_FIELD_ADDED = "REQUIRED_INPUT_FIELD_ADDED", 
    IMPLEMENTED_INTERFACE_REMOVED = "IMPLEMENTED_INTERFACE_REMOVED", 
    FIELD_REMOVED = "FIELD_REMOVED", 
    FIELD_CHANGED_KIND = "FIELD_CHANGED_KIND", 
    REQUIRED_ARG_ADDED = "REQUIRED_ARG_ADDED", 
    ARG_REMOVED = "ARG_REMOVED", 
    ARG_CHANGED_KIND = "ARG_CHANGED_KIND", 
    DIRECTIVE_REMOVED = "DIRECTIVE_REMOVED", 
    DIRECTIVE_ARG_REMOVED = "DIRECTIVE_ARG_REMOVED", 
    REQUIRED_DIRECTIVE_ARG_ADDED = "REQUIRED_DIRECTIVE_ARG_ADDED", 
    DIRECTIVE_REPEATABLE_REMOVED = "DIRECTIVE_REPEATABLE_REMOVED", 
    DIRECTIVE_LOCATION_REMOVED = "DIRECTIVE_LOCATION_REMOVED"
});
local v44 = l_Object_0.freeze({
    VALUE_ADDED_TO_ENUM = "VALUE_ADDED_TO_ENUM", 
    TYPE_ADDED_TO_UNION = "TYPE_ADDED_TO_UNION", 
    OPTIONAL_INPUT_FIELD_ADDED = "OPTIONAL_INPUT_FIELD_ADDED", 
    OPTIONAL_ARG_ADDED = "OPTIONAL_ARG_ADDED", 
    IMPLEMENTED_INTERFACE_ADDED = "IMPLEMENTED_INTERFACE_ADDED", 
    ARG_DEFAULT_VALUE_CHANGE = "ARG_DEFAULT_VALUE_CHANGE"
});
local function v48(v45, v46)
    return (l_Array_0.filter(v29(v45, v46), function(v47)
        return v43[v47.type] ~= nil;
    end));
end;
local function v52(v49, v50)
    return (l_Array_0.filter(v29(v49, v50), function(v51)
        return v44[v51.type] ~= nil;
    end));
end;
v29 = function(v53, v54)
    return l_Array_0.concat(v30(v53, v54), v31(v53, v54));
end;
v31 = function(v55, v56)
    local v57 = {};
    local v58 = v32(v55:getDirectives(), v56:getDirectives());
    for _, v60 in ipairs(v58.removed) do
        table.insert(v57, {
            type = v43.DIRECTIVE_REMOVED, 
            description = ("%s was removed."):format(v60.name)
        });
    end;
    for _, v62 in ipairs(v58.persisted) do
        local v63 = v62[1];
        local v64 = v62[2];
        local v65 = v32(v63.args, v64.args);
        for _, v67 in ipairs(v65.added) do
            if l_isRequiredArgument_0(v67) then
                table.insert(v57, {
                    type = v43.REQUIRED_DIRECTIVE_ARG_ADDED, 
                    description = ("A required arg %s on directive %s was added."):format(v67.name, v63.name)
                });
            end;
        end;
        for _, v69 in ipairs(v65.removed) do
            table.insert(v57, {
                type = v43.DIRECTIVE_ARG_REMOVED, 
                description = ("%s was removed from %s."):format(v69.name, v63.name)
            });
        end;
        if not (not v63.isRepeatable or v64.isRepeatable) then
            table.insert(v57, {
                type = v43.DIRECTIVE_REPEATABLE_REMOVED, 
                description = ("Repeatable flag was removed from %s."):format(v63.name)
            });
        end;
        for _, v71 in ipairs(v63.locations) do
            if table.find(v64.locations, v71) == nil then
                table.insert(v57, {
                    type = v43.DIRECTIVE_LOCATION_REMOVED, 
                    description = ("%s was removed from %s."):format(v71, v63.name)
                });
            end;
        end;
    end;
    return v57;
end;
v30 = function(v72, v73)
    local v74 = {};
    local v75 = v32(v72:getTypeMap():values(), v73:getTypeMap():values());
    for _, v77 in ipairs(v75.removed) do
        table.insert(v74, {
            type = v43.TYPE_REMOVED, 
            description = not not l_isSpecifiedScalarType_0(v77) and ("Standard scalar %s was removed because it is not referenced anymore."):format(v77.name) or ("%s was removed."):format(v77.name)
        });
    end;
    for _, v79 in ipairs(v75.persisted) do
        local v80 = v79[1];
        local v81 = v79[2];
        if not l_isEnumType_0(v80) or not l_isEnumType_0(v81) then
            if not l_isUnionType_0(v80) or not l_isUnionType_0(v81) then
                if not l_isInputObjectType_0(v80) or not l_isInputObjectType_0(v81) then
                    if not l_isObjectType_0(v80) or not l_isObjectType_0(v81) then
                        if not l_isInterfaceType_0(v80) or not l_isInterfaceType_0(v81) then
                            if v80.new ~= v81.new then
                                table.insert(v74, {
                                    type = v43.TYPE_CHANGED_KIND, 
                                    description = ("%s changed from %s to %s."):format(v80.name, v38(v80), v38(v81))
                                });
                            end;
                        else
                            for _, v83 in ipairs(l_Array_0.concat(v36(v80, v81), v37(v80, v81))) do
                                table.insert(v74, v83);
                            end;
                        end;
                    else
                        for _, v85 in ipairs(l_Array_0.concat(v36(v80, v81), v37(v80, v81))) do
                            table.insert(v74, v85);
                        end;
                    end;
                else
                    for _, v87 in ipairs(v35(v80, v81)) do
                        table.insert(v74, v87);
                    end;
                end;
            else
                for _, v89 in ipairs(v34(v80, v81)) do
                    table.insert(v74, v89);
                end;
            end;
        else
            for _, v91 in ipairs(v33(v80, v81)) do
                table.insert(v74, v91);
            end;
        end;
    end;
    return v74;
end;
v35 = function(v92, v93)
    local v94 = {};
    local v95 = v32(v92:getFields():values(), v93:getFields():values());
    for _, v97 in ipairs(v95.added) do
        if not l_isRequiredInputField_0(v97) then
            table.insert(v94, {
                type = v44.OPTIONAL_INPUT_FIELD_ADDED, 
                description = ("An optional field %s on input type %s was added."):format(v97.name, v92.name)
            });
        else
            table.insert(v94, {
                type = v43.REQUIRED_INPUT_FIELD_ADDED, 
                description = ("A required field %s on input type %s was added."):format(v97.name, v92.name)
            });
        end;
    end;
    for _, v99 in ipairs(v95.removed) do
        table.insert(v94, {
            type = v43.FIELD_REMOVED, 
            description = ("%s.%s was removed."):format(v92.name, v99.name)
        });
    end;
    for _, v101 in ipairs(v95.persisted) do
        local v102 = v101[1];
        local v103 = v101[2];
        if not v39(v102.type, v103.type) then
            table.insert(v94, {
                type = v43.FIELD_CHANGED_KIND, 
                description = ("%s.%s changed type from %s to %s."):format(v92.name, v102.name, tostring(v102.type), (tostring(v103.type)))
            });
        end;
    end;
    return v94;
end;
v34 = function(v104, v105)
    local v106 = {};
    local v107 = v32(v104:getTypes(), v105:getTypes());
    for _, v109 in ipairs(v107.added) do
        table.insert(v106, {
            type = v44.TYPE_ADDED_TO_UNION, 
            description = ("%s was added to union type %s."):format(v109.name, v104.name)
        });
    end;
    for _, v111 in ipairs(v107.removed) do
        table.insert(v106, {
            type = v43.TYPE_REMOVED_FROM_UNION, 
            description = ("%s was removed from union type %s."):format(v111.name, v104.name)
        });
    end;
    return v106;
end;
v33 = function(v112, v113)
    local v114 = {};
    local v115 = v32(v112:getValues(), v113:getValues());
    for _, v117 in ipairs(v115.added) do
        table.insert(v114, {
            type = v44.VALUE_ADDED_TO_ENUM, 
            description = ("%s was added to enum type %s."):format(v117.name, v112.name)
        });
    end;
    for _, v119 in ipairs(v115.removed) do
        table.insert(v114, {
            type = v43.VALUE_REMOVED_FROM_ENUM, 
            description = ("%s was removed from enum type %s."):format(v119.name, v112.name)
        });
    end;
    return v114;
end;
v37 = function(v120, v121)
    local v122 = {};
    local v123 = v32(v120:getInterfaces(), v121:getInterfaces());
    for _, v125 in ipairs(v123.added) do
        table.insert(v122, {
            type = v44.IMPLEMENTED_INTERFACE_ADDED, 
            description = ("%s added to interfaces implemented by %s."):format(v125.name, v120.name)
        });
    end;
    for _, v127 in ipairs(v123.removed) do
        table.insert(v122, {
            type = v43.IMPLEMENTED_INTERFACE_REMOVED, 
            description = ("%s no longer implements interface %s."):format(v120.name, v127.name)
        });
    end;
    return v122;
end;
v36 = function(v128, v129)
    local v130 = {};
    local v131 = v32(v128:getFields():values(), v129:getFields():values());
    for _, v133 in ipairs(v131.removed) do
        table.insert(v130, {
            type = v43.FIELD_REMOVED, 
            description = ("%s.%s was removed."):format(v128.name, v133.name)
        });
    end;
    for _, v135 in ipairs(v131.persisted) do
        local v136 = v135[1];
        local v137 = v135[2];
        for _, v139 in ipairs(v40(v128, v136, v137)) do
            table.insert(v130, v139);
        end;
        if not v41(v136.type, v137.type) then
            table.insert(v130, {
                type = v43.FIELD_CHANGED_KIND, 
                description = ("%s.%s changed type from "):format(v128.name, v136.name) .. ("%s to %s."):format(tostring(v136.type), (tostring(v137.type)))
            });
        end;
    end;
    return v130;
end;
v40 = function(v140, v141, v142)
    local v143 = {};
    local v144 = v32(v141.args, v142.args);
    for _, v146 in ipairs(v144.removed) do
        table.insert(v143, {
            type = v43.ARG_REMOVED, 
            description = ("%s.%s arg %s was removed."):format(v140.name, v141.name, v146.name)
        });
    end;
    for _, v148 in ipairs(v144.persisted) do
        local v149 = v148[1];
        local v150 = v148[2];
        if v39(v149.type, v150.type) then
            if v149.defaultValue ~= nil then
                if v150.defaultValue == nil then
                    table.insert(v143, {
                        type = v44.ARG_DEFAULT_VALUE_CHANGE, 
                        description = ("%s.%s arg %s defaultValue was removed."):format(v140.name, v141.name, v149.name)
                    });
                else
                    local v151 = v42(v149.defaultValue, v149.type);
                    local v152 = v42(v150.defaultValue, v150.type);
                    if v151 ~= v152 then
                        table.insert(v143, {
                            type = v44.ARG_DEFAULT_VALUE_CHANGE, 
                            description = ("%s.%s arg %s has changed defaultValue from %s to %s."):format(v140.name, v141.name, v149.name, v151, v152)
                        });
                    end;
                end;
            end;
        else
            table.insert(v143, {
                type = v43.ARG_CHANGED_KIND, 
                description = ("%s.%s arg %s has changed type from "):format(v140.name, v141.name, v149.name) .. ("%s to %s."):format(tostring(v149.type), (tostring(v150.type)))
            });
        end;
    end;
    for _, v154 in ipairs(v144.added) do
        if not l_isRequiredArgument_0(v154) then
            table.insert(v143, {
                type = v44.OPTIONAL_ARG_ADDED, 
                description = ("An optional arg %s on %s.%s was added."):format(v154.name, v140.name, v141.name)
            });
        else
            table.insert(v143, {
                type = v43.REQUIRED_ARG_ADDED, 
                description = ("A required arg %s on %s.%s was added."):format(v154.name, v140.name, v141.name)
            });
        end;
    end;
    return v143;
end;
v41 = function(v155, v156)
    if not l_isListType_0(v155) then
        if not l_isNonNullType_0(v155) then
            local v157;
            if l_isNamedType_0(v156) then
                v157 = true;
                if not (v155.name ~= v156.name) then
                    goto label0;
                end;
            end;
            v157 = l_isNonNullType_0(v156) and v41(v155, v156.ofType);
            ::label0::;
            return v157;
        else
            return l_isNonNullType_0(v156) and v41(v155.ofType, v156.ofType);
        end;
    else
        return not not l_isListType_0(v156) and v41(v155.ofType, v156.ofType) or l_isNonNullType_0(v156) and v41(v155, v156.ofType);
    end;
end;
v39 = function(v158, v159)
    if not l_isListType_0(v158) then
        if not l_isNonNullType_0(v158) then
            return l_isNamedType_0(v159) and v158.name == v159.name;
        else
            return not not l_isNonNullType_0(v159) and v39(v158.ofType, v159.ofType) or not l_isNonNullType_0(v159) and v39(v158.ofType, v159);
        end;
    else
        return l_isListType_0(v159) and v39(v158.ofType, v159.ofType);
    end;
end;
v38 = function(v160)
    if not l_isScalarType_0(v160) then
        if not l_isObjectType_0(v160) then
            if not l_isInterfaceType_0(v160) then
                if not l_isUnionType_0(v160) then
                    if not l_isEnumType_0(v160) then
                        if not l_isInputObjectType_0(v160) then
                            l_invariant_0(false, "Unexpected type: " .. l_inspect_0(v160));
                            return "";
                        else
                            return "an Input type";
                        end;
                    else
                        return "an Enum type";
                    end;
                else
                    return "a Union type";
                end;
            else
                return "an Interface type";
            end;
        else
            return "an Object type";
        end;
    else
        return "a Scalar type";
    end;
end;
v42 = function(v161, v162)
    local v163 = l_astFromValue_0(v161, v162);
    l_invariant_0(v163 ~= nil);
    return l_print_0((l_visit_0(v163, {
        ObjectValue = function(_, v165)
            local v166 = l_Array_0.concat({}, v165.fields);
            l_Array_0.sort(v166, function(v167, v168)
                return l_naturalCompare_0(v167.name.value, v168.name.value);
            end);
            return l_Object_0.assign({}, v165, {
                fields = v166
            });
        end
    })));
end;
v32 = function(v169, v170)
    local v171 = {};
    local v172 = {};
    local v173 = {};
    local v175 = l_keyMapOrdered_0(v169, function(v174)
        return v174.name;
    end);
    local v177 = l_keyMapOrdered_0(v170, function(v176)
        return v176.name;
    end);
    for _, v179 in ipairs(v169) do
        local v180 = v177:get(v179.name);
        if v180 == nil then
            table.insert(v172, v179);
        else
            table.insert(v173, {
                v179, 
                v180
            });
        end;
    end;
    for _, v182 in ipairs(v170) do
        if v175:get(v182.name) == nil then
            table.insert(v171, v182);
        end;
    end;
    return {
        added = v171, 
        persisted = v173, 
        removed = v172
    };
end;
return {
    BreakingChangeType = v43, 
    DangerousChangeType = v44, 
    findBreakingChanges = v48, 
    findDangerousChanges = v52
};
