local v0 = require(script.Parent.Parent.Parent.Parent.Parent.LuauPolyfill);
local l_Array_0 = v0.Array;
local l_Boolean_0 = v0.Boolean;
local l_Error_0 = v0.Error;
local l_Map_0 = v0.Map;
local l_Number_0 = v0.Number;
local v6 = {};
local l_PROFILER_EXPORT_VERSION_0 = require(script.Parent.Parent.Parent.Parent.constants).PROFILER_EXPORT_VERSION;
local _ = require(script.Parent.Parent.Parent.Parent.backend.types);
local _ = require(script.Parent.types);
local v10 = {
    "var(--color-commit-gradient-0)", 
    "var(--color-commit-gradient-1)", 
    "var(--color-commit-gradient-2)", 
    "var(--color-commit-gradient-3)", 
    "var(--color-commit-gradient-4)", 
    "var(--color-commit-gradient-5)", 
    "var(--color-commit-gradient-6)", 
    "var(--color-commit-gradient-7)", 
    "var(--color-commit-gradient-8)", 
    "var(--color-commit-gradient-9)"
};
v6.prepareProfilingDataFrontendFromBackendAndStore = function(v11, v12, v13)
    local v14 = l_Map_0.new();
    for _, v16 in v11, nil, nil do
        for _, v18 in v16.dataForRoots, nil, nil do
            local l_commitData_0 = v18.commitData;
            local l_displayName_0 = v18.displayName;
            local l_initialTreeBaseDurations_0 = v18.initialTreeBaseDurations;
            local l_interactionCommits_0 = v18.interactionCommits;
            local l_interactions_0 = v18.interactions;
            local l_rootID_0 = v18.rootID;
            local v25 = v12:get(l_rootID_0);
            if v25 == nil then
                error(l_Error_0.new(string.format("Could not find profiling operations for root %s", (tostring(l_rootID_0)))));
            end;
            local v26 = v13:get(l_rootID_0);
            if v26 == nil then
                error(l_Error_0.new(string.format("Could not find profiling snapshots for root %s", (tostring(l_rootID_0)))));
            end;
            v14:set(l_rootID_0, {
                commitData = l_Array_0.map(l_commitData_0, function(v27, _)
                    return {
                        changeDescriptions = if v27.changeDescriptions ~= nil then l_Map_0.new(v27.changeDescriptions) else nil, 
                        duration = v27.duration, 
                        fiberActualDurations = l_Map_0.new(v27.fiberActualDurations), 
                        fiberSelfDurations = l_Map_0.new(v27.fiberSelfDurations), 
                        interactionIDs = v27.interactionIDs, 
                        priorityLevel = v27.priorityLevel, 
                        timestamp = v27.timestamp
                    };
                end), 
                displayName = l_displayName_0, 
                initialTreeBaseDurations = l_Map_0.new(l_initialTreeBaseDurations_0), 
                interactionCommits = l_Map_0.new(l_interactionCommits_0), 
                interactions = l_Map_0.new(l_interactions_0), 
                operations = v25, 
                rootID = l_rootID_0, 
                snapshots = v26
            });
        end;
    end;
    return {
        dataForRoots = v14, 
        imported = false
    };
end;
v6.prepareProfilingDataFrontendFromExport = function(v29)
    local l_version_0 = v29.version;
    if l_version_0 ~= l_PROFILER_EXPORT_VERSION_0 then
        error(string.format("Unsupported profiler export version \"%s\"", (tostring(l_version_0))));
    end;
    local v31 = l_Map_0.new();
    l_Array_0.forEach(v29.dataForRoots, function(v32)
        local l_commitData_1 = v32.commitData;
        local l_displayName_1 = v32.displayName;
        local l_initialTreeBaseDurations_1 = v32.initialTreeBaseDurations;
        local l_interactionCommits_1 = v32.interactionCommits;
        local l_interactions_1 = v32.interactions;
        local l_operations_0 = v32.operations;
        local l_rootID_1 = v32.rootID;
        v31:set(l_rootID_1, {
            commitData = l_Array_0.map(l_commitData_1, function(v40)
                local l_changeDescriptions_0 = v40.changeDescriptions;
                return {
                    changeDescriptions = if l_changeDescriptions_0 ~= nil then l_Map_0.new(l_changeDescriptions_0) else nil, 
                    duration = v40.duration, 
                    fiberActualDurations = l_Map_0.new(v40.fiberActualDurations), 
                    fiberSelfDurations = l_Map_0.new(v40.fiberSelfDurations), 
                    interactionIDs = v40.interactionIDs, 
                    priorityLevel = v40.priorityLevel, 
                    timestamp = v40.timestamp
                };
            end), 
            displayName = l_displayName_1, 
            initialTreeBaseDurations = l_Map_0.new(l_initialTreeBaseDurations_1), 
            interactionCommits = l_Map_0.new(l_interactionCommits_1), 
            interactions = l_Map_0.new(l_interactions_1), 
            operations = l_operations_0, 
            rootID = l_rootID_1, 
            snapshots = l_Map_0.new(v32.snapshots)
        });
    end);
    return {
        dataForRoots = v31, 
        imported = true
    };
end;
v6.prepareProfilingDataExport = function(v42)
    local v43 = {};
    v42.dataForRoots:forEach(function(v44)
        table.insert(v43, {
            commitData = l_Array_0.map(v44.commitData, function(v45)
                local l_changeDescriptions_1 = v45.changeDescriptions;
                return {
                    changeDescriptions = if l_changeDescriptions_1 ~= nil then l_Array_0.from(l_changeDescriptions_1:entries()) else nil, 
                    duration = v45.duration, 
                    fiberActualDurations = l_Array_0.from(v45.fiberActualDurations:entries()), 
                    fiberSelfDurations = l_Array_0.from(v45.fiberSelfDurations:entries()), 
                    interactionIDs = v45.interactionIDs, 
                    priorityLevel = v45.priorityLevel, 
                    timestamp = v45.timestamp
                };
            end), 
            displayName = v44.displayName, 
            initialTreeBaseDurations = l_Array_0.from(v44.initialTreeBaseDurations:entries()), 
            interactionCommits = l_Array_0.from(v44.interactionCommits:entries()), 
            interactions = l_Array_0.from(v44.interactions:entries()), 
            operations = v44.operations, 
            rootID = v44.rootID, 
            snapshots = l_Array_0.from(v44.snapshots:entries())
        });
    end);
    return {
        version = l_PROFILER_EXPORT_VERSION_0, 
        dataForRoots = v43
    };
end;
v6.getGradientColor = function(v47)
    local v48 = #v10;
    local _ = nil;
    return v10[math.round(if not l_Number_0.isNaN(v47) then if l_Number_0.isFinite(v47) then math.max(0, (math.min(v48, v47))) * v48 else v48 else 0)];
end;
v6.formatDuration = function(v50)
    local v51 = math.round(v50 * 10) / 10;
    if not l_Boolean_0.toJSBoolean(v51) then
        return "<0.1";
    else
        return v51;
    end;
end;
v6.formatPercentage = function(v52)
    return (math.round(v52 * 100));
end;
v6.formatTime = function(v53)
    return math.round(math.round(v53) / 100) / 10;
end;
v6.scale = function(v54, v55, v56, v57)
    return function(v58, v59)
        if v55 - v54 == 0 then
            return v59;
        else
            return ((v58 - v54) / (v55 - v54)) * (v57 - v56);
        end;
    end;
end;
return v6;
