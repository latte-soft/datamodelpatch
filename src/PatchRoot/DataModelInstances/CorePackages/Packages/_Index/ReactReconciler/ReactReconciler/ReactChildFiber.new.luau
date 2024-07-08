local l___DEV___0 = _G.__DEV__;
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Error_0 = v2.Error;
local l_console_0 = require(l_Parent_0.Shared).console;
local l_describeError_0 = require(l_Parent_0.Shared).describeError;
local _ = require(l_Parent_0.Shared);
local _ = require(l_Parent_0.React);
local _ = require(script.Parent.ReactInternalTypes);
local _ = require(script.Parent.ReactFiberLane);
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local v12 = require(script.Parent.ReactFiberFlags);
local l_Placement_0 = v12.Placement;
local l_Deletion_0 = v12.Deletion;
local l_ReactSymbols_0 = require(l_Parent_0.Shared).ReactSymbols;
local l_getIteratorFn_0 = l_ReactSymbols_0.getIteratorFn;
local l_REACT_ELEMENT_TYPE_0 = l_ReactSymbols_0.REACT_ELEMENT_TYPE;
local l_REACT_FRAGMENT_TYPE_0 = l_ReactSymbols_0.REACT_FRAGMENT_TYPE;
local l_REACT_PORTAL_TYPE_0 = l_ReactSymbols_0.REACT_PORTAL_TYPE;
local l_REACT_LAZY_TYPE_0 = l_ReactSymbols_0.REACT_LAZY_TYPE;
local l_REACT_BLOCK_TYPE_0 = l_ReactSymbols_0.REACT_BLOCK_TYPE;
local v22 = require(script.Parent.ReactWorkTags);
local _ = v22.FunctionComponent;
local _ = v22.ClassComponent;
local l_HostText_0 = v22.HostText;
local l_HostPortal_0 = v22.HostPortal;
local _ = v22.ForwardRef;
local l_Fragment_0 = v22.Fragment;
local _ = v22.SimpleMemoComponent;
local l_Block_0 = v22.Block;
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_ReactFeatureFlags_0 = require(l_Parent_0.Shared).ReactFeatureFlags;
local l_enableLazyElements_0 = l_ReactFeatureFlags_0.enableLazyElements;
local l_enableBlocksAPI_0 = l_ReactFeatureFlags_0.enableBlocksAPI;
local v35 = require(script.Parent["ReactFiber.new"]);
local l_createWorkInProgress_0 = v35.createWorkInProgress;
local l_resetWorkInProgress_0 = v35.resetWorkInProgress;
local l_createFiberFromElement_0 = v35.createFiberFromElement;
local l_createFiberFromFragment_0 = v35.createFiberFromFragment;
local l_createFiberFromText_0 = v35.createFiberFromText;
local l_createFiberFromPortal_0 = v35.createFiberFromPortal;
local v42 = {};
local v43 = nil;
local v44 = nil;
local v45 = nil;
local function v48(_, _)
end;
if l___DEV___0 then
    v43 = false;
    v44 = {};
    v45 = {};
    v48 = function(v49, v50)
        if not (v49 ~= nil) or type(v49) ~= "table" then
            return ;
        elseif (not v49._store or v49._store.validated) or v49.key ~= nil then
            return ;
        else
            local l_l_invariant_0_0 = l_invariant_0;
            local v52 = false;
            if v49._store ~= nil then
                v52 = type(v49._store) == "table";
            end;
            l_l_invariant_0_0(v52, "React Component in warnForMissingKey should have a _store. " .. "This error is likely caused by a bug in React. Please file an issue.");
            v49._store.validated = true;
            l_l_invariant_0_0 = l_getComponentName_0(v50.type) or "Component";
            if not v44[l_l_invariant_0_0] then
                v44[l_l_invariant_0_0] = true;
                l_console_0.error("Each child in a list should have a unique " .. "\"key\" prop. See https://reactjs.org/link/warning-keys for " .. "more information.");
                return ;
            else
                return ;
            end;
        end;
    end;
end;
local l_isArray_0 = l_Array_0.isArray;
coerceRef = function(v54, _, v56)
    local l_ref_0 = v56.ref;
    if l_ref_0 ~= nil and type(l_ref_0) == "string" then
        if (not v56._owner or not v56._self) or v56._owner.stateNode == v56._self then
            local _ = nil;
            error(l_Error_0.new(string.format("Component \"%s\" contains the string ref \"%s\". Support for string refs " .. "has been removed. We recommend using " .. "useRef() or createRef() instead. " .. "Learn more about using refs safely here: " .. "https://reactjs.org/link/strict-mode-string-ref", not l___DEV___0 and "<enable __DEV__ mode for component names>" or (l_getComponentName_0(v54.type) or "Component"), (tostring(l_ref_0)))));
        end;
        if not v56._owner then
            error("Expected ref to be a function or an object returned by React.createRef(), or nil.");
        end;
    end;
    return l_ref_0;
end;
local function _(v59)
    if l___DEV___0 then
        local v60 = l_getComponentName_0(v59.type) or "Component";
        if not v45[v60] then
            v45[v60] = true;
            l_console_0.error("Functions are not valid as a React child. This may happen if " .. "you return a Component instead of <Component /> from render. " .. "Or maybe you meant to call this function rather than return it.");
        else
            return ;
        end;
    end;
end;
resolveLazyType = function(v62)
    local v63, v64 = xpcall(v62._init, l_describeError_0, v62._payload);
    if v63 then
        return v64;
    else
        return v62;
    end;
end;
local function v357(v65)
    local function _(v66, v67)
        if v65 then
            local l_deletions_0 = v66.deletions;
            if l_deletions_0 == nil then
                v66.deletions = {
                    v67
                };
                v66.flags = bit32.bor(v66.flags, l_Deletion_0);
                return ;
            else
                table.insert(l_deletions_0, v67);
                return ;
            end;
        else
            return ;
        end;
    end;
    local function _(v70, v71)
        if v65 then
            local l_v71_0 = v71;
            while l_v71_0 ~= nil do
                local l_l_v71_0_0 = l_v71_0;
                if v65 then
                    local l_deletions_1 = v70.deletions;
                    if l_deletions_1 == nil then
                        v70.deletions = {
                            l_l_v71_0_0
                        };
                        v70.flags = bit32.bor(v70.flags, l_Deletion_0);
                    else
                        table.insert(l_deletions_1, l_l_v71_0_0);
                    end;
                end;
                l_v71_0 = l_v71_0.sibling;
            end;
            return nil;
        else
            return nil;
        end;
    end;
    local function v80(_, v77)
        local v78 = {};
        local l_v77_0 = v77;
        while l_v77_0 ~= nil do
            if l_v77_0.key ~= nil then
                v78[l_v77_0.key] = l_v77_0;
            else
                v78[l_v77_0.index] = l_v77_0;
            end;
            l_v77_0 = l_v77_0.sibling;
        end;
        return v78;
    end;
    local function _(v81, v82)
        local v83 = l_createWorkInProgress_0(v81, v82);
        v83.index = 1;
        v83.sibling = nil;
        return v83;
    end;
    local function _(v85, v86, v87)
        v85.index = v87;
        if v65 then
            local l_alternate_0 = v85.alternate;
            if l_alternate_0 ~= nil then
                local l_index_0 = l_alternate_0.index;
                if l_index_0 < v86 then
                    v85.flags = bit32.bor(v85.flags, l_Placement_0);
                    return v86;
                else
                    return l_index_0;
                end;
            else
                v85.flags = bit32.bor(v85.flags, l_Placement_0);
                return v86;
            end;
        else
            return v86;
        end;
    end;
    local function _(v91)
        if v65 and v91.alternate == nil then
            v91.flags = bit32.bor(v91.flags, l_Placement_0);
        end;
        return v91;
    end;
    local function _(v93, v94, v95, v96)
        if not (v94 ~= nil) or v94.tag ~= l_HostText_0 then
            local v97 = l_createFiberFromText_0(v95, v93.mode, v96);
            v97.return_ = v93;
            return v97;
        else
            local v98 = l_createWorkInProgress_0(v94, v95);
            v98.index = 1;
            v98.sibling = nil;
            local l_v98_0 = v98;
            l_v98_0.return_ = v93;
            return l_v98_0;
        end;
    end;
    local function v111(v101, v102, v103, v104)
        if v102 ~= nil then
            if v102.elementType == v103.type then
                local v105 = l_createWorkInProgress_0(v102, v103.props);
                v105.index = 1;
                v105.sibling = nil;
                local l_v105_0 = v105;
                l_v105_0.ref = coerceRef(v101, v102, v103);
                l_v105_0.return_ = v101;
                if l___DEV___0 then
                    l_v105_0._debugSource = v103._source;
                    l_v105_0._debugOwner = v103._owner;
                end;
                return l_v105_0;
            elseif l_enableBlocksAPI_0 and v102.tag == l_Block_0 then
                local l_type_0 = v103.type;
                if type(l_type_0) == "table" and l_type_0["$$typeof"] == l_REACT_LAZY_TYPE_0 then
                    l_type_0 = resolveLazyType(l_type_0);
                end;
                if l_type_0["$$typeof"] == l_REACT_BLOCK_TYPE_0 and l_type_0._render == v102.type._render then
                    local v108 = l_createWorkInProgress_0(v102, v103.props);
                    v108.index = 1;
                    v108.sibling = nil;
                    local l_v108_0 = v108;
                    l_v108_0.return_ = v101;
                    l_v108_0.type = l_type_0;
                    if l___DEV___0 then
                        l_v108_0._debugSource = v103._source;
                        l_v108_0._debugOwner = v103._owner;
                    end;
                    return l_v108_0;
                end;
            end;
        end;
        local v110 = l_createFiberFromElement_0(v103, v101.mode, v104);
        v110.ref = coerceRef(v101, v102, v103);
        v110.return_ = v101;
        return v110;
    end;
    local function v119(v112, v113, v114, v115)
        if not ((v113 ~= nil and v113.tag == l_HostPortal_0) and v113.stateNode.containerInfo == v114.containerInfo) or v113.stateNode.implementation ~= v114.implementation then
            local v116 = l_createFiberFromPortal_0(v114, v112.mode, v115);
            v116.return_ = v112;
            return v116;
        else
            local v117 = l_createWorkInProgress_0(v113, v114.children or {});
            v117.index = 1;
            v117.sibling = nil;
            local l_v117_0 = v117;
            l_v117_0.return_ = v112;
            return l_v117_0;
        end;
    end;
    local function _(v120, v121, v122, v123, v124)
        if not (v121 ~= nil) or v121.tag ~= l_Fragment_0 then
            local v125 = l_createFiberFromFragment_0(v122, v120.mode, v123, v124);
            v125.return_ = v120;
            return v125;
        else
            local v126 = l_createWorkInProgress_0(v121, v122);
            v126.index = 1;
            v126.sibling = nil;
            local l_v126_0 = v126;
            l_v126_0.return_ = v120;
            return l_v126_0;
        end;
    end;
    local function _(v129, v130)
        if v130.key == nil then
            local v131 = type(v129);
            if not (v131 ~= "string") or v131 == "number" then
                v130.key = v129;
                return ;
            elseif v131 == "table" then
                v130.key = tostring(v129);
            end;
        end;
    end;
    local function v133(v134, v135, v136, v137)
        if v135 == nil then
            return nil;
        else
            local v138 = type(v135);
            if v138 == "table" then
                if v135.key == nil then
                    local v139 = type(v137);
                    if not (v139 ~= "string") or v139 == "number" then
                        v135.key = v137;
                    elseif v139 == "table" then
                        v135.key = tostring(v137);
                    end;
                end;
                local v140 = v135["$$typeof"];
                if v140 == l_REACT_ELEMENT_TYPE_0 then
                    local v141 = l_createFiberFromElement_0(v135, v134.mode, v136);
                    v141.ref = coerceRef(v134, nil, v135);
                    v141.return_ = v134;
                    return v141;
                elseif v140 == l_REACT_PORTAL_TYPE_0 then
                    local v142 = l_createFiberFromPortal_0(v135, v134.mode, v136);
                    v142.return_ = v134;
                    return v142;
                elseif not (v140 == l_REACT_LAZY_TYPE_0) or not l_enableLazyElements_0 then
                    local v143 = l_createFiberFromFragment_0(v135, v134.mode, v136, nil);
                    v143.return_ = v134;
                    return v143;
                else
                    return v133(v134, v135._init(v135._payload), v136);
                end;
            elseif not (v138 ~= "string") or v138 == "number" then
                local v144 = l_createFiberFromText_0(tostring(v135), v134.mode, v136);
                v144.return_ = v134;
                return v144;
            else
                if not (not (l___DEV___0 and v138 == "function") or not l___DEV___0) then
                    local v145 = l_getComponentName_0(v134.type) or "Component";
                    if not v45[v145] then
                        v45[v145] = true;
                        l_console_0.error("Functions are not valid as a React child. This may happen if " .. "you return a Component instead of <Component /> from render. " .. "Or maybe you meant to call this function rather than return it.");
                    end;
                end;
                return nil;
            end;
        end;
    end;
    local function v146(v147, v148, v149, v150, v151)
        if v149 == nil then
            return nil;
        else
            local v152 = if v148 ~= nil then v148.key else nil;
            local v153 = type(v149);
            if v153 == "table" then
                if v149.key == nil then
                    local v154 = type(v151);
                    if not (v154 ~= "string") or v154 == "number" then
                        v149.key = v151;
                    elseif v154 == "table" then
                        v149.key = tostring(v151);
                    end;
                end;
                local v155 = v149["$$typeof"];
                if v155 == l_REACT_ELEMENT_TYPE_0 then
                    if v149.key == v152 then
                        if v149.type == l_REACT_FRAGMENT_TYPE_0 then
                            local l_children_0 = v149.props.children;
                            if not (v148 ~= nil) or v148.tag ~= l_Fragment_0 then
                                local v157 = l_createFiberFromFragment_0(l_children_0, v147.mode, v150, v152);
                                v157.return_ = v147;
                                return v157;
                            else
                                local v158 = l_createWorkInProgress_0(v148, l_children_0);
                                v158.index = 1;
                                v158.sibling = nil;
                                local l_v158_0 = v158;
                                l_v158_0.return_ = v147;
                                return l_v158_0;
                            end;
                        else
                            return (v111(v147, v148, v149, v150));
                        end;
                    else
                        return nil;
                    end;
                elseif v155 == l_REACT_PORTAL_TYPE_0 then
                    if v149.key == v152 then
                        return (v119(v147, v148, v149, v150));
                    else
                        return nil;
                    end;
                elseif not (v155 == l_REACT_LAZY_TYPE_0) or not l_enableLazyElements_0 then
                    if v152 ~= nil then
                        return nil;
                    elseif not (v148 ~= nil) or v148.tag ~= l_Fragment_0 then
                        local v160 = l_createFiberFromFragment_0(v149, v147.mode, v150, nil);
                        v160.return_ = v147;
                        return v160;
                    else
                        local v161 = l_createWorkInProgress_0(v148, v149);
                        v161.index = 1;
                        v161.sibling = nil;
                        local l_v161_0 = v161;
                        l_v161_0.return_ = v147;
                        return l_v161_0;
                    end;
                else
                    return v146(v147, v148, v149._init(v149._payload), v150);
                end;
            elseif not (v153 ~= "string") or v153 == "number" then
                if v152 ~= nil then
                    return nil;
                else
                    local v163 = tostring(v149);
                    if not (v148 ~= nil) or v148.tag ~= l_HostText_0 then
                        local v164 = l_createFiberFromText_0(v163, v147.mode, v150);
                        v164.return_ = v147;
                        return v164;
                    else
                        local v165 = l_createWorkInProgress_0(v148, v163);
                        v165.index = 1;
                        v165.sibling = nil;
                        local l_v165_0 = v165;
                        l_v165_0.return_ = v147;
                        return l_v165_0;
                    end;
                end;
            else
                if not (not (l___DEV___0 and v153 == "function") or not l___DEV___0) then
                    local v167 = l_getComponentName_0(v147.type) or "Component";
                    if not v45[v167] then
                        v45[v167] = true;
                        l_console_0.error("Functions are not valid as a React child. This may happen if " .. "you return a Component instead of <Component /> from render. " .. "Or maybe you meant to call this function rather than return it.");
                    end;
                end;
                return nil;
            end;
        end;
    end;
    local function v168(v169, v170, v171, v172, v173, v174)
        if v172 == nil then
            return nil;
        else
            local v175 = type(v172);
            if v175 == "table" then
                if v172.key == nil then
                    local v176 = type(v174);
                    if not (v176 ~= "string") or v176 == "number" then
                        v172.key = v174;
                    elseif v176 == "table" then
                        v172.key = tostring(v174);
                    end;
                end;
                local _ = nil;
                local v178 = v172["$$typeof"];
                if v178 == l_REACT_ELEMENT_TYPE_0 then
                    local v179 = v169[if v172.key == nil then v171 else v172.key];
                    if v172.type == l_REACT_FRAGMENT_TYPE_0 then
                        local l_children_1 = v172.props.children;
                        local l_key_0 = v172.key;
                        if not (v179 ~= nil) or v179.tag ~= l_Fragment_0 then
                            local v182 = l_createFiberFromFragment_0(l_children_1, v170.mode, v173, l_key_0);
                            v182.return_ = v170;
                            return v182;
                        else
                            local v183 = l_createWorkInProgress_0(v179, l_children_1);
                            v183.index = 1;
                            v183.sibling = nil;
                            local l_v183_0 = v183;
                            l_v183_0.return_ = v170;
                            return l_v183_0;
                        end;
                    else
                        return (v111(v170, v179, v172, v173));
                    end;
                elseif v178 == l_REACT_PORTAL_TYPE_0 then
                    return (v119(v170, v169[if v172.key == nil then v171 else v172.key], v172, v173));
                elseif not (v178 == l_REACT_LAZY_TYPE_0) or not l_enableLazyElements_0 then
                    local v185 = v169[v171];
                    if not (v185 ~= nil) or v185.tag ~= l_Fragment_0 then
                        local v186 = l_createFiberFromFragment_0(v172, v170.mode, v173, nil);
                        v186.return_ = v170;
                        return v186;
                    else
                        local v187 = l_createWorkInProgress_0(v185, v172);
                        v187.index = 1;
                        v187.sibling = nil;
                        local l_v187_0 = v187;
                        l_v187_0.return_ = v170;
                        return l_v187_0;
                    end;
                else
                    return v168(v169, v170, v171, v172._init(v172._payload), v173);
                end;
            elseif not (v175 ~= "string") or v175 == "number" then
                local v189 = v169[v171] or nil;
                local v190 = tostring(v172);
                if not (v189 ~= nil) or v189.tag ~= l_HostText_0 then
                    local v191 = l_createFiberFromText_0(v190, v170.mode, v173);
                    v191.return_ = v170;
                    return v191;
                else
                    local v192 = l_createWorkInProgress_0(v189, v190);
                    v192.index = 1;
                    v192.sibling = nil;
                    local l_v192_0 = v192;
                    l_v192_0.return_ = v170;
                    return l_v192_0;
                end;
            else
                if not (not (l___DEV___0 and v175 == "function") or not l___DEV___0) then
                    local v194 = l_getComponentName_0(v170.type) or "Component";
                    if not v45[v194] then
                        v45[v194] = true;
                        l_console_0.error("Functions are not valid as a React child. This may happen if " .. "you return a Component instead of <Component /> from render. " .. "Or maybe you meant to call this function rather than return it.");
                    end;
                end;
                return nil;
            end;
        end;
    end;
    local function v195(v196, v197, v198)
        if l___DEV___0 then
            if not (v196 ~= nil) or type(v196) ~= "table" then
                return v197;
            else
                local v199 = v196["$$typeof"];
                if not (v199 ~= l_REACT_ELEMENT_TYPE_0) or v199 == l_REACT_PORTAL_TYPE_0 then
                    v48(v196, v198);
                    local l_key_1 = v196.key;
                    if type(l_key_1) ~= "string" then
                        return v197;
                    elseif v197 == nil then
                        return {
                            [l_key_1] = true
                        };
                    elseif v197[l_key_1] then
                        l_console_0.error("Encountered two children with the same key, `%s`. " .. "Keys should be unique so that components maintain their identity " .. "across updates. Non-unique keys may cause children to be " .. "duplicated and/or omitted \226\128\148 the behavior is unsupported and " .. "could change in a future version.", l_key_1);
                        return v197;
                    else
                        v197[l_key_1] = true;
                        return v197;
                    end;
                elseif not (not (v199 == l_REACT_LAZY_TYPE_0) or not l_enableLazyElements_0) then
                    v195(v196._init(v196._payload), v197, v198);
                end;
            end;
        end;
        return v197;
    end;
    local function v241(v201, v202, v203, v204)
        if l___DEV___0 then
            local v205 = nil;
            for _, v207 in v203, nil, nil do
                v205 = v195(v207, v205, v201);
            end;
        end;
        local v208 = nil;
        local v209 = nil;
        local l_v202_0 = v202;
        local v211 = 1;
        local v212 = 1;
        local v213 = nil;
        local v214 = #v203;
        while l_v202_0 ~= nil and v212 <= v214 do
            if v212 < l_v202_0.index then
                v213 = l_v202_0;
                l_v202_0 = nil;
            else
                v213 = l_v202_0.sibling;
            end;
            local v215 = nil;
            local v216 = v203[v212];
            v215 = if (v216 ~= nil and type(v216) == "table") and v216["$$typeof"] ~= nil then v146(v201, l_v202_0, v216, v204, v212) else v146(v201, l_v202_0, v216, v204);
            if v215 == nil then
                if l_v202_0 == nil then
                    l_v202_0 = v213;
                    break;
                else
                    break;
                end;
            else
                if not (not v65 or not l_v202_0) and v215.alternate == nil then
                    local l_l_v202_0_0 = l_v202_0;
                    if v65 then
                        local l_deletions_2 = v201.deletions;
                        if l_deletions_2 == nil then
                            v201.deletions = {
                                l_l_v202_0_0
                            };
                            v201.flags = bit32.bor(v201.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_2, l_l_v202_0_0);
                        end;
                    end;
                end;
                local l_v215_0 = v215;
                local l_v211_0 = v211;
                l_v215_0.index = v212;
                if v65 then
                    local l_alternate_1 = l_v215_0.alternate;
                    if l_alternate_1 ~= nil then
                        local l_index_1 = l_alternate_1.index;
                        if l_index_1 < l_v211_0 then
                            l_v215_0.flags = bit32.bor(l_v215_0.flags, l_Placement_0);
                            v211 = l_v211_0;
                        else
                            v211 = l_index_1;
                        end;
                    else
                        l_v215_0.flags = bit32.bor(l_v215_0.flags, l_Placement_0);
                        v211 = l_v211_0;
                    end;
                else
                    v211 = l_v211_0;
                end;
                if v209 == nil then
                    v208 = v215;
                else
                    v209.sibling = v215;
                end;
                v209 = v215;
                l_v202_0 = v213;
                v212 = v212 + 1;
            end;
        end;
        if v214 < v212 then
            local l_l_v202_0_1 = l_v202_0;
            if v65 then
                local l_l_l_v202_0_1_0 = l_l_v202_0_1;
                while l_l_l_v202_0_1_0 ~= nil do
                    local l_l_l_l_v202_0_1_0_0 = l_l_l_v202_0_1_0;
                    if v65 then
                        local l_deletions_3 = v201.deletions;
                        if l_deletions_3 == nil then
                            v201.deletions = {
                                l_l_l_l_v202_0_1_0_0
                            };
                            v201.flags = bit32.bor(v201.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_3, l_l_l_l_v202_0_1_0_0);
                        end;
                    end;
                    l_l_l_v202_0_1_0 = l_l_l_v202_0_1_0.sibling;
                end;
                return v208;
            else
                return v208;
            end;
        elseif l_v202_0 == nil then
            while v212 <= v214 do
                local v227 = nil;
                local v228 = v203[v212];
                v227 = if (v228 ~= nil and type(v228) == "table") and v228["$$typeof"] ~= nil then v133(v201, v228, v204, v212) else v133(v201, v228, v204);
                if v227 == nil then
                    v212 = v212 + 1;
                else
                    local l_v227_0 = v227;
                    local l_v211_1 = v211;
                    l_v227_0.index = v212;
                    if v65 then
                        local l_alternate_2 = l_v227_0.alternate;
                        if l_alternate_2 ~= nil then
                            local l_index_2 = l_alternate_2.index;
                            if l_index_2 < l_v211_1 then
                                l_v227_0.flags = bit32.bor(l_v227_0.flags, l_Placement_0);
                                v211 = l_v211_1;
                            else
                                v211 = l_index_2;
                            end;
                        else
                            l_v227_0.flags = bit32.bor(l_v227_0.flags, l_Placement_0);
                            v211 = l_v211_1;
                        end;
                    else
                        v211 = l_v211_1;
                    end;
                    if v209 == nil then
                        v208 = v227;
                    else
                        v209.sibling = v227;
                    end;
                    v209 = v227;
                    v212 = v212 + 1;
                end;
            end;
            return v208;
        else
            local v233 = v80(v201, l_v202_0);
            while v212 <= v214 do
                local v234 = v168(v233, v201, v212, v203[v212], v204, v212);
                if v234 ~= nil then
                    if v65 and v234.alternate ~= nil then
                        v233[if v234.key == nil then v212 else v234.key] = nil;
                    end;
                    local l_v211_2 = v211;
                    v234.index = v212;
                    if v65 then
                        local l_alternate_3 = v234.alternate;
                        if l_alternate_3 ~= nil then
                            local l_index_3 = l_alternate_3.index;
                            if l_index_3 < l_v211_2 then
                                v234.flags = bit32.bor(v234.flags, l_Placement_0);
                                v211 = l_v211_2;
                            else
                                v211 = l_index_3;
                            end;
                        else
                            v234.flags = bit32.bor(v234.flags, l_Placement_0);
                            v211 = l_v211_2;
                        end;
                    else
                        v211 = l_v211_2;
                    end;
                    if v209 == nil then
                        v208 = v234;
                    else
                        v209.sibling = v234;
                    end;
                    v209 = v234;
                end;
                v212 = v212 + 1;
            end;
            if v65 then
                for _, v239 in v233, nil, nil do
                    if v65 then
                        local l_deletions_4 = v201.deletions;
                        if l_deletions_4 == nil then
                            v201.deletions = {
                                v239
                            };
                            v201.flags = bit32.bor(v201.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_4, v239);
                        end;
                    end;
                end;
            end;
            return v208;
        end;
    end;
    local function v280(v242, v243, v244, v245, v246)
        if l___DEV___0 then
            if v244.entries == v246 then
                if not v43 then
                    l_console_0.error("Using Maps as children is not supported. " .. "Use an array of keyed ReactElements instead.");
                end;
                v43 = true;
            end;
            local v247 = v246(v244);
            if v247 then
                local v248 = nil;
                local v249 = v247.next();
                while not v249.done do
                    v249 = v247.next();
                    v248 = v195(v249.value, v248, v242);
                end;
            end;
        end;
        local v250 = v246(v244);
        local v251 = nil;
        local v252 = nil;
        local l_v243_0 = v243;
        local v254 = 1;
        local v255 = 1;
        local v256 = nil;
        local v257 = v250.next();
        while not (not (l_v243_0 ~= nil) or v257.done) do
            if v255 < l_v243_0.index then
                v256 = l_v243_0;
                l_v243_0 = nil;
            else
                v256 = l_v243_0.sibling;
            end;
            local v258 = v146(v242, l_v243_0, v257.value, v245, v257.key);
            if v258 == nil then
                if l_v243_0 == nil then
                    l_v243_0 = v256;
                    break;
                else
                    break;
                end;
            else
                if not (not v65 or not l_v243_0) and v258.alternate == nil then
                    local l_l_v243_0_0 = l_v243_0;
                    if v65 then
                        local l_deletions_5 = v242.deletions;
                        if l_deletions_5 == nil then
                            v242.deletions = {
                                l_l_v243_0_0
                            };
                            v242.flags = bit32.bor(v242.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_5, l_l_v243_0_0);
                        end;
                    end;
                end;
                local l_v254_0 = v254;
                v258.index = v255;
                if v65 then
                    local l_alternate_4 = v258.alternate;
                    if l_alternate_4 ~= nil then
                        local l_index_4 = l_alternate_4.index;
                        if l_index_4 < l_v254_0 then
                            v258.flags = bit32.bor(v258.flags, l_Placement_0);
                            v254 = l_v254_0;
                        else
                            v254 = l_index_4;
                        end;
                    else
                        v258.flags = bit32.bor(v258.flags, l_Placement_0);
                        v254 = l_v254_0;
                    end;
                else
                    v254 = l_v254_0;
                end;
                if v252 == nil then
                    v251 = v258;
                else
                    v252.sibling = v258;
                end;
                v252 = v258;
                l_v243_0 = v256;
                v255 = v255 + 1;
                v257 = v250.next();
            end;
        end;
        if not v257.done then
            if l_v243_0 == nil then
                while not v257.done do
                    local v264 = v133(v242, v257.value, v245, v257.key);
                    if v264 == nil then
                        v255 = v255 + 1;
                        v257 = v250.next();
                    else
                        local l_v254_1 = v254;
                        v264.index = v255;
                        if v65 then
                            local l_alternate_5 = v264.alternate;
                            if l_alternate_5 ~= nil then
                                local l_index_5 = l_alternate_5.index;
                                if l_index_5 < l_v254_1 then
                                    v264.flags = bit32.bor(v264.flags, l_Placement_0);
                                    v254 = l_v254_1;
                                else
                                    v254 = l_index_5;
                                end;
                            else
                                v264.flags = bit32.bor(v264.flags, l_Placement_0);
                                v254 = l_v254_1;
                            end;
                        else
                            v254 = l_v254_1;
                        end;
                        if v252 == nil then
                            v251 = v264;
                        else
                            v252.sibling = v264;
                        end;
                        v252 = v264;
                        v255 = v255 + 1;
                        v257 = v250.next();
                    end;
                end;
                return v251;
            else
                local v268 = nil;
                while not v257.done do
                    if not v268 then
                        v268 = v80(v242, l_v243_0);
                    end;
                    local v269 = v168(v268, v242, v255, v257.value, v245, v257.key);
                    if v269 ~= nil then
                        if v65 and v269.alternate ~= nil then
                            if v269.key == nil then
                                v268[v255] = nil;
                            else
                                v268[v269.key] = nil;
                            end;
                        end;
                        local l_v254_2 = v254;
                        v269.index = v255;
                        if v65 then
                            local l_alternate_6 = v269.alternate;
                            if l_alternate_6 ~= nil then
                                local l_index_6 = l_alternate_6.index;
                                if l_index_6 < l_v254_2 then
                                    v269.flags = bit32.bor(v269.flags, l_Placement_0);
                                    v254 = l_v254_2;
                                else
                                    v254 = l_index_6;
                                end;
                            else
                                v269.flags = bit32.bor(v269.flags, l_Placement_0);
                                v254 = l_v254_2;
                            end;
                        else
                            v254 = l_v254_2;
                        end;
                        if v252 == nil then
                            v251 = v269;
                        else
                            v252.sibling = v269;
                        end;
                        v252 = v269;
                    end;
                    v255 = v255 + 1;
                    v257 = v250.next();
                end;
                if v65 then
                    for _, v274 in v268, nil, nil do
                        if v65 then
                            local l_deletions_6 = v242.deletions;
                            if l_deletions_6 == nil then
                                v242.deletions = {
                                    v274
                                };
                                v242.flags = bit32.bor(v242.flags, l_Deletion_0);
                            else
                                table.insert(l_deletions_6, v274);
                            end;
                        end;
                    end;
                end;
                return v251;
            end;
        else
            local l_l_v243_0_1 = l_v243_0;
            if v65 then
                local l_l_l_v243_0_1_0 = l_l_v243_0_1;
                while l_l_l_v243_0_1_0 ~= nil do
                    local l_l_l_l_v243_0_1_0_0 = l_l_l_v243_0_1_0;
                    if v65 then
                        local l_deletions_7 = v242.deletions;
                        if l_deletions_7 == nil then
                            v242.deletions = {
                                l_l_l_l_v243_0_1_0_0
                            };
                            v242.flags = bit32.bor(v242.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_7, l_l_l_l_v243_0_1_0_0);
                        end;
                    end;
                    l_l_l_v243_0_1_0 = l_l_l_v243_0_1_0.sibling;
                end;
                return v251;
            else
                return v251;
            end;
        end;
    end;
    local function v294(v281, v282, v283, v284)
        if v282 ~= nil and v282.tag == l_HostText_0 then
            local l_sibling_0 = v282.sibling;
            if v65 then
                local l_l_sibling_0_0 = l_sibling_0;
                while l_l_sibling_0_0 ~= nil do
                    local l_l_l_sibling_0_0_0 = l_l_sibling_0_0;
                    if v65 then
                        local l_deletions_8 = v281.deletions;
                        if l_deletions_8 == nil then
                            v281.deletions = {
                                l_l_l_sibling_0_0_0
                            };
                            v281.flags = bit32.bor(v281.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_8, l_l_l_sibling_0_0_0);
                        end;
                    end;
                    l_l_sibling_0_0 = l_l_sibling_0_0.sibling;
                end;
            end;
            local v289 = l_createWorkInProgress_0(v282, v283);
            v289.index = 1;
            v289.sibling = nil;
            l_sibling_0 = v289;
            l_sibling_0.return_ = v281;
            return l_sibling_0;
        else
            if v65 then
                local l_v282_0 = v282;
                while l_v282_0 ~= nil do
                    local l_l_v282_0_0 = l_v282_0;
                    if v65 then
                        local l_deletions_9 = v281.deletions;
                        if l_deletions_9 == nil then
                            v281.deletions = {
                                l_l_v282_0_0
                            };
                            v281.flags = bit32.bor(v281.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_9, l_l_v282_0_0);
                        end;
                    end;
                    l_v282_0 = l_v282_0.sibling;
                end;
            end;
            local v293 = l_createFiberFromText_0(v283, v281.mode, v284);
            v293.return_ = v281;
            return v293;
        end;
    end;
    local function v319(v295, v296, v297, v298)
        local l_key_2 = v297.key;
        local l_v296_0 = v296;
        while l_v296_0 ~= nil do
            if l_v296_0.key == l_key_2 then
                if l_v296_0.tag == l_Fragment_0 then
                    if v297.type == l_REACT_FRAGMENT_TYPE_0 then
                        local l_sibling_1 = l_v296_0.sibling;
                        if v65 then
                            local l_l_sibling_1_0 = l_sibling_1;
                            while l_l_sibling_1_0 ~= nil do
                                local l_l_l_sibling_1_0_0 = l_l_sibling_1_0;
                                if v65 then
                                    local l_deletions_10 = v295.deletions;
                                    if l_deletions_10 == nil then
                                        v295.deletions = {
                                            l_l_l_sibling_1_0_0
                                        };
                                        v295.flags = bit32.bor(v295.flags, l_Deletion_0);
                                    else
                                        table.insert(l_deletions_10, l_l_l_sibling_1_0_0);
                                    end;
                                end;
                                l_l_sibling_1_0 = l_l_sibling_1_0.sibling;
                            end;
                        end;
                        local v305 = l_createWorkInProgress_0(l_v296_0, v297.props.children);
                        v305.index = 1;
                        v305.sibling = nil;
                        l_sibling_1 = v305;
                        l_sibling_1.return_ = v295;
                        if l___DEV___0 then
                            l_sibling_1._debugSource = v297._source;
                            l_sibling_1._debugOwner = v297._owner;
                        end;
                        return l_sibling_1;
                    end;
                elseif l_v296_0.elementType == v297.type then
                    local l_sibling_2 = l_v296_0.sibling;
                    if v65 then
                        local l_l_sibling_2_0 = l_sibling_2;
                        while l_l_sibling_2_0 ~= nil do
                            local l_l_l_sibling_2_0_0 = l_l_sibling_2_0;
                            if v65 then
                                local l_deletions_11 = v295.deletions;
                                if l_deletions_11 == nil then
                                    v295.deletions = {
                                        l_l_l_sibling_2_0_0
                                    };
                                    v295.flags = bit32.bor(v295.flags, l_Deletion_0);
                                else
                                    table.insert(l_deletions_11, l_l_l_sibling_2_0_0);
                                end;
                            end;
                            l_l_sibling_2_0 = l_l_sibling_2_0.sibling;
                        end;
                    end;
                    local v310 = l_createWorkInProgress_0(l_v296_0, v297.props);
                    v310.index = 1;
                    v310.sibling = nil;
                    l_sibling_2 = v310;
                    l_sibling_2.ref = coerceRef(v295, l_v296_0, v297);
                    l_sibling_2.return_ = v295;
                    if l___DEV___0 then
                        l_sibling_2._debugSource = v297._source;
                        l_sibling_2._debugOwner = v297._owner;
                    end;
                    return l_sibling_2;
                end;
                local l_l_v296_0_0 = l_v296_0;
                if v65 then
                    local l_l_l_v296_0_0_0 = l_l_v296_0_0;
                    while true do
                        if l_l_l_v296_0_0_0 ~= nil then
                            local l_l_l_l_v296_0_0_0_0 = l_l_l_v296_0_0_0;
                            if v65 then
                                local l_deletions_12 = v295.deletions;
                                if l_deletions_12 == nil then
                                    v295.deletions = {
                                        l_l_l_l_v296_0_0_0_0
                                    };
                                    v295.flags = bit32.bor(v295.flags, l_Deletion_0);
                                else
                                    table.insert(l_deletions_12, l_l_l_l_v296_0_0_0_0);
                                end;
                            end;
                            l_l_l_v296_0_0_0 = l_l_l_v296_0_0_0.sibling;
                        else
                            goto label0;
                        end;
                    end;
                else
                    break;
                end;
            else
                local l_l_v296_0_1 = l_v296_0;
                if v65 then
                    local l_deletions_13 = v295.deletions;
                    if l_deletions_13 == nil then
                        v295.deletions = {
                            l_l_v296_0_1
                        };
                        v295.flags = bit32.bor(v295.flags, l_Deletion_0);
                    else
                        table.insert(l_deletions_13, l_l_v296_0_1);
                    end;
                end;
                l_v296_0 = l_v296_0.sibling;
            end;
        end;
        ::label0::;
        if v297.type == l_REACT_FRAGMENT_TYPE_0 then
            local v317 = l_createFiberFromFragment_0(v297.props.children, v295.mode, v298, v297.key);
            v317.return_ = v295;
            return v317;
        else
            local v318 = l_createFiberFromElement_0(v297, v295.mode, v298);
            v318.ref = coerceRef(v295, v296, v297);
            v318.return_ = v295;
            return v318;
        end;
    end;
    local function v338(v320, v321, v322, v323)
        local l_key_3 = v322.key;
        local l_v321_0 = v321;
        while l_v321_0 ~= nil do
            if l_v321_0.key == l_key_3 then
                if (l_v321_0.tag == l_HostPortal_0 and l_v321_0.stateNode.containerInfo == v322.containerInfo) and l_v321_0.stateNode.implementation == v322.implementation then
                    local l_sibling_3 = l_v321_0.sibling;
                    if v65 then
                        local l_l_sibling_3_0 = l_sibling_3;
                        while l_l_sibling_3_0 ~= nil do
                            local l_l_l_sibling_3_0_0 = l_l_sibling_3_0;
                            if v65 then
                                local l_deletions_14 = v320.deletions;
                                if l_deletions_14 == nil then
                                    v320.deletions = {
                                        l_l_l_sibling_3_0_0
                                    };
                                    v320.flags = bit32.bor(v320.flags, l_Deletion_0);
                                else
                                    table.insert(l_deletions_14, l_l_l_sibling_3_0_0);
                                end;
                            end;
                            l_l_sibling_3_0 = l_l_sibling_3_0.sibling;
                        end;
                    end;
                    local v330 = l_createWorkInProgress_0(l_v321_0, v322.children or {});
                    v330.index = 1;
                    v330.sibling = nil;
                    l_sibling_3 = v330;
                    l_sibling_3.return_ = v320;
                    return l_sibling_3;
                else
                    local l_l_v321_0_0 = l_v321_0;
                    if v65 then
                        local l_l_l_v321_0_0_0 = l_l_v321_0_0;
                        while true do
                            if l_l_l_v321_0_0_0 ~= nil then
                                local l_l_l_l_v321_0_0_0_0 = l_l_l_v321_0_0_0;
                                if v65 then
                                    local l_deletions_15 = v320.deletions;
                                    if l_deletions_15 == nil then
                                        v320.deletions = {
                                            l_l_l_l_v321_0_0_0_0
                                        };
                                        v320.flags = bit32.bor(v320.flags, l_Deletion_0);
                                    else
                                        table.insert(l_deletions_15, l_l_l_l_v321_0_0_0_0);
                                    end;
                                end;
                                l_l_l_v321_0_0_0 = l_l_l_v321_0_0_0.sibling;
                            else
                                goto label1;
                            end;
                        end;
                    else
                        break;
                    end;
                end;
            else
                local l_l_v321_0_1 = l_v321_0;
                if v65 then
                    local l_deletions_16 = v320.deletions;
                    if l_deletions_16 == nil then
                        v320.deletions = {
                            l_l_v321_0_1
                        };
                        v320.flags = bit32.bor(v320.flags, l_Deletion_0);
                    else
                        table.insert(l_deletions_16, l_l_v321_0_1);
                    end;
                end;
                l_v321_0 = l_v321_0.sibling;
            end;
        end;
        ::label1::;
        local v337 = l_createFiberFromPortal_0(v322, v320.mode, v323);
        v337.return_ = v320;
        return v337;
    end;
    local function v339(v340, v341, v342, v343)
        local v344 = type(v342);
        local v345 = false;
        if v342 ~= nil then
            v345 = false;
            if v344 == "table" then
                v345 = false;
                if v342.type == l_REACT_FRAGMENT_TYPE_0 then
                    v345 = v342.key == nil;
                end;
            end;
        end;
        if v345 then
            v342 = v342.props.children;
            v344 = type(v342);
        end;
        local v346 = l_isArray_0(v342);
        local v347 = false;
        if v342 ~= nil then
            v347 = false;
            if v344 == "table" then
                v347 = not v346;
            end;
        end;
        if not v347 then
            if not v346 then
                if not (v344 ~= "string") or v344 == "number" then
                    local v348 = v294(v340, v341, tostring(v342), v343);
                    if v65 and v348.alternate == nil then
                        v348.flags = bit32.bor(v348.flags, l_Placement_0);
                    end;
                    return v348;
                end;
            else
                return (v241(v340, v341, v342, v343));
            end;
        else
            local v349 = v342["$$typeof"];
            if v349 == l_REACT_ELEMENT_TYPE_0 then
                local v350 = v319(v340, v341, v342, v343);
                if v65 and v350.alternate == nil then
                    v350.flags = bit32.bor(v350.flags, l_Placement_0);
                end;
                return v350;
            elseif v349 == l_REACT_PORTAL_TYPE_0 then
                local v351 = v338(v340, v341, v342, v343);
                if v65 and v351.alternate == nil then
                    v351.flags = bit32.bor(v351.flags, l_Placement_0);
                end;
                return v351;
            elseif not (not (v349 == l_REACT_LAZY_TYPE_0) or not l_enableLazyElements_0) then
                return v339(v340, v341, v342._init(v342._payload), v343);
            end;
        end;
        local v352 = l_getIteratorFn_0(v342);
        if not v352 then
            if not (not (l___DEV___0 and v344 == "function") or not l___DEV___0) then
                local v353 = l_getComponentName_0(v340.type) or "Component";
                if not v45[v353] then
                    v45[v353] = true;
                    l_console_0.error("Functions are not valid as a React child. This may happen if " .. "you return a Component instead of <Component /> from render. " .. "Or maybe you meant to call this function rather than return it.");
                end;
            end;
            if not (v342 == nil and v345) then
            end;
            if v65 then
                local l_v341_0 = v341;
                while l_v341_0 ~= nil do
                    local l_l_v341_0_0 = l_v341_0;
                    if v65 then
                        local l_deletions_17 = v340.deletions;
                        if l_deletions_17 == nil then
                            v340.deletions = {
                                l_l_v341_0_0
                            };
                            v340.flags = bit32.bor(v340.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_17, l_l_v341_0_0);
                        end;
                    end;
                    l_v341_0 = l_v341_0.sibling;
                end;
                return nil;
            else
                return nil;
            end;
        else
            return (v280(v340, v341, v342, v343, v352));
        end;
    end;
    return v339;
end;
v42.reconcileChildFibers = v357(true);
v42.mountChildFibers = v357(false);
v42.cloneChildFibers = function(_, v359)
    if v359.child == nil then
        return ;
    else
        local l_child_0 = v359.child;
        local v361 = l_createWorkInProgress_0(l_child_0, l_child_0.pendingProps);
        v359.child = v361;
        v361.return_ = v359;
        while l_child_0.sibling ~= nil do
            l_child_0 = l_child_0.sibling;
            v361.sibling = l_createWorkInProgress_0(l_child_0, l_child_0.pendingProps);
            v361 = v361.sibling;
            v361.return_ = v359;
        end;
        v361.sibling = nil;
        return ;
    end;
end;
v42.resetChildFibers = function(v362, v363)
    local l_child_1 = v362.child;
    while l_child_1 ~= nil do
        l_resetWorkInProgress_0(l_child_1, v363);
        l_child_1 = l_child_1.sibling;
    end;
end;
return v42;
