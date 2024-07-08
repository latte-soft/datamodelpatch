local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.RoactInspector.Utils.getChildAtKey);
local v3 = require(l_Parent_0.EventName);
local v4 = require(l_Parent_0.RoactInspector.Classes.FieldWatcher);
local v5 = require(l_Parent_0.RoactInspector.Classes.InstancePicker);
local v6 = require(l_Parent_0.RoactInspector.Classes.RoactProfiler);
local v7 = require(l_Parent_0.Classes.TargetWorker);
local v8 = require(l_Parent_0.RoactInspector.Classes.RoactTreeWatcher);
local l_Selection_0 = game:GetService("Selection");
local v10 = require(l_Parent_1.Dash);
local l_map_0 = v10.map;
local l_forEach_0 = v10.forEach;
local l_last_0 = v10.last;
local l_pretty_0 = v10.pretty;
local l_reduce_0 = v10.reduce;
local _ = require(l_Parent_0.Types);
local l_insert_0 = table.insert;
local v24 = v7:extend("RoactInspectorWorker", function(v18, v19, v20, v21, v22)
    local v23 = v7.new(v18, v19, v20);
    v23.roact = v22;
    v23.tree = v21;
    return v23;
end);
v24._init = function(v25)
    v25.treeWatcher = v8.new(v25.debugInterface, v25.tree, function(v26, v27)
        v25:showChildren(v26, v27);
    end);
    v25.treeWatcher:monitor();
    v25.fieldWatcher = v4.new(function(_)
        v25:showFields({});
    end);
    v25.picker = v5.new(v25.debugInterface, function(v29)
        return v25:pickInstance(v29);
    end);
    v25.profiler = v6.new(v25.debugInterface, v25.treeWatcher, v25.tree, v25.roact);
    v25:connectEvents();
end;
v24.connectEvents = function(v30)
    v7.connectEvents(v30);
    v30:connect({
        eventName = v3.RoactInspector.GetChildren, 
        onEvent = function(v31)
            v30:showChildren(v31.path);
        end
    });
    v30:connect({
        eventName = v3.RoactInspector.GetBranch, 
        onEvent = function(v32)
            v30:showBranch(v32.path);
        end
    });
    v30:connect({
        eventName = v3.RoactInspector.GetFields, 
        onEvent = function(v33)
            v30.currentPath = v33.path;
            v30.currentNodeIndex = v33.nodeIndex;
            v30:showFields(v33.fieldPath or {});
        end
    });
    v30:connect({
        eventName = v3.RoactInspector.Highlight, 
        onEvent = function(v34)
            local v35 = v30.treeWatcher:getNode(v34.path);
            if v35 then
                local v36 = v30.treeWatcher:getHostNode(v35);
                if not v36 or not v36.hostObject then
                    v30.picker:dehighlight();
                    return ;
                else
                    v30.picker:highlight(v36.hostObject);
                    return ;
                end;
            else
                return ;
            end;
        end
    });
    v30:connect({
        eventName = v3.RoactInspector.Dehighlight, 
        onEvent = function()
            v30.picker:dehighlight();
        end
    });
    v30:connect({
        eventName = v3.RoactInspector.SetPicking, 
        onEvent = function(v37)
            v30.picker:setActive(v37.isPicking);
        end
    });
    v30:connect({
        eventName = v3.RoactInspector.OpenPath, 
        onEvent = function(v38)
            v30:openPath(v38.path);
        end
    });
    v30:connect({
        eventName = v3.RoactInspector.SetProfiling, 
        onEvent = function(v39)
            v30.profiler:setActive(v39.isProfiling);
        end
    });
    v30:connect({
        eventName = v3.RoactInspector.GetProfileData, 
        onEvent = function(v40)
            v30:showProfileData((v30.profiler:getData(v40.componentSliceStart, v40.componentSliceEnd, v40.eventSliceStart, v40.eventSliceEnd)));
        end
    });
    v30:connect({
        eventName = v3.RoactInspector.ClearProfileData, 
        onEvent = function()
            v30.profiler:clearData();
        end
    });
    v30:connect({
        eventName = v3.RoactInspector.SortProfileData, 
        onEvent = function(v41)
            v30.profiler:sortData(v41.tableName, v41.index, v41.order);
        end
    });
    v30:connect({
        eventName = v3.RoactInspector.SelectProfileInstance, 
        onEvent = function(v42)
            v30.profiler:selectInstance(v42.instanceId);
        end
    });
    v30:connect({
        eventName = v3.RoactInspector.SetProfileFilter, 
        onEvent = function(v43)
            v30.profiler:setFilter(v43.filter);
        end
    });
    v30:connect({
        eventName = v3.RoactInspector.SetProfileSearchTerm, 
        onEvent = function(v44)
            v30.profiler:setSearchTerm(v44.searchTerm);
        end
    });
end;
v24.getNodeInfo = function(v45, v46)
    local v47 = "";
    local v48 = "";
    if v46.currentElement.source then
        local v49 = v46.currentElement.source:find("\n");
        if v49 then
            v47 = v47:sub(1, v49 - 1);
            v48 = v47:match("[A-Za-z0-9_]+%.[A-Za-z0-9_]+:[0-9]+") or "";
        end;
    end;
    return {
        Name = v45.treeWatcher:getNodeName(v46), 
        Source = v47, 
        Link = v48, 
        Icon = v45.treeWatcher:getNodeIcon(v46)
    };
end;
v24.pickInstance = function(v50, v51)
    v50.picker:setActive(false);
    v50:openPath((v50.treeWatcher:getPath(v51)));
end;
v24.openPath = function(v52, v53)
    local v54 = {};
    l_forEach_0(v53, function(v55)
        l_insert_0(v54, v55);
        v52:showChildren(v54);
    end);
    v52:send({
        eventName = v3.RoactInspector.PickInstance, 
        path = v53
    });
    v52:showBranch(v53);
end;
v24.showChildren = function(v56, v57, v58)
    local v59 = v56.treeWatcher:getNode(v57);
    if v59 then
        v56.treeWatcher:watchPath(v57);
        v56:send({
            eventName = v3.RoactInspector.ShowChildren, 
            path = v57, 
            children = v56.treeWatcher:getChildren(v57, v59, 2), 
            updatedIndexes = v58
        });
        return ;
    else
        warn("[DeveloperInspector - Roact] Missing path " .. l_pretty_0(v57));
        return ;
    end;
end;
v24.showBranch = function(v60, v61)
    local v62 = v60.treeWatcher:getNodes(v61);
    if v62 then
        local v63 = l_last_0(v62);
        if not (not v63 or not v63.hostObject) then
            l_Selection_0:Set({
                v63.hostObject
            });
        end;
        v60:send({
            eventName = v3.RoactInspector.ShowBranch, 
            path = v61, 
            branch = l_map_0(v62, function(v64)
                return v60:getNodeInfo(v64);
            end)
        });
        return ;
    else
        return ;
    end;
end;
v24.showFields = function(v65, v66)
    local v67 = v65.treeWatcher:getNodes(v65.currentPath);
    if v67 then
        local v68 = v67[v65.currentNodeIndex];
        if v68 then
            local v69 = v68.instance or v68.currentElement;
            v65.fieldWatcher:clear();
            v65.fieldWatcher:setRoot(v69);
            v65.fieldWatcher:addPath(v66);
            local v74 = l_reduce_0(v66, function(v70, v71)
                local l_status_0, l_result_0 = pcall(function()
                    return v2(v70, v71);
                end);
                if not l_status_0 then
                    return nil;
                else
                    return l_result_0;
                end;
            end, v69);
            if v74 == nil then
                return ;
            else
                v65:send({
                    eventName = v3.RoactInspector.ShowFields, 
                    path = v65.currentPath, 
                    nodeIndex = v65.currentNodeIndex, 
                    fieldPath = v66, 
                    fields = v65.fieldWatcher:collect(v74, 2, v66)
                });
                return ;
            end;
        else
            return ;
        end;
    else
        return ;
    end;
end;
v24.showProfileData = function(v75, v76)
    v75:send({
        eventName = v3.RoactInspector.ShowProfileData, 
        data = v76
    });
end;
v24.destroy = function(v77)
    v7.destroy(v77);
    v77.profiler:destroy();
    v77.picker:destroy();
    v77.treeWatcher:destroy();
    v77.fieldWatcher:destroy();
    v77.treeWatcher = nil;
end;
return v24;
