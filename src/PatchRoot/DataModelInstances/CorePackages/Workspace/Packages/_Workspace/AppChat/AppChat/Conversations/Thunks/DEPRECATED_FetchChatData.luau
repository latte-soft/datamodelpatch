local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Players_0 = game:GetService("Players");
local v3 = require(l_script_FirstAncestor_0.Actions.SetAppLoaded);
local v4 = require(l_script_FirstAncestor_0.LegacyAnalytics.RoactChatAnalytics);
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_Analytics_0 = require(l_Parent_0.Analytics).Analytics;
local v7 = require(l_script_FirstAncestor_0.Constants);
local v8 = require(script.Parent.FetchChatSettings);
local v9 = l_Analytics_0.new(l_RbxAnalyticsService_0);
local v10 = require(l_script_FirstAncestor_0.Conversations.Thunks.DEPRECATED_getLocalUserConversations);
return function(v11)
    return function(v12)
        return v12:dispatch(v8.API()):andThen(function(v13)
            local l_responseBody_0 = v13.responseBody;
            local v15 = v4.new(v9, (tostring(l_Players_0.LocalPlayer.UserId)));
            if l_responseBody_0.chatEnabled then
                v15:userLoadedChat();
                v12:dispatch(v10(1, v7.PageSize.GET_CONVERSATIONS)):andThen(function()
                    v12:dispatch(v3(true));
                end);
            end;
            if v11 then
                v11(l_responseBody_0.chatEnabled);
            end;
            return l_responseBody_0;
        end):catch(function(v16)
            warn("FetchChatData failed with error: ", (tostring(v16)));
        end);
    end;
end;
