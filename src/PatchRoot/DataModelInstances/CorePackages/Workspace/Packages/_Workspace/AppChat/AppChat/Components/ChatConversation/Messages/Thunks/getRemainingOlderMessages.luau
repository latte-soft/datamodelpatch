local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AppChatNetworking);
local v3 = require(l_script_FirstAncestor_0.Http.RoduxNetworking);
local v4 = require(l_script_FirstAncestor_0.Http.NetworkingChat);
local v5 = require(l_Parent_0.Promise);
local v6 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local v7 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v8 = game:DefineFastFlag("AppChatRemainingOlderMessagesLogResolve", false);
local v9 = require(l_script_FirstAncestor_0.Flags.isAppChatChannelsAPIEnabled);
local function v16(v10)
    local v11 = v7(v10, "keys");
    local v12 = v7(v10, "values");
    local v13 = nil;
    for _, v15 in pairs(v11) do
        if v12[v15] and v12[v15].previousMessageId == nil then
            return v15;
        end;
    end;
    return v13;
end;
return function(v17, v18)
    v6:info("Maybe getting older messages for {}", v18);
    return function(v19)
        local l_ChatAppReducer_0 = v19:getState().ChatAppReducer;
        if l_ChatAppReducer_0 and l_ChatAppReducer_0.Conversations then
            local v21 = l_ChatAppReducer_0.Conversations[v18];
            local _ = nil;
            local v23 = if not v9() then v4.GetMessages.getStatus(v19:getState(), v18) else v2.rodux.GetOlderMessages.getStatus(v19:getState(), v18) == v3.Enum.NetworkStatus.Fetching;
            if not v8 then
                if not (not (not v21 or v23) and not v21.fetchedOldestMessage) then
                    return v5.resolve();
                end;
            elseif v21 then
                if not v23 then
                    if v21.fetchedOldestMessage then
                        v6:debug("Canceling since we have already fetched the oldest message for conversation id {}", v18);
                        return v5.resolve();
                    end;
                else
                    v6:debug("Canceling since we are already fetching older messages for conversation id {}", v18);
                    return v5.resolve();
                end;
            else
                v6:debug("Canceling since conversation id {} is not in local state", v18);
                return v5.resolve();
            end;
            return v17(v18, v16(v21.messages), v21.nextCursor);
        else
            return v5.resolve();
        end;
    end;
end;
