local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Models.Conversation);
local v2 = require(l_script_FirstAncestor_0.Http.NetworkingChat);
local v3 = require(l_script_FirstAncestor_0.Conversations.hasConversationChanged);
local v4 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v5 = require(l_script_FirstAncestor_0.Conversations.Thunks.DEPRECATED_refreshMessages);
local function v6(v7, v8)
    local v9 = v7:getState();
    local v10 = not not v8 and v8.pageSize or 30;
    local v11 = not not v8 and v8.pageNumber or 1;
    return v7:dispatch(v2.GetUserConversations.API(v11, v10)):andThen(function(v12)
        local l_responseBody_0 = v12.responseBody;
        for _, v15 in ipairs(l_responseBody_0) do
            local v16 = v4(v9, string.format("ChatAppReducer.Conversations.%s", (tostring(v15.id))));
            if not v3({
                new = v1.fromWeb(v15), 
                existing = v16
            }) then
                return ;
            elseif v16 then
                v5(v16, v7);
            end;
        end;
        if #l_responseBody_0 == v10 then
            v6(v7, {
                pageNumber = v11 + 1, 
                pageSize = v10
            });
        end;
    end):catch(function(v17)
        warn("Failure in DEPRECATED_refreshConversations NetworkingChat.GetUserConversations ", (tostring(v17)));
    end);
end;
return v6;
