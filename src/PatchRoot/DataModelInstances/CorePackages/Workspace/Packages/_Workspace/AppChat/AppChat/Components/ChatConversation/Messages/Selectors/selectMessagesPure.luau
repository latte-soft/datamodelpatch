local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_script_FirstAncestor_0.Components.ChatConversation.Utils.messageSortPredicate);
local v5 = require(l_script_FirstAncestor_0.Components.ChatConversation.Utils.filterForLinksWithPolicy);
local v6 = require(l_script_FirstAncestor_0.Conversations.populateMessageWithState);
local l_HttpService_0 = game:GetService("HttpService");
return function(v8, v9)
    local l_conversation_0 = v8.conversation;
    if l_conversation_0 then
        local l_messages_0 = l_conversation_0.messages;
        local l_sendingMessages_0 = l_conversation_0.sendingMessages;
        local l_conversationId_0 = v8.conversationId;
        local v14 = v9.previousMessagesState[l_conversationId_0];
        local v15 = v9.previousSendingMessagesState[l_conversationId_0];
        local v16 = v9.previousMessagesResult[l_conversationId_0];
        if l_messages_0 then
            if l_messages_0 == v14 and l_sendingMessages_0 == v15 then
                return {
                    itemList = v16 or {}, 
                    previousMessagesState = v9.previousMessagesState, 
                    previousSendingMessagesState = v9.previousSendingMessagesState, 
                    previousMessagesResult = v9.previousMessagesResult
                };
            else
                local v17 = v2(l_messages_0, "values");
                local v18 = if not l_sendingMessages_0 then {} else v2(l_sendingMessages_0, "values");
                local v19 = v3.List.sort(v3.Dictionary.values((v3.Dictionary.join(v17, v18))), v4);
                local v20 = {};
                local v21 = table.clone(v16 or {});
                local v22 = if #v21 > 0 and v21[#v21].sent then v21[#v21].sent:GetUnixTimestamp() else math.huge;
                for _, v24 in v19, nil, nil do
                    local v25 = not not v18[v24.id];
                    for v26, v27 in v5(v24) do
                        local v28 = v6({
                            Users = v8.Users, 
                            LocalUserId = v8.localUserId
                        }, v27, v24.id, l_conversation_0, v20[#v20], v25);
                        if not (not v28.sent or v28.sent:GetUnixTimestamp() >= v22) or #v21 == 0 then
                            v28.stable_key = if v26 > 1 then l_HttpService_0:GenerateGUID(true) else v28.messageId;
                        else
                            v28.stable_key = table.remove(v21, #v21).stable_key;
                        end;
                        table.insert(v20, v28);
                    end;
                end;
                if #v21 > 0 then
                    return {
                        itemList = v16 or {}, 
                        previousMessagesState = v9.previousMessagesState, 
                        previousSendingMessagesState = v9.previousSendingMessagesState, 
                        previousMessagesResult = v9.previousMessagesResult
                    };
                else
                    local v29 = table.clone(v9.previousMessagesState);
                    local v30 = table.clone(v9.previousSendingMessagesState);
                    local v31 = table.clone(v9.previousMessagesResult);
                    v29[l_conversationId_0] = l_messages_0;
                    v30[l_conversationId_0] = l_sendingMessages_0;
                    v31[l_conversationId_0] = v3.List.reverse(v20);
                    return {
                        itemList = v31[l_conversationId_0], 
                        previousMessagesState = v29, 
                        previousSendingMessagesState = v30, 
                        previousMessagesResult = v31
                    };
                end;
            end;
        else
            return {
                itemList = v16 or {}, 
                previousMessagesState = v9.previousMessagesState, 
                previousSendingMessagesState = v9.previousSendingMessagesState, 
                previousMessagesResult = v9.previousMessagesResult
            };
        end;
    else
        return {
            itemList = {}, 
            previousMessagesState = v9.previousMessagesState, 
            previousSendingMessagesState = v9.previousSendingMessagesState, 
            previousMessagesResult = v9.previousMessagesResult
        };
    end;
end;
