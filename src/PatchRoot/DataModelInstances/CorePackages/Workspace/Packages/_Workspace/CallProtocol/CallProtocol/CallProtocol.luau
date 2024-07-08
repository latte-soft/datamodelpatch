local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Parent.Promise);
local v2 = require(l_Parent_0.CallProtocolConstants);
local _ = require(l_Parent_0.CallProtocolTypes);
local l_MessageBusService_0 = game:GetService("MessageBusService");
local v5 = {};
v5.__index = v5;
v5.new = function()
    return (setmetatable({}, v5));
end;
v5.initCall = function(_, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16)
    l_MessageBusService_0:Publish(v2.MESSAGE_INIT_CALL, {
        callerId = v7, 
        calleeId = v8, 
        callerCombinedName = v9, 
        calleeCombinedName = v10, 
        muted = v11, 
        camEnabled = v12, 
        callerUniqueIdentifier = v13, 
        placeId = v14, 
        reservedServerAccessCode = v15, 
        universeId = v16
    });
end;
v5.answerCall = function(_, v18)
    l_MessageBusService_0:Publish(v2.MESSAGE_ANSWER_CALL, {
        callId = v18
    });
end;
v5.answerSuccessCall = function(_, v20)
    l_MessageBusService_0:Publish(v2.MESSAGE_ANSWER_SUCCESS_CALL, {
        callId = v20
    });
end;
v5.rejectCall = function(_, v22)
    l_MessageBusService_0:Publish(v2.MESSAGE_REJECT_CALL, {
        callId = v22
    });
end;
v5.cancelCall = function(_, v24)
    l_MessageBusService_0:Publish(v2.MESSAGE_CANCEL_CALL, {
        callId = v24
    });
end;
v5.teleportSuccessCall = function(_, v26)
    l_MessageBusService_0:Publish(v2.MESSAGE_TELEPORT_SUCCESS_CALL, {
        callId = v26
    });
end;
v5.finishCall = function(_, v28)
    l_MessageBusService_0:Publish(v2.MESSAGE_FINISH_CALL, {
        callId = v28
    });
end;
v5.getCallState = function(_)
    return (v1.new(function(v30, _)
        l_MessageBusService_0:MakeRequest(v2.NAME, v2.METHOD_GET_CALL_STATE, {}, function(v32)
            v30(v32);
        end, {});
    end));
end;
v5.updateMicAndCamState = function(_, v34, v35)
    local v36 = {};
    if v34 ~= nil then
        v36.muted = v34;
    end;
    if v35 ~= nil then
        v36.camEnabled = v35;
    end;
    l_MessageBusService_0:Publish(v2.MESSAGE_UDPATE_MIC_AND_CAM_STATE, v36);
end;
v5.listenToHandleInitCall = function(_, v38)
    return l_MessageBusService_0:Subscribe(v2.MESSAGE_HANDLE_INIT_CALL, v38, false, true);
end;
v5.listenToHandleConnectingCall = function(_, v40)
    return l_MessageBusService_0:Subscribe(v2.MESSAGE_HANDLE_CONNECTING_CALL, v40, false, true);
end;
v5.listenToHandleTeleportingCall = function(_, v42)
    return l_MessageBusService_0:Subscribe(v2.MESSAGE_HANDLE_TELEPORTING_CALL, v42, false, true);
end;
v5.listenToHandleActiveCall = function(_, v44)
    return l_MessageBusService_0:Subscribe(v2.MESSAGE_HANDLE_ACTIVE_CALL, v44, false, true);
end;
v5.listenToHandleEndCall = function(_, v46)
    return l_MessageBusService_0:Subscribe(v2.MESSAGE_HANDLE_END_CALL, v46, false, true);
end;
v5.listenToHandleCallMessage = function(_, v48)
    return l_MessageBusService_0:Subscribe(v2.MESSAGE_HANDLE_CALL_MESSAGE, v48, false, true);
end;
v5.listenToHandleMicAndCamChanged = function(_, v50)
    return l_MessageBusService_0:Subscribe(v2.MESSAGE_HANDLE_MIC_AND_CAM_CHANGED, v50, false, true);
end;
v5.listenToHandleTransferCallTeleportLeave = function(_, v52)
    return l_MessageBusService_0:Subscribe(v2.MESSAGE_HANDLE_TRANSFER_CALL_TELEPORT_LEAVE, v52, false, true);
end;
v5.listenToHandleTransferCallTeleportJoin = function(_, v54)
    return l_MessageBusService_0:Subscribe(v2.MESSAGE_HANDLE_TRANSFER_CALL_TELEPORT_JOIN, v54, false, true);
end;
v5.default = v5.new();
return v5;
