local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Parent.AppChatNetworking);
local v2 = require(script.Parent.processConversations);
local v3 = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local v4 = require(l_script_FirstAncestor_0.Logger);
return function(v5)
    return function(v6)
        v4:info("Fetching latest conversation details for conversationId: {}", v5);
        return v6:dispatch(v1.rodux.GetConversationDetails.API(v5)):andThen(function(v7)
            local l_responseBody_0 = v7.responseBody;
            assert(l_responseBody_0.conversations and #l_responseBody_0.conversations == 1, "Expected exactly one conversation in response body");
            v6:dispatch(v2(l_responseBody_0.conversations));
            return v3.fromChannelsApi(l_responseBody_0.conversations[1]);
        end):catch(function(v9)
            v4:warning("Failure in fetchLatestConversationDetails, Status: " .. tostring(v9));
        end);
    end;
end;
