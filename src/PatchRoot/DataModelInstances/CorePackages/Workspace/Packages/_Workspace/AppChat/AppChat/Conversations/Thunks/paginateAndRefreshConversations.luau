local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Parent.AppChatNetworking);
local v2 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v3 = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local v4 = require(l_script_FirstAncestor_0.Conversations.hasConversationChanged);
local v5 = require(l_script_FirstAncestor_0.Conversations.Thunks.DEPRECATED_refreshMessages);
local v6 = require(l_script_FirstAncestor_0.Logger):new("paginateAndRefreshConversations");
local v7 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatUseFetchNewestMessages);
local v8 = require(l_script_FirstAncestor_0.Conversations.Thunks.paginateForNewerMessages);
local function v9(v10)
    return function(v11)
        local v12 = v11:getState();
        return v11:dispatch(v1.rodux.GetUserConversations.API(v10)):andThen(function(v13)
            for _, v15 in v13.responseBody.conversations, nil, nil do
                local v16 = v2(v12, (("ChatAppReducer.Conversations.%*"):format((tostring(v15.id)))));
                local v17 = v3.fromChannelsApi(v15);
                if not v4({
                    new = v17, 
                    existing = v16
                }) then
                    return ;
                elseif v16 then
                    if not v7() then
                        v5(v16, v11);
                    else
                        v6:debug("Fetching missing messages for conversation: {}", v17.id);
                        v11:dispatch(v8(v17));
                    end;
                end;
            end;
            local l_next_cursor_0 = v13.responseBody.next_cursor;
            if (l_next_cursor_0 and l_next_cursor_0 ~= "") and typeof(l_next_cursor_0) == "string" then
                return v11:dispatch(v9(l_next_cursor_0));
            else
                return ;
            end;
        end):catch(function(v19)
            warn("Failure in paginateAndRefreshConversations: ", (tostring(v19)));
            return v19;
        end);
    end;
end;
return function()
    return function(v20)
        local v21 = nil;
        return v20:dispatch(function(v22)
            local v23 = v22:getState();
            return v22:dispatch(v1.rodux.GetUserConversations.API(v21)):andThen(function(v24)
                for _, v26 in v24.responseBody.conversations, nil, nil do
                    local v27 = v2(v23, (("ChatAppReducer.Conversations.%*"):format((tostring(v26.id)))));
                    local v28 = v3.fromChannelsApi(v26);
                    if not v4({
                        new = v28, 
                        existing = v27
                    }) then
                        return ;
                    elseif v27 then
                        if not v7() then
                            v5(v27, v22);
                        else
                            v6:debug("Fetching missing messages for conversation: {}", v28.id);
                            v22:dispatch(v8(v28));
                        end;
                    end;
                end;
                local l_next_cursor_1 = v24.responseBody.next_cursor;
                if (l_next_cursor_1 and l_next_cursor_1 ~= "") and typeof(l_next_cursor_1) == "string" then
                    return v22:dispatch(v9(l_next_cursor_1));
                else
                    return ;
                end;
            end):catch(function(v30)
                warn("Failure in paginateAndRefreshConversations: ", (tostring(v30)));
                return v30;
            end);
        end);
    end;
end;
