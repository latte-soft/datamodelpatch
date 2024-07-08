local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_RoactPaginator_0 = require(l_script_FirstAncestor_0.SocialLibraries).RoactPaginator;
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local l_Conversations_0 = script.Parent.Conversations;
local v6 = require(l_script_FirstAncestor_0.Conversations.Thunks.fetchConversationsByPage);
local v7 = require(l_Conversations_0.NetworkRequests.DEPRECATED_getLocalUserConversationsAsync);
local v8 = require(l_script_FirstAncestor_0.Http.NetworkingChat);
local v9 = require(l_script_FirstAncestor_0.Conversations.Thunks.createConversation);
local v10 = require(l_script_FirstAncestor_0.Flags.isAppChatChannelsAPIEnabled);
return function(v11)
    return {
        [l_RoactPaginator_0.fetchInit] = function()
            if not v10() then
                return v3.new(function(v12)
                    coroutine.wrap(function()
                        v11(function(v13)
                            if not v4(v13:getState(), "RoactChat.isActiveChatUser") then
                                v11(v7(1, 30));
                            end;
                        end);
                        v12(nil, 2);
                    end)();
                end);
            else
                return v11(v6());
            end;
        end, 
        [l_RoactPaginator_0.fetchWithCursor] = function(v14)
            return v3.new(function(v15)
                coroutine.wrap(function()
                    if not v10() then
                        v11(v7(v14, 30));
                        v15(v14 - 1, v14 + 1);
                        return ;
                    else
                        local v16, v17, v18 = v11(v6(v14)):await();
                        if not v16 then
                            v15(nil, v14);
                            return ;
                        else
                            v15(v17, v18);
                            return ;
                        end;
                    end;
                end)();
            end);
        end, 
        startOneToOneConversation = function(v19)
            return v11(v8.StartOneToOneConversation.API(v19));
        end, 
        createOneToOneConversation = function(v20)
            return v11(v9("one_to_one", {
                v20
            }));
        end
    };
end;
