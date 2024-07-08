local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Classes.BindableEventBridge);
local v2 = require(l_Parent_0.Classes.DebugInterface);
local v3 = require(l_Parent_0.RoactInspector.Classes.RoactInspectorApi);
local v4 = require(l_Parent_0.Services);
local v5 = require(l_Parent_0.EventName);
local v8 = v2:extend("InspectorDebugInterface", function(v6)
    local v7 = v2.new("Inspector", "Inspector", {
        v1.new(v4.getStudioService()), 
        v1.new(game:GetService("CoreGui")), 
        (v1.new(game:GetService("ReplicatedStorage"), true))
    });
    v7.handlers = v6;
    return v7;
end);
v8._init = function(v9)
    v9:_connectInspector();
end;
v8.getTargetApi = function(v10)
    return v10.targetApi;
end;
v8.closeTargetApi = function(v11)
    if v11.targetApi then
        v11.targetApi:close();
    end;
end;
v8._connectInspector = function(v12)
    v12:_connect({
        eventName = v5.ShowTargets, 
        onEvent = function(v13)
            v12.handlers.onAddTargets(v13);
        end
    });
end;
v8.getTargets = function(v14)
    v14:_send({
        eventName = v5.GetTargets
    });
end;
v8.attachRoactTree = function(v15, v16, v17)
    local v18 = v3.new(v15, v16, v17);
    v18:attach(v15.handlers.RoactInspector);
    v15.targetApi = v18;
    return v15.targetApi;
end;
return v8;
