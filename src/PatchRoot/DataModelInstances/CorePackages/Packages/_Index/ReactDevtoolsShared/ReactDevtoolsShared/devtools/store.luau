local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_inspect_0 = v1.util.inspect;
local l_Array_0 = v1.Array;
local l_Error_0 = v1.Error;
local l_Map_0 = v1.Map;
local l_Object_0 = v1.Object;
local l_Set_0 = v1.Set;
local l_console_0 = require(l_Parent_0.Shared).console;
local v9 = require(script.Parent.Parent.events);
local v10 = require(script.Parent.Parent.constants);
local l_TREE_OPERATION_ADD_0 = v10.TREE_OPERATION_ADD;
local l_TREE_OPERATION_REMOVE_0 = v10.TREE_OPERATION_REMOVE;
local l_TREE_OPERATION_REORDER_CHILDREN_0 = v10.TREE_OPERATION_REORDER_CHILDREN;
local l_TREE_OPERATION_UPDATE_TREE_BASE_DURATION_0 = v10.TREE_OPERATION_UPDATE_TREE_BASE_DURATION;
local l_ElementTypeRoot_0 = require(script.Parent.Parent.types).ElementTypeRoot;
local v16 = require(script.Parent.Parent.utils);
local l_getSavedComponentFilters_0 = v16.getSavedComponentFilters;
local l_saveComponentFilters_0 = v16.saveComponentFilters;
local l_separateDisplayNameAndHOCs_0 = v16.separateDisplayNameAndHOCs;
local l_shallowDiffers_0 = v16.shallowDiffers;
local v21 = require(script.Parent.Parent.storage);
local l_localStorageGetItem_0 = v21.localStorageGetItem;
local l_localStorageSetItem_0 = v21.localStorageSetItem;
local l___DEBUG___0 = v10.__DEBUG__;
local v25 = require(script.Parent.ProfilerStore);
local _ = require(script.Parent.Parent.devtools.views.Components.types);
local _ = require(script.Parent.Parent.types);
local _ = require(script.Parent.Parent.bridge);
local _ = require(script.Parent.types);
local function v31(v30, ...)
    if l___DEBUG___0 then
        print("Store", v30, ...);
    end;
end;
local v32 = setmetatable({}, {
    __index = v9
});
local v33 = {
    __index = v32
};
v32.new = function(v34, v35)
    local v36 = setmetatable(v9.new(), v33);
    v35 = v35 or {};
    v36._bridge = v34;
    v36._collapseNodesByDefault = true;
    v36._componentFilters = {};
    v36._hasOwnerMetadata = false;
    v36._idToElement = l_Map_0.new();
    v36._isNativeStyleEditorSupported = false;
    v36._isBackendStorageAPISupported = false;
    v36._nativeStyleEditorValidAttributes = nil;
    v36._ownersMap = l_Map_0.new();
    v36._recordChangeDescriptions = false;
    v36._revision = 0;
    v36._roots = {};
    v36._rootIDToCapabilities = l_Map_0.new();
    v36._rootIDToRendererID = l_Map_0.new();
    v36._supportsNativeInspection = true;
    v36._supportsProfiling = false;
    v36._supportsReloadAndProfile = false;
    v36._supportsTraceUpdates = false;
    v36._unsupportedRendererVersionDetected = false;
    v36._weightAcrossRoots = 0;
    if l___DEBUG___0 then
        v31("constructor", "subscribing to Bridge");
    end;
    v36._collapseNodesByDefault = l_localStorageGetItem_0("React::DevTools::collapseNodesByDefault") == "true";
    v36._recordChangeDescriptions = l_localStorageGetItem_0("React::DevTools::recordChangeDescriptions") == "true";
    v36._componentFilters = l_getSavedComponentFilters_0();
    local v37 = false;
    if v35 ~= nil then
        v37 = v35.isProfiling == true;
        local l_supportsNativeInspection_0 = v35.supportsNativeInspection;
        local l_supportsProfiling_0 = v35.supportsProfiling;
        local l_supportsReloadAndProfile_0 = v35.supportsReloadAndProfile;
        local l_supportsTraceUpdates_0 = v35.supportsTraceUpdates;
        v36._supportsNativeInspection = l_supportsNativeInspection_0 ~= false;
        if l_supportsProfiling_0 then
            v36._supportsProfiling = true;
        end;
        if l_supportsReloadAndProfile_0 then
            v36._supportsReloadAndProfile = true;
        end;
        if l_supportsTraceUpdates_0 then
            v36._supportsTraceUpdates = true;
        end;
    end;
    v36._profilerStore = v25.new(v34, v36, v37);
    v36._onBridgeOperations = v36.onBridgeOperations;
    v36.onBridgeOperations = function(...)
        v36:_onBridgeOperations(...);
    end;
    v36._onBridgeOverrideComponentFilters = v36.onBridgeOverrideComponentFilters;
    v36.onBridgeOverrideComponentFilters = function(...)
        v36:_onBridgeOverrideComponentFilters(...);
    end;
    v36._onBridgeShutdown = v36.onBridgeShutdown;
    v36.onBridgeShutdown = function(...)
        v36:_onBridgeShutdown(...);
    end;
    v36._onBridgeStorageSupported = v36.onBridgeStorageSupported;
    v36.onBridgeStorageSupported = function(...)
        v36:_onBridgeStorageSupported(...);
    end;
    v36._onBridgeNativeStyleEditorSupported = v36.onBridgeNativeStyleEditorSupported;
    v36.onBridgeNativeStyleEditorSupported = function(...)
        v36:_onBridgeNativeStyleEditorSupported(...);
    end;
    v36._onBridgeUnsupportedRendererVersion = v36.onBridgeUnsupportedRendererVersion;
    v36.onBridgeUnsupportedRendererVersion = function(...)
        v36:_onBridgeUnsupportedRendererVersion(...);
    end;
    v34:addListener("operations", v36.onBridgeOperations);
    v34:addListener("overrideComponentFilters", v36.onBridgeOverrideComponentFilters);
    v34:addListener("shutdown", v36.onBridgeShutdown);
    v34:addListener("isBackendStorageAPISupported", v36.onBridgeStorageSupported);
    v34:addListener("isNativeStyleEditorSupported", v36.onBridgeNativeStyleEditorSupported);
    v34:addListener("unsupportedRendererVersion", v36.onBridgeUnsupportedRendererVersion);
    return v36;
end;
v32.assertExpectedRootMapSizes = function(v42)
    if #v42._roots == 0 then
        v42:assertMapSizeMatchesRootCount(v42._idToElement, "_idToElement");
        v42:assertMapSizeMatchesRootCount(v42._ownersMap, "_ownersMap");
    end;
    v42:assertMapSizeMatchesRootCount(v42._rootIDToCapabilities, "_rootIDToCapabilities");
    v42:assertMapSizeMatchesRootCount(v42._rootIDToRendererID, "_rootIDToRendererID");
end;
v32.assertMapSizeMatchesRootCount = function(v43, v44, v45)
    local v46 = #v43._roots;
    if v44.size ~= v46 then
        error(l_Error_0.new(string.format("Expected %s to contain %s items, but it contains %s items\n\n%s", v45, tostring(v46), tostring(v44.size), l_inspect_0(v44, {
            depth = 20
        }))));
    end;
end;
v32.getCollapseNodesByDefault = function(v47)
    return v47._collapseNodesByDefault;
end;
v32.setCollapseNodesByDefault = function(v48, v49)
    v48._collapseNodesByDefault = v49;
    l_localStorageSetItem_0("React::DevTools::collapseNodesByDefault", not v49 and "false" or "true");
    v48:emit("collapseNodesByDefault");
end;
v32.getComponentFilters = function(v50)
    return v50._componentFilters;
end;
v32.setComponentFilters = function(v51, v52)
    if v51._profilerStore:isProfiling() then
        error("Cannot modify filter preferences while profiling");
    end;
    local v54 = l_Array_0.filter(v51._componentFilters, function(v53)
        return v53.isEnabled;
    end);
    local v56 = l_Array_0.filter(v52, function(v55)
        return v55.isEnabled;
    end);
    local v57 = #v54 ~= #v56;
    if not v57 then
        for v58 = 1, #v56 do
            if l_shallowDiffers_0(v54[v58], v56[v58]) then
                v57 = true;
                break;
            end;
        end;
    end;
    v51._componentFilters = v52;
    l_saveComponentFilters_0(v52);
    if v57 then
        v51._bridge:send("updateComponentFilters", v52);
    end;
    v51:emit("componentFilters");
end;
v32.getHasOwnerMetadata = function(v59)
    return v59._hasOwnerMetadata;
end;
v32.getNativeStyleEditorValidAttributes = function(v60)
    return v60._nativeStyleEditorValidAttributes;
end;
v32.getNumElements = function(v61)
    return v61._weightAcrossRoots;
end;
v32.getProfilerStore = function(v62)
    return v62._profilerStore;
end;
v32.getRecordChangeDescriptions = function(v63)
    return v63._recordChangeDescriptions;
end;
v32.setRecordChangeDescriptions = function(v64, v65)
    v64._recordChangeDescriptions = v65;
    l_localStorageSetItem_0("React::DevTools::recordChangeDescriptions", not v65 and "false" or "true");
    v64:emit("recordChangeDescriptions");
end;
v32.getRevision = function(v66)
    return v66._revision;
end;
v32.getRootIDToRendererID = function(v67)
    return v67._rootIDToRendererID;
end;
v32.getRoots = function(v68)
    return v68._roots;
end;
v32.getSupportsNativeInspection = function(v69)
    return v69._supportsNativeInspection;
end;
v32.getSupportsNativeStyleEditor = function(v70)
    return v70._isNativeStyleEditorSupported;
end;
v32.getSupportsProfiling = function(v71)
    return v71._supportsProfiling;
end;
v32.getSupportsReloadAndProfile = function(v72)
    return v72._supportsReloadAndProfile and v72._isBackendStorageAPISupported;
end;
v32.getSupportsTraceUpdates = function(v73)
    return v73._supportsTraceUpdates;
end;
v32.getUnsupportedRendererVersionDetected = function(v74)
    return v74._unsupportedRendererVersionDetected;
end;
v32.containsElement = function(v75, v76)
    return v75._idToElement:get(v76) ~= nil;
end;
v32.getElementAtIndex = function(v77, v78)
    if not (v78 >= 0) or v77:getNumElements() <= v78 then
        l_console_0.warn(string.format("Invalid index %d specified; store contains %d items.", v78, v77:getNumElements()));
        return nil;
    else
        local _ = nil;
        local v80 = nil;
        local v81 = 0;
        for v82 = 1, #v77._roots do
            v80 = v77._idToElement:get(v77._roots[v82]);
            if not (#v80.children == 0) then
                if not (v78 < v81 + v80.weight) then
                    v81 = v81 + v80.weight;
                else
                    break;
                end;
            end;
        end;
        local l_v80_0 = v80;
        local v84 = v81 - 1;
        while v78 ~= v84 do
            for v85 = 1, #l_v80_0.children do
                local v86 = v77._idToElement:get(l_v80_0.children[v85]);
                local v87 = if not v86.isCollapsed then v86.weight else 1;
                if v78 <= v84 + v87 then
                    v84 = v84 + 1;
                    l_v80_0 = v86;
                    break;
                else
                    v84 = v84 + v87;
                end;
            end;
        end;
        return l_v80_0 or nil;
    end;
end;
v32.getElementIDAtIndex = function(v88, v89)
    local v90 = v88:getElementAtIndex(v89);
    if v90 == nil then
        return nil;
    else
        return v90.id;
    end;
end;
v32.getElementByID = function(v91, v92)
    local v93 = v91._idToElement:get(v92);
    if v93 == nil then
        l_console_0.warn(string.format("No element found with id \"%s\"", (tostring(v92))));
        return nil;
    else
        return v93;
    end;
end;
v32.getIndexOfElementID = function(v94, v95)
    local v96 = v94:getElementByID(v95);
    if not (v96 ~= nil) or v96.parentID == 0 then
        return nil;
    else
        local l_v95_0 = v95;
        local l_parentID_0 = v96.parentID;
        local v99 = 0;
        while true do
            local v100 = v94._idToElement:get(l_parentID_0);
            local l_children_0 = v100.children;
            for v102 = 1, #l_children_0 do
                local v103 = l_children_0[v102];
                if v103 ~= l_v95_0 then
                    local v104 = v94._idToElement:get(v103);
                    v99 = v99 + if not v104.isCollapsed then v104.weight else 1;
                else
                    break;
                end;
            end;
            if v100.parentID ~= 0 then
                v99 = v99 + 1;
                l_v95_0 = v100.id;
                l_parentID_0 = v100.parentID;
            else
                break;
            end;
        end;
        for v105 = 1, #v94._roots do
            local v106 = v94._roots[v105];
            if v106 ~= l_parentID_0 then
                v99 = v99 + v94._idToElement:get(v106).weight;
            else
                break;
            end;
        end;
        return v99;
    end;
end;
v32.getOwnersListForElement = function(v107, v108)
    local v109 = {};
    local v110 = v107._idToElement:get(v108);
    if v110 ~= nil then
        table.insert(v109, l_Object_0.assign({}, v110, {
            depth = 0
        }));
        local v111 = v107._ownersMap:get(v108);
        if v111 ~= nil then
            local v112 = l_Map_0.new({
                {
                    v108, 
                    0
                }
            });
            for _, v116 in (l_Array_0.sort(l_Array_0.from(v111), function(v113, v114)
                return (v107:getIndexOfElementID(v113) or 0) - (v107:getIndexOfElementID(v114) or 0);
            end)), nil, nil do
                local v117 = v107._idToElement:get(v116);
                if v117 ~= nil then
                    local l_parentID_1 = v117.parentID;
                    local v119 = 0;
                    while l_parentID_1 > 0 do
                        if l_parentID_1 ~= v108 and not v111:has(l_parentID_1) then
                            local v120 = v107._idToElement:get(l_parentID_1);
                            if v120 ~= nil then
                                l_parentID_1 = v120.parentID;
                            else
                                break;
                            end;
                        else
                            v119 = v112:get(l_parentID_1) + 1;
                            v112:set(v116, v119);
                            break;
                        end;
                    end;
                    if v119 == 0 then
                        error("Invalid owners list");
                    end;
                    table.insert(v109, l_Object_0.assign({}, v117, {
                        depth = v119
                    }));
                end;
            end;
        end;
    end;
    return v109;
end;
v32.getRendererIDForElement = function(v121, v122)
    local v123 = v121._idToElement:get(v122);
    while true do
        if v123 ~= nil then
            if v123.parentID == 0 then
                local v124 = v121._rootIDToRendererID:get(v123.id);
                if v124 == nil then
                    return nil;
                else
                    return v124;
                end;
            else
                v123 = v121._idToElement:get(v123.parentID);
            end;
        else
            return nil;
        end;
    end;
end;
v32.getRootIDForElement = function(v125, v126)
    local v127 = v125._idToElement:get(v126);
    while true do
        if v127 ~= nil then
            if v127.parentID == 0 then
                return v127.id;
            else
                v127 = v125._idToElement:get(v127.parentID);
            end;
        else
            return nil;
        end;
    end;
end;
v32.isInsideCollapsedSubTree = function(v128, v129)
    local v130 = v128._idToElement:get(v129);
    while true do
        if v130 ~= nil then
            if v130.parentID == 0 then
                return false;
            else
                v130 = v128._idToElement:get(v130.parentID);
                if not (not (v130 ~= nil) or not v130.isCollapsed) then
                    return true;
                end;
            end;
        else
            return false;
        end;
    end;
end;
v32.toggleIsCollapsed = function(v131, v132, v133)
    local v134 = false;
    local v135 = v131:getElementByID(v132);
    if v135 ~= nil then
        if not v133 then
            local l_v135_0 = v135;
            while l_v135_0 ~= nil do
                local v137 = if not l_v135_0.isCollapsed then l_v135_0.weight else 1;
                if l_v135_0.isCollapsed then
                    v134 = true;
                    l_v135_0.isCollapsed = false;
                    local v138 = if not l_v135_0.isCollapsed then l_v135_0.weight else 1 - v137;
                    local v139 = v131._idToElement:get(l_v135_0.parentID);
                    while v139 ~= nil do
                        v139.weight = v139.weight + v138;
                        if not v139.isCollapsed then
                            v139 = v131._idToElement:get(v139.parentID);
                        else
                            break;
                        end;
                    end;
                end;
                if l_v135_0.parentID ~= 0 then
                    l_v135_0 = v131:getElementByID(l_v135_0.parentID);
                else
                    l_v135_0 = nil;
                end;
            end;
        else
            if v135.type == l_ElementTypeRoot_0 then
                error("Root nodes cannot be collapsed");
            end;
            if not v135.isCollapsed then
                v134 = true;
                v135.isCollapsed = true;
                local v140 = 1 - v135.weight;
                local v141 = v131._idToElement:get(v135.parentID);
                while v141 ~= nil do
                    v141.weight = v141.weight + v140;
                    v141 = v131._idToElement:get(v141.parentID);
                end;
            end;
        end;
        if v134 then
            local v142 = 0;
            for _, v144 in v131._roots, nil, nil do
                v142 = v142 + v131:getElementByID(v144).weight;
            end;
            v131._weightAcrossRoots = v142;
            v131:emit("mutated", {
                {}, 
                {}
            });
        end;
    end;
end;
v32._adjustParentTreeWeight = function(v145, v146, v147)
    local v148 = false;
    while v146 ~= nil do
        v146.weight = v146.weight + v147;
        if not v146.isCollapsed then
            v146 = v145._idToElement:get(v146.parentID);
        else
            v148 = true;
            break;
        end;
    end;
    if not v148 then
        v145._weightAcrossRoots = v145._weightAcrossRoots + v147;
    end;
end;
v32.onBridgeNativeStyleEditorSupported = function(v149, v150)
    local l_isSupported_0 = v150.isSupported;
    local l_validAttributes_0 = v150.validAttributes;
    v149._isNativeStyleEditorSupported = l_isSupported_0;
    v149._nativeStyleEditorValidAttributes = l_validAttributes_0 or nil;
    v149:emit("supportsNativeStyleEditor");
end;
v32.onBridgeOperations = function(v153, v154)
    if l___DEBUG___0 then
        l_console_0.groupCollapsed("onBridgeOperations");
        v31("onBridgeOperations", table.concat(v154, ","));
    end;
    local v155 = false;
    local v156 = v154[1];
    local v157 = {};
    local v158 = {};
    local v159 = 3;
    local v160 = {
        ""
    };
    local function _()
        local l_v159_0 = v159;
        v159 = v159 + 1;
        return l_v159_0;
    end;
    local l_v159_1 = v159;
    v159 = v159 + 1;
    local v164 = v159 + v154[l_v159_1];
    while v159 < v164 do
        local l_v159_2 = v159;
        v159 = v159 + 1;
        table.insert(v160, v154[l_v159_2]);
    end;
    while v159 <= #v154 do
        l_v159_1 = v154[v159];
        if l_v159_1 == l_TREE_OPERATION_ADD_0 then
            local v166 = v154[v159 + 1];
            local v167 = v154[v159 + 2];
            v159 = v159 + 3;
            if v153._idToElement:has(v166) then
                error(l_Error_0.new(("Cannot add node %s because a node with that id is already in the Store."):format((tostring(v166)))));
            end;
            local v168 = 0;
            local v169 = nil;
            if v167 == l_ElementTypeRoot_0 then
                if l___DEBUG___0 then
                    v31("Add", string.format("new root node %s", (tostring(v166))));
                end;
                local v170 = v154[v159] > 0;
                v159 = v159 + 1;
                local v171 = v154[v159] > 0;
                v159 = v159 + 1;
                v153._roots = l_Array_0.concat(v153._roots, v166);
                v153._rootIDToRendererID:set(v166, v156);
                v153._rootIDToCapabilities:set(v166, {
                    hasOwnerMetadata = v171, 
                    supportsProfiling = v170
                });
                v153._idToElement:set(v166, {
                    children = {}, 
                    depth = -1, 
                    displayName = nil, 
                    hocDisplayNames = nil, 
                    id = v166, 
                    isCollapsed = false, 
                    key = nil, 
                    ownerID = 0, 
                    parentID = 0, 
                    type = v167, 
                    weight = 0
                });
                v155 = true;
            else
                v169 = v154[v159];
                v159 = v159 + 1;
                v168 = v154[v159];
                v159 = v159 + 1;
                local v172 = v160[v154[v159] + 1];
                v159 = v159 + 1;
                local v173 = v160[v154[v159] + 1];
                v159 = v159 + 1;
                if l___DEBUG___0 then
                    v31("Add", string.format("node %s (%s) as child of %s", tostring(v166), v172 or "null", (tostring(v169))));
                end;
                if not v153._idToElement:has(v169) then
                    error(l_Error_0.new(("Cannot add child %s to parent %s because parent node was not found in the Store."):format(tostring(v166), (tostring(v169)))));
                end;
                local v174 = v153._idToElement:get(v169);
                table.insert(v174.children, v166);
                local v175, v176 = l_separateDisplayNameAndHOCs_0(v172, v167);
                v153._idToElement:set(v166, {
                    children = {}, 
                    depth = v174.depth + 1, 
                    displayName = v175, 
                    hocDisplayNames = v176, 
                    id = v166, 
                    isCollapsed = v153._collapseNodesByDefault, 
                    key = v173, 
                    ownerID = v168, 
                    parentID = v174.id, 
                    type = v167, 
                    weight = 1
                });
                table.insert(v157, v166);
                v153:_adjustParentTreeWeight(v174, 1);
                if v168 > 0 then
                    local v177 = v153._ownersMap:get(v168);
                    if v177 == nil then
                        v177 = l_Set_0.new();
                        v153._ownersMap:set(v168, v177);
                    end;
                    v177:add(v166);
                end;
            end;
        elseif l_v159_1 == l_TREE_OPERATION_REMOVE_0 then
            local v178 = v154[v159 + 1];
            v159 = v159 + 2;
            for _ = 1, v178 do
                local v180 = v154[v159];
                if not v153._idToElement:has(v180) then
                    error(l_Error_0.new(("Cannot remove node %s because no matching node was found in the Store."):format((tostring(v180)))));
                end;
                v159 = v159 + 1;
                local v181 = v153._idToElement:get(v180);
                local l_children_1 = v181.children;
                local l_ownerID_0 = v181.ownerID;
                local l_parentID_2 = v181.parentID;
                local l_weight_0 = v181.weight;
                if #l_children_1 > 0 then
                    error(l_Error_0.new(string.format("Node %s was removed before its children.", (tostring(v180)))));
                end;
                v153._idToElement:delete(v180);
                local v186 = nil;
                if l_parentID_2 == 0 then
                    if l___DEBUG___0 then
                        v31("Remove", string.format("node %s root", (tostring(v180))));
                    end;
                    v153._roots = l_Array_0.filter(v153._roots, function(v187)
                        return v187 ~= v180;
                    end);
                    v153._rootIDToRendererID:delete(v180);
                    v153._rootIDToCapabilities:delete(v180);
                    v155 = true;
                else
                    if l___DEBUG___0 then
                        v31("Remove", string.format("node %s from parent %s", tostring(v180), (tostring(l_parentID_2))));
                    end;
                    v186 = v153._idToElement:get(l_parentID_2);
                    if v186 == nil then
                        error(("Cannot remove node %s from parent %s because no matching node was found in the Store."):format(tostring(v180), (tostring(l_parentID_2))));
                    end;
                    l_Array_0.splice(v186.children, l_Array_0.indexOf(v186.children, v180), 1);
                end;
                v153:_adjustParentTreeWeight(v186, -l_weight_0);
                v158[v180] = l_parentID_2;
                v153._ownersMap:delete(v180);
                if l_ownerID_0 > 0 then
                    local v188 = v153._ownersMap:get(l_ownerID_0);
                    if v188 ~= nil then
                        v188:delete(v180);
                    end;
                end;
            end;
        elseif l_v159_1 == l_TREE_OPERATION_REORDER_CHILDREN_0 then
            local v189 = v154[v159 + 1];
            local v190 = v154[v159 + 2];
            v159 = v159 + 3;
            if not v153._idToElement:has(v189) then
                error(l_Error_0.new(("Cannot reorder children for node %s because no matching node was found in the Store."):format((tostring(v189)))));
            end;
            local l_children_2 = v153._idToElement:get(v189).children;
            if #l_children_2 ~= v190 then
                error("Children cannot be added or removed during a reorder operation.");
            end;
            for v192 = 1, v190 do
                local v193 = v154[(v159 + v192) - 1];
                l_children_2[v192] = v193;
                if _G.__DEV__ then
                    local v194 = v153._idToElement:get(v193);
                    if not (v194 ~= nil) or v194.parentID ~= v189 then
                        l_console_0.error("Children cannot be added or removed during a reorder operation.");
                    end;
                end;
            end;
            v159 = v159 + v190;
            if _G.__DEBUG__ then
                v31("Re-order", string.format("Node %s children %s", tostring(v189), l_Array_0.join(l_children_2, ",")));
            end;
        elseif l_v159_1 == l_TREE_OPERATION_UPDATE_TREE_BASE_DURATION_0 then
            v159 = v159 + 3;
        else
            error("Unsupported Bridge operation " .. tostring(l_v159_1));
        end;
    end;
    v153._revision = v153._revision + 1;
    if v155 then
        l_v159_1 = v153._supportsProfiling;
        v153._hasOwnerMetadata = false;
        v153._supportsProfiling = false;
        for _, v196 in v153._rootIDToCapabilities, nil, nil do
            local l_hasOwnerMetadata_0 = v196.hasOwnerMetadata;
            local l_supportsProfiling_1 = v196.supportsProfiling;
            if l_hasOwnerMetadata_0 then
                v153._hasOwnerMetadata = true;
            end;
            if l_supportsProfiling_1 then
                v153._supportsProfiling = true;
            end;
        end;
        v153:emit("roots");
        if v153._supportsProfiling ~= l_v159_1 then
            v153:emit("supportsProfiling");
        end;
    end;
    if l___DEBUG___0 then
        l_console_0.log(require(script.Parent.utils).printStore(v153, true));
        l_console_0.groupEnd();
    end;
    v153:emit("mutated", {
        v157, 
        v158
    });
end;
v32.onBridgeOverrideComponentFilters = function(v199, v200)
    v199._componentFilters = v200;
    l_saveComponentFilters_0(v200);
end;
v32.onBridgeShutdown = function(v201)
    if l___DEBUG___0 then
        v31("onBridgeShutdown", "unsubscribing from Bridge");
    end;
    v201._bridge:removeListener("operations", v201.onBridgeOperations);
    v201._bridge:removeListener("shutdown", v201.onBridgeShutdown);
    v201._bridge:removeListener("isBackendStorageAPISupported", v201.onBridgeStorageSupported);
end;
v32.onBridgeStorageSupported = function(v202, v203)
    v202._isBackendStorageAPISupported = v203;
    v202:emit("supportsReloadAndProfile");
end;
v32.onBridgeUnsupportedRendererVersion = function(v204)
    v204._unsupportedRendererVersionDetected = true;
    v204:emit("unsupportedRendererVersionDetected");
end;
return v32;
