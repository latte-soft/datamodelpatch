local l_gamePlayIntent_0 = require(script:FindFirstAncestor("AppChat").Parent.ExperienceAnalytics).Events.gamePlayIntent;
return function(v1, v2, v3)
    local v4 = nil;
    local v5 = nil;
    if v2 == "gamePlayIntent" then
        v5 = {
            conversationId = v1.conversationId, 
            rootPlaceId = v1.placeId, 
            joinAttemptId = v1.joinAttemptId
        };
        v4 = v1.eventIngest;
    else
        v5 = {
            conversationId = v1.conversationId, 
            placeId = v1.placeId
        };
        v4 = v1.eventStream;
    end;
    if v2 == "gamePlayIntent" then
        l_gamePlayIntent_0(v4, v3, {
            placeId = v5.rootPlaceId, 
            rootPlaceId = tonumber(v5.rootPlaceId), 
            conversationId = v5.conversationId, 
            joinAttemptId = v5.joinAttemptId
        });
        return ;
    else
        v4:setRBXEventStream(v3, v2, v5);
        return ;
    end;
end;
