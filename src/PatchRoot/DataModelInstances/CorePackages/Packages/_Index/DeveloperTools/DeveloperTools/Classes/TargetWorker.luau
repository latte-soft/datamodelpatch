local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.EventName);
local v3 = require(l_Parent_1.Dash);
local l_class_0 = v3.class;
local l_forEach_0 = v3.forEach;
local l_join_0 = v3.join;
local l_insert_0 = table.insert;
local v11 = l_class_0("TargetWorker", function(v8, v9, v10)
    return {
        targetId = v9, 
        toBridgeId = v10, 
        debugInterface = v8, 
        listeners = {}
    };
end);
v11.connectEvents = function(v12)
    v12:connect({
        eventName = v2.CloseTarget, 
        onEvent = function(_)
            v12.debugInterface:removeWorker(v12.targetId);
        end
    });
end;
v11.connect = function(v14, v15)
    local v16 = l_join_0(v15, {
        targetId = v14.targetId
    });
    v14.debugInterface:_connect(v16);
    l_insert_0(v14.listeners, v16);
end;
v11.send = function(v17, v18)
    v17.debugInterface:_send((l_join_0(v18, {
        fromTargetId = v17.targetId, 
        toBridgeId = v17.toBridgeId
    })));
end;
v11.destroy = function(v19)
    l_forEach_0(v19.listeners, function(v20)
        v19.debugInterface:_disconnect(v20);
    end);
end;
return v11;
