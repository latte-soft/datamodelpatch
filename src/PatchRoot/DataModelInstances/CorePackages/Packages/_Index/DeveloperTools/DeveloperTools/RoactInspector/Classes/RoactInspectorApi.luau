local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.EventName);
local v2 = require(l_Parent_0.Classes.TargetApi);
local v3 = v2:extend("RoactInspectorApi");
v3._init = function(v4)
    v4.profileComponentsPageIndex = 1;
    v4.profileComponentsPageSize = 1;
    v4.profileEventsPageIndex = 1;
    v4.profileEventsPageSize = 1;
end;
v3.attach = function(v5, v6)
    v5.handlers = v6;
    v2.attach(v5);
    v5:_connect({
        eventName = v1.RoactInspector.ShowChildren, 
        onEvent = function(v7)
            v5.handlers.onUpdateInstances(v7.path, v7.children, v7.updatedIndexes);
        end
    });
    v5:_connect({
        eventName = v1.RoactInspector.ShowBranch, 
        onEvent = function(v8)
            v5.handlers.onUpdateBranch(v8.path, v8.branch);
        end
    });
    v5:_connect({
        eventName = v1.RoactInspector.ShowFields, 
        onEvent = function(v9)
            v5.handlers.onUpdateFields(v9.path, v9.nodeIndex, v9.fieldPath, v9.fields);
        end
    });
    v5:_connect({
        eventName = v1.RoactInspector.PickInstance, 
        onEvent = function(v10)
            v5.handlers.onPickInstance(v10.path);
        end
    });
    v5:_connect({
        eventName = v1.RoactInspector.ShowProfileData, 
        onEvent = function(v11)
            v5.handlers.onUpdateProfileData(v11.data);
        end
    });
end;
v3.getChildren = function(v12, v13)
    v12:_send({
        eventName = v1.RoactInspector.GetChildren, 
        path = v13
    });
end;
v3.getRoot = function(v14)
    v14:getChildren({});
end;
v3.getBranch = function(v15, v16)
    v15:_send({
        eventName = v1.RoactInspector.GetBranch, 
        path = v16
    });
end;
v3.getFields = function(v17, v18, v19, v20)
    v17:_send({
        eventName = v1.RoactInspector.GetFields, 
        path = v18, 
        nodeIndex = v19, 
        fieldPath = v20
    });
end;
v3.setPicking = function(v21, v22)
    v21:_send({
        eventName = v1.RoactInspector.SetPicking, 
        isPicking = v22
    });
end;
v3.openPath = function(v23, v24)
    v23:_send({
        eventName = v1.RoactInspector.OpenPath, 
        path = v24
    });
end;
v3.setProfiling = function(v25, v26)
    if not v26 then
        v25.profileThread = nil;
    else
        local v27 = nil;
        do
            local l_v27_0 = v27;
            l_v27_0 = coroutine.wrap(function()
                while l_v27_0 == v25.profileThread do
                    v25:getProfileData();
                    wait(0.5);
                end;
            end);
            v25.profileThread = l_v27_0;
            l_v27_0();
        end;
    end;
    v25:_send({
        eventName = v1.RoactInspector.SetProfiling, 
        isProfiling = v26
    });
end;
v3.clearProfileData = function(v29)
    v29:_send({
        eventName = v1.RoactInspector.ClearProfileData
    });
end;
v3.sortProfileData = function(v30, v31, v32, v33)
    v30:_send({
        eventName = v1.RoactInspector.SortProfileData, 
        tableName = v31, 
        index = v32, 
        order = v33
    });
end;
v3.selectProfileInstance = function(v34, v35)
    v34:_send({
        eventName = v1.RoactInspector.SelectProfileInstance, 
        instanceId = v35
    });
end;
v3.setProfileFilter = function(v36, v37)
    v36:_send({
        eventName = v1.RoactInspector.SetProfileFilter, 
        filter = v37
    });
end;
v3.setProfileSearchTerm = function(v38, v39)
    v38:_send({
        eventName = v1.RoactInspector.SetProfileSearchTerm, 
        searchTerm = v39
    });
end;
v3.setProfileComponentsPageIndex = function(v40, v41)
    v40.profileComponentsPageIndex = v41;
end;
v3.setProfileComponentsPageSize = function(v42, v43)
    v42.profileComponentsPageSize = v43;
end;
v3.setProfileEventsPageIndex = function(v44, v45)
    v44.profileEventsPageIndex = v45;
end;
v3.setProfileEventsPageSize = function(v46, v47)
    v46.profileEventsPageSize = v47;
end;
v3.getProfileData = function(v48)
    local v49 = (v48.profileComponentsPageIndex - 1) * v48.profileComponentsPageSize + 1;
    local v50 = (v49 + v48.profileComponentsPageSize) - 1;
    local v51 = (v48.profileEventsPageIndex - 1) * v48.profileEventsPageSize + 1;
    v48:_send({
        eventName = v1.RoactInspector.GetProfileData, 
        componentSliceStart = v49, 
        componentSliceEnd = v50, 
        eventSliceStart = v51, 
        eventSliceEnd = (v51 + v48.profileEventsPageSize) - 1
    });
end;
v3.highlight = function(v52, v53)
    v52:_send({
        eventName = v1.RoactInspector.Highlight, 
        path = v53
    });
end;
v3.dehighlight = function(v54)
    v54:_send({
        eventName = v1.RoactInspector.Dehighlight
    });
end;
return v3;
