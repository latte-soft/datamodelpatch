local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Dash);
local l_class_0 = v1.class;
local l_slice_0 = v1.slice;
local l_filter_0 = v1.filter;
local l_forEach_0 = v1.forEach;
local l_keys_0 = v1.keys;
local l_some_0 = v1.some;
local l_values_0 = v1.values;
local l_concat_0 = table.concat;
local l_insert_0 = table.insert;
local l_sort_0 = table.sort;
local v12 = require(l_Parent_0.RoactInspector.Utils.getSymbol);
local v13 = require(l_Parent_0.RoactInspector.Utils.sanitizeRoactLog);
local _ = require(l_Parent_0.Types);
local v44 = l_class_0("RoactProfiler", function(v15, v16, v17, v18)
    local v19 = {
        active = false, 
        events = {}, 
        rows = {}, 
        instanceEvents = {}, 
        selectedEvents = {}, 
        indent = 0, 
        eventCount = 0, 
        debugInterface = v15, 
        registeredFnProxies = {}, 
        registeredComponents = {}, 
        instanceIndices = {}, 
        nextInstanceIndex = 1, 
        nextEventId = 1, 
        renderTimes = {}, 
        filter = {}, 
        searchTerm = nil, 
        roact = v18, 
        treeWatcher = v16, 
        tree = v17, 
        startTime = 0, 
        profileComponents = {
            sortIndex = nil, 
            sortOrder = nil, 
            columns = {
                "instanceName", 
                "depth", 
                "count", 
                "renderTime", 
                "time"
            }
        }, 
        profileEvents = {
            sortIndex = nil, 
            sortOrder = nil, 
            columns = {
                "startTime", 
                "renderTime", 
                "time", 
                "cause", 
                "details"
            }
        }
    };
    v19.resolveUpdateProxy = function(v20, ...)
        local v21 = debug.traceback();
        local v22 = os.clock();
        local v23 = {
            ...
        };
        local l_v19_0 = v19;
        l_v19_0.indent = l_v19_0.indent + 1;
        l_v19_0 = v20.props;
        local l_state_0 = v20.state;
        local l_status_0, l_result_0 = pcall(function()
            return v20:__resolveUpdateHidden(unpack(v23));
        end);
        if not (not l_status_0 or not l_result_0) then
            local v28 = v20.shouldUpdate == v19.roact.PureComponent.shouldUpdate;
            local v29 = l_state_0 ~= v20.state;
            local v30 = l_v19_0 ~= v20.props;
            l_insert_0(v19.events, {
                instance = v20, 
                depth = v19.indent, 
                renderTime = v19.renderTimes[v19.indent] or 0, 
                startTime = v22, 
                endTime = os.clock(), 
                updateTrace = v21, 
                isPure = v28, 
                oldState = not not v29 and l_state_0 or nil, 
                newState = not not v29 and v20.state or nil, 
                oldProps = not not v30 and l_v19_0 or nil, 
                newProps = not not v30 and v20.props or nil
            });
        end;
        v19.renderTimes[v19.indent] = nil;
        local l_v19_1 = v19;
        l_v19_1.indent = l_v19_1.indent - 1;
        if not l_status_0 then
            warn("Update error during profiling", l_result_0);
        end;
        return l_result_0;
    end;
    v19.mountProxy = function(v32, ...)
        local v33 = os.clock();
        local v34 = debug.traceback();
        local v35 = {
            ...
        };
        local l_v19_2 = v19;
        l_v19_2.indent = l_v19_2.indent + 1;
        local v37;
        l_v19_2, v37 = pcall(function()
            return v32:__mountHidden(unpack(v35));
        end);
        if l_v19_2 then
            l_insert_0(v19.events, {
                depth = v19.indent, 
                instance = v32, 
                renderTime = v19.renderTimes[v19.indent] or 0, 
                startTime = v33, 
                endTime = os.clock(), 
                isMount = true, 
                updateTrace = v34
            });
        end;
        v19.renderTimes[v19.indent] = nil;
        local l_v19_3 = v19;
        l_v19_3.indent = l_v19_3.indent - 1;
        if l_v19_2 then
            return v37;
        else
            warn("Mount error during profiling", v37);
            return false;
        end;
    end;
    v19.renderProxy = function(v39, ...)
        local v40 = os.clock();
        local v41 = {
            ...
        };
        local l_status_1, l_result_1 = pcall(function()
            return v39:__renderHidden(unpack(v41));
        end);
        if l_status_1 then
            v19.renderTimes[v19.indent] = (v19.renderTimes[v19.indent] or 0) + (os.clock() - v40) * 1000;
        end;
        if l_status_1 then
            return l_result_1;
        else
            warn("Render error during profiling", l_result_1);
            return false;
        end;
    end;
    return v19;
end);
v44.getRootNode = function(v45)
    return v12(v45.tree, "InternalData").rootNode;
end;
v44.sortData = function(v46, v47, v48, v49)
    v46[v47].sortIndex = v48;
    v46[v47].sortOrder = v49;
end;
v44.getData = function(v50, v51, v52, v53, v54)
    v50:updateRows();
    local v55 = v50:getComponentRows();
    local v56 = l_slice_0(v50:getEventRows(), v53, v54);
    l_forEach_0(v56, function(v57)
        if not v57.log then
            v57.log = v13(v57.updateTrace);
        end;
    end);
    return {
        componentRows = l_slice_0(v55, v51, v52), 
        eventRows = v56, 
        rowCount = #v55, 
        eventCount = v50.eventCount, 
        instanceEventCount = #v50.selectedEvents
    };
end;
v44.updateRows = function(v58)
    l_forEach_0(v58.events, function(v59)
        local v60 = v58.instanceIndices[v59.instance];
        if not v58.instanceIndices[v59.instance] then
            v60 = v58.nextInstanceIndex;
            v58.instanceIndices[v59.instance] = v58.nextInstanceIndex;
            local l_v58_0 = v58;
            l_v58_0.nextInstanceIndex = l_v58_0.nextInstanceIndex + 1;
        end;
        local v62 = v12(v59.instance, "InternalData");
        local v63 = v62 and v62.virtualNode;
        local v64 = v63 and v58.treeWatcher:getHostNode(v63);
        local v65 = v64 and v58.treeWatcher:getPath(v64.hostObject);
        local v66 = tostring(v60);
        local v67 = v58.rows[v66] or {
            instanceId = v66, 
            count = 0, 
            depth = v59.depth, 
            path = v65, 
            pathString = v65 and "Path: " .. l_concat_0(v65, "."), 
            instanceName = v59.instance.__componentName, 
            time = 0, 
            renderTime = 0
        };
        v58.rows[v66] = v67;
        v67.count = v67.count + 1;
        if not v58.instanceEvents[v66] then
            v58.instanceEvents[v66] = {};
        end;
        l_insert_0(v58.instanceEvents[v66], v58:getEventInfo(v59));
        v67.time = v67.time + (v59.endTime - v59.startTime) * 1000;
        v67.renderTime = v67.renderTime + v59.renderTime;
    end, {});
    v58.eventCount = v58.eventCount + #v58.events;
    v58.events = {};
end;
v44.selectInstance = function(v68, v69)
    v68.selectedEvents = v68.instanceEvents[v69] or {};
end;
v44.getComponentRows = function(v70)
    local v71 = l_values_0(v70.rows);
    if not (not v70.filter and not v70.searchTerm) then
        v71 = l_filter_0(v71, function(v72)
            if not v70.searchTerm or v72.instanceName:lower():find(v70.searchTerm) then
                return not l_some_0(v70.filter, function(v73)
                    return v72.instanceName:find(v73);
                end);
            else
                return false;
            end;
        end);
    end;
    return v70:getSortedData(v71, v70.profileComponents);
end;
v44.getEventRows = function(v74)
    return v74:getSortedData(v74.selectedEvents, v74.profileEvents);
end;
v44.getSortedData = function(v75, v76, v77)
    if v77.sortIndex then
        l_sort_0(v76, function(v78, v79)
            local v80 = v77.columns[v77.sortIndex];
            if v75.profileComponents.sortOrder == Enum.SortDirection.Descending then
                return v78[v80] < v79[v80];
            else
                return v79[v80] < v78[v80];
            end;
        end);
    end;
    return v76;
end;
v44.getEventInfo = function(v81, v82)
    local v83 = "";
    local v84 = "";
    local v85 = "";
    if v82.isMount then
        v83 = "Mount";
    end;
    if v82.oldState then
        v83 = v83 .. "State";
        local v86, v87 = v81:getChangedKeys(v82.oldState, v82.newState);
        v84 = v86;
        v85 = v87;
    end;
    if v82.oldProps then
        v83 = v83 .. "Props";
        local v88, v89 = v81:getChangedKeys(v82.oldProps, v82.newProps);
        v84 = v88;
        v85 = v89;
    end;
    return {
        startTime = v82.startTime - v81.startTime, 
        renderTime = v82.renderTime, 
        time = (v82.endTime - v82.startTime) * 1000, 
        cause = v83, 
        updateTrace = v82.updateTrace, 
        details = v84, 
        detailsTip = v85
    };
end;
v44.getChangedKeys = function(_, v91, v92)
    local v93 = {};
    l_forEach_0(v91, function(v94, v95)
        if v94 ~= v92[v95] then
            v93[tostring(v95)] = true;
        end;
    end);
    l_forEach_0(v92, function(v96, v97)
        if v96 ~= v91[v97] then
            v93[tostring(v97)] = true;
        end;
    end);
    local v98 = l_keys_0(v93);
    local v99 = nil;
    if #v98 == 0 then
        v99 = "No values changed";
    else
        v99 = "";
        l_forEach_0(v98, function(v100)
            v99 = v99 .. ("%s: %s -> %s\n"):format(tostring(v100), tostring(v91[v100]), (tostring(v92[v100])));
        end);
    end;
    return l_concat_0(v98, ", "), v99;
end;
v44.clearData = function(v101)
    v101.events = {};
    v101.eventCount = 0;
    v101.nextInstanceIndex = 0;
    v101.instanceIndices = {};
    v101.renderTimes = {};
    v101.rows = {};
    v101.instanceEvents = {};
    v101.selectedEvents = {};
end;
v44.setActive = function(v102, v103)
    if v102.active == v103 then
        return ;
    else
        v102.active = v103;
        local v104 = v102:getRootNode();
        if not v103 then
            v102:stop(v104);
            return ;
        else
            v102.startTime = os.clock();
            v102:start(v104);
            return ;
        end;
    end;
end;
v44.start = function(v105, v106)
    assert(v105.createElementHidden == nil, "Roact Profiler already started");
    v105.createElementHidden = v105.roact.createElement;
    v105.roact.createElement = function(v107, ...)
        return v105.createElementHidden(v105:registerComponent(v107), ...);
    end;
    v105:registerNode(v106);
end;
v44.registerNode = function(v108, v109)
    v108:registerComponent(v109.currentElement and v109.currentElement.component);
    l_forEach_0(v109.children, function(v110)
        v108:registerNode(v110);
    end);
end;
v44.registerComponent = function(v111, v112)
    if not v111.registeredComponents[v112] then
        if typeof(v112) == "table" then
            v111:registerComponentClass(v112);
        elseif typeof(v112) == "function" then
            v111:registerComponentFn(v112);
        else
            return v112;
        end;
    end;
    return v111.registeredComponents[v112];
end;
v44.registerComponentClass = function(v113, v114)
    v113.registeredComponents[v114] = v114;
    v114.__resolveUpdateHidden = v114.__resolveUpdate;
    v114.__resolveUpdate = v113.resolveUpdateProxy;
    v114.__mountHidden = v114.__mount;
    v114.__mount = v113.mountProxy;
    v114.__renderHidden = v114.render;
    v114.render = v113.renderProxy;
end;
v44.registerComponentFn = function(v115, v116)
    local function v121(...)
        local v117 = os.clock();
        local v118 = {
            ...
        };
        local l_status_2, l_result_2 = pcall(function()
            return v116(unpack(v118));
        end);
        if l_status_2 then
            v115.renderTimes[v115.indent] = (v115.renderTimes[v115.indent] or 0) + (os.clock() - v117) * 1000;
            return l_result_2;
        else
            warn("Render fn error during profiling", l_result_2);
            return false;
        end;
    end;
    v115.registeredComponents[v116] = v121;
    v115.registeredComponents[v121] = v121;
    v115.registeredFnProxies[v121] = v116;
end;
v44.setFilter = function(v122, v123)
    v122.filter = v123;
end;
v44.setSearchTerm = function(v124, v125)
    v124.searchTerm = v125:lower();
end;
v44.stop = function(v126, v127)
    v126.roact.createElement = v126.createElementHidden;
    v126.createElementHidden = nil;
    l_forEach_0(v126.registeredComponents, function(_, v129)
        if typeof(v129) == "table" then
            v129.__mount = v129.__mountHidden;
            v129.__mountHidden = nil;
            v129.__resolveUpdate = v129.__resolveUpdateHidden;
            v129.__resolveUpdateHidden = nil;
            v129.render = v129.__renderHidden;
            v129.__renderHidden = nil;
        end;
    end);
    v126:unregisterNode(v127);
    v126.registeredComponents = {};
    v126.registeredFnProxies = {};
    v126.componentIds = {};
end;
v44.destroy = function(v130)
    v130:setActive(false);
    v130:clearData();
end;
v44.unregisterNode = function(v131, v132)
    local v133 = v132.currentElement and v132.currentElement.component;
    if v131.registeredFnProxies[v133] then
        v132.currentElement.component = v131.registeredFnProxies[v133];
    end;
    l_forEach_0(v132.children, function(v134)
        v131:unregisterNode(v134);
    end);
end;
return v44;
