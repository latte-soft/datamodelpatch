local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.Requests);
local v2 = require(l_script_FirstAncestor_0.Analytics);
local v3 = require(l_script_FirstAncestor_0.dependencies);
local l_AnalyticsService_0 = v3.AnalyticsService;
local l_Players_0 = v3.Players;
local l_isAppChatChannelsAPIEnabled_0 = v3.AppChat.Flags.isAppChatChannelsAPIEnabled;
local l_fetchChatMetadata_0 = v3.AppChat.Conversations.Thunks.fetchChatMetadata;
local l_NavigateIntoChat_0 = v3.AppChat.Actions.NavigateIntoChat;
return function(v9)
    return {
        fetchChatSettings = not l_isAppChatChannelsAPIEnabled_0() and function(v10)
            v9(function(v11)
                return v9(v1.GetUserV2FromUserId.API(v11:getState().LocalUserId));
            end);
            return v9(v1.FetchChatSettings.API()):andThen(function(_)
                v2.Class.new(l_AnalyticsService_0, (tostring(l_Players_0.LocalPlayer.UserId))):userLoadedSocialTab();
            end):andThen(function()
                v9(v10(true));
            end):catch(function(v13)
                warn("SocialTab.Requests.FetchChatSettings with error: ", (tostring(v13)));
            end);
        end or function(v14)
            return v9(l_fetchChatMetadata_0()):andThen(function()
                v9(v14(true));
            end);
        end, 
        navigateIntoChat = function(v15)
            v9(l_NavigateIntoChat_0(v15));
        end
    };
end;
