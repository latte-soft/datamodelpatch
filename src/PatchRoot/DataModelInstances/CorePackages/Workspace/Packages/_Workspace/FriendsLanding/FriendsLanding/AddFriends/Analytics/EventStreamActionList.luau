local l_Parent_0 = script:FindFirstAncestor("FriendsLanding").Parent;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v2 = require(l_Parent_0.Dash);
local l_Enums_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums;
local l_EventTypes_0 = l_Enums_0.EventTypes;
local l_Contexts_0 = l_Enums_0.Contexts;
local l_Sources_0 = l_Enums_0.Sources;
local v7 = require(script.Parent.EventNames);
return {
    [v7.OpenUserSearch] = {
        context = l_Contexts_0.Players, 
        eventType = l_EventTypes_0.Search, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId, 
            act = "open", 
            source = l_Sources_0.AddFriendsPage
        }
    }, 
    [v7.PageLoad] = {
        context = l_Contexts_0.AddFriends, 
        eventType = l_EventTypes_0.PageLoad, 
        formatRulesForAdditionalInfo = {
            page = v2.identity, 
            requestingUserId = v2.identity, 
            gamesContext = v2.identity, 
            absPosition = v2.identity, 
            mutualFriendsContext = v2.identity, 
            recommendationSessionId = v2.identity, 
            recommendationCount = v2.identity
        }
    }
};
