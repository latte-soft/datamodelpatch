local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AppChat);
local v3 = require(l_Parent_0.AppChatNetworking);
if not v2.Flags.isAppChatChannelsAPIEnabled() then
    local v4 = require(l_script_FirstAncestor_0.dependencies);
    local l_RoduxNetworking_0 = v4.RoduxNetworking;
    local l_Url_0 = v4.Url;
    return l_RoduxNetworking_0.GET(script, function(v7)
        return v7(l_Url_0.CHAT_URL):path("get-unread-conversation-count");
    end);
else
    return v3.rodux.GetConversationMetadata;
end;
