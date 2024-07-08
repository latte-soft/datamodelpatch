local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Messages_0 = script.Parent.Messages;
local v3 = require(l_Messages_0.NetworkRequests.getOlderMessages);
local v4 = require(l_Messages_0.NetworkRequests.markConversationAsRead);
local v5 = require(l_Messages_0.Thunks.sendTextMessage);
local v6 = require(l_Messages_0.Thunks.getRemainingOlderMessages);
local v7 = require(l_Messages_0.NetworkRequests.updateTypingStatus);
local v8 = require(l_script_FirstAncestor_0.Conversations.Thunks.createFriendConversation);
local v9 = require(l_script_FirstAncestor_0.Logger);
local v10 = require(l_script_FirstAncestor_0.Http.NetworkingChat);
local v11 = require(l_Parent_0.AppChatNetworking);
local v12 = require(l_script_FirstAncestor_0.Flags.isAppChatChannelsAPIEnabled);
return function(v13)
    local function v18(v14, v15, v16, v17)
        return v13(v3(v14, v15, v16, v17));
    end;
    return {
        getOlderMessages = function(v19, _)
            return v13(v6(v18, v19));
        end, 
        sendMessage = function(v21, v22)
            return v13(v5(v21, v22));
        end, 
        createFriendConversation = function(v23, v24)
            return v13(v8(v23, v24));
        end, 
        markConversationAsRead = function(v25, v26)
            v13(v4(v25, v26));
        end, 
        postTypingStatus = function(v27, v28)
            if not v12() then
                return v13(v10.UpdateUserTypingStatus.API(v27, v28));
            else
                return v13(v7(v27));
            end;
        end, 
        getUnreadConversationCount = function()
            if not v12() then
                return v13(v10.GetUnreadConversationCount.API()):catch(function(v29)
                    warn("NetworkingChat failure in getUnreadConversationCount, Status: " .. tostring(v29));
                end);
            else
                return v13(v11.rodux.GetConversationMetadata.API()):catch(function(v30)
                    v9:error((("Failure in GetConversationMetadata. Error: %*"):format((tostring(v30)))));
                end);
            end;
        end
    };
end;
