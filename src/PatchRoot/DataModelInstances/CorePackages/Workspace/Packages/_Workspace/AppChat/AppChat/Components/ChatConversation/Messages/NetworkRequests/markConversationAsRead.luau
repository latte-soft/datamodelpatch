local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Parent.AppChatNetworking);
local v2 = require(l_script_FirstAncestor_0.Http.NetworkingChat);
local v3 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v4 = require(l_script_FirstAncestor_0.Logger);
local v5 = require(l_script_FirstAncestor_0.Flags.isAppChatChannelsAPIEnabled);
local v6 = game:DefineFastFlag("AppChatAlwaysFetchUnreadCount", false);
local function _(v7, v8)
    return function(v9)
        local v10 = v3(v9:getState(), string.format("ChatAppReducer.Conversations.%s", v7 or ""));
        if not (not v10 or not v10.hasUnreadMessages) then
            if not v5() then
                v9:dispatch(v2.MarkAsRead.API(v7)):andThen(function()
                    if not (not v6 and not v8) then
                        v9:dispatch(v2.GetUnreadConversationCount.API()):catch(function(v11)
                            v4:error("NetworkingChat.GetUnreadConversationCount failure in markConversationAsRead, ", (("Status: %*"):format((tostring(v11)))));
                        end);
                    end;
                end):catch(function(v12)
                    v4:error((("NetworkingChat failure in markConversationAsRead, Status: %*"):format((tostring(v12)))));
                end);
            else
                v4:info("Marking conversation {} as read", v7);
                v9:dispatch(v1.rodux.MarkConversation.API(v7)):andThen(function()
                    v9:dispatch(v1.rodux.GetConversationMetadata.API()):catch(function(v13)
                        v4:error((("AppChatNetworking failure in markConversationAsRead, Status: %*"):format((tostring(v13)))));
                    end);
                end):catch(function(v14)
                    v4:error((("AppChatNetworking failure in markConversationAsRead, Status: %*"):format((tostring(v14)))));
                end);
                return ;
            end;
        end;
    end;
end;
return function(...)
    local v16, v17 = ...;
    return function(v18)
        local v19 = v3(v18:getState(), string.format("ChatAppReducer.Conversations.%s", v16 or ""));
        if not (not v19 or not v19.hasUnreadMessages) then
            if not v5() then
                v18:dispatch(v2.MarkAsRead.API(v16)):andThen(function()
                    if not (not v6 and not v17) then
                        v18:dispatch(v2.GetUnreadConversationCount.API()):catch(function(v20)
                            v4:error("NetworkingChat.GetUnreadConversationCount failure in markConversationAsRead, ", (("Status: %*"):format((tostring(v20)))));
                        end);
                    end;
                end):catch(function(v21)
                    v4:error((("NetworkingChat failure in markConversationAsRead, Status: %*"):format((tostring(v21)))));
                end);
            else
                v4:info("Marking conversation {} as read", v16);
                v18:dispatch(v1.rodux.MarkConversation.API(v16)):andThen(function()
                    v18:dispatch(v1.rodux.GetConversationMetadata.API()):catch(function(v22)
                        v4:error((("AppChatNetworking failure in markConversationAsRead, Status: %*"):format((tostring(v22)))));
                    end);
                end):catch(function(v23)
                    v4:error((("AppChatNetworking failure in markConversationAsRead, Status: %*"):format((tostring(v23)))));
                end);
                return ;
            end;
        end;
    end;
end;
