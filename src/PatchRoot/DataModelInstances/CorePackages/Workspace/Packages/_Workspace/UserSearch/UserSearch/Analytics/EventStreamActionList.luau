local l_Parent_0 = script:FindFirstAncestor("UserSearch").Parent;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Enums_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums;
local l_Contexts_0 = l_Enums_0.Contexts;
local l_EventTypes_0 = l_Enums_0.EventTypes;
local v5 = require(script.Parent.EventNames);
local v6 = require(script.Parent.BtnValues);
local function v8(v7)
    if not v7 then
        return "";
    else
        return (table.concat(v7, ","));
    end;
end;
local function v10(v9)
    return v9;
end;
return {
    [v5.PlayerTileImpressions] = {
        context = l_Contexts_0.PlayerSearch, 
        eventType = l_EventTypes_0.PlayerTileImpressions, 
        formatRulesForAdditionalInfo = {
            tilePos = v8, 
            playerId = v8, 
            playerName = v8
        }
    }, 
    [v5.NavigateToAddFriendsBtn] = {
        context = l_Contexts_0.PlayerSearch, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v6.NavigateToAddFriends
        }
    }, 
    [v5.PlayerFriendRequest] = {
        context = l_Contexts_0.PlayerSearch, 
        eventType = l_EventTypes_0.PlayerFriendAdd, 
        formatRulesForAdditionalInfo = {
            playerId = v10, 
            tilePos = v10, 
            contextualInfoType = v10
        }, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }
    }, 
    [v5.PlayerFriendAccept] = {
        context = l_Contexts_0.PlayerSearch, 
        eventType = l_EventTypes_0.PlayerFriendAccept, 
        formatRulesForAdditionalInfo = {
            playerId = v10, 
            tilePos = v10, 
            contextualInfoType = v10
        }, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }
    }, 
    [v5.PlayerTileClick] = {
        context = l_Contexts_0.PlayerSearch, 
        eventType = l_EventTypes_0.PlayerTileClick, 
        formatRulesForAdditionalInfo = {
            playerId = v10, 
            tilePos = v10, 
            contextualInfoType = v10
        }, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }
    }, 
    [v5.UserSearchLoadingTime] = {
        context = l_Contexts_0.PlayerSearch, 
        eventType = l_EventTypes_0.LoadingTime, 
        formatRulesForAdditionalInfo = {
            status = v10, 
            loadingTime = v10, 
            loadingThreshold = v10, 
            nextPage = v10
        }, 
        additionalInfo = {
            fetch = "userSearch", 
            locale = l_LocalizationService_0.RobloxLocaleId
        }
    }
};
