local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Actions.SetAppLoaded);
local v3 = require(l_script_FirstAncestor_0.LegacyAnalytics.RoactChatAnalytics);
local v4 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local v5 = require(l_Parent_0.Analytics).Analytics.new((game:GetService("RbxAnalyticsService")));
local v6 = require(l_Parent_0.AppChatNetworking);
return function()
    v4:info("Fetching chat metadata");
    return function(v7)
        local l_LocalUserId_0 = v7:getState().LocalUserId;
        return v7:dispatch(v6.rodux.GetMetadata.API()):andThen(function(v9)
            return v9.responseBody.isChatEnabled;
        end):andThen(function(v10)
            if v10 then
                v7:dispatch(v2(true));
                v3.new(v5, l_LocalUserId_0):userLoadedChat();
            end;
        end):catch(function(v11)
            v4:warning("FetchChatData failed with error: {}", (tostring(v11)));
        end);
    end;
end;
