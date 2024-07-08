local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Parent.Dash);
local l_class_0 = v2.class;
local l_forEach_0 = v2.forEach;
local l_map_0 = v2.map;
local l_insert_0 = table.insert;
local _ = require(l_Parent_0.Services);
local v8 = require(l_Parent_0.EventName);
local v9 = require(l_Parent_0.Classes.PluginEventRouter);
local v10 = require(l_Parent_0.RoactInspector.Classes.RoactInspectorWorker);
local v11 = require(l_Parent_0.Roact17.Classes.Roact17TargetWatcher);
local v15 = l_class_0("DebugInterface", function(v12, v13, v14)
    return {
        sourceId = l_HttpService_0:GenerateGUID(), 
        sourceKind = v12, 
        sourceName = v13, 
        bridges = v14, 
        routers = {}, 
        targets = {}, 
        workers = {}, 
        connectionsForListener = {}, 
        outboundBridgeForBridgeId = {}
    };
end);
v15.addRoactTree = function(v16, v17, v18, v19)
    assert(typeof(v17) == "string", "targetName must be a string");
    assert(v18, "roactTree must be defined");
    return v16:addTarget(v17, function(v20, v21)
        return v10.new(v16, v20, v21, v18, v19);
    end);
end;
v15.initRoact = function(v22, v23, v24)
    v22.workers.reactTargetWatcher = v11.new(v22, (v23.setup(v24)));
end;
v15.addPluginRouter = function(v25, v26)
    l_insert_0(v25.routers, v9.new(v25.sourceName, v26, v25.bridges));
end;
v15._connectTargets = function(v27)
    if not next(v27.targets) then
        v27:_connect({
            eventName = v8.GetTargets, 
            onEvent = function(v28)
                v27:_send({
                    eventName = v8.ShowTargets, 
                    toBridgeId = v28.fromBridgeId, 
                    sourceId = v27.sourceId, 
                    sourceName = v27.sourceName, 
                    sourceKind = v27.sourceKind, 
                    targets = l_map_0(v27.targets, function(v29)
                        return {
                            id = v29.id, 
                            name = v29.name
                        };
                    end)
                });
            end
        });
        return ;
    else
        return ;
    end;
end;
v15._send = function(v30, v31)
    if v31.toBridgeId then
        local v32 = v30.outboundBridgeForBridgeId[v31.toBridgeId];
        if not v32 then
            error(("[DeveloperTools] No bridge to other bridge %s"):format(v31.toBridgeId));
        end;
        v32:send(v31);
        return ;
    else
        l_forEach_0(v30.bridges, function(v33)
            v33:send(v31);
        end);
        return ;
    end;
end;
v15._connect = function(v34, v35)
    local v36 = {};
    v34.connectionsForListener[v35] = v36;
    l_forEach_0(v34.bridges, function(v37)
        l_insert_0(v36, (v37:connect(function(v38)
            v34.outboundBridgeForBridgeId[v38.fromBridgeId] = v37;
            local v39 = true;
            if v35.eventName ~= nil then
                v39 = v35.eventName == v38.eventName;
            end;
            local v40 = true;
            if v35.bridgeId ~= nil then
                v40 = v35.bridgeId == v38.toBridgeId;
            end;
            local v41 = true;
            if v35.targetId ~= nil then
                v41 = v35.targetId == v38.toTargetId;
            end;
            if not ((not v39 or not v40) or not v41) then
                v35.onEvent(v38);
            end;
        end)));
    end);
end;
v15._disconnect = function(v42, v43)
    l_forEach_0(v42.connectionsForListener[v43], function(v44)
        v44:Disconnect();
    end);
end;
v15.addTarget = function(v45, v46, v47)
    v45:_connectTargets();
    local v48 = l_HttpService_0:GenerateGUID();
    local v50 = {
        id = v48, 
        name = v46, 
        listener = {
            targetId = v48, 
            eventName = v8.AttachTarget, 
            onEvent = function(v49)
                v45.workers[v48] = v45.workers[v48] or v47(v48, v49.fromBridgeId);
            end
        }
    };
    v45.targets[v48] = v50;
    v45:_connect(v50.listener);
    return v48;
end;
v15.removeTarget = function(v51, v52)
    local v53 = v51.targets[v52];
    if v53 ~= nil then
        v51:_disconnect(v53.listener);
        v51.targets[v52] = nil;
    end;
end;
v15.removeWorker = function(v54, v55)
    local v56 = v54.workers[v55];
    if v56 then
        v56:destroy();
    end;
    v54.workers[v55] = nil;
end;
v15.setGuiOptions = function(v57, v58)
    v57.rootInstance = v58.rootInstance;
    v57.pickerParent = v58.pickerParent;
    v57.rootPath = v58.rootPath;
    v57.rootPrefix = v58.rootPrefix;
end;
v15.destroy = function(v59)
    l_forEach_0(v59.bridges, function(v60)
        v60:destroy();
    end);
    l_forEach_0(v59.routers, function(v61)
        v61:destroy();
    end);
    l_forEach_0(v59.workers, function(v62)
        v62:destroy();
    end);
end;
return v15;
