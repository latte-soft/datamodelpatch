local v0 = require(script.Parent.Parent.LuauPolyfill);
local l_Array_0 = v0.Array;
local l_Object_0 = v0.Object;
local l_Set_0 = v0.Set;
local l_String_0 = v0.String;
local l_querySelectorAll_0 = require(script.Parent.jsHelpers.querySelectors).querySelectorAll;
local v6 = {};
local v7 = {
    "PlaceholderText"
};
local _ = require(script.Parent.types);
local l_getSuggestedQuery_0 = require(script.Parent.suggestions).getSuggestedQuery;
local v10 = require(script.Parent.matches);
local l_fuzzyMatches_0 = v10.fuzzyMatches;
local l_matches_0 = v10.matches;
local l_makeNormalizer_0 = v10.makeNormalizer;
local l_waitFor_0 = require(script.Parent["wait-for"]).waitFor;
local l_getConfig_0 = require(script.Parent.config).getConfig;
local l_getNodeTestId_0 = require(script.Parent["get-node-test-id"]).getNodeTestId;
local function v19(v17, v18)
    return l_getConfig_0().getElementError(v17, v18);
end;
local function v22(v20, v21)
    return v19(("%s\n\n(If this is intentional, then use the `*AllBy*` variant of the query (like `queryAllByText`, `getAllByText`, or `findAllByText`))."):format(v20), v21);
end;
local function v45(v23, v24, v25, v26)
    local v27 = if v26 == nil then {} else v26;
    local v28 = v27.exact == nil and true or v27.exact;
    local l_collapseWhitespace_0 = v27.collapseWhitespace;
    local l_trim_0 = v27.trim;
    local l_normalizer_0 = v27.normalizer;
    local v32 = if v28 ~= nil then l_matches_0 else l_fuzzyMatches_0;
    local v33 = l_makeNormalizer_0({
        collapseWhitespace = l_collapseWhitespace_0, 
        trim = l_trim_0, 
        normalizer = l_normalizer_0
    });
    local function _(v34, v35)
        local l_status_0, l_result_0 = pcall(function()
            return v34[v35];
        end);
        if l_status_0 then
            return l_result_0;
        else
            return nil;
        end;
    end;
    return l_Array_0.filter(l_querySelectorAll_0(v24, {
        v23
    }, if not l_Array_0.includes(v7, v23) then l_getConfig_0().testIdAttribute == v23 and "tag" or "attribute" else "property"), function(v39)
        local l_v32_0 = v32;
        local v41;
        if not l_Array_0.includes(v7, v23) then
            v41 = if l_getConfig_0().testIdAttribute == v23 then l_getNodeTestId_0(v39) else v39:GetAttribute(v23);
        else
            local l_v23_0 = v23;
            local l_status_1, l_result_1 = pcall(function()
                return v39[l_v23_0];
            end);
            v41 = if l_status_1 then l_result_1 else nil;
        end;
        return l_v32_0(v41, v39, v25, v33);
    end);
end;
local function v51(v46, v47, v48, v49)
    local v50 = v45(v46, v47, v48, v49);
    if #v50 > 1 then
        error(v22(("Found multiple elements by [%s=%s]"):format(v46, (tostring(v48))), v47));
    end;
    if not v50[1] then
        return nil;
    else
        return v50[1];
    end;
end;
local function v57(v52, v53)
    return function(v54, ...)
        local v55 = v52(v54, ...);
        if #v55 > 1 then
            error(v22(("%s\n\nHere are the matching elements:\n\n%s"):format(tostring(v53(v54, ...)), (l_Array_0.join(l_Array_0.map(v55, function(v56)
                return l_getConfig_0().getElementError(nil, v56).message;
            end), "\n\n"))), v54));
        end;
        if not v55[1] then
            return nil;
        else
            return v55[1];
        end;
    end;
end;
local function v60(v58, v59)
    return l_getConfig_0().getElementError(("A better query is available, try this:\n%s\n"):format(v58:toString()), v59);
end;
local function v65(v61, v62)
    return function(v63, ...)
        local v64 = v61(v63, ...);
        if #v64 == 0 then
            error(l_getConfig_0().getElementError(v62(v63, ...), v63));
        end;
        return v64;
    end;
end;
local function v71(v66)
    return function(v67, v68, v69, v70)
        return l_waitFor_0(function()
            return v66(v67, v68, v69);
        end, l_Object_0.assign({}, {
            container = v67
        }, v70));
    end;
end;
local function v81(v72, v73, v74)
    return function(v75, ...)
        local v76 = {
            ...
        };
        local v77 = v72(v75, ...);
        local v78 = if v76[#v76] == nil then {} else v76[#v76];
        local v79 = if not (typeof(v78) == "table") or v78.suggest == nil then l_getConfig_0().throwSuggestions else v78.suggest;
        if not (not v77 or not v79) then
            local v80 = l_getSuggestedQuery_0(v77, v74);
            if not (not (v80 ~= nil) or l_String_0.endsWith(v73, v80.queryName)) then
                error(v60(v80, v75));
            end;
        end;
        return v77;
    end;
end;
local function v93(v82, v83, v84)
    return function(v85, ...)
        local v86 = {
            ...
        };
        local v87 = v82(v85, ...);
        local v88 = if v86[#v86] == nil then {} else v86[#v86];
        local v89 = if v88.suggest == nil then l_getConfig_0().throwSuggestions else v88.suggest;
        if not (not (#v87 ~= 0) or not v89) then
            local v92 = l_Array_0.concat({}, l_Array_0.from(l_Set_0.new(l_Array_0.map(v87, function(v90)
                local v91 = l_getSuggestedQuery_0(v90, v84);
                if v91 ~= nil then
                    return (v91.toString());
                else
                    return v91;
                end;
            end))));
            if not (not (#v92 == 1) or l_String_0.endsWith(v83, l_getSuggestedQuery_0(v87[1], v84).queryName)) then
                error(v60(v92[1], v85));
            end;
        end;
        return v87;
    end;
end;
local function v166(v94, v95, v96)
    local function v100(v97, ...)
        local v98 = v94(v97, ...);
        if #v98 > 1 then
            error(v22(("%s\n\nHere are the matching elements:\n\n%s"):format(tostring(v95(v97, ...)), (l_Array_0.join(l_Array_0.map(v98, function(v99)
                return l_getConfig_0().getElementError(nil, v99).message;
            end), "\n\n"))), v97));
        end;
        if not v98[1] then
            return nil;
        else
            return v98[1];
        end;
    end;
    local v101 = debug.info(v94, "n");
    local v102 = "query";
    local l_v100_0 = v100 --[[ copy: 4 -> 13 ]];
    local l_v102_0 = v102 --[[ copy: 6 -> 14 ]];
    local l_v101_0 = v101 --[[ copy: 5 -> 15 ]];
    local function v112(v106, ...)
        local v107 = {
            ...
        };
        local v108 = l_v100_0(v106, ...);
        local v109 = if v107[#v107] == nil then {} else v107[#v107];
        local v110 = if not (typeof(v109) == "table") or v109.suggest == nil then l_getConfig_0().throwSuggestions else v109.suggest;
        if not (not v108 or not v110) then
            local v111 = l_getSuggestedQuery_0(v108, l_v102_0);
            if not (not (v111 ~= nil) or l_String_0.endsWith(l_v101_0, v111.queryName)) then
                error(v60(v111, v106));
            end;
        end;
        return v108;
    end;
    v100 = function(v113, ...)
        local v114 = v94(v113, ...);
        if #v114 == 0 then
            error(l_getConfig_0().getElementError(v96(v113, ...), v113));
        end;
        return v114;
    end;
    v101 = function(v115, ...)
        local v116 = v100(v115, ...);
        if #v116 > 1 then
            error(v22(("%s\n\nHere are the matching elements:\n\n%s"):format(tostring(v95(v115, ...)), (l_Array_0.join(l_Array_0.map(v116, function(v117)
                return l_getConfig_0().getElementError(nil, v117).message;
            end), "\n\n"))), v115));
        end;
        if not v116[1] then
            return nil;
        else
            return v116[1];
        end;
    end;
    local v118 = debug.info(v94, "n");
    local v119 = "get";
    local l_v119_0 = v119 --[[ copy: 8 -> 16 ]];
    local l_v118_0 = v118 --[[ copy: 7 -> 17 ]];
    v102 = function(v122, ...)
        local v123 = {
            ...
        };
        local v124 = v101(v122, ...);
        local v125 = if v123[#v123] == nil then {} else v123[#v123];
        local v126 = if not (typeof(v125) == "table") or v125.suggest == nil then l_getConfig_0().throwSuggestions else v125.suggest;
        if not (not v124 or not v126) then
            local v127 = l_getSuggestedQuery_0(v124, l_v119_0);
            if not (not (v127 ~= nil) or l_String_0.endsWith(l_v118_0, v127.queryName)) then
                error(v60(v127, v122));
            end;
        end;
        return v124;
    end;
    v119 = debug.info(v94, "n"):gsub("query", "get");
    local v128 = "getAll";
    local l_v128_0 = v128 --[[ copy: 9 -> 18 ]];
    local l_v119_1 = v119 --[[ copy: 8 -> 19 ]];
    v118 = function(v131, ...)
        local v132 = {
            ...
        };
        local v133 = v100(v131, ...);
        local v134 = if v132[#v132] == nil then {} else v132[#v132];
        local v135 = if v134.suggest == nil then l_getConfig_0().throwSuggestions else v134.suggest;
        if not (not (#v133 ~= 0) or not v135) then
            local v138 = l_Array_0.concat({}, l_Array_0.from(l_Set_0.new(l_Array_0.map(v133, function(v136)
                local v137 = l_getSuggestedQuery_0(v136, l_v128_0);
                if v137 ~= nil then
                    return (v137.toString());
                else
                    return v137;
                end;
            end))));
            if not (not (#v138 == 1) or l_String_0.endsWith(l_v119_1, l_getSuggestedQuery_0(v133[1], l_v128_0).queryName)) then
                error(v60(v138[1], v131));
            end;
        end;
        return v133;
    end;
    local v139 = debug.info(v94, "n");
    local v140 = "findAll";
    local l_v140_0 = v140 --[[ copy: 11 -> 20 ]];
    local l_v139_0 = v139 --[[ copy: 10 -> 21 ]];
    v128 = function(v143, ...)
        local v144 = {
            ...
        };
        local v145 = v100(v143, ...);
        local v146 = if v144[#v144] == nil then {} else v144[#v144];
        local v147 = if v146.suggest == nil then l_getConfig_0().throwSuggestions else v146.suggest;
        if not (not (#v145 ~= 0) or not v147) then
            local v150 = l_Array_0.concat({}, l_Array_0.from(l_Set_0.new(l_Array_0.map(v145, function(v148)
                local v149 = l_getSuggestedQuery_0(v148, l_v140_0);
                if v149 ~= nil then
                    return (v149.toString());
                else
                    return v149;
                end;
            end))));
            if not (not (#v150 == 1) or l_String_0.endsWith(l_v139_0, l_getSuggestedQuery_0(v145[1], l_v140_0).queryName)) then
                error(v60(v150[1], v143));
            end;
        end;
        return v145;
    end;
    v119 = function(v151, v152, v153, v154)
        return l_waitFor_0(function()
            return v128(v151, v152, v153);
        end, l_Object_0.assign({}, {
            container = v151
        }, v154));
    end;
    v140 = debug.info(v94, "n");
    local v155 = "find";
    v139 = function(v156, ...)
        local v157 = {
            ...
        };
        local v158 = v101(v156, ...);
        local v159 = if v157[#v157] == nil then {} else v157[#v157];
        local v160 = if not (typeof(v159) == "table") or v159.suggest == nil then l_getConfig_0().throwSuggestions else v159.suggest;
        if not (not v158 or not v160) then
            local v161 = l_getSuggestedQuery_0(v158, v155);
            if not (not (v161 ~= nil) or l_String_0.endsWith(v140, v161.queryName)) then
                error(v60(v161, v156));
            end;
        end;
        return v158;
    end;
    return v112, v118, v102, v119, function(v162, v163, v164, v165)
        return l_waitFor_0(function()
            return v139(v162, v163, v164);
        end, l_Object_0.assign({}, {
            container = v162
        }, v165));
    end;
end;
v6.getElementError = v19;
v6.wrapAllByQueryWithSuggestion = v93;
v6.wrapSingleQueryWithSuggestion = v81;
v6.getMultipleElementsFoundError = v22;
v6.queryAllByAttribute = v45;
v6.queryByAttribute = v51;
v6.makeSingleQuery = v57;
v6.makeGetAllQuery = v65;
v6.makeFindQuery = v71;
v6.buildQueries = v166;
return v6;
