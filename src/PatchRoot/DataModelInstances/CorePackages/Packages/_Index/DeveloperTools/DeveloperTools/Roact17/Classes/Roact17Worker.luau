local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.RoactInspector.Utils.getChildAtKey);
local v3 = require(l_Parent_0.Roact17.types);
local v4 = require(l_Parent_0.EventName);
local v5 = require(l_Parent_0.RoactInspector.Classes.InstancePicker);
local v6 = require(l_Parent_0.Roact17.Classes.Roact17Profiler);
local v7 = require(l_Parent_0.RoactInspector.Classes.FieldWatcher);
local v8 = require(l_Parent_0.Classes.TargetWorker);
local v9 = require(l_Parent_1.Dash);
local l_append_0 = v9.append;
local l_map_0 = v9.map;
local _ = v9.mapOne;
local l_forEach_0 = v9.forEach;
local l_filter_0 = v9.filter;
local l_last_0 = v9.last;
local l_reduce_0 = v9.reduce;
local l_reverse_0 = v9.reverse;
local l_startsWith_0 = v9.startsWith;
local _ = require(l_Parent_0.Types);
local l_concat_0 = table.concat;
local l_insert_0 = table.insert;
local v28 = v8:extend("Roact17Worker", function(v22, v23, v24, v25, v26)
    local v27 = v8.new(v22, v23, v24);
    v27.devtools = v25;
    v27.root = v26;
    v27.pendingFields = {};
    return v27;
end);
v28._init = function(v29)
    v29.picker = v5.new(v29.debugInterface, function(v30)
        return v29:pickInstance(v30);
    end);
    v29.fieldWatcher = v7.new(function(v31)
        l_forEach_0(v31, function(v32)
            v29:reduceAndSendFields(v29.fieldWatcher.root, v32);
        end);
    end, "data");
    v29.fieldWatcher.onPoll = function()
        if v29.fieldWatcher.polling then
            if v29.currentPath then
                local v33 = v29:getNodes(l_last_0(v29.currentPath));
                if v33 then
                    local v34 = v33[v29.currentNodeIndex];
                    if v34 then
                        v29.devtools.agent:inspectElement({
                            id = v34.id, 
                            rendererID = v29.devtools.store:getRendererIDForElement(v29.root), 
                            path = {}
                        });
                        delay(0.5, v29.fieldWatcher.onPoll);
                        return ;
                    else
                        return ;
                    end;
                else
                    return ;
                end;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
    v29.profiler = v6.new(v29);
    v29:connectEvents();
    v29:connectDevtools();
end;
v28.connectEvents = function(v35)
    v8.connectEvents(v35);
    v35:connect({
        eventName = v4.RoactInspector.GetChildren, 
        onEvent = function(v36)
            v35:showChildren(v36.path);
        end
    });
    v35:connect({
        eventName = v4.RoactInspector.GetBranch, 
        onEvent = function(v37)
            v35:showBranch(v37.path);
        end
    });
    v35:connect({
        eventName = v4.RoactInspector.GetFields, 
        onEvent = function(v38)
            v35.fieldWatcher:clear();
            v35.currentPath = v38.path;
            v35.currentNodeIndex = v38.nodeIndex;
            v35:showFields(v38.fieldPath or {});
        end
    });
    v35:connect({
        eventName = v4.RoactInspector.Highlight, 
        onEvent = function(v39)
            if #v39.path == 0 then
                return ;
            else
                local v40 = tonumber(l_last_0(l_last_0(v39.path):split(".")));
                local v41 = v35:getHostNode(v40);
                local v42 = v35:getHostInstance(v40);
                if not v41 or not v42 then
                    v35.picker:dehighlight();
                    return ;
                else
                    v35.picker:highlight(v42);
                    return ;
                end;
            end;
        end
    });
    v35:connect({
        eventName = v4.RoactInspector.Dehighlight, 
        onEvent = function()
            v35.picker:dehighlight();
        end
    });
    v35:connect({
        eventName = v4.RoactInspector.SetPicking, 
        onEvent = function(v43)
            v35.picker:setActive(v43.isPicking);
        end
    });
    v35:connect({
        eventName = v4.RoactInspector.OpenPath, 
        onEvent = function(v44)
            v35:openPath(v44.path);
        end
    });
    v35:connect({
        eventName = v4.RoactInspector.SetProfiling, 
        onEvent = function(v45)
            v35.profiler:setActive(v45.isProfiling);
        end
    });
    v35:connect({
        eventName = v4.RoactInspector.GetProfileData, 
        onEvent = function(v46)
            v35.profiler:getData(v46, function(v47)
                v35:showProfileData(v47);
            end);
        end
    });
    v35:connect({
        eventName = v4.RoactInspector.ClearProfileData, 
        onEvent = function()
            v35.profiler:clearData();
        end
    });
    v35:connect({
        eventName = v4.RoactInspector.SortProfileData, 
        onEvent = function(v48)
            v35.profiler:sortData(v48.tableName, v48.index, v48.order);
        end
    });
    v35:connect({
        eventName = v4.RoactInspector.SelectProfileInstance, 
        onEvent = function(v49)
            v35.profiler:selectInstance(v49.instanceId);
        end
    });
    v35:connect({
        eventName = v4.RoactInspector.SetProfileFilter, 
        onEvent = function(v50)
            v35.profiler:setFilter(v50.filter);
        end
    });
    v35:connect({
        eventName = v4.RoactInspector.SetProfileSearchTerm, 
        onEvent = function(v51)
            v35.profiler:setSearchTerm(v51.searchTerm);
        end
    });
end;
v28.getNodeInfo = function(v52, v53)
    if v53.type == v3.ElementType.Root then
        return {
            Name = "Root", 
            Source = "", 
            Link = "", 
            Icon = "Branch"
        };
    else
        local v54 = "Branch";
        if v53.type == v3.ElementType.HostComponent then
            local v55 = v52:getHostInstance(v53.id);
            if v55 then
                v54 = v55.ClassName;
            end;
        end;
        local l_displayName_0 = v53.displayName;
        if #v53.key > 0 and v53.displayName ~= v53.key then
            l_displayName_0 = v53.key .. ": " .. v53.displayName;
        end;
        return {
            Name = l_displayName_0, 
            Source = "", 
            Link = "", 
            Icon = v54
        };
    end;
end;
v28.connectDevtools = function(v57)
    v57.devtools.bridge:addListener("inspectedElement", function(v58)
        if not (v58.type == "full-data") then
            if v58.value ~= nil and #v58.path > 0 then
                if #v58.path > 0 then
                    v57.fieldWatcher:addPath(v58.path);
                    local v59 = l_concat_0(v58.path, ",");
                    v57.pendingFields = l_filter_0(v57.pendingFields, function(v60)
                        local v61 = l_concat_0(v60, ",");
                        local v62 = true;
                        if v61 ~= v59 then
                            v62 = l_startsWith_0(v61, v59 .. ",");
                        end;
                        return v62;
                    end);
                    v57:send({
                        eventName = v4.RoactInspector.ShowFields, 
                        path = v57.currentPath, 
                        nodeIndex = v57.currentNodeIndex, 
                        fieldPath = v58.path, 
                        fields = v57.fieldWatcher:collect(v58.value.data, 2, v58.path)
                    });
                else
                    v57.fieldWatcher:setRoot(v58.value.data);
                    return ;
                end;
            end;
            return ;
        else
            v57.fieldWatcher:setRoot(v58.value);
            v57.fieldWatcher:checkFields();
            l_forEach_0(v57.pendingFields, function(v63)
                v57.fieldWatcher:addPath(v63);
                v57:reduceAndSendFields(v58.value, v63);
            end);
            v57.pendingFields = {};
            return ;
        end;
    end);
    v57.devtools.bridge:addListener("operations", function(_)
    end);
    v57.devtools.bridge:addListener("shutdown", function(_)
        v57:send({
            eventName = v4.CloseTarget
        });
        v57.debugInterface:removeWorker(v57.targetId);
        v57:destroy();
    end);
end;
v28.reduceAndSendFields = function(v66, v67, v68)
    local v74 = l_reduce_0(v68, function(v69, v70, v71)
        local l_status_0, l_result_0 = pcall(function()
            return v2(v69, v70);
        end);
        if l_status_0 and l_result_0 ~= nil then
            if v71 == 1 then
                return l_result_0.data;
            else
                return l_result_0;
            end;
        else
            return nil;
        end;
    end, v67);
    if v74 == nil then
        return ;
    else
        v66:send({
            eventName = v4.RoactInspector.ShowFields, 
            path = v66.currentPath, 
            nodeIndex = v66.currentNodeIndex, 
            fieldPath = v68, 
            fields = v66.fieldWatcher:collect(v74, 2, v68)
        });
        return ;
    end;
end;
v28.pickInstance = function(v75, v76)
    local v77 = v75:getPath(v76);
    v75.picker:setActive(false);
    v75:openPath(v77);
end;
v28.getPath = function(v78, v79)
    local v80 = v78:getRenderer().getFiberIDForNative(v79);
    if v80 then
        local v81 = {};
        local v82 = {};
        while v80 ~= v78.root do
            local v83 = v78.devtools.store:getElementByID(v80);
            if v83.type == v3.ElementType.HostComponent and #v82 > 0 then
                l_insert_0(v81, l_concat_0(l_reverse_0(v82), "."));
                v82 = {};
            end;
            l_insert_0(v82, v80);
            v80 = v83.parentID;
        end;
        if #v82 > 0 then
            l_insert_0(v82, v78.root);
            l_insert_0(v81, l_concat_0(l_reverse_0(v82), "."));
        end;
        return l_reverse_0(v81);
    else
        return nil;
    end;
end;
v28.openPath = function(v84, v85)
    local v86 = {};
    l_forEach_0(v85, function(v87)
        l_insert_0(v86, v87);
        v84:showChildren(l_append_0({}, v86));
    end);
    v84:send({
        eventName = v4.RoactInspector.PickInstance, 
        path = v85
    });
    v84:showBranch(v85);
end;
v28.showChildren = function(v88, v89, v90)
    if #v89 == 0 then
        local v91, v92 = v88:getHostNode(v88.root);
        local v93 = if not v91 then nil else v88:getHostInstance(v91.id);
        local v94 = {
            v92
        };
        v88:send({
            eventName = v4.RoactInspector.ShowChildren, 
            path = v89, 
            children = {
                [v92 or "None"] = {
                    Name = if not v93 then if v91 then v91.displayName else "<None>" else v93.Name, 
                    Icon = "Branch", 
                    Children = v88:getChildren(v94, v88.root, 1), 
                    Path = v94
                }
            }, 
            updatedIndexes = v90
        });
        return ;
    else
        v88:send({
            eventName = v4.RoactInspector.ShowChildren, 
            path = v89, 
            children = v88:getChildren(v89, tonumber(l_last_0(l_last_0(v89):split("."))), 2), 
            updatedIndexes = v90
        });
        return ;
    end;
end;
v28.getChildren = function(v95, v96, v97, v98)
    if v98 == 0 then
        return nil;
    else
        local v99 = v95:getHostNode(v97);
        if v99 then
            local v100 = {};
            l_forEach_0(v99.children, function(v101)
                v95:_collectChildren(v101, v96, "", v98, v100);
            end);
            return v100;
        else
            return nil;
        end;
    end;
end;
v28._collectChildren = function(v102, v103, v104, v105, v106, v107)
    local v108 = tostring(v103);
    local v109 = #v105 == 0 and v108 or ("%s.%s"):format(v105, v108);
    local v110 = v102.devtools.store:getElementByID(v103);
    if v110.type == v3.ElementType.HostComponent then
        local v111 = v102:getHostInstance(v103);
        local v112 = not not v111 and v111.Name or v110.displayName;
        if #v110.key > 0 and v112 ~= v110.key then
            v112 = ("%s: %s"):format(v110.key, v112);
        end;
        local v113 = l_append_0({}, v104, {
            v109
        });
        v107[v109] = {
            Name = v112, 
            Icon = not not v111 and v111.ClassName or "Branch", 
            Children = v102:getChildren(v113, v103, v106 - 1), 
            Path = v113
        };
        return ;
    else
        l_forEach_0(v110.children, function(v114)
            v102:_collectChildren(v114, v104, v109, v106, v107);
        end);
        return ;
    end;
end;
v28.getHostNode = function(v115, v116, v117, v118)
    local v119 = tostring(v116);
    local v120 = if not v118 then v119 else ("%s.%s"):format(v118, v119);
    if v116 then
        local v121 = v115.devtools.store:getElementByID(v116);
        if v121 then
            if v121.type == v3.ElementType.HostComponent then
                return v121, v120;
            else
                for v122 = 1, #v121.children do
                    local v123, v124 = v115:getHostNode(v121.children[v122], v117, v120);
                    if v123 then
                        return v123, v124;
                    end;
                end;
            end;
        else
            return nil;
        end;
    end;
    return nil;
end;
v28.getRenderer = function(v125)
    return v125.devtools.hook.rendererInterfaces[v125.devtools.store:getRendererIDForElement(v125.root)];
end;
v28.getHostInstance = function(v126, v127)
    local v128 = v126:getRenderer();
    local v129 = v126:getHostNode(v127);
    if v129 then
        local v130 = v128.findNativeNodesForFiberID(v129.id);
        return not not v130 and v130[1] or nil;
    else
        return ;
    end;
end;
v28.showBranch = function(v131, v132)
    local v133 = v131:getNodes(l_last_0(v132));
    if v133 then
        local v134 = nil;
        local v135 = l_last_0(v133);
        if v135 then
            v134 = v131:getHostInstance(v135.id);
        end;
        v131:send({
            eventName = v4.RoactInspector.ShowBranch, 
            path = v132, 
            branch = l_map_0(v133, function(v136)
                return v131:getNodeInfo(v136);
            end), 
            instance = v134
        });
        return ;
    else
        return ;
    end;
end;
v28.showFields = function(v137, v138)
    local v139 = v137:getNodes(l_last_0(v137.currentPath));
    if v139 then
        local v140 = v139[v137.currentNodeIndex];
        if v140 then
            if v138[1] == "_context" then
                return ;
            else
                l_insert_0(v137.pendingFields, v138);
                v137.devtools.agent:inspectElement({
                    id = v140.id, 
                    rendererID = v137.devtools.store:getRendererIDForElement(v137.root), 
                    path = v138
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
v28.getNodes = function(v141, v142)
    return l_map_0(v142:split("."), function(v143)
        return v141.devtools.store:getElementByID((tonumber(v143)));
    end);
end;
v28.showProfileData = function(v144, v145)
    v144:send({
        eventName = v4.RoactInspector.ShowProfileData, 
        data = v145
    });
end;
v28.destroy = function(v146)
    v8.destroy(v146);
    v146.picker:destroy();
    v146.profiler:destroy();
    v146.fieldWatcher:destroy();
end;
return v28;
