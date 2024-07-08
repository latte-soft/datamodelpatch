local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local v2 = require(script.Parent.createConversation);
local v3 = require(l_script_FirstAncestor_0.Conversations.getOtherParticipants);
local _ = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local v5 = require(l_script_FirstAncestor_0.Conversations.Actions.FriendConversationCreated);
return function(v6, v7)
    return function(v8)
        local v9 = v8:getState();
        local v10 = v9.ChatAppReducer.Conversations[v6];
        if v10 then
            local v11 = v3(v10, v9.LocalUserId);
            if #v11 > 1 then
                v1:error("friendConversationId {} has more than 2 participants. Unable to create one-to-one conversation.", v6);
                return ;
            else
                return v8:dispatch(v2("one_to_one", {
                    (tostring(v11[1]))
                }, v7, "userSentMessageToFriendPlaceholder")):tap(function(v12)
                    v8:dispatch(v5({
                        newConversationId = v12.id, 
                        oldFriendConversationId = v6
                    }));
                end);
            end;
        else
            v1:error("Could not find friendConversationId {} in store state. Unable to create converstation.", v6);
            return ;
        end;
    end;
end;
