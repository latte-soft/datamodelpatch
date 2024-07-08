local l_console_0 = require(script.Parent.Parent.Parent.LuauPolyfill).console;
local l_HttpService_0 = game:GetService("HttpService");
local l__G_0 = _G;
local v3 = require(script.Parent.Parent.events);
local _ = function(v4, _)
    return v4;
end;
local v7 = require(script.Parent.Parent.constants);
local l_SESSION_STORAGE_LAST_SELECTION_KEY_0 = v7.SESSION_STORAGE_LAST_SELECTION_KEY;
local l_SESSION_STORAGE_RELOAD_AND_PROFILE_KEY_0 = v7.SESSION_STORAGE_RELOAD_AND_PROFILE_KEY;
local l_SESSION_STORAGE_RECORD_CHANGE_DESCRIPTIONS_KEY_0 = v7.SESSION_STORAGE_RECORD_CHANGE_DESCRIPTIONS_KEY;
local l___DEBUG___0 = v7.__DEBUG__;
local v12 = require(script.Parent.Parent.storage);
local l_sessionStorageGetItem_0 = v12.sessionStorageGetItem;
local l_sessionStorageRemoveItem_0 = v12.sessionStorageRemoveItem;
local l_sessionStorageSetItem_0 = v12.sessionStorageSetItem;
local _ = function(_, _)
end;
local _ = function(_)
end;
local _ = function(_)
end;
local _ = function(_)
end;
local function _()
end;
local _ = require(script.Parent.Parent.bridge);
local _ = require(script.Parent.types);
local _ = require(script.Parent.Parent.types);
local function v30(v29, ...)
    if l___DEBUG___0 then
        print(v29, ...);
    end;
end;
local v31 = setmetatable({}, {
    __index = v3
});
local v32 = {
    __index = v31
};
v31.new = function(v33)
    local v34 = setmetatable(v3.new(), v32);
    v34._bridge = v33;
    v34._isProfiling = false;
    v34._recordChangeDescriptions = false;
    v34._rendererInterfaces = {};
    v34._persistedSelection = nil;
    v34._persistedSelectionMatch = nil;
    v34._traceUpdatesEnabled = false;
    if l_sessionStorageGetItem_0(l_SESSION_STORAGE_RELOAD_AND_PROFILE_KEY_0) == "true" then
        v34._recordChangeDescriptions = l_sessionStorageGetItem_0(l_SESSION_STORAGE_RECORD_CHANGE_DESCRIPTIONS_KEY_0) == "true";
        v34._isProfiling = true;
        l_sessionStorageRemoveItem_0(l_SESSION_STORAGE_RECORD_CHANGE_DESCRIPTIONS_KEY_0);
        l_sessionStorageRemoveItem_0(l_SESSION_STORAGE_RELOAD_AND_PROFILE_KEY_0);
    end;
    local v35 = l_sessionStorageGetItem_0(l_SESSION_STORAGE_LAST_SELECTION_KEY_0);
    if v35 ~= nil then
        v34._persistedSelection = l_HttpService_0.JSONDecode(v35);
    end;
    local function _(v36)
        return function(...)
            v36(v34, ...);
        end;
    end;
    local v38 = "copyElementPath";
    local l_copyElementPath_0 = v34.copyElementPath;
    local l_l_copyElementPath_0_0 = l_copyElementPath_0 --[[ copy: 8 -> 9 ]];
    v33:addListener(v38, function(...)
        l_l_copyElementPath_0_0(v34, ...);
    end);
    v38 = "deletePath";
    l_copyElementPath_0 = v34.deletePath;
    local l_l_copyElementPath_0_1 = l_copyElementPath_0 --[[ copy: 8 -> 10 ]];
    v33:addListener(v38, function(...)
        l_l_copyElementPath_0_1(v34, ...);
    end);
    v38 = "getProfilingData";
    l_copyElementPath_0 = v34.getProfilingData;
    local l_l_copyElementPath_0_2 = l_copyElementPath_0 --[[ copy: 8 -> 11 ]];
    v33:addListener(v38, function(...)
        l_l_copyElementPath_0_2(v34, ...);
    end);
    v38 = "getProfilingStatus";
    l_copyElementPath_0 = v34.getProfilingStatus;
    local l_l_copyElementPath_0_3 = l_copyElementPath_0 --[[ copy: 8 -> 12 ]];
    v33:addListener(v38, function(...)
        l_l_copyElementPath_0_3(v34, ...);
    end);
    v38 = "getOwnersList";
    l_copyElementPath_0 = v34.getOwnersList;
    local l_l_copyElementPath_0_4 = l_copyElementPath_0 --[[ copy: 8 -> 13 ]];
    v33:addListener(v38, function(...)
        l_l_copyElementPath_0_4(v34, ...);
    end);
    v38 = "inspectElement";
    l_copyElementPath_0 = v34.inspectElement;
    local l_l_copyElementPath_0_5 = l_copyElementPath_0 --[[ copy: 8 -> 14 ]];
    v33:addListener(v38, function(...)
        l_l_copyElementPath_0_5(v34, ...);
    end);
    v38 = "logElementToConsole";
    l_copyElementPath_0 = v34.logElementToConsole;
    local l_l_copyElementPath_0_6 = l_copyElementPath_0 --[[ copy: 8 -> 15 ]];
    v33:addListener(v38, function(...)
        l_l_copyElementPath_0_6(v34, ...);
    end);
    v38 = "overrideSuspense";
    l_copyElementPath_0 = v34.overrideSuspense;
    local l_l_copyElementPath_0_7 = l_copyElementPath_0 --[[ copy: 8 -> 16 ]];
    v33:addListener(v38, function(...)
        l_l_copyElementPath_0_7(v34, ...);
    end);
    v38 = "overrideValueAtPath";
    l_copyElementPath_0 = v34.overrideValueAtPath;
    local l_l_copyElementPath_0_8 = l_copyElementPath_0 --[[ copy: 8 -> 17 ]];
    v33:addListener(v38, function(...)
        l_l_copyElementPath_0_8(v34, ...);
    end);
    v38 = "reloadAndProfile";
    l_copyElementPath_0 = v34.reloadAndProfile;
    local l_l_copyElementPath_0_9 = l_copyElementPath_0 --[[ copy: 8 -> 18 ]];
    v33:addListener(v38, function(...)
        l_l_copyElementPath_0_9(v34, ...);
    end);
    v38 = "renamePath";
    l_copyElementPath_0 = v34.renamePath;
    local l_l_copyElementPath_0_10 = l_copyElementPath_0 --[[ copy: 8 -> 19 ]];
    v33:addListener(v38, function(...)
        l_l_copyElementPath_0_10(v34, ...);
    end);
    v38 = "setTraceUpdatesEnabled";
    l_copyElementPath_0 = v34.setTraceUpdatesEnabled;
    local l_l_copyElementPath_0_11 = l_copyElementPath_0 --[[ copy: 8 -> 20 ]];
    v33:addListener(v38, function(...)
        l_l_copyElementPath_0_11(v34, ...);
    end);
    v38 = "startProfiling";
    l_copyElementPath_0 = v34.startProfiling;
    local l_l_copyElementPath_0_12 = l_copyElementPath_0 --[[ copy: 8 -> 21 ]];
    v33:addListener(v38, function(...)
        l_l_copyElementPath_0_12(v34, ...);
    end);
    v38 = "stopProfiling";
    l_copyElementPath_0 = v34.stopProfiling;
    local l_l_copyElementPath_0_13 = l_copyElementPath_0 --[[ copy: 8 -> 22 ]];
    v33:addListener(v38, function(...)
        l_l_copyElementPath_0_13(v34, ...);
    end);
    v38 = "storeAsGlobal";
    l_copyElementPath_0 = v34.storeAsGlobal;
    local l_l_copyElementPath_0_14 = l_copyElementPath_0 --[[ copy: 8 -> 23 ]];
    v33:addListener(v38, function(...)
        l_l_copyElementPath_0_14(v34, ...);
    end);
    v38 = "syncSelectionFromNativeElementsPanel";
    l_copyElementPath_0 = v34.syncSelectionFromNativeElementsPanel;
    local l_l_copyElementPath_0_15 = l_copyElementPath_0 --[[ copy: 8 -> 24 ]];
    v33:addListener(v38, function(...)
        l_l_copyElementPath_0_15(v34, ...);
    end);
    v38 = "shutdown";
    l_copyElementPath_0 = v34.shutdown;
    local l_l_copyElementPath_0_16 = l_copyElementPath_0 --[[ copy: 8 -> 25 ]];
    v33:addListener(v38, function(...)
        l_l_copyElementPath_0_16(v34, ...);
    end);
    v38 = "updateConsolePatchSettings";
    l_copyElementPath_0 = v34.updateConsolePatchSettings;
    local l_l_copyElementPath_0_17 = l_copyElementPath_0 --[[ copy: 8 -> 26 ]];
    v33:addListener(v38, function(...)
        l_l_copyElementPath_0_17(v34, ...);
    end);
    v38 = "updateComponentFilters";
    l_copyElementPath_0 = v34.updateComponentFilters;
    local l_l_copyElementPath_0_18 = l_copyElementPath_0 --[[ copy: 8 -> 27 ]];
    v33:addListener(v38, function(...)
        l_l_copyElementPath_0_18(v34, ...);
    end);
    v38 = "viewAttributeSource";
    l_copyElementPath_0 = v34.viewAttributeSource;
    local l_l_copyElementPath_0_19 = l_copyElementPath_0 --[[ copy: 8 -> 28 ]];
    v33:addListener(v38, function(...)
        l_l_copyElementPath_0_19(v34, ...);
    end);
    v38 = "viewElementSource";
    l_copyElementPath_0 = v34.viewElementSource;
    local l_l_copyElementPath_0_20 = l_copyElementPath_0 --[[ copy: 8 -> 29 ]];
    v33:addListener(v38, function(...)
        l_l_copyElementPath_0_20(v34, ...);
    end);
    v38 = "overrideContext";
    l_copyElementPath_0 = v34.overrideContext;
    local l_l_copyElementPath_0_21 = l_copyElementPath_0 --[[ copy: 8 -> 30 ]];
    v33:addListener(v38, function(...)
        l_l_copyElementPath_0_21(v34, ...);
    end);
    v38 = "overrideHookState";
    l_copyElementPath_0 = v34.overrideHookState;
    local l_l_copyElementPath_0_22 = l_copyElementPath_0 --[[ copy: 8 -> 31 ]];
    v33:addListener(v38, function(...)
        l_l_copyElementPath_0_22(v34, ...);
    end);
    v38 = "overrideProps";
    l_copyElementPath_0 = v34.overrideProps;
    local l_l_copyElementPath_0_23 = l_copyElementPath_0 --[[ copy: 8 -> 32 ]];
    v33:addListener(v38, function(...)
        l_l_copyElementPath_0_23(v34, ...);
    end);
    v38 = "overrideState";
    l_copyElementPath_0 = v34.overrideState;
    v33:addListener(v38, function(...)
        l_copyElementPath_0(v34, ...);
    end);
    if v34._isProfiling then
        v33:send("profilingStatus", true);
    end;
    v33:send("isBackendStorageAPISupported", true);
    return v34;
end;
v31.getRendererInterfaces = function(v64)
    return v64._rendererInterfaces;
end;
v31.copyElementPath = function(v65, v66)
    local l_id_0 = v66.id;
    local l_path_0 = v66.path;
    local l_rendererID_0 = v66.rendererID;
    local v70 = v65._rendererInterfaces[l_rendererID_0];
    if v70 == nil then
        l_console_0.warn(string.format("Invalid renderer id \"%d\" for element \"%d\"", l_rendererID_0, l_id_0));
        return ;
    else
        v70.copyElementPath(l_id_0, l_path_0);
        return ;
    end;
end;
v31.deletePath = function(v71, v72)
    local l_hookID_0 = v72.hookID;
    local l_id_1 = v72.id;
    local l_path_1 = v72.path;
    local l_rendererID_1 = v72.rendererID;
    local l_type_0 = v72.type;
    local v78 = v71._rendererInterfaces[l_rendererID_1];
    if v78 == nil then
        l_console_0.warn(string.format("Invalid renderer id \"%d\" for element \"%d\"", l_rendererID_1, l_id_1));
        return ;
    else
        v78.deletePath(l_type_0, l_id_1, l_hookID_0, l_path_1);
        return ;
    end;
end;
v31.getInstanceAndStyle = function(v79, v80)
    local l_id_2 = v80.id;
    local l_rendererID_2 = v80.rendererID;
    local v83 = v79._rendererInterfaces[l_rendererID_2];
    if v83 == nil then
        l_console_0.warn(string.format("Invalid renderer id \"%d\"", l_rendererID_2));
        return nil;
    else
        return v83.getInstanceAndStyle(l_id_2);
    end;
end;
v31.getIDForNode = function(v84, v85)
    for _, v87 in v84._rendererInterfaces, nil, nil do
        local l_status_0, l_result_0 = pcall(v87.getFiberIDForNative, v85, true);
        if l_status_0 and l_result_0 ~= nil then
            return l_result_0;
        end;
    end;
    return nil;
end;
v31.getProfilingData = function(v90, v91)
    local l_rendererID_3 = v91.rendererID;
    local v93 = v90._rendererInterfaces[l_rendererID_3];
    if v93 == nil then
        l_console_0.warn(string.format("Invalid renderer id \"%d\"", l_rendererID_3));
    end;
    v90._bridge:send("profilingData", v93.getProfilingData());
end;
v31.getProfilingStatus = function(v94)
    v94._bridge:send("profilingStatus", v94._isProfiling);
end;
v31.getOwnersList = function(v95, v96)
    local l_id_3 = v96.id;
    local l_rendererID_4 = v96.rendererID;
    local v99 = v95._rendererInterfaces[l_rendererID_4];
    if v99 == nil then
        l_console_0.warn(string.format("Invalid renderer id \"%d\" for element \"%d\"", l_rendererID_4, l_id_3));
        return ;
    else
        v95._bridge:send("ownersList", {
            id = l_id_3, 
            owners = v99.getOwnersList(l_id_3)
        });
        return ;
    end;
end;
v31.inspectElement = function(v100, v101)
    local l_id_4 = v101.id;
    local l_path_2 = v101.path;
    local l_rendererID_5 = v101.rendererID;
    local v105 = v100._rendererInterfaces[l_rendererID_5];
    if v105 == nil then
        l_console_0.warn(string.format("Invalid renderer id \"%d\" for element \"%d\"", l_rendererID_5, l_id_4));
        return ;
    else
        v100._bridge:send("inspectedElement", v105.inspectElement(l_id_4, l_path_2));
        if not (v100._persistedSelectionMatch ~= nil) or v100._persistedSelectionMatch.id ~= l_id_4 then
            v100._persistedSelection = nil;
            v100._persistedSelectionMatch = nil;
            v105.setTrackedPath(nil);
            v100:_throttledPersistSelection(l_rendererID_5, l_id_4);
        end;
        return ;
    end;
end;
v31.logElementToConsole = function(v106, v107)
    local l_id_5 = v107.id;
    local l_rendererID_6 = v107.rendererID;
    local v110 = v106._rendererInterfaces[l_rendererID_6];
    if v110 == nil then
        l_console_0.warn(string.format("Invalid renderer id \"%d\" for element \"%d\"", l_rendererID_6, l_id_5));
        return ;
    else
        v110.logElementToConsole(l_id_5);
        return ;
    end;
end;
v31.overrideSuspense = function(v111, v112)
    local l_id_6 = v112.id;
    local l_rendererID_7 = v112.rendererID;
    local l_forceFallback_0 = v112.forceFallback;
    local v116 = v111._rendererInterfaces[l_rendererID_7];
    if v116 == nil then
        l_console_0.warn(string.format("Invalid renderer id \"%d\" for element \"%d\"", l_rendererID_7, l_id_6));
        return ;
    else
        v116.overrideSuspense(l_id_6, l_forceFallback_0);
        return ;
    end;
end;
v31.overrideValueAtPath = function(v117, v118)
    local l_hookID_1 = v118.hookID;
    local l_id_7 = v118.id;
    local l_path_3 = v118.path;
    local l_rendererID_8 = v118.rendererID;
    local l_type_1 = v118.type;
    local l_value_0 = v118.value;
    local v125 = v117._rendererInterfaces[l_rendererID_8];
    if v125 == nil then
        l_console_0.warn(string.format("Invalid renderer id \"%d\" for element \"%d\"", l_rendererID_8, l_id_7));
        return ;
    else
        v125.overrideValueAtPath(l_type_1, l_id_7, l_hookID_1, l_path_3, l_value_0);
        return ;
    end;
end;
v31.overrideContext = function(v126, v127)
    local l_id_8 = v127.id;
    local l_path_4 = v127.path;
    local l_rendererID_9 = v127.rendererID;
    local l_wasForwarded_0 = v127.wasForwarded;
    local l_value_1 = v127.value;
    if not l_wasForwarded_0 then
        v126:overrideValueAtPath({
            id = l_id_8, 
            path = l_path_4, 
            rendererID = l_rendererID_9, 
            type = "context", 
            value = l_value_1
        });
    end;
end;
v31.overrideHookState = function(v133, v134)
    local l_id_9 = v134.id;
    local _ = v134.hookID;
    local l_path_5 = v134.path;
    local l_rendererID_10 = v134.rendererID;
    local l_wasForwarded_1 = v134.wasForwarded;
    local l_value_2 = v134.value;
    if not l_wasForwarded_1 then
        v133:overrideValueAtPath({
            id = l_id_9, 
            path = l_path_5, 
            rendererID = l_rendererID_10, 
            type = "hooks", 
            value = l_value_2
        });
    end;
end;
v31.overrideProps = function(v141, v142)
    local l_id_10 = v142.id;
    local l_path_6 = v142.path;
    local l_rendererID_11 = v142.rendererID;
    local l_wasForwarded_2 = v142.wasForwarded;
    local l_value_3 = v142.value;
    if not l_wasForwarded_2 then
        v141:overrideValueAtPath({
            id = l_id_10, 
            path = l_path_6, 
            rendererID = l_rendererID_11, 
            type = "props", 
            value = l_value_3
        });
    end;
end;
v31.overrideState = function(v148, v149)
    local l_id_11 = v149.id;
    local l_path_7 = v149.path;
    local l_rendererID_12 = v149.rendererID;
    local l_wasForwarded_3 = v149.wasForwarded;
    local l_value_4 = v149.value;
    if not l_wasForwarded_3 then
        v148:overrideValueAtPath({
            id = l_id_11, 
            path = l_path_7, 
            rendererID = l_rendererID_12, 
            type = "state", 
            value = l_value_4
        });
    end;
end;
v31.reloadAndProfile = function(v155, v156)
    l_sessionStorageSetItem_0(l_SESSION_STORAGE_RELOAD_AND_PROFILE_KEY_0, "true");
    l_sessionStorageSetItem_0(l_SESSION_STORAGE_RECORD_CHANGE_DESCRIPTIONS_KEY_0, not v156 and "false" or "true");
    v155._bridge:send("reloadAppForProfiling");
end;
v31.renamePath = function(v157, v158)
    local l_hookID_3 = v158.hookID;
    local l_id_12 = v158.id;
    local l_newPath_0 = v158.newPath;
    local l_oldPath_0 = v158.oldPath;
    local l_rendererID_13 = v158.rendererID;
    local l_type_2 = v158.type;
    local v165 = v157._rendererInterfaces[l_rendererID_13];
    if v165 == nil then
        l_console_0.warn(string.format("Invalid renderer id \"%d\" for element \"%d\"", l_rendererID_13, l_id_12));
        return ;
    else
        v165.renamePath(l_type_2, l_id_12, l_hookID_3, l_oldPath_0, l_newPath_0);
        return ;
    end;
end;
v31.selectNode = function(v166, v167)
    local v168 = v166:getIDForNode(v167);
    if v168 ~= nil then
        v166._bridge:send("selectFiber", v168);
    end;
end;
v31.setRendererInterface = function(v169, v170, v171)
    v169._rendererInterfaces[v170] = v171;
    if v169._isProfiling then
        v171.startProfiling(v169._recordChangeDescriptions);
    end;
    v171.setTraceUpdatesEnabled(v169._traceUpdatesEnabled);
    local l__persistedSelection_0 = v169._persistedSelection;
    if l__persistedSelection_0 ~= nil and l__persistedSelection_0.rendererID == v170 then
        v171.setTrackedPath(l__persistedSelection_0.path);
    end;
end;
v31.setTraceUpdatesEnabled = function(v173, v174)
    v173._traceUpdatesEnabled = v174;
    for _, v176 in v173._rendererInterfaces, nil, nil do
        v176.setTraceUpdatesEnabled(v174);
    end;
end;
v31.syncSelectionFromNativeElementsPanel = function(v177)
    local v178 = l__G_0.__REACT_DEVTOOLS_GLOBAL_HOOK__["$0"];
    if v178 == nil then
        return ;
    else
        v177:selectNode(v178);
        return ;
    end;
end;
v31.shutdown = function(v179)
    v179:emit("shutdown");
end;
v31.startProfiling = function(v180, v181)
    v180._recordChangeDescriptions = v181;
    v180._isProfiling = true;
    for _, v183 in v180._rendererInterfaces, nil, nil do
        v183.startProfiling(v181);
    end;
    v180._bridge:send("profilingStatus", v180._isProfiling);
end;
v31.stopProfiling = function(v184)
    v184._isProfiling = false;
    v184._recordChangeDescriptions = false;
    for _, v186 in v184._rendererInterfaces, nil, nil do
        v186.stopProfiling();
    end;
    v184._bridge:send("profilingStatus", v184._isProfiling);
end;
v31.storeAsGlobal = function(v187, v188)
    local l_count_0 = v188.count;
    local l_id_13 = v188.id;
    local l_path_8 = v188.path;
    local l_rendererID_14 = v188.rendererID;
    local v193 = v187._rendererInterfaces[l_rendererID_14];
    if v193 == nil then
        l_console_0.warn(string.format("Invalid renderer id \"%d\" for element \"%d\"", l_rendererID_14, l_id_13));
        return ;
    else
        v193.storeAsGlobal(l_id_13, l_path_8, l_count_0);
        return ;
    end;
end;
v31.updateConsolePatchSettings = function(_, v195)
    local l_appendComponentStack_0 = v195.appendComponentStack;
    local l_breakOnConsoleErrors_0 = v195.breakOnConsoleErrors;
    if not l_appendComponentStack_0 and not l_breakOnConsoleErrors_0 then
        return ;
    else
        local _ = {
            appendComponentStack = l_appendComponentStack_0, 
            breakOnConsoleErrors = l_breakOnConsoleErrors_0
        };
        return ;
    end;
end;
v31.updateComponentFilters = function(v199, v200)
    for _, v202 in v199._rendererInterfaces, nil, nil do
        v202.updateComponentFilters(v200);
    end;
end;
v31.viewAttributeSource = function(v203, v204)
    local l_id_14 = v204.id;
    local l_path_9 = v204.path;
    local l_rendererID_15 = v204.rendererID;
    local v208 = v203._rendererInterfaces[l_rendererID_15];
    if v208 == nil then
        l_console_0.warn(string.format("Invalid renderer id \"%d\" for element \"%d\"", l_rendererID_15, l_id_14));
        return ;
    else
        v208.prepareViewAttributeSource(l_id_14, l_path_9);
        return ;
    end;
end;
v31.viewElementSource = function(v209, v210)
    local l_id_15 = v210.id;
    local l_rendererID_16 = v210.rendererID;
    local v213 = v209._rendererInterfaces[l_rendererID_16];
    if v213 == nil then
        l_console_0.warn(string.format("Invalid renderer id \"%d\" for element \"%d\"", l_rendererID_16, l_id_15));
        return ;
    else
        v213.prepareViewElementSource(l_id_15);
        return ;
    end;
end;
v31.onTraceUpdates = function(v214, v215)
    v214:emit("traceUpdates", v215);
end;
v31.onHookOperations = function(v216, v217)
    if l__G_0.__DEBUG__ then
        v30("onHookOperations", v217);
    end;
    v216._bridge:send("operations", v217);
    if v216._persistedSelection ~= nil then
        local v218 = v217[1];
        if v216._persistedSelection.rendererID == v218 then
            local v219 = v216._rendererInterfaces[v218];
            if v219 == nil then
                l_console_0.warn(string.format("Invalid renderer id \"%d\"", v218));
                return ;
            else
                local l__persistedSelectionMatch_0 = v216._persistedSelectionMatch;
                local v221 = v219.getBestMatchForTrackedPath();
                v216._persistedSelectionMatch = v221;
                local v222 = if l__persistedSelectionMatch_0 ~= nil then l__persistedSelectionMatch_0.id else nil;
                local v223 = if v221 ~= nil then v221.id else nil;
                if v222 ~= v223 and v223 ~= nil then
                    v216._bridge:send("selectFiber", v223);
                end;
                if not (not (v221 ~= nil) or not v221.isFullMatch) then
                    v216._persistedSelection = nil;
                    v216._persistedSelectionMatch = nil;
                    v219.setTrackedPath(nil);
                end;
            end;
        end;
    end;
end;
v31.onUnsupportedRenderer = function(v224, v225)
    v224._bridge:send("unsupportedRendererVersion", v225);
end;
v31._throttledPersistSelection = function(v226, v227, v228)
    local v229 = v226._rendererInterfaces[v227];
    local v230 = if v229 ~= nil then v229.getPathForElement(v228) else nil;
    if v230 ~= nil then
        l_sessionStorageSetItem_0(l_SESSION_STORAGE_LAST_SELECTION_KEY_0, l_HttpService_0:JSONEncode({
            rendererID = v227, 
            path = v230
        }));
        return ;
    else
        l_sessionStorageRemoveItem_0(l_SESSION_STORAGE_LAST_SELECTION_KEY_0);
        return ;
    end;
end;
return v31;
