local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AppChatNetworking);
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local v5 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v6 = require(l_script_FirstAncestor_0.Analytics.Enums.CreateConversationError);
local v7 = require(l_script_FirstAncestor_0.Flags.isAppChatFriendsSourceEnabled);
local v8 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatCreateConversationFailedCheck);
local function v14(v9, v10, v11)
    local v12 = v9.responseBody.conversations[1];
    if v8() and v12.status == "failed" then
        return v3.reject("Failed to create conversation.");
    else
        local v13 = v4.fromChannelsApi(v12);
        if v10 then
            v10.fireAnalyticsEvent(v5.NewConversationCreated, {
                conversationId = v13.id, 
                createConversationResult = if v13 then v9.responseBody.conversations[1].status else v6.InvalidResponse, 
                participantsCount = #v13.participants, 
                createdReason = if not v7() then nil else v11 or "unknown"
            });
        end;
        return v13;
    end;
end;
return function(v15, v16, v17, v18)
    return function(v19)
        return v19:dispatch(v2.rodux.CreateConversation.API(v15, v16)):andThen(function(v20)
            return v14(v20, v17, v18);
        end);
    end;
end;
