local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Parent.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Map_0 = v1.Map;
local l_Object_0 = v1.Object;
local v5 = require(l_Parent_0.luaUtils.null);
local l_jsutils_0 = l_Parent_0.jsutils;
local l_language_0 = l_Parent_0.language;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local l_inspect_0 = require(l_jsutils_0.inspect).inspect;
local l_Kind_0 = require(l_language_0.kinds).Kind;
local l_print_0 = require(l_language_0.printer).print;
local v12 = require(l_Parent_0.type.definition);
local l_getNamedType_0 = v12.getNamedType;
local l_isNonNullType_0 = v12.isNonNullType;
local l_isLeafType_0 = v12.isLeafType;
local l_isObjectType_0 = v12.isObjectType;
local l_isListType_0 = v12.isListType;
local l_isInterfaceType_0 = v12.isInterfaceType;
local l_typeFromAST_0 = require(l_Parent_0.utilities.typeFromAST).typeFromAST;
local v20 = {};
local v21 = nil;
local v22 = nil;
local v23 = nil;
local v24 = nil;
local v25 = nil;
local v26 = nil;
local v27 = nil;
local v28 = nil;
local v29 = nil;
local v30 = nil;
local v31 = nil;
local v32 = nil;
local function v33(v34)
    if not l_Array_0.isArray(v34) then
        return v34;
    else
        return table.concat(l_Array_0.map(v34, function(v35)
            return ("subfields \"%s\" conflict because "):format(v35[1]) .. v33(v35[2]);
        end), " and ");
    end;
end;
v20.OverlappingFieldsCanBeMergedRule = function(v36)
    local v37 = v32.new();
    local v38 = {};
    return {
        SelectionSet = function(_, v40)
            for _, v42 in ipairs((v21(v36, v38, v37, v36:getParentType(), v40))) do
                local v43 = v42[1];
                local v44 = v43[1];
                local v45 = v43[2];
                v36:reportError(l_GraphQLError_0.new(("Fields \"%s\" conflict because %s. Use different aliases on the fields to fetch both if this was intentional."):format(v44, if not l_Array_0.isArray(v45) then v45 else table.concat(l_Array_0.map(v45, function(v46)
                    return ("subfields \"%s\" conflict because "):format(v46[1]) .. v33(v46[2]);
                end), " and ")), l_Array_0.concat(v42[2], v42[3])));
            end;
        end
    };
end;
v21 = function(v47, v48, v49, v50, v51)
    local v52 = {};
    local v53 = v26(v47, v48, v50, v51);
    local v54 = v53[1];
    local v55 = v53[2];
    v24(v47, v52, v48, v49, v54);
    if #v55 ~= 0 then
        for v56 = 1, #v55 do
            v22(v47, v52, v48, v49, false, v54, v55[v56]);
            for v57 = v56 + 1, #v55 do
                v25(v47, v52, v48, v49, false, v55[v56], v55[v57]);
            end;
        end;
    end;
    return v52;
end;
v22 = function(v58, v59, v60, v61, v62, v63, v64)
    local v65 = v58:getFragment(v64);
    if v65 then
        local v66 = v27(v58, v60, v65);
        local v67 = v66[1];
        local v68 = v66[2];
        if v63 == v67 then
            return ;
        else
            v23(v58, v59, v60, v61, v62, v63, v67);
            for v69 = 1, #v68 do
                v22(v58, v59, v60, v61, v62, v63, v68[v69]);
            end;
            return ;
        end;
    else
        return ;
    end;
end;
v25 = function(v70, v71, v72, v73, v74, v75, v76)
    if v75 == v76 then
        return ;
    elseif not v73:has(v75, v76, v74) then
        v73:add(v75, v76, v74);
        local v77 = v70:getFragment(v75);
        local v78 = v70:getFragment(v76);
        if v77 and v78 then
            local v79 = v27(v70, v72, v77);
            local v80 = v79[1];
            local v81 = v79[2];
            local v82 = v27(v70, v72, v78);
            local v83 = v82[1];
            local v84 = v82[2];
            v23(v70, v71, v72, v73, v74, v80, v83);
            for v85 = 1, #v84 do
                v25(v70, v71, v72, v73, v74, v75, v84[v85]);
            end;
            for v86 = 1, #v81 do
                v25(v70, v71, v72, v73, v74, v81[v86], v76);
            end;
            return ;
        else
            return ;
        end;
    else
        return ;
    end;
end;
local function v106(v87, v88, v89, v90, v91, v92, v93, v94)
    local v95 = {};
    local v96 = v26(v87, v88, v91, v92);
    local v97 = v96[1];
    local v98 = v96[2];
    local v99 = v26(v87, v88, v93, v94);
    local v100 = v99[1];
    local v101 = v99[2];
    v23(v87, v95, v88, v89, v90, v97, v100);
    if #v101 ~= 0 then
        for v102 = 1, #v101 do
            v22(v87, v95, v88, v89, v90, v97, v101[v102]);
        end;
    end;
    if #v98 ~= 0 then
        for v103 = 1, #v98 do
            v22(v87, v95, v88, v89, v90, v100, v98[v103]);
        end;
    end;
    for v104 = 1, #v98 do
        for v105 = 1, #v101 do
            v25(v87, v95, v88, v89, v90, v98[v104], v101[v105]);
        end;
    end;
    return v95;
end;
v24 = function(v107, v108, v109, v110, v111)
    for _, v113 in v111, nil, nil do
        local v114 = v113[1];
        local v115 = v113[2];
        if #v115 > 1 then
            for v116 = 1, #v115 do
                for v117 = v116 + 1, #v115 do
                    local v118 = v28(v107, v109, v110, false, v114, v115[v116], v115[v117]);
                    if v118 then
                        table.insert(v108, v118);
                    end;
                end;
            end;
        end;
    end;
end;
v23 = function(v119, v120, v121, v122, v123, v124, v125)
    for _, v127 in ipairs(v124:keys()) do
        local v128 = v125[v127];
        if v128 then
            local v129 = v124[v127];
            for v130 = 1, #v129 do
                for v131 = 1, #v128 do
                    local v132 = v28(v119, v121, v122, v123, v127, v129[v130], v128[v131]);
                    if v132 then
                        table.insert(v120, v132);
                    end;
                end;
            end;
        end;
    end;
end;
v28 = function(v133, v134, v135, v136, v137, v138, v139)
    local v140 = v138[1];
    local v141 = v138[2];
    local v142 = v138[3];
    local v143 = v139[1];
    local v144 = v139[2];
    local v145 = v139[3];
    local l_v136_0 = v136;
    if not l_v136_0 then
        l_v136_0 = false;
        if v140 ~= v143 then
            l_v136_0 = l_isObjectType_0(v140) and l_isObjectType_0(v143);
        end;
    end;
    if not l_v136_0 then
        local l_value_0 = v141.name.value;
        local l_value_1 = v144.name.value;
        if l_value_0 ~= l_value_1 then
            return {
                {
                    v137, 
                    ("\"%s\" and \"%s\" are different fields"):format(l_value_0, l_value_1)
                }, 
                {
                    v141
                }, 
                {
                    v144
                }
            };
        elseif not v29(v141.arguments or {}, v144.arguments or {}) then
            return {
                {
                    v137, 
                    "they have differing arguments"
                }, 
                {
                    v141
                }, 
                {
                    v144
                }
            };
        end;
    end;
    local v149 = v142 and v142.type;
    local v150 = v145 and v145.type;
    if (not v149 or not v150) or not v30(v149, v150) then
        local l_selectionSet_0 = v141.selectionSet;
        local l_selectionSet_1 = v144.selectionSet;
        if not l_selectionSet_0 or not l_selectionSet_1 then
            return nil;
        else
            return v31(v106(v133, v134, v135, l_v136_0, l_getNamedType_0(v149), l_selectionSet_0, l_getNamedType_0(v150), l_selectionSet_1), v137, v141, v144);
        end;
    else
        return {
            {
                v137, 
                ("they return conflicting types \"%s\" and \"%s\""):format(l_inspect_0(v149), l_inspect_0(v150))
            }, 
            {
                v141
            }, 
            {
                v144
            }
        };
    end;
end;
local v153 = nil;
local v154 = nil;
v29 = function(v155, v156)
    if #v155 ~= #v156 then
        return false;
    else
        return l_Array_0.every(v155, function(v157)
            local v159 = l_Array_0.find(v156, function(v158)
                return v158.name.value == v157.name.value;
            end);
            if v159 then
                return v153(v157.value, v159.value);
            else
                return false;
            end;
        end);
    end;
end;
v153 = function(v160, v161)
    return l_print_0(v160) == l_print_0(v161);
end;
v30 = function(v162, v163)
    if not l_isListType_0(v162) then
        if not l_isListType_0(v163) then
            if not l_isNonNullType_0(v162) then
                if not l_isNonNullType_0(v163) then
                    if not l_isLeafType_0(v162) and not l_isLeafType_0(v163) then
                        return false;
                    else
                        return v162 ~= v163;
                    end;
                else
                    return true;
                end;
            elseif not l_isNonNullType_0(v163) then
                return true;
            else
                return v30(v162.ofType, v163.ofType);
            end;
        else
            return true;
        end;
    elseif not l_isListType_0(v163) then
        return true;
    else
        return v30(v162.ofType, v163.ofType);
    end;
end;
v26 = function(v164, v165, v166, v167)
    local v168 = v165[v167];
    if not v168 then
        local v169 = l_Map_0.new();
        local v170 = {};
        v154(v164, v166, v167, v169, v170);
        v168 = {
            v169, 
            l_Object_0.keys(v170)
        };
        v165[v167] = v168;
    end;
    return v168;
end;
v27 = function(v171, v172, v173)
    local v174 = v172[v173.selectionSet];
    if not v174 then
        return v26(v171, v172, l_typeFromAST_0(v171:getSchema(), v173.typeCondition), v173.selectionSet);
    else
        return v174;
    end;
end;
v154 = function(v175, v176, v177, v178, v179)
    for _, v181 in ipairs(v177.selections) do
        local l_kind_0 = v181.kind;
        if l_kind_0 == l_Kind_0.FIELD then
            local l_value_2 = v181.name.value;
            local v184 = nil;
            if not (not l_isObjectType_0(v176) and not l_isInterfaceType_0(v176)) then
                v184 = v176:getFields():get(l_value_2);
            end;
            local v185 = if not v181.alias then l_value_2 else v181.alias.value;
            if not v178[v185] then
                v178[v185] = {};
            end;
            table.insert(v178[v185], {
                v176 or v5, 
                v181 or v5, 
                v184 or v5
            });
        elseif l_kind_0 == l_Kind_0.FRAGMENT_SPREAD then
            v179[v181.name.value] = true;
        elseif l_kind_0 == l_Kind_0.INLINE_FRAGMENT then
            local l_typeCondition_0 = v181.typeCondition;
            local l_v176_0 = v176;
            if l_typeCondition_0 then
                l_v176_0 = l_typeFromAST_0(v175:getSchema(), l_typeCondition_0);
            end;
            v154(v175, l_v176_0, v181.selectionSet, v178, v179);
        end;
    end;
end;
v31 = function(v188, v189, v190, v191)
    if #v188 > 0 then
        return {
            {
                v189, 
                l_Array_0.map(v188, function(v192)
                    return v192[1];
                end)
            }, 
            l_Array_0.reduce(v188, function(v193, v194)
                return l_Array_0.concat(v193, v194[2]);
            end, {
                v190
            }), 
            l_Array_0.reduce(v188, function(v195, v196)
                return l_Array_0.concat(v195, v196[3]);
            end, {
                v191
            })
        };
    else
        return nil;
    end;
end;
v32 = {};
local v197 = {
    __index = v32
};
v32.new = function()
    local v198 = setmetatable({}, v197);
    v198._data = {};
    return v198;
end;
v32.has = function(v199, v200, v201, v202)
    local v203 = v199._data[v200];
    local v204 = v203 and v203[v201];
    if v204 == nil then
        return false;
    elseif v202 == false then
        return v204 == false;
    else
        return true;
    end;
end;
v32.add = function(v205, v206, v207, v208)
    v205:_pairSetAdd(v206, v207, v208);
    v205:_pairSetAdd(v207, v206, v208);
end;
v32._pairSetAdd = function(v209, v210, v211, v212)
    local v213 = v209._data[v210];
    if not v213 then
        v213 = {};
        v209._data[v210] = v213;
    end;
    v213[v211] = v212;
end;
return v20;
