local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Error_0 = v1.Error;
local l_Map_0 = v1.Map;
local l_Object_0 = v1.Object;
local l_String_0 = v1.String;
local v7 = {};
local _ = require(l_Parent_0.Shared);
local _ = require(l_Parent_0.ReactReconciler);
local _ = require(l_Parent_0.Shared);
local v11 = require(l_Parent_0.ReactReconciler)({});
local l_NoMode_0 = v11.ReactTypeOfMode.NoMode;
local v16 = {
    parse = function(v13)
        if v13.stack == nil then
            return {};
        else
            return l_Array_0.map(l_Array_0.filter(string.split(v13.stack, "\n"), function(v14)
                return string.find(v14, "^LoadedCode") ~= nil;
            end), function(v15)
                return {
                    source = v15, 
                    functionName = string.match(v15, "function (%w+)$")
                };
            end);
        end;
    end
};
local v17 = require(l_Parent_0.Shared);
local l_ReactSharedInternals_0 = v17.ReactSharedInternals;
local l_REACT_OPAQUE_ID_TYPE_0 = v17.ReactSymbols.REACT_OPAQUE_ID_TYPE;
local l_ReactWorkTags_0 = v11.ReactWorkTags;
local l_FunctionComponent_0 = l_ReactWorkTags_0.FunctionComponent;
local l_SimpleMemoComponent_0 = l_ReactWorkTags_0.SimpleMemoComponent;
local l_ContextProvider_0 = l_ReactWorkTags_0.ContextProvider;
local l_ForwardRef_0 = l_ReactWorkTags_0.ForwardRef;
local l_Block_0 = l_ReactWorkTags_0.Block;
local v26 = {};
local v27 = nil;
local v28 = nil;
local v29 = nil;
local function v38()
    if v27 == nil then
        local v30 = l_Map_0.new();
        local v31 = nil;
        local l_status_0, l_result_0 = pcall(function()
            v29.useContext({
                _currentValue = nil
            });
            v29.useState(nil);
            v29.useReducer(function(v32, _)
                return v32;
            end, nil);
            v29.useRef(nil);
            v29.useLayoutEffect(function()
            end);
            v29.useEffect(function()
            end);
            v29.useImperativeHandle(nil, function()
                return nil;
            end);
            v29.useDebugValue(nil);
            v29.useCallback(function()
            end);
            v29.useMemo(function()
                return nil;
            end);
        end);
        v31 = v26;
        v26 = {};
        if not l_status_0 then
            error(l_result_0);
        end;
        for v36 = 1, #v31 do
            local v37 = v31[v36];
            v30:set(v37.primitive, v16.parse(v37.stackError));
        end;
        v27 = v30;
    end;
    return v27;
end;
local v39 = nil;
local function _()
    local l_v39_0 = v39;
    if l_v39_0 ~= nil then
        v39 = l_v39_0.next;
    end;
    return l_v39_0;
end;
v29 = {
    readContext = function(v42, _)
        return v42._currentValue;
    end, 
    useCallback = function(v44, _)
        local l_v39_1 = v39;
        if l_v39_1 ~= nil then
            v39 = l_v39_1.next;
        end;
        local l_l_v39_1_0 = l_v39_1;
        table.insert(v26, {
            primitive = "Callback", 
            stackError = l_Error_0.new(), 
            value = if l_l_v39_1_0 ~= nil then l_l_v39_1_0.memoizedState[1] else v44
        });
        return v44;
    end, 
    useContext = function(v48, _)
        table.insert(v26, {
            primitive = "Context", 
            stackError = l_Error_0.new(), 
            value = v48._currentValue
        });
        return v48._currentValue;
    end, 
    useEffect = function(v50, _)
        local l_v39_2 = v39;
        if l_v39_2 ~= nil then
            v39 = l_v39_2.next;
        end;
        table.insert(v26, {
            primitive = "Effect", 
            stackError = l_Error_0.new(), 
            value = v50
        });
    end, 
    useImperativeHandle = function(v53, _, _)
        local l_v39_3 = v39;
        if l_v39_3 ~= nil then
            v39 = l_v39_3.next;
        end;
        l_v39_3 = nil;
        if v53 ~= nil and typeof(v53) == "table" then
            l_v39_3 = v53.current;
        end;
        table.insert(v26, {
            primitive = "ImperativeHandle", 
            stackError = l_Error_0.new(), 
            value = l_v39_3
        });
    end, 
    useDebugValue = function(v57, v58)
        table.insert(v26, {
            primitive = "DebugValue", 
            stackError = l_Error_0.new(), 
            value = if typeof(v58) == "function" then v58(v57) else v57
        });
    end, 
    useLayoutEffect = function(v59, _)
        local l_v39_4 = v39;
        if l_v39_4 ~= nil then
            v39 = l_v39_4.next;
        end;
        table.insert(v26, {
            primitive = "LayoutEffect", 
            stackError = l_Error_0.new(), 
            value = v59
        });
    end, 
    useMemo = function(v62, _)
        local l_v39_5 = v39;
        if l_v39_5 ~= nil then
            v39 = l_v39_5.next;
        end;
        local l_l_v39_5_0 = l_v39_5;
        l_v39_5 = if l_l_v39_5_0 ~= nil then l_l_v39_5_0.memoizedState[1] else {
            v62()
        };
        table.insert(v26, {
            primitive = "Memo", 
            stackError = l_Error_0.new(), 
            value = l_v39_5
        });
        return table.unpack(l_v39_5);
    end, 
    useReducer = function(_, v67, v68)
        local l_v39_6 = v39;
        if l_v39_6 ~= nil then
            v39 = l_v39_6.next;
        end;
        local l_l_v39_6_0 = l_v39_6;
        l_v39_6 = nil;
        l_v39_6 = if l_l_v39_6_0 ~= nil then l_l_v39_6_0.memoizedState else if v68 ~= nil then v68(v67) else v67;
        table.insert(v26, {
            primitive = "Reducer", 
            stackError = l_Error_0.new(), 
            value = l_v39_6
        });
        return l_v39_6, function(_)
        end;
    end, 
    useRef = function(v72)
        local l_v39_7 = v39;
        if l_v39_7 ~= nil then
            v39 = l_v39_7.next;
        end;
        local l_l_v39_7_0 = l_v39_7;
        l_v39_7 = if l_l_v39_7_0 ~= nil then l_l_v39_7_0.memoizedState else {
            current = v72
        };
        table.insert(v26, {
            primitive = "Ref", 
            stackError = l_Error_0.new(), 
            value = l_v39_7.current
        });
        return l_v39_7;
    end, 
    useBinding = function(v75)
        local l_v39_8 = v39;
        if l_v39_8 ~= nil then
            v39 = l_v39_8.next;
        end;
        local l_l_v39_8_0 = l_v39_8;
        l_v39_8 = if l_l_v39_8_0 ~= nil then l_l_v39_8_0.memoizedState else {
            getValue = function(_)
                return v75;
            end
        };
        table.insert(v26, {
            primitive = "Binding", 
            stackError = l_Error_0.new(), 
            value = l_v39_8:getValue()
        });
        return l_v39_8, function(_)
        end;
    end, 
    useState = function(v80)
        local l_v39_9 = v39;
        if l_v39_9 ~= nil then
            v39 = l_v39_9.next;
        end;
        local l_l_v39_9_0 = l_v39_9;
        l_v39_9 = if l_l_v39_9_0 ~= nil then l_l_v39_9_0.memoizedState else if typeof(v80) == "function" then v80() else v80;
        table.insert(v26, {
            primitive = "State", 
            stackError = l_Error_0.new(), 
            value = l_v39_9
        });
        return l_v39_9, function(_)
        end;
    end, 
    useMutableSource = function(v84, v85, _)
        local l_v39_10 = v39;
        if l_v39_10 ~= nil then
            v39 = l_v39_10.next;
        end;
        l_v39_10 = v39;
        if l_v39_10 ~= nil then
            v39 = l_v39_10.next;
        end;
        l_v39_10 = v39;
        if l_v39_10 ~= nil then
            v39 = l_v39_10.next;
        end;
        l_v39_10 = v39;
        if l_v39_10 ~= nil then
            v39 = l_v39_10.next;
        end;
        l_v39_10 = v85(v84._source);
        table.insert(v26, {
            primitive = "MutableSource", 
            stackError = l_Error_0.new(), 
            value = l_v39_10
        });
        return l_v39_10;
    end, 
    useOpaqueIdentifier = function()
        local l_v39_11 = v39;
        if l_v39_11 ~= nil then
            v39 = l_v39_11.next;
        end;
        local l_l_v39_11_0 = l_v39_11;
        if v28 and v28.mode == l_NoMode_0 then
            l_v39_11 = v39;
            if l_v39_11 ~= nil then
                v39 = l_v39_11.next;
            end;
        end;
        l_v39_11 = if l_l_v39_11_0 == nil then nil else l_l_v39_11_0.memoizedState and (l_v39_11["$$typeof"] == l_REACT_OPAQUE_ID_TYPE_0 and nil);
        table.insert(v26, {
            primitive = "OpaqueIdentifier", 
            stackError = l_Error_0.new(), 
            value = l_v39_11
        });
        return l_v39_11;
    end
};
local v90 = 1;
local function v99(v91, v92, v93)
    local l_source_0 = v92[v93].source;
    for v95 = 1, #v91 do
        if v91[v95].source == l_source_0 then
            local v96 = v93 + 1;
            local v97 = v95 + 1;
            local v98 = false;
            while v96 <= #v92 and v97 <= #v91 do
                if v91[v97].source ~= v92[v96].source then
                    v98 = true;
                    break;
                else
                    v96 = v96 + 1;
                    v97 = v97 + 1;
                end;
            end;
            if not v98 then
                return v95;
            end;
        end;
    end;
    return -1;
end;
local function v104(v100, v101)
    local v102 = v99(v101, v100, v90);
    if v102 ~= -1 then
        return v102;
    else
        for v103 = 1, math.min(#v100, 5) do
            v102 = v99(v101, v100, v103);
            if v102 ~= -1 then
                v90 = v103;
                return v102;
            end;
        end;
        return -1;
    end;
end;
local function _(v105, v106)
    if not v105 or v105 == "" then
        return false;
    else
        local v107 = "use" .. tostring(v106);
        if string.len(v105) < string.len(v107) then
            return false;
        else
            return l_String_0.lastIndexOf(v105, v107) == (string.len(v105) - string.len(v107)) + 1;
        end;
    end;
end;
local function v122(v109, v110)
    local v111 = v38():get(v110.primitive);
    if v111 == nil then
        return -1;
    else
        for v112 = 1, math.min(#v111, #v109) do
            local l_v112_0 = v112;
            if v111[l_v112_0].source ~= v109[l_v112_0].source then
                if l_v112_0 < #v109 then
                    local l_functionName_0 = v109[l_v112_0].functionName;
                    local l_primitive_0 = v110.primitive;
                    local v116;
                    if not l_functionName_0 or l_functionName_0 == "" then
                        v116 = false;
                    else
                        local v117 = "use" .. tostring(l_primitive_0);
                        v116 = string.len(l_functionName_0) >= string.len(v117) and l_String_0.lastIndexOf(l_functionName_0, v117) == (string.len(l_functionName_0) - string.len(v117)) + 1;
                    end;
                    if v116 then
                        l_v112_0 = l_v112_0 + 1;
                    end;
                end;
                if l_v112_0 < #v109 then
                    local l_functionName_1 = v109[l_v112_0].functionName;
                    local l_primitive_1 = v110.primitive;
                    local v120;
                    if not l_functionName_1 or l_functionName_1 == "" then
                        v120 = false;
                    else
                        local v121 = "use" .. tostring(l_primitive_1);
                        v120 = string.len(l_functionName_1) >= string.len(v121) and l_String_0.lastIndexOf(l_functionName_1, v121) == (string.len(l_functionName_1) - string.len(v121)) + 1;
                    end;
                    if v120 then
                        l_v112_0 = l_v112_0 + 1;
                    end;
                end;
                return l_v112_0;
            end;
        end;
        return -1;
    end;
end;
local function v128(v123, v124)
    local v125 = v16.parse(v124.stackError);
    local v126 = v104(v123, v125);
    local v127 = v122(v125, v124);
    if not (v126 ~= -1 and v127 ~= -1) or v126 - v127 < 2 then
        return nil;
    else
        return l_Array_0.slice(v125, v127, v126 - 1);
    end;
end;
local function _(v129)
    if v129 then
        local v130 = l_String_0.lastIndexOf(v129, ".");
        if v130 == -1 then
            v130 = 1;
        end;
        if l_String_0.substr(v129, v130, 3) == "use" then
            v130 = v130 + 3;
        end;
        return l_String_0.substr(v129, v130);
    else
        return "";
    end;
end;
local v132 = nil;
local function v157(v133, v134)
    local v135 = {};
    local v136 = nil;
    local l_v135_0 = v135;
    local v138 = 1;
    local v139 = {};
    for v140 = 1, #v134 do
        local v141 = v134[v140];
        local v142 = v128(v133, v141);
        if v142 ~= nil then
            local v143 = 0;
            if v136 ~= nil then
                while (v143 < #v142 and v143 < #v136) and v142[#v142 - v143].source == v136[#v136 - v143].source do
                    v143 = v143 + 1;
                end;
                for _ = #v136 - 1, v143 + 1, -1 do
                    l_v135_0 = table.remove(v139);
                end;
            end;
            for v145 = #v142 - v143, 2, -1 do
                local v146 = {};
                local v147 = {
                    id = nil, 
                    isStateEditable = false
                };
                local l_functionName_2 = v142[v145 - 1].functionName;
                local v149;
                if l_functionName_2 then
                    local v150 = l_String_0.lastIndexOf(l_functionName_2, ".");
                    if v150 == -1 then
                        v150 = 1;
                    end;
                    if l_String_0.substr(l_functionName_2, v150, 3) == "use" then
                        v150 = v150 + 3;
                    end;
                    v149 = l_String_0.substr(l_functionName_2, v150);
                else
                    v149 = "";
                end;
                v147.name = v149;
                v147.value = nil;
                v147.subHooks = v146;
                table.insert(l_v135_0, v147);
                table.insert(v139, l_v135_0);
                l_v135_0 = v146;
            end;
            v136 = v142;
        end;
        local function _()
            local l_v138_0 = v138;
            v138 = v138 + 1;
            return l_v138_0;
        end;
        local l_primitive_2 = v141.primitive;
        local v154;
        if not (l_primitive_2 ~= "Context") or l_primitive_2 == "DebugValue" then
            v154 = nil;
        else
            local l_v138_1 = v138;
            v138 = v138 + 1;
            v154 = l_v138_1;
        end;
        local v156 = true;
        if l_primitive_2 ~= "Reducer" then
            v156 = l_primitive_2 == "State";
        end;
        table.insert(l_v135_0, {
            id = v154, 
            isStateEditable = v156, 
            name = l_primitive_2, 
            value = v141.value, 
            subHooks = {}
        });
    end;
    v132(v135, nil);
    return v135;
end;
v132 = function(v158, v159)
    local v160 = {};
    local v161 = 1;
    while v161 <= #v158 do
        local v162 = v158[v161];
        if v162.name == "DebugValue" and #v162.subHooks == 0 then
            l_Array_0.splice(v158, v161, 1);
            v161 = v161 - 1;
            table.insert(v160, v162);
        else
            v132(v162.subHooks, v162);
        end;
        v161 = v161 + 1;
    end;
    if v159 ~= nil then
        if #v160 == 1 then
            v159.value = v160[1].value;
            return ;
        elseif #v160 > 1 then
            v159.value = l_Array_0.map(v160, function(v163)
                return v163.value;
            end);
        end;
    end;
end;
local function v172(v164, v165, v166)
    if v166 == nil then
        v166 = l_ReactSharedInternals_0.ReactCurrentDispatcher;
    end;
    local l_current_0 = v166.current;
    local v168 = nil;
    v166.current = v29;
    local v169 = nil;
    local l_status_1, l_result_1 = pcall(function()
        v169 = l_Error_0.new();
        v164(v165);
    end);
    v168 = v26;
    v26 = {};
    v166.current = l_current_0;
    if not l_status_1 then
        error(l_result_1);
    end;
    return (v157(v16.parse(v169), v168));
end;
v7.inspectHooks = v172;
local function v177(v173, v174)
    local l_v174_0 = v174;
    while l_v174_0 do
        if l_v174_0.tag == l_ContextProvider_0 then
            local l__context_0 = l_v174_0.type._context;
            if not v173:has(l__context_0) then
                v173:set(l__context_0, l__context_0._currentValue);
                l__context_0._currentValue = l_v174_0.memoizedProps.value;
            end;
        end;
        l_v174_0 = l_v174_0.return_;
    end;
end;
local _ = function(v178)
    for _, v180 in v178, nil, nil do
        v180[1]._currentValue = v180[2];
    end;
end;
local function v191(v182, v183, v184, v185)
    local l_current_1 = v185.current;
    local v187 = nil;
    v185.current = v29;
    local v188 = nil;
    local l_status_2, l_result_2 = pcall(function()
        v188 = l_Error_0.new();
        v182(v183, v184);
    end);
    v187 = v26;
    v26 = {};
    v185.current = l_current_1;
    if not l_status_2 then
        error(l_result_2);
    end;
    return (v157(v16.parse(v188), v187));
end;
local function v197(v192, v193)
    if not (typeof(v192) == "table") or not v192.defaultProps then
        return v193;
    else
        local v194 = l_Object_0.assign({}, v193);
        local l_defaultProps_0 = v192.defaultProps;
        for v196 in l_defaultProps_0, nil, nil do
            if v194[v196] == nil then
                v194[v196] = l_defaultProps_0[v196];
            end;
        end;
        return v194;
    end;
end;
v7.inspectHooksOfFiber = function(v198, v199)
    if v199 == nil then
        v199 = l_ReactSharedInternals_0.ReactCurrentDispatcher;
    end;
    v28 = v198;
    if ((v198.tag ~= l_FunctionComponent_0 and v198.tag ~= l_SimpleMemoComponent_0) and v198.tag ~= l_ForwardRef_0) and v198.tag ~= l_Block_0 then
        error(l_Error_0.new("Unknown Fiber. Needs to be a function component to inspect hooks."));
    end;
    v38();
    local l_type_0 = v198.type;
    local l_memoizedProps_0 = v198.memoizedProps;
    if l_type_0 ~= v198.elementType then
        l_memoizedProps_0 = v197(l_type_0, l_memoizedProps_0);
    end;
    v39 = v198.memoizedState;
    local v202 = l_Map_0.new();
    local l_status_3, l_result_3 = pcall(function()
        v177(v202, v198);
        if v198.tag == l_ForwardRef_0 then
            return (v191(l_type_0.render, l_memoizedProps_0, v198.ref, v199));
        else
            return (v172(l_type_0, l_memoizedProps_0, v199));
        end;
    end);
    v39 = nil;
    for _, v206 in v202, nil, nil do
        v206[1]._currentValue = v206[2];
    end;
    if not l_status_3 then
        error(l_result_3);
    end;
    return l_result_3;
end;
return v7;
