local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Parent.Promise);
local v2 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v3 = require(l_script_FirstAncestor_0.Conversations.Thunks.DEPRECATED_getLocalUserConversations);
return function(v4, v5, v6)
    return function(v7)
        if not (not v6 or not v6.DEPRECATED_getLocalUserConversations) then
            v3 = v6.DEPRECATED_getLocalUserConversations;
        end;
        if not v2(v7:getState(), "ChatAppReducer.ConversationsAsync.oldestConversationIsFetched") then
            return v7:dispatch(v3(v4, v5));
        else
            return v1.resolve();
        end;
    end;
end;
