local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Parent.AppChatNetworking);
local v2 = require(l_script_FirstAncestor_0.Logger):new("AppChat.paginateForNewerMessages");
local _ = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local function _(v4, v5)
    return v4.messages:Get(v5) ~= nil;
end;
local function v7(v8, v9)
    return function(v10)
        local l_responseBody_0 = v9.responseBody;
        if l_responseBody_0 then
            local l_messages_0 = l_responseBody_0.messages;
            local v13 = (not not l_messages_0 and #l_messages_0 > 0) and l_messages_0[#l_messages_0].id or nil;
            if v13 == nil then
                v2:warning("No messages in response");
                return ;
            else
                assert(v13, "FFlagLuauTinyControlFlowAnalysis");
                local v14 = (not not l_responseBody_0.next_cursor and l_responseBody_0.next_cursor ~= "") and l_responseBody_0.next_cursor or nil;
                if v14 == nil then
                    v2:debug("No more messages to fetch");
                    return ;
                elseif not (v8.messages:Get(v13) ~= nil) then
                    v2:trace("Fetching for the next page of messages using cursor: {}", v14);
                    return v10:dispatch(v1.rodux.GetOlderMessages.API(v8.id, v14)):andThen(function(v15)
                        return v10:dispatch(v7(v8, v15));
                    end):catch(function(v16)
                        v2:warning("AppChatNetworking failure in fetchOlderMessages of refreshing new messages: {}", v16);
                    end);
                else
                    v2:debug("Last message already in conversation, we've caught up");
                    return ;
                end;
            end;
        else
            return ;
        end;
    end;
end;
return function(v17)
    return function(v18)
        v2:info("Starting to fetch newest messages for conversation: {}", v17.id);
        return v18:dispatch(v1.rodux.GetOlderMessages.API(v17.id, nil)):andThen(function(v19)
            local l_v18_0 = v18;
            local l_v17_0 = v17;
            return l_v18_0:dispatch(function(v22)
                local l_responseBody_1 = v19.responseBody;
                if l_responseBody_1 then
                    local l_messages_1 = l_responseBody_1.messages;
                    local v25 = (not not l_messages_1 and #l_messages_1 > 0) and l_messages_1[#l_messages_1].id or nil;
                    if v25 == nil then
                        v2:warning("No messages in response");
                        return ;
                    else
                        assert(v25, "FFlagLuauTinyControlFlowAnalysis");
                        local v26 = (not not l_responseBody_1.next_cursor and l_responseBody_1.next_cursor ~= "") and l_responseBody_1.next_cursor or nil;
                        if v26 == nil then
                            v2:debug("No more messages to fetch");
                            return ;
                        elseif not (l_v17_0.messages:Get(v25) ~= nil) then
                            v2:trace("Fetching for the next page of messages using cursor: {}", v26);
                            return v22:dispatch(v1.rodux.GetOlderMessages.API(l_v17_0.id, v26)):andThen(function(v27)
                                return v22:dispatch(v7(l_v17_0, v27));
                            end):catch(function(v28)
                                v2:warning("AppChatNetworking failure in fetchOlderMessages of refreshing new messages: {}", v28);
                            end);
                        else
                            v2:debug("Last message already in conversation, we've caught up");
                            return ;
                        end;
                    end;
                else
                    return ;
                end;
            end);
        end):catch(function(v29)
            v2:warning("AppChatNetworking failure in refreshing first batch of new messages: {}", v29);
        end);
    end;
end;
