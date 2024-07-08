local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.EventName);
local v3 = require(l_Parent_1.Dash);
local l_join_0 = v3.join;
local v8 = v3.class("TargetApi", function(v5, v6, v7)
    return {
        debugInterface = v5, 
        bridgeId = v6, 
        targetId = v7
    };
end);
v8.close = function(v9)
    v9:_send({
        eventName = v2.CloseTarget
    });
end;
v8._send = function(v10, v11)
    v10.debugInterface:_send((l_join_0(v11, {
        toBridgeId = v10.bridgeId, 
        toTargetId = v10.targetId
    })));
end;
v8._connect = function(v12, v13)
    v12.debugInterface:_connect((l_join_0(v13, {
        fromTargetId = v12.targetId
    })));
end;
v8.attach = function(v14)
    v14:_send({
        eventName = v2.AttachTarget
    });
end;
return v8;
