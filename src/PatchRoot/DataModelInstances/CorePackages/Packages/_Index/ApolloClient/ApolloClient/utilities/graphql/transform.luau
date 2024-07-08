local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Object_0 = v2.Object;
local l_Boolean_0 = v2.Boolean;
local l_String_0 = v2.String;
local v7 = {};
local v8 = require(l_Parent_1.GraphQL);
local l_visit_0 = v8.visit;
local l_REMOVE_0 = v8.REMOVE;
local l_invariant_0 = require(l_Parent_0.jsutils.invariant).invariant;
local v12 = require(script.Parent.getFromAST);
local l_checkDocument_0 = v12.checkDocument;
local l_getOperationDefinition_0 = v12.getOperationDefinition;
local l_getFragmentDefinition_0 = v12.getFragmentDefinition;
local l_getFragmentDefinitions_0 = v12.getFragmentDefinitions;
local l_getMainDefinition_0 = v12.getMainDefinition;
local l_filterInPlace_0 = require(script.Parent.Parent.common.filterInPlace).filterInPlace;
local v19 = require(script.Parent.storeUtils);
local l_isField_0 = v19.isField;
local l_isInlineFragment_0 = v19.isInlineFragment;
local function _(v22)
    local v23 = {};
    l_Array_0.forEach(v22, function(v24)
        v23[v24.name.value] = v24;
    end);
    return v23;
end;
local v26 = nil;
local v27 = nil;
local v28 = nil;
local v29 = nil;
local v30 = {
    kind = "Field", 
    name = {
        kind = "Name", 
        value = "__typename"
    }
};
local function v31(v32, v33)
    return l_Array_0.every(v32.selectionSet.selections, function(v34)
        local v35 = false;
        if v34.kind == "FragmentSpread" then
            v35 = v31(v33[v34.name.value], v33);
        end;
        return v35;
    end, nil);
end;
local function _(v36)
    local v37 = l_getOperationDefinition_0(v36) or l_getFragmentDefinition_0(v36);
    local v38 = l_getFragmentDefinitions_0(v36);
    local v39 = {};
    l_Array_0.forEach(v38, function(v40)
        v39[v40.name.value] = v40;
    end);
    local l_v39_0 = v39;
    if not l_Array_0.every(v37.selectionSet.selections, function(v42)
        local v43 = false;
        if v42.kind == "FragmentSpread" then
            v43 = v31(l_v39_0[v42.name.value], l_v39_0);
        end;
        return v43;
    end, nil) then
        return v36;
    else
        return nil;
    end;
end;
local function _(v45)
    return function(v46)
        return l_Array_0.some(v45, function(v47)
            local v48;
            if l_Boolean_0.toJSBoolean(v47.name) then
                v48 = true;
                if not (v47.name ~= v46.name.value) then
                    goto label0;
                end;
            end;
            v48 = l_Boolean_0.toJSBoolean(v47.test) and v47:test(v46);
            ::label0::;
            return v48;
        end);
    end;
end;
local function v91(v50, v51)
    local v52 = {};
    local v53 = {};
    local v54 = {};
    local v55 = {};
    local v80 = l_visit_0(v51, {
        Variable = {
            enter = function(_, v57, _, v59)
                if v59.kind ~= "VariableDefinition" then
                    v52[v57.name.value] = true;
                end;
                return nil;
            end
        }, 
        Field = {
            enter = function(_, v61)
                if not (((not l_Boolean_0.toJSBoolean(v50) or not l_Boolean_0.toJSBoolean(v61.directives)) or not l_Array_0.some(v50, function(v62)
                    return v62.remove;
                end)) or not v61.directives) then
                    local l_some_0 = l_Array_0.some;
                    local l_directives_0 = v61.directives;
                    local l_v50_0 = v50;
                    if l_some_0(l_directives_0, function(v66)
                        return l_Array_0.some(l_v50_0, function(v67)
                            local v68;
                            if l_Boolean_0.toJSBoolean(v67.name) then
                                v68 = true;
                                if not (v67.name ~= v66.name.value) then
                                    goto label1;
                                end;
                            end;
                            v68 = l_Boolean_0.toJSBoolean(v67.test) and v67:test(v66);
                            ::label1::;
                            return v68;
                        end);
                    end) then
                        if v61.arguments then
                            l_Array_0.forEach(v61.arguments, function(v69)
                                if v69.value.kind == "Variable" then
                                    table.insert(v53, {
                                        name = v69.value.name.value
                                    });
                                end;
                            end);
                        end;
                        if v61.selectionSet then
                            l_Array_0.forEach(v29(v61.selectionSet), function(v70)
                                table.insert(v55, {
                                    name = v70.name.value
                                });
                            end);
                        end;
                        return l_REMOVE_0;
                    end;
                end;
                return nil;
            end
        }, 
        FragmentSpread = {
            enter = function(_, v72)
                v54[v72.name.value] = true;
            end
        }, 
        Directive = {
            enter = function(_, v74)
                local l_toJSBoolean_0 = l_Boolean_0.toJSBoolean;
                local l_v50_1 = v50;
                if not l_toJSBoolean_0((function(v77)
                    return l_Array_0.some(l_v50_1, function(v78)
                        local v79;
                        if l_Boolean_0.toJSBoolean(v78.name) then
                            v79 = true;
                            if not (v78.name ~= v77.name.value) then
                                goto label2;
                            end;
                        end;
                        v79 = l_Boolean_0.toJSBoolean(v78.test) and v78:test(v77);
                        ::label2::;
                        return v79;
                    end);
                end)(v74)) then
                    return nil;
                else
                    return l_REMOVE_0;
                end;
            end
        }
    });
    local v81 = l_getOperationDefinition_0(v80) or l_getFragmentDefinition_0(v80);
    local v82 = l_getFragmentDefinitions_0(v80);
    local v83 = {};
    l_Array_0.forEach(v82, function(v84)
        v83[v84.name.value] = v84;
    end);
    local l_v83_0 = v83;
    local v88 = if not l_Array_0.every(v81.selectionSet.selections, function(v86)
        local v87 = false;
        if v86.kind == "FragmentSpread" then
            v87 = v31(l_v83_0[v86.name.value], l_v83_0);
        end;
        return v87;
    end, nil) then v80 else nil;
    if not (not l_Boolean_0.toJSBoolean(v88) or not l_Boolean_0.toJSBoolean(#l_filterInPlace_0(v53, function(v89)
        return not not l_Boolean_0.toJSBoolean(v89.name) and not v52[v89.name];
    end))) then
        v88 = v27(v53, v88);
    end;
    if not (not l_Boolean_0.toJSBoolean(v88) or not l_Boolean_0.toJSBoolean(#l_filterInPlace_0(v55, function(v90)
        return not not l_Boolean_0.toJSBoolean(v90.name) and not v54[v90.name];
    end))) then
        v88 = v28(v55, v88);
    end;
    return v88;
end;
v7.removeDirectivesFromDocument = v91;
v7.addTypenameToDocument = l_Object_0.assign(setmetatable({}, {
    __call = function(_, v93)
        return l_visit_0(l_checkDocument_0(v93), {
            SelectionSet = {
                enter = function(_, v95, _, v97)
                    if l_Boolean_0.toJSBoolean(v97) and v97.kind == "OperationDefinition" then
                        return ;
                    else
                        local l_selections_0 = v95.selections;
                        if l_Boolean_0.toJSBoolean(l_selections_0) then
                            if not l_Array_0.some(l_selections_0, function(v99)
                                local v100 = l_isField_0(v99);
                                if v100 then
                                    v100 = true;
                                    if v99.name.value ~= "__typename" then
                                        v100 = l_String_0.lastIndexOf(v99.name.value, "__", 1) == 1;
                                    end;
                                end;
                                return v100;
                            end) then
                                if (not l_isField_0(v97) or not l_Boolean_0.toJSBoolean(v97.directives)) or not l_Boolean_0.toJSBoolean(l_Array_0.some(v97.directives, function(v101)
                                    return v101.name.value == "export";
                                end)) then
                                    return l_Object_0.assign({}, v95, {
                                        selections = l_Array_0.concat({}, l_selections_0, {
                                            v30
                                        })
                                    });
                                else
                                    return ;
                                end;
                            else
                                return ;
                            end;
                        else
                            return ;
                        end;
                    end;
                end
            }
        });
    end
}), {
    added = function(_, v103)
        return v103 == v30;
    end
});
local v108 = {
    test = function(_, v105)
        local v106 = v105.name.value == "connection";
        if not (not v106 or l_Boolean_0.toJSBoolean(v105.arguments) and not l_Array_0.some(v105.arguments, function(v107)
            return v107.name.value == "key";
        end)) then
            l_invariant_0.warn("Removing an @connection directive even though it does not have a key. " .. "You may want to use the key parameter to specify a store key.");
        end;
        return v106;
    end
};
v7.removeConnectionDirectiveFromDocument = function(v109)
    return (v91({
        v108
    }, l_checkDocument_0(v109)));
end;
local function _(v110, v111, v112)
    if v112 == nil then
        v112 = true;
    end;
    return not not v111 and (v111.selections and l_Array_0.some(v111.selections, function(v113)
        return v26(v110, v113, v112);
    end) or false);
end;
v26 = function(v115, v116, v117)
    if v117 == nil then
        v117 = true;
    end;
    if l_isField_0(v116) then
        if v116.directives then
            local v121 = l_Array_0.some(v116.directives, function(v118)
                return l_Array_0.some(v115, function(v119)
                    local v120;
                    if l_Boolean_0.toJSBoolean(v119.name) then
                        v120 = true;
                        if not (v119.name ~= v118.name.value) then
                            goto label4;
                        end;
                    end;
                    v120 = l_Boolean_0.toJSBoolean(v119.test) and v119:test(v118);
                    ::label4::;
                    return v120;
                end);
            end);
            if not v121 then
                if v117 then
                    local l_selectionSet_0 = v116.selectionSet;
                    local l_v117_0 = v117;
                    if l_v117_0 == nil then
                        l_v117_0 = true;
                    end;
                    do
                        local l_l_v117_0_0 = l_v117_0;
                        v121 = not not l_selectionSet_0 and (l_selectionSet_0.selections and l_Array_0.some(l_selectionSet_0.selections, function(v125)
                            return v26(v115, v125, l_l_v117_0_0);
                        end) or false);
                    end;
                    if v121 then
                        goto label3;
                    end;
                end;
                v121 = false;
            end;
            ::label3::;
            return v121;
        else
            return false;
        end;
    else
        return true;
    end;
end;
local function _(v126)
    return function(v127)
        return l_Array_0.some(v126, function(v128)
            local v129;
            if not (not (v127.value and v127.value.kind == "Variable") or not v127.value.name) then
                v129 = true;
                if v128.name ~= v127.value.name.value then
                    if v128.test then
                        v129 = v128:test(v127);
                        if v129 then
                            goto label5;
                        end;
                    end;
                else
                    goto label5;
                end;
            end;
            v129 = false;
            ::label5::;
            return v129;
        end);
    end;
end;
v27 = function(v131, v132)
    local function v136(v133)
        return l_Array_0.some(v131, function(v134)
            local v135;
            if not (not (v133.value and v133.value.kind == "Variable") or not v133.value.name) then
                v135 = true;
                if v134.name ~= v133.value.name.value then
                    if v134.test then
                        v135 = v134:test(v133);
                        if v135 then
                            goto label6;
                        end;
                    end;
                else
                    goto label6;
                end;
            end;
            v135 = false;
            ::label6::;
            return v135;
        end);
    end;
    local v148 = l_visit_0(v132, {
        OperationDefinition = {
            enter = function(_, v138)
                return l_Object_0.assign({}, v138, {
                    variableDefinitions = not not v138.variableDefinitions and l_Array_0.filter(v138.variableDefinitions, function(v139)
                        return not l_Array_0.some(v131, function(v140)
                            return v140.name == v139.variable.name.value;
                        end);
                    end) or {}
                });
            end
        }, 
        Field = {
            enter = function(_, v142)
                if l_Array_0.some(v131, function(v143)
                    return v143.remove;
                end) then
                    local v144 = 0;
                    if v142.arguments then
                        l_Array_0.forEach(v142.arguments, function(v145)
                            if v136(v145) then
                                v144 = v144 + 1;
                            end;
                        end);
                    end;
                    if v144 == 1 then
                        return l_REMOVE_0;
                    else
                        --[[ close >= 3 ]]
                    end;
                end;
                return nil;
            end
        }, 
        Argument = {
            enter = function(_, v147)
                if not l_Boolean_0.toJSBoolean(v136(v147)) then
                    return nil;
                else
                    return l_REMOVE_0;
                end;
            end
        }
    });
    local v149 = l_getOperationDefinition_0(v148) or l_getFragmentDefinition_0(v148);
    local v150 = l_getFragmentDefinitions_0(v148);
    local v151 = {};
    l_Array_0.forEach(v150, function(v152)
        v151[v152.name.value] = v152;
    end);
    local l_v151_0 = v151;
    if not l_Array_0.every(v149.selectionSet.selections, function(v154)
        local v155 = false;
        if v154.kind == "FragmentSpread" then
            v155 = v31(l_v151_0[v154.name.value], l_v151_0);
        end;
        return v155;
    end, nil) then
        return v148;
    else
        return nil;
    end;
end;
v7.removeArgumentsFromDocument = v27;
v28 = function(v156, v157)
    local function v161(_, v159)
        if not l_Array_0.some(v156, function(v160)
            return v160.name == v159.name.value;
        end) then
            return nil;
        else
            return l_REMOVE_0;
        end;
    end;
    local v162 = l_visit_0(v157, {
        FragmentSpread = {
            enter = v161
        }, 
        FragmentDefinition = {
            enter = v161
        }
    });
    local v163 = l_getOperationDefinition_0(v162) or l_getFragmentDefinition_0(v162);
    local v164 = l_getFragmentDefinitions_0(v162);
    local v165 = {};
    l_Array_0.forEach(v164, function(v166)
        v165[v166.name.value] = v166;
    end);
    local l_v165_0 = v165;
    if not l_Array_0.every(v163.selectionSet.selections, function(v168)
        local v169 = false;
        if v168.kind == "FragmentSpread" then
            v169 = v31(l_v165_0[v168.name.value], l_v165_0);
        end;
        return v169;
    end, nil) then
        return v162;
    else
        return nil;
    end;
end;
v7.removeFragmentSpreadFromDocument = v28;
v29 = function(v170)
    local v171 = {};
    l_Array_0.forEach(v170.selections, function(v172)
        if not l_isField_0(v172) and not l_isInlineFragment_0(v172) or not v172.selectionSet then
            if v172.kind == "FragmentSpread" then
                table.insert(v171, v172);
            end;
            return ;
        else
            l_Array_0.forEach(v29(v172.selectionSet), function(v173)
                table.insert(v171, v173);
            end);
            return ;
        end;
    end);
    return v171;
end;
v7.buildQueryFromSelectionSet = function(v174)
    if l_getMainDefinition_0(v174).operation == "query" then
        return v174;
    else
        return (l_visit_0(v174, {
            OperationDefinition = {
                enter = function(_, v176)
                    return l_Object_0.assign({}, v176, {
                        operation = "query"
                    });
                end
            }
        }));
    end;
end;
v7.removeClientSetsFromDocument = function(v177)
    l_checkDocument_0(v177);
    local v180 = v91({
        {
            test = function(_, v179)
                return v179.name.value == "client";
            end, 
            remove = true
        }
    }, v177);
    if l_Boolean_0.toJSBoolean(v180) then
        v180 = l_visit_0(v180, {
            FragmentDefinition = {
                enter = function(_, v182)
                    if not v182.selectionSet or not l_Boolean_0.toJSBoolean((l_Array_0.every(v182.selectionSet.selections, function(v183)
                        return l_isField_0(v183) and v183.name.value == "__typename";
                    end))) then
                        return nil;
                    else
                        return l_REMOVE_0;
                    end;
                end
            }
        });
    end;
    return v180;
end;
return v7;
