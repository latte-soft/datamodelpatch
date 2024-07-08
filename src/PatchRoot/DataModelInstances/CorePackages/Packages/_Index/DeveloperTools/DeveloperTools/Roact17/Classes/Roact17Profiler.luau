local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Dash);
local l_class_0 = v1.class;
local l_slice_0 = v1.slice;
local l_filter_0 = v1.filter;
local l_forEach_0 = v1.forEach;
local l_pretty_0 = v1.pretty;
local l_reverse_0 = v1.reverse;
local l_some_0 = v1.some;
local l_find_0 = v1.find;
local l_concat_0 = table.concat;
local l_insert_0 = table.insert;
local l_sort_0 = table.sort;
local _ = require(l_Parent_0.Types);
local _ = require(l_Parent_0.Roact17.types);
local v16 = l_class_0("Roact17Profiler", function(v15)
    return {
        active = false, 
        devtools = v15.devtools, 
        root = v15.root, 
        rows = {}, 
        instanceEvents = {}, 
        selectedEvents = {}, 
        commitCount = 0, 
        eventCount = 0, 
        worker = v15, 
        currentEvents = {}, 
        filter = {}, 
        searchTerm = nil, 
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
        }, 
        slices = {
            componentSliceStart = -1, 
            componentSliceEnd = -1, 
            eventSliceStart = -1, 
            eventSliceEnd = -1
        }
    };
end);
v16._init = function(v17)
    v17.devtools.bridge:addListener("profilingData", function(v18)
        v17:updateRows(v18);
    end);
end;
v16.sortData = function(v19, v20, v21, v22)
    v19[v20].sortIndex = v21;
    v19[v20].sortOrder = v22;
end;
v16.getData = function(v23, v24)
    v23.slices = v24;
    local l_status_0, l_result_0 = pcall(function()
        v23.devtools.agent:getProfilingData({
            rendererID = v23.devtools.store:getRendererIDForElement(v23.root)
        });
    end);
    if not (l_status_0 or l_result_0:find("getProfilingData%(%) called before any profiling data was recorded")) then
        warn(l_result_0);
    end;
end;
v16.updateRows = function(v27, v28)
    local v30 = l_find_0(v28.dataForRoots, function(v29)
        return v29.rootID == v27.root;
    end);
    if v30 then
        local v31 = v27.worker:getHostInstance(v27.root);
        local l_commitData_0 = v30.commitData;
        while v27.commitCount < #l_commitData_0 do
            v27.commitCount = v27.commitCount + 1;
            local v33 = l_commitData_0[v27.commitCount];
            l_forEach_0(v33.changeDescriptions, function(v34)
                local v35 = v34[1];
                local v36 = v27.devtools.store:getElementByID(v35);
                local v37 = v34[2];
                local v38 = v27.worker:getHostNode(v35);
                local v39 = if not v38 then nil else v27.worker:getHostInstance(v38.id);
                local v40 = if not v39 then nil else v27.worker:getPath(v39);
                local v41 = nil;
                if not v40 then
                    v41 = "Unknown";
                else
                    local v42 = {};
                    while v39 ~= nil and v39 ~= v31 do
                        l_insert_0(v42, v39.Name);
                        v39 = v39.Parent;
                    end;
                    l_insert_0(v42, v31.Name);
                    v41 = l_concat_0(l_reverse_0(v42), ".");
                end;
                local v43 = not v36 and "Unknown" or v36.displayName;
                if (v36 and #v36.key > 0) and v36.key ~= v36.displayName then
                    v43 = ("%s: %s"):format(v36.key, v43);
                end;
                local v44 = v27.rows[v35] or {
                    instanceId = v35, 
                    count = 0, 
                    depth = not v40 and 0 or #v40, 
                    path = v40 or {}, 
                    pathString = v41, 
                    instanceName = v43, 
                    time = 0, 
                    renderTime = 0
                };
                v27.rows[v35] = v44;
                local l_v27_0 = v27;
                l_v27_0.eventCount = l_v27_0.eventCount + 1;
                v44.count = v44.count + 1;
                if not v27.instanceEvents[v35] then
                    v27.instanceEvents[v35] = {};
                end;
                l_v27_0 = {};
                if not v37.isFirstMount then
                    if v37.props then
                        l_insert_0(l_v27_0, "props");
                    end;
                    if v37.state then
                        l_insert_0(l_v27_0, "state");
                    end;
                else
                    l_insert_0(l_v27_0, "mount");
                end;
                local v46 = (not v37.props and "" or l_pretty_0(v37.props)) .. " " .. (not v37.state and "" or l_pretty_0(v37.state));
                local v47 = {
                    startTime = v33.timestamp, 
                    renderTime = 0, 
                    time = 0, 
                    cause = l_concat_0(l_v27_0, ", "), 
                    updateTrace = "", 
                    log = "", 
                    details = v46, 
                    detailsTip = v46
                };
                v27.currentEvents[v35] = v47;
                l_insert_0(v27.instanceEvents[v35], v47);
            end);
            l_forEach_0(v33.fiberActualDurations, function(v48)
                local v49 = v48[1];
                local v50 = v27.currentEvents[v49];
                if v50 then
                    v50.time = v50.time + v48[2];
                    local v51 = v27.rows[v49];
                    v51.time = v51.time + v48[2];
                    return ;
                else
                    return ;
                end;
            end);
            l_forEach_0(v33.fiberSelfDurations, function(v52)
                local v53 = v52[1];
                local v54 = v27.currentEvents[v53];
                if v54 then
                    v54.renderTime = v54.renderTime + v52[2];
                    local v55 = v27.rows[v53];
                    v55.renderTime = v55.renderTime + v52[2];
                    return ;
                else
                    return ;
                end;
            end);
            for v56 in pairs(v27.currentEvents) do
                v27.currentEvents[v56] = nil;
            end;
        end;
        local v57 = v27:getComponentRows();
        v27.worker:showProfileData({
            componentRows = l_slice_0(v57, v27.slices.componentSliceStart, v27.slices.componentSliceEnd), 
            eventRows = l_slice_0(v27:getEventRows(), v27.slices.eventSliceStart, v27.slices.eventSliceEnd), 
            rowCount = #v57, 
            eventCount = v27.eventCount, 
            instanceEventCount = #v27.selectedEvents
        });
        return ;
    else
        return ;
    end;
end;
v16.selectInstance = function(v58, v59)
    v58.instanceEvents[v59] = v58.instanceEvents[v59] or {};
    v58.selectedEvents = v58.instanceEvents[v59];
end;
v16.getComponentRows = function(v60)
    local v61 = {};
    for _, v63 in pairs(v60.rows) do
        l_insert_0(v61, v63);
    end;
    if not (not v60.filter and not v60.searchTerm) then
        v61 = l_filter_0(v61, function(v64)
            if not v60.searchTerm or v64.instanceName:lower():find(v60.searchTerm) then
                return not l_some_0(v60.filter, function(v65)
                    return v64.instanceName:find(v65);
                end);
            else
                return false;
            end;
        end);
    end;
    return v60:getSortedData(v61, v60.profileComponents);
end;
v16.getEventRows = function(v66)
    return v66:getSortedData(v66.selectedEvents, v66.profileEvents);
end;
v16.getSortedData = function(v67, v68, v69)
    if v69.sortIndex then
        l_sort_0(v68, function(v70, v71)
            local v72 = v69.columns[v69.sortIndex];
            if v67.profileComponents.sortOrder == Enum.SortDirection.Descending then
                return v70[v72] < v71[v72];
            else
                return v71[v72] < v70[v72];
            end;
        end);
    end;
    return v68;
end;
v16.setSearchTerm = function(v73, v74)
    v73.searchTerm = v74:lower();
end;
v16.clearData = function(v75)
    v75.events = {};
    v75.eventCount = 0;
    v75.commitCount = 0;
    v75.rows = {};
    v75.instanceEvents = {};
    v75.selectedEvents = {};
end;
v16.setActive = function(v76, v77)
    if v76.active == v77 then
        return ;
    else
        v76.active = v77;
        if not v77 then
            v76.devtools.agent:stopProfiling(true);
            return ;
        else
            v76.devtools.agent:startProfiling(true);
            return ;
        end;
    end;
end;
v16.destroy = function(v78)
    v78:setActive(false);
    v78:clearData();
end;
return v16;
