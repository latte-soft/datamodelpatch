local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v3 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v4 = require(l_script_FirstAncestor_0.Http.NetworkingChat);
local v5 = require(l_script_FirstAncestor_0.Http.RoduxNetworking);
local v6 = require(l_script_FirstAncestor_0.Flags.isAppChatChannelsAPIEnabled);
local v7 = require(l_Parent_0.AppChatNetworking);
local v8 = game:DefineFastFlag("EnableAreConversationsFetchingFix", false);
return function()
    return l_useSelector_0(function(v9)
        if not v8 then
            return v3(v9, "ChatAppReducer.ConversationsAsync.pageConversationsIsFetching");
        elseif not v6() then
            return v4.GetUserConversations.getStatus(v9, 1) == v5.Enum.NetworkStatus.Fetching;
        else
            return v7.rodux.GetUserConversations.getStatus(v9, 1) == v5.Enum.NetworkStatus.Fetching;
        end;
    end);
end;
