local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AppChatNetworking);
local v3 = require(l_Parent_0.Rodux);
local v4 = require(l_script_FirstAncestor_0.Http.NetworkingChat);
local v5 = require(l_script_FirstAncestor_0.Conversations.Actions.ReceivedLatestMessages);
local v6 = require(l_script_FirstAncestor_0.Conversations.Actions.ReceivedOldestConversation);
local v7 = require(l_script_FirstAncestor_0.Conversations.Actions.ReceivedPageConversations);
local v8 = require(l_script_FirstAncestor_0.Conversations.Actions.RequestLatestMessages);
local v9 = require(l_script_FirstAncestor_0.Conversations.Actions.RequestPageConversations);
local l_Immutable_0 = require(l_Parent_0.AppCommonLib).Immutable;
return v3.createReducer({}, {
    [v9.name] = function(v11, _)
        return l_Immutable_0.JoinDictionaries(v11, {
            pageConversationsIsFetching = true
        });
    end, 
    [v7.name] = function(v13, _)
        return l_Immutable_0.JoinDictionaries(v13, {
            pageConversationsIsFetching = false
        });
    end, 
    [v8.name] = function(v15, _)
        return l_Immutable_0.JoinDictionaries(v15, {
            latestMessagesIsFetching = true
        });
    end, 
    [v5.name] = function(v17, _)
        return l_Immutable_0.JoinDictionaries(v17, {
            latestMessagesIsFetching = false
        });
    end, 
    [v6.name] = function(v19, _)
        return l_Immutable_0.JoinDictionaries(v19, {
            oldestConversationIsFetched = true
        });
    end, 
    [v4.GetUserConversations.Succeeded.name] = function(v21, v22)
        if #v22.responseBody < v22.queryArgs.pageSize then
            return l_Immutable_0.JoinDictionaries(v21, {
                oldestConversationIsFetched = true
            });
        else
            return v21;
        end;
    end, 
    [v2.rodux.GetUserConversations.Succeeded.name] = function(v23, v24)
        local l_next_cursor_0 = v24.responseBody.next_cursor;
        if not (l_next_cursor_0 ~= nil) or l_next_cursor_0 == "" then
            return l_Immutable_0.JoinDictionaries(v23, {
                oldestConversationIsFetched = true
            });
        else
            return v23;
        end;
    end
});
