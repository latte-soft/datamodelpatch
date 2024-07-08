local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
game:DefineFastFlag("AppChatChannelsGetNewerMessagesWithPrevCursor", false);
local v2 = require(l_Parent_0.AppChatNetworking);
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_script_FirstAncestor_0.Http.NetworkingChat);
local v5 = require(l_script_FirstAncestor_0.Conversations.Thunks.DEPRECATED_getConversations);
local v6 = require(l_script_FirstAncestor_0.Constants);
local v7 = require(l_script_FirstAncestor_0.Utils.reportToDiagByCountryCode);
local v8 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local v9 = require(l_script_FirstAncestor_0.Flags.isAppChatChannelsAPIEnabled);
local function _(v10)
    v7(v6.PerformanceMeasurement.LUA_CHAT_RECEIVE_MESSAGE, "MessageReceivedTime", tick() - v10);
end;
return function(v12, _, v14)
    v8:info("Getting new messages for {}", v12);
    return function(v15)
        local v16 = if not v9() then nil else {};
        local v17 = v15:getState().ChatAppReducer.Conversations[v12];
        if not v17 then
            if not v9() then
                v15:dispatch(v5({
                    v12
                })):catch(function(v18)
                    warn("NetworkingChat failure in GetConversations", v18);
                end);
            elseif v16 then
                table.insert(v16, v15:dispatch(v2.rodux.GetConversationDetails.API(v12)):catch(function(v19)
                    v8:error((("AppChatNetworking failure in GetConversationDetails: %*"):format((tostring(v19)))));
                end));
            end;
        end;
        if not v9() then
            v15:dispatch(v4.GetMessages.API(v12, v6.PageSize.GET_NEW_MESSAGES)):andThen(function()
                v7(v6.PerformanceMeasurement.LUA_CHAT_RECEIVE_MESSAGE, "MessageReceivedTime", tick() - v14);
            end):catch(function(v20)
                warn("NetworkingChat failure in GetNewMessages", v20);
            end);
        else
            local v21 = if not game:GetFastFlag("AppChatChannelsGetNewerMessagesWithPrevCursor") then nil else v17 and v17.previousCursor or nil;
            if v16 then
                table.insert(v16, v15:dispatch(v2.rodux.GetNewerMessages.API(v12, v21)):andThen(function()
                    v7(v6.PerformanceMeasurement.LUA_CHAT_RECEIVE_MESSAGE, "MessageReceivedTime", tick() - v14);
                end):catch(function(v22)
                    v8:error((("AppChatNetworking failure in GetNewerMessages: %*"):format((tostring(v22)))));
                end));
            end;
        end;
        if not v9() then
            return nil;
        else
            return v3.allSettled(v16);
        end;
    end;
end;
