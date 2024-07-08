local l_MessageBusService_0 = game:GetService("MessageBusService");
return {
    NAME = "Call", 
    MESSAGE_INIT_CALL = l_MessageBusService_0:GetMessageId("Call", "initCall"), 
    MESSAGE_ANSWER_CALL = l_MessageBusService_0:GetMessageId("Call", "answerCall"), 
    MESSAGE_ANSWER_SUCCESS_CALL = l_MessageBusService_0:GetMessageId("Call", "answerSuccessCall"), 
    MESSAGE_REJECT_CALL = l_MessageBusService_0:GetMessageId("Call", "rejectCall"), 
    MESSAGE_CANCEL_CALL = l_MessageBusService_0:GetMessageId("Call", "cancelCall"), 
    MESSAGE_TELEPORT_SUCCESS_CALL = l_MessageBusService_0:GetMessageId("Call", "teleportSuccessCall"), 
    MESSAGE_FINISH_CALL = l_MessageBusService_0:GetMessageId("Call", "finishCall"), 
    MESSAGE_UDPATE_MIC_AND_CAM_STATE = l_MessageBusService_0:GetMessageId("Call", "updateMicAndCamState"), 
    MESSAGE_HANDLE_INIT_CALL = l_MessageBusService_0:GetMessageId("Call", "handleInitCall"), 
    MESSAGE_HANDLE_CONNECTING_CALL = l_MessageBusService_0:GetMessageId("Call", "handleConnectingCall"), 
    MESSAGE_HANDLE_TELEPORTING_CALL = l_MessageBusService_0:GetMessageId("Call", "handleTeleportingCall"), 
    MESSAGE_HANDLE_ACTIVE_CALL = l_MessageBusService_0:GetMessageId("Call", "handleActiveCall"), 
    MESSAGE_HANDLE_END_CALL = l_MessageBusService_0:GetMessageId("Call", "handleEndCall"), 
    MESSAGE_HANDLE_CALL_MESSAGE = l_MessageBusService_0:GetMessageId("Call", "handleCallMessage"), 
    MESSAGE_HANDLE_MIC_AND_CAM_CHANGED = l_MessageBusService_0:GetMessageId("Call", "handleMicAndCamChanged"), 
    MESSAGE_HANDLE_TRANSFER_CALL_TELEPORT_LEAVE = l_MessageBusService_0:GetMessageId("Call", "handleTransferCallTeleportLeave"), 
    MESSAGE_HANDLE_TRANSFER_CALL_TELEPORT_JOIN = l_MessageBusService_0:GetMessageId("Call", "handleTransferCallTeleportJoin"), 
    METHOD_GET_CALL_STATE = "getCallState"
};
