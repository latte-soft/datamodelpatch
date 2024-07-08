local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Conversations.Actions.ReceivedMessages);
local v2 = require(l_script_FirstAncestor_0.Models.MessageModel);
local v3 = require(l_script_FirstAncestor_0.Utils.reportAnalyticsForNewMessages);
local v4 = require(l_script_FirstAncestor_0.Flags.isAppChatChannelsAPIEnabled);
return function(v5, v6)
    return function(v7)
        local v8 = nil;
        v8 = if not v4() then v2.fromSentWeb(v6, v5) else v2.fromSentChannelsApi(v6, v5);
        if v8 then
            v3(v8, v5);
            local v9 = v7:getState().ChatAppReducer.Conversations[v5];
            if v9.messages:Length() > 0 then
                v8.previousMessageId = v9.messages:Last().id;
            end;
            v7:dispatch(v1(v5, {
                v8
            }));
            return ;
        else
            return ;
        end;
    end;
end;
