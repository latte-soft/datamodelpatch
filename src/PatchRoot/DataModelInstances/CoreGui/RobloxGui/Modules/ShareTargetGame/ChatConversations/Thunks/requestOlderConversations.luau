return function(v0, v1)
    return function(v2)
        local v3 = v2:getState();
        if not v3.ChatAppReducer.ConversationsAsync.oldestConversationIsFetched then
            local v4 = 0;
            for _, _ in pairs(v3.ChatAppReducer.Conversations) do
                v4 = v4 + 1;
            end;
            v0(math.floor(v4 / v1) + 1);
            return ;
        else
            return ;
        end;
    end;
end;
