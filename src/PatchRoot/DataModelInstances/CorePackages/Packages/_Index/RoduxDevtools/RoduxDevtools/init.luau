local v0 = {
    __className = "Devtools"
};
v0.__index = v0;
v0.new = function()
    local v1 = setmetatable({
        _events = table.create(100), 
        _eventsIndex = 0, 
        _pluginBridge = nil, 
        _pluginBridgeListener = nil, 
        _pluginBridgeBatchPackets = {}, 
        _pluginBridgeBatchProcess = nil, 
        _source = debug.traceback()
    }, v0);
    v1:_findPluginBridge(function(v2)
        v1:_connectPluginBridge(v2);
    end);
    return v1;
end;
v0._findPluginBridge = function(v3, v4)
    if not v3._pluginBridge then
        local v5 = workspace.CurrentCamera or workspace;
        local l___RoduxDevtoolsPluginBridge_0 = v5:FindFirstChild("__RoduxDevtoolsPluginBridge");
        if not l___RoduxDevtoolsPluginBridge_0 or not l___RoduxDevtoolsPluginBridge_0:IsA("BindableEvent") then
            task.defer(function()
                local v7 = v5:WaitForChild("__RoduxDevtoolsPluginBridge", 10);
                if v3._events == nil then
                    return ;
                elseif not v7 or not v7:IsA("BindableEvent") then
                    return ;
                else
                    v3._pluginBridge = v7;
                    v4(v7);
                    return ;
                end;
            end);
            return ;
        else
            v3._pluginBridge = l___RoduxDevtoolsPluginBridge_0;
            v4(l___RoduxDevtoolsPluginBridge_0);
            return ;
        end;
    else
        v4(v3._pluginBridge);
        return ;
    end;
end;
v0._connectPluginBridge = function(v8, v9)
    if v9 then
        if v8._pluginBridgeListener then
            v8._pluginBridgeListener:Disconnect();
            v8._pluginBridgeListener = nil;
        end;
        if v8._pluginBridgeBatchProcess then
            v8._pluginBridgeBatchProcess:Disconnect();
            v8._pluginBridgeBatchProcess = nil;
        end;
        v8._pluginBridgeListener = v9.Event:Connect(function(v10, ...)
            if v10 == "DevtoolsCall" then
                local v11 = {
                    ...
                };
                local v12 = v8[v11[1]];
                if v12 then
                    table.remove(v11, 1);
                    pcall(v12, v8, table.unpack(v11));
                else
                    return ;
                end;
            end;
        end);
        v8._pluginBridgeBatchProcess = game:GetService("RunService").Heartbeat:Connect(function()
            if next(v8._pluginBridgeBatchPackets) == nil then
                return ;
            else
                v9:Fire("PluginBatchPackets", v8._pluginBridgeBatchPackets);
                table.clear(v8._pluginBridgeBatchPackets);
                return ;
            end;
        end);
        if #v8._events > 0 then
            local v13 = {};
            for v14, v15 in v8._events, nil, nil do
                v13[v14] = {
                    isStub = true, 
                    eventType = v15.eventType, 
                    props = {
                        elapsedMs = v15.props.elapsedMs, 
                        name = v15.props.name
                    }
                };
            end;
            v8:_firePluginBridge("updateEvents", v13);
        end;
        return ;
    else
        return ;
    end;
end;
v0._firePluginBridge = function(v16, v17, v18)
    if v16._pluginBridge then
        table.insert(v16._pluginBridgeBatchPackets, {
            type = v17, 
            props = v18
        });
        return ;
    else
        return ;
    end;
end;
v0._hookIntoStore = function(v19, v20)
    v19._store = v20;
    local v21 = string.split(debug.traceback(), "\n");
    v19._source = v21[1];
    for _, v23 in v21, nil, nil do
        if not (string.find(v23, "RoduxDevtools.-hookIntoStore") or string.find(v23, "Store.-new")) then
            v19._source = v23;
            break;
        end;
    end;
    v19._originalReducer = v20._reducer;
    v20._reducer = function(v24, v25)
        local v26 = os.clock();
        local v27 = v19._originalReducer(v24, v25);
        v19:_addEvent("Reduce", {
            name = v25.type or tostring(v25), 
            elapsedMs = (os.clock() - v26) * 1000, 
            action = v25, 
            state = v27
        });
        return v27;
    end;
    v19._originalFlushHandler = v20._flushHandler;
    v20._flushHandler = function(...)
        local v28 = os.clock();
        v19._originalFlushHandler(...);
        v19:_addEvent("Flush", {
            name = "@@FLUSH", 
            elapsedMs = (os.clock() - v28) * 1000, 
            listenerCount = #v20.changed._listeners, 
            listeners = table.clone(v20.changed._listeners)
        });
    end;
end;
v0._addEvent = function(v29, v30, v31)
    local v32 = {
        eventType = v30, 
        source = v29._source, 
        timestamp = DateTime.now().UnixTimestampMillis, 
        props = v31
    };
    local v33 = nil;
    for v34 = v29._eventsIndex or 0, 1, -1 do
        local v35 = v29._events[v34];
        if v35.props.state then
            v33 = v35.props.state;
            break;
        end;
    end;
    v32.props.lastState = v33;
    v29._eventsIndex = (v29._eventsIndex or 0) + 1;
    v29._events[v29._eventsIndex] = v32;
    v29:_firePluginBridge("updateEvent", {
        index = v29._eventsIndex, 
        event = {
            isStub = true, 
            eventType = v30, 
            props = {
                elapsedMs = v32.props.elapsedMs, 
                name = v32.props.name
            }
        }
    });
end;
v0._fillPluginStubAtIndex = function(v36, v37)
    local v38 = v36._events[v37];
    if v38 then
        v36:_firePluginBridge("updateEvent", {
            index = v37, 
            event = v38
        });
        return ;
    else
        return ;
    end;
end;
v0._setState = function(v39, v40, v41)
    if not v41 then
        v41 = v39._store._state;
    end;
    v39._store._state = v40;
    v39._store._lastState = v41;
    v39._store._mutatedSinceFlush = true;
end;
v0.Clear = function(v42)
    v42._eventsIndex = 0;
    v42._events = table.create(100);
end;
v0.Destroy = function(v43)
    if v43._pluginBridgeListener then
        v43._pluginBridgeListener:Disconnect();
    end;
    if v43._pluginBridgeBatchProcess then
        v43._pluginBridgeBatchProcess:Disconnect();
    end;
    v43:Clear();
    table.clear(v43);
    setmetatable(v43, nil);
end;
v0.GetLoggedEvents = function(v44)
    return table.clone(v44._events);
end;
v0.GetLoggedEventsOfType = function(v45, v46)
    local v47 = {};
    local v48 = 0;
    for _, v50 in v45._events, nil, nil do
        if v50.eventType == v46 then
            v48 = v48 + 1;
            v47[v48] = v50;
        end;
    end;
    return v47;
end;
v0.GetReducedActionsOfType = function(v51, v52)
    local v53 = {};
    local v54 = 0;
    for _, v56 in v51._events, nil, nil do
        if type(v56.props.action) == "table" and v56.props.action.type == v52 then
            v54 = v54 + 1;
            v53[v54] = v56;
        end;
    end;
    return v53;
end;
v0.RevertToStateAtIndex = function(v57, v58)
    if type(v58) ~= "number" then
        return ;
    else
        local v59 = os.clock();
        local v60 = nil;
        local v61 = nil;
        local v62 = nil;
        for v63 = v58, 1, -1 do
            v60 = v57._events[v63];
            if v60.props.state then
                v61 = v60.props.state;
                v62 = v63;
                break;
            end;
        end;
        if v61 then
            local v64 = nil;
            for v65 = v62 - 1, 1, -1 do
                local v66 = v57._events[v65];
                if v66.props.state then
                    v64 = v66.props.state;
                    break;
                end;
            end;
            v57:_setState(v61, v64);
            v57:_addEvent("Reduce", {
                isDevtools = true, 
                name = "@@REVERT_TO_STATE", 
                elapsedMs = (os.clock() - v59) * 1000, 
                action = {
                    type = "@@REVERT_TO_STATE", 
                    revertTarget = {
                        name = v60.props.name, 
                        action = v60.props.action, 
                        eventIndex = v62
                    }
                }, 
                state = v61
            });
            return ;
        else
            return ;
        end;
    end;
end;
v0.ReplaceActionAtIndex = function(v67, v68, v69)
    if type(v68) ~= "number" then
        return ;
    elseif v69 ~= nil and type(v69) ~= "table" then
        return ;
    else
        local v70 = v67._events[v68];
        if not (v70 ~= nil) or v70.props.action == nil then
            return ;
        else
            v70.altered = v70.altered or {};
            v70.altered.replaceAction = v69;
            v67:_firePluginBridge("updateEvent", {
                index = v68, 
                event = v70
            });
            v67:_recomputeStateWithAlterations();
            return ;
        end;
    end;
end;
v0.UndoActionAtIndex = function(v71, v72)
    if type(v72) ~= "number" then
        return ;
    else
        local v73 = v71._events[v72];
        if not (v73 ~= nil) or v73.props.action == nil then
            return ;
        else
            v73.altered = v73.altered or {};
            if not v73.altered.skipped then
                v73.altered.skipped = true;
                v71:_firePluginBridge("updateEvent", {
                    index = v72, 
                    event = v73
                });
                v71:_recomputeStateWithAlterations();
                return ;
            else
                return ;
            end;
        end;
    end;
end;
v0.RedoActionAtIndex = function(v74, v75)
    if type(v75) ~= "number" then
        return ;
    else
        local v76 = v74._events[v75];
        if not (v76 ~= nil) or v76.props.action == nil then
            return ;
        else
            v76.altered = v76.altered or {};
            if v76.altered.skipped == false then
                return ;
            else
                v76.altered.skipped = false;
                v74:_firePluginBridge("updateEvent", {
                    index = v75, 
                    event = v76
                });
                v74:_recomputeStateWithAlterations();
                return ;
            end;
        end;
    end;
end;
v0._recomputeStateWithAlterations = function(v77)
    if #v77._events == 0 then
        return ;
    else
        local v78 = os.clock();
        local v79 = nil;
        local v80 = nil;
        for v81, v82 in v77._events, nil, nil do
            if not v82.altered or not next(v82.altered) then
                if v82.props.state then
                    v80 = v82.props.state;
                end;
            else
                v79 = v81;
                break;
            end;
        end;
        if v79 and v80 then
            local l_v79_0 = v79;
            local v84 = #v77._events;
            local v85 = nil;
            local v86 = {};
            local v87 = {};
            for v88 = l_v79_0, v84 do
                local v89 = v77._events[v88];
                if v89 then
                    local l_action_0 = v89.props.action;
                    if not (not (l_action_0 ~= nil) or v89.props.isDevtools) then
                        if not v89.altered or not v89.altered.skipped then
                            if not (not v89.altered or not v89.altered.replaceAction) then
                                table.insert(v87, {
                                    name = v89.props.name, 
                                    originalAction = v89.props.action, 
                                    replacedAction = v89.altered.replaceAction, 
                                    eventIndex = v88
                                });
                                l_action_0 = v89.altered.replaceAction;
                            end;
                            v85 = table.clone(v80);
                            v80 = v77._originalReducer(v80, l_action_0);
                        else
                            table.insert(v86, {
                                name = v89.props.name, 
                                action = v89.props.action, 
                                eventIndex = v88
                            });
                        end;
                    end;
                end;
            end;
            v77:_setState(v80, v85);
            v77:_addEvent("Reduce", {
                isDevtools = true, 
                name = "@@RECOMPUTE_STATE_WITH_ALTERATIONS", 
                elapsedMs = (os.clock() - v78) * 1000, 
                action = {
                    type = "@@RECOMPUTE_STATE_WITH_ALTERATIONS", 
                    skippedActions = v86, 
                    replacedActions = v87
                }, 
                state = v80
            });
            return ;
        else
            return ;
        end;
    end;
end;
return v0;
