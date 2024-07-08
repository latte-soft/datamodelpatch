local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Map_0 = v1.Map;
local l_Object_0 = v1.Object;
local l_Set_0 = v1.Set;
local v7 = {};
local l_getOperationASTFromRequest_0 = require(script.Parent.getOperationASTFromRequest).getOperationASTFromRequest;
local v9 = require(l_Parent_0.GraphQL);
local l_Kind_0 = v9.Kind;
local l_isListType_0 = v9.isListType;
local l_getNullableType_0 = v9.getNullableType;
local l_isAbstractType_0 = v9.isAbstractType;
local l_isObjectType_0 = v9.isObjectType;
local l_TypeNameMetaFieldDef_0 = v9.TypeNameMetaFieldDef;
local l_SchemaMetaFieldDef_0 = v9.SchemaMetaFieldDef;
local v17 = require(script.Parent.collectFields);
local l_collectFields_0 = v17.collectFields;
local l_collectSubFields_0 = v17.collectSubFields;
local _ = require(script.Parent.Interfaces);
local _ = require(script.Parent.types);
local l_NULL_0 = v9.NULL;
local v23 = nil;
local v24 = nil;
local v25 = nil;
local v26 = nil;
local v27 = nil;
local v28 = nil;
local v29 = nil;
local function v30(v31, v32, v33)
    if not l_Boolean_0.toJSBoolean(l_Array_0.isArray(v31)) then
        if typeof(v31) == "table" then
            local v34 = if v32 ~= nil then v32(v31) else v31;
            if v34 ~= nil then
                for v35 in v34, nil, nil do
                    v34[v35] = v30(v34[tostring(v35)], v32, v33);
                end;
            end;
            if v33 ~= nil then
                return (v33(v34));
            else
                return v34;
            end;
        else
            return v31;
        end;
    else
        return l_Array_0.map(v31, function(v36)
            return v30(v36, v32, v33);
        end);
    end;
end;
v7.visitData = v30;
v7.visitErrors = function(v37, v38)
    return l_Array_0.map(v37, function(v39)
        return v38(v39);
    end);
end;
v7.visitResult = function(v40, v41, v42, v43, v44)
    local v47 = l_Array_0.reduce(v41.document.definitions, function(v45, v46)
        if v46.kind == l_Kind_0.FRAGMENT_DEFINITION then
            v45[tostring(v46.name.value)] = v46;
        end;
        return v45;
    end, {});
    local v48 = if not l_Boolean_0.toJSBoolean(v41.variables) then {} else v41.variables;
    local v49 = {
        segmentInfoMap = l_Map_0.new(), 
        unpathedErrors = l_Set_0.new()
    };
    local l_data_0 = v40.data;
    local l_errors_0 = v40.errors;
    local v52 = false;
    if l_errors_0 ~= nil then
        v52 = v44 ~= nil;
    end;
    local v53 = l_getOperationASTFromRequest_0(v41);
    if l_data_0 ~= nil and v53 ~= nil then
        v40.data = v23(l_data_0, v53, v42, v47, v48, v43, if not l_Boolean_0.toJSBoolean(v52) then nil else l_errors_0, v49);
    end;
    local l_toJSBoolean_0 = l_Boolean_0.toJSBoolean;
    local v55 = false;
    if l_errors_0 ~= nil then
        v55 = v44;
    end;
    if l_toJSBoolean_0(v55) then
        v40.errors = v24(l_errors_0, v44, v49);
    end;
    return v40;
end;
v24 = function(v56, v57, v58)
    local l_segmentInfoMap_0 = v58.segmentInfoMap;
    local l_unpathedErrors_0 = v58.unpathedErrors;
    local l___unpathed_0 = v57.__unpathed;
    return l_Array_0.map(v56, function(v62)
        local v63 = l_segmentInfoMap_0:get(v62);
        local v68 = if v63 == nil then v62 else l_Array_0.reduce(l_Array_0.reverse(l_Array_0.concat({}, v63)), function(v64, v65)
            local v66 = v57[v65.type.name];
            if v66 == nil then
                return v64;
            else
                local v67 = v66[tostring(v65.fieldName)];
                if v67 == nil then
                    return v64;
                else
                    return (v67(v64, v65.pathIndex));
                end;
            end;
        end, v62);
        if not l_Boolean_0.toJSBoolean(if not l_Boolean_0.toJSBoolean(l___unpathed_0) then l___unpathed_0 else l_unpathedErrors_0:has(v62)) then
            return v68;
        else
            return l___unpathed_0(v68);
        end;
    end);
end;
local function _(v69, v70)
    local l_operation_0 = v70.operation;
    if l_operation_0 == "query" then
        return v69:getQueryType();
    elseif l_operation_0 == "mutation" then
        return v69:getMutationType();
    elseif l_operation_0 == "subscription" then
        return v69:getSubscriptionType();
    else
        return nil;
    end;
end;
v23 = function(v73, v74, v75, v76, v77, v78, v79, v80)
    local l_operation_1 = v74.operation;
    local v82 = if l_operation_1 == "query" then v75:getQueryType() else if l_operation_1 == "mutation" then v75:getMutationType() else if l_operation_1 == "subscription" then v75:getSubscriptionType() else nil;
    return v25(v73, v82, l_collectFields_0(v75, v76, v77, v82, v74.selectionSet, l_Map_0.new(), l_Set_0.new()), v75, v76, v77, v78, 1, v79, v80);
end;
v25 = function(v83, v84, v85, v86, v87, v88, v89, v90, v91, v92)
    local v93 = v84:getFields();
    local v94 = if typeof(v89) == "table" then v89[v84.name] else nil;
    local v95 = if typeof(v94) == "table" then v94.__enter else nil;
    local v96 = if v95 ~= nil then v95(v83) else v83;
    local v97 = nil;
    local v98 = nil;
    if v91 ~= nil then
        v97 = v26(v91, v90);
        v98 = v97.errorMap;
        for _, v100 in v97.unpathedErrors, nil, nil do
            v92.unpathedErrors:add(v100);
        end;
    end;
    for _, v102 in v85, nil, nil do
        local v103, v104 = table.unpack(v102, 1, 2);
        local l_value_0 = v104[1].name.value;
        local v106 = if typeof(v93:get(l_value_0)) == "table" then v93:get(l_value_0).type else nil;
        if v106 == nil then
            if l_value_0 == "__typename" then
                v106 = l_TypeNameMetaFieldDef_0.type;
            elseif l_value_0 == "__schema" then
                v106 = l_SchemaMetaFieldDef_0.type;
            end;
        end;
        local v107 = v90 + 1;
        local v108 = nil;
        if v98 then
            v108 = v98[tostring(v103)];
            if v108 ~= nil then
                v98[tostring(v103)] = nil;
            end;
            v28(v84, l_value_0, v107, v108, v92);
        end;
        v27(v96, v103, v29(v83[tostring(v103)], v106, v104, v86, v87, v88, v89, v107, v108, v92), v94, l_value_0);
    end;
    local l___typename_0 = v96.__typename;
    if l___typename_0 ~= nil then
        v27(v96, "__typename", l___typename_0, v94, "__typename");
    end;
    if v98 then
        for v110 in v98, nil, nil do
            for _, v112 in v98[v110], nil, nil do
                v92.unpathedErrors:add(v112);
            end;
        end;
    end;
    local v113 = if typeof(v94) == "table" then v94.__leave else nil;
    if v113 ~= nil then
        return (v113(v96));
    else
        return v96;
    end;
end;
v27 = function(v114, v115, v116, v117, v118)
    if v117 == nil then
        v114[tostring(v115)] = v116;
        return ;
    else
        local v119 = v117[v118];
        if v119 == nil then
            v114[tostring(v115)] = v116;
            return ;
        else
            local v120 = v119(v116);
            if v120 == nil then
                v114[tostring(v115)] = nil;
                return ;
            else
                v114[tostring(v115)] = v120;
                return ;
            end;
        end;
    end;
end;
local function v132(v121, v122, v123, v124, v125, v126, v127, v128, v129, v130)
    return l_Array_0.map(v121, function(v131)
        return v29(v131, v122, v123, v124, v125, v126, v127, v128 + 1, v129, v130);
    end);
end;
v29 = function(v133, v134, v135, v136, v137, v138, v139, v140, v141, v142)
    local v143 = if v141 ~= nil then v141 else {};
    if not (v133 ~= nil) or v133 == l_NULL_0 then
        return v133;
    else
        local v144 = l_getNullableType_0(v134);
        if not l_Boolean_0.toJSBoolean(l_isListType_0(v144)) then
            if not l_Boolean_0.toJSBoolean(l_isAbstractType_0(v144)) then
                if not l_Boolean_0.toJSBoolean(l_isObjectType_0(v144)) then
                    local v145 = if typeof(v139) == "table" then v139[v144.name] else nil;
                    if v145 == nil then
                        return v133;
                    else
                        local v146 = v145(v133);
                        if v146 == nil then
                            return v133;
                        else
                            return v146;
                        end;
                    end;
                else
                    return v25(v133, v144, l_collectSubFields_0(v136, v137, v138, v144, v135), v136, v137, v138, v139, v140, v143, v142);
                end;
            else
                local v147 = v136:getType(v133.__typename);
                return v25(v133, v147, l_collectSubFields_0(v136, v137, v138, v147, v135), v136, v137, v138, v139, v140, v143, v142);
            end;
        else
            return v132(v133, v144.ofType, v135, v136, v137, v138, v139, v140, v143, v142);
        end;
    end;
end;
v26 = function(v148, v149)
    local v150 = {};
    local v151 = l_Set_0.new();
    for _, v153 in v148, nil, nil do
        local v154 = if typeof(v153.path) == "table" then v153.path[v149] else nil;
        if v154 == nil then
            v151:add(v153);
        elseif l_Array_0.indexOf(l_Object_0.keys(v150), (tostring(v154))) ~= -1 then
            table.insert(v150[tostring(v154)], v153);
        else
            v150[tostring(v154)] = {
                v153
            };
        end;
    end;
    return {
        errorMap = v150, 
        unpathedErrors = v151
    };
end;
v28 = function(v155, v156, v157, v158, v159)
    local v160 = if v158 ~= nil then v158 else {};
    for _, v162 in v160, nil, nil do
        local v163 = {
            type = v155, 
            fieldName = v156, 
            pathIndex = v157
        };
        local v164 = v159.segmentInfoMap:get(v162);
        if v164 == nil then
            v159.segmentInfoMap:set(v162, {
                v163
            });
        else
            table.insert(v164, v163);
        end;
    end;
end;
return v7;
