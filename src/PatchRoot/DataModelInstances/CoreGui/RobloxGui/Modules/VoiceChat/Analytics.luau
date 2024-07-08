local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
game:DefineFastInt("LuaVoiceChatAnalyticsPointsThrottle", 0);
game:DefineFastFlag("LuaVoiceChatAnalyticsUsePointsV2", false);
game:DefineFastFlag("LuaVoiceChatAnalyticsUseCounterV2", false);
game:DefineFastFlag("LuaVoiceChatAnalyticsUseEventsV2", false);
game:DefineFastFlag("LuaVoiceChatAnalyticsBanMessage", true);
game:DefineFastFlag("LuaVoiceChatReconnectMissedSequence", false);
local v1 = {};
v1.__index = v1;
v1.INFO = "info";
v1.WARNING = "warning";
v1.ERROR = "error";
v1.new = function(v2)
    if not v2 then
        v2 = l_RbxAnalyticsService_0;
    end;
    assert(v2, "Analytics impl must not be nil.");
    return (setmetatable({
        _impl = v2
    }, v1));
end;
local function v3()
end;
v1.stubService = function()
    return {
        SetRBXEvent = v3, 
        SetRBXEventStream = v3, 
        SendEventDeferred = v3, 
        ReportCounter = v3, 
        ReportStats = v3, 
        ReportInfluxSeries = v3
    };
end;
v1.setImpl = function(v4, v5)
    v4._impl = v5;
end;
v1._report = function(v6, v7, v8, v9, v10)
    local v11 = v7 .. "-" .. v8;
    if game:GetFastFlag("LuaVoiceChatAnalyticsUsePointsV2") then
        v6._impl:ReportInfluxSeries(v11, v10, game:GetFastInt("LuaVoiceChatAnalyticsPointsThrottle"));
    end;
    if game:GetFastFlag("LuaVoiceChatAnalyticsUseCounterV2") then
        local l_v11_0 = v11;
        if v9 then
            l_v11_0 = l_v11_0 .. "-" .. v9;
        end;
        local l_l_v11_0_0 = l_v11_0;
        if not (not v10 or not v10.result) then
            l_l_v11_0_0 = l_l_v11_0_0 .. "-" .. v10.result;
        end;
        v6._impl:ReportCounter(l_l_v11_0_0, 1);
    end;
    if game:GetFastFlag("LuaVoiceChatAnalyticsUseEventsV2") then
        v6._impl:SendEventDeferred("client", v7, v8, v10);
    end;
end;
v1.reportVoiceChatJoinResult = function(v14, v15, v16, v17)
    v14:_report("voiceChat", "defaultChannelJoinResults", v16, {
        success = v15, 
        result = v16, 
        logLevel = v17 or v1.INFO
    });
end;
v1.reportBanMessageEvent = function(v18, v19)
    if game:GetFastFlag("LuaVoiceChatAnalyticsBanMessage") then
        v18._impl:ReportCounter("voiceChat-reportBanMessage" .. v19, 1);
    end;
end;
v1.reportBanMessageEventV2 = function(v20, v21, v22, v23, v24)
    v20:_report("voiceChat", "reportBanEvent", nil, {
        eventType = v21, 
        banReason = v22, 
        userId = v23, 
        voiceSessionId = v24
    });
end;
v1.reportReconnectDueToMissedSequence = function(v25)
    if game:GetFastFlag("LuaVoiceChatReconnectMissedSequence") then
        v25._impl:ReportCounter("voiceChat-reconnectMissedSequence", 1);
    end;
end;
v1.reportOutOfOrderSequence = function(v26)
    v26._impl:ReportCounter("voiceChat-outOfOrderSequence", 1);
end;
v1.reportReceivedNudge = function(v27, v28, v29, v30)
    local v31 = DateTime.now().UnixTimestampMillis - DateTime.fromIsoDate(v28.deliveryTime).UnixTimestampMillis;
    v27._impl:ReportCounter("voicechat-receivednudge", 1);
    v27._impl:ReportCounter("voicechat-receivednudgeduration", v31);
    v27._impl:SendEventDeferred("client", "voiceChat", "receivedNudge", {
        type = v28.type, 
        durationInMs = v31, 
        userId = v29, 
        voiceSessionId = v30
    });
end;
v1.reportClosedNudge = function(v32, v33, v34)
    v32._impl:ReportCounter("voicechat-closednudge", 1);
    v32._impl:SendEventDeferred("client", "voiceChat", "closedNudge", {
        userId = v33, 
        voiceSessionId = v34, 
        closeType = "CLOSED"
    });
end;
v1.reportAcknowledgedNudge = function(v35, v36, v37)
    v35._impl:ReportCounter("voicechat-acknowledgednudge", 1);
    v35._impl:SendEventDeferred("client", "voiceChat", "closedNudge", {
        userId = v36, 
        voiceSessionId = v37, 
        closeType = "ACKNOWLEDGED"
    });
end;
v1.reportDeniedNudge = function(v38, v39, v40)
    v38._impl:ReportCounter("voicechat-deniednudge", 1);
    v38._impl:SendEventDeferred("client", "voiceChat", "closedNudge", {
        userId = v39, 
        voiceSessionId = v40, 
        closeType = "DENIED"
    });
end;
v1.reportVoiceMuteIndividual = function(v41, v42)
    v41._impl:SendEventDeferred("client", "voice", "voiceUIMuteUnmuteIndividual", {
        user_id = v42.userId, 
        client_session_id = v42.clientSessionId, 
        target_user_id = v42.targetUserId, 
        channel_id = v42.channelId, 
        context = v42.context, 
        muted = v42.muted
    });
end;
v1.reportVoiceMuteGroup = function(v43, v44)
    v43._impl:SendEventDeferred("client", "voice", "voiceUIMuteUnmuteGroup", {
        user_id = v44.userId, 
        client_session_id = v44.clientSessionId, 
        channel_id = v44.channelId, 
        context = v44.context, 
        group_type = v44.groupType, 
        muted = v44.muted
    });
end;
v1.reportVoiceMuteSelf = function(v45, v46)
    v45._impl:SendEventDeferred("client", "voice", "voiceUIMuteUnmuteSelf", {
        user_id = v46.userId, 
        client_session_id = v46.clientSessionId, 
        channel_id = v46.channelId, 
        context = v46.context, 
        muted = v46.muted
    });
end;
return v1;
