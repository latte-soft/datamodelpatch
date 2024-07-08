local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_CorePackages_0.Packages.Dash);
local l_Enums_0 = require(l_CorePackages_0.Workspace.Packages.SocialLuaAnalytics).Analytics.Enums;
local l_Contexts_0 = l_Enums_0.Contexts;
local l_EventTypes_0 = l_Enums_0.EventTypes;
local v8 = require(script.Parent.EventNamesEnum);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
local l_l_RbxAnalyticsService_0_PlaySessionId_0 = l_RbxAnalyticsService_0:GetPlaySessionId();
local v12 = nil;
v12 = (not (l_l_UserInputService_0_Platform_0 ~= Enum.Platform.Windows) or l_l_UserInputService_0_Platform_0 == Enum.Platform.OSX) and "desktop" or (l_l_UserInputService_0_Platform_0 == Enum.Platform.IOS and "ios" or (l_l_UserInputService_0_Platform_0 == Enum.Platform.Android and "android" or ((not (((l_l_UserInputService_0_Platform_0 ~= Enum.Platform.XBox360 and l_l_UserInputService_0_Platform_0 ~= Enum.Platform.PS3) and l_l_UserInputService_0_Platform_0 ~= Enum.Platform.PS4) and l_l_UserInputService_0_Platform_0 ~= Enum.Platform.XBoxOne) or l_l_UserInputService_0_Platform_0 == Enum.Platform.WiiU) and "console" or "other")));
return {
    [v8.CallBarHangUpClicked] = {
        context = l_Contexts_0.ContactList, 
        eventType = l_EventTypes_0.CallBarHangUpClicked, 
        additionalInfo = {
            uid = l_LocalPlayer_0.UserId, 
            universeId = game.GameId, 
            placeId = game.PlaceId, 
            deviceType = v12, 
            playSessionId = l_l_RbxAnalyticsService_0_PlaySessionId_0
        }, 
        formatRulesForAdditionalInfo = {
            eventTimestampMs = v4.identity, 
            calleeUserId = v4.identity, 
            callerUserId = v4.identity, 
            callId = v4.identity, 
            callStatus = v4.identity, 
            isRetry = v4.identity
        }
    }, 
    [v8.PhoneBookNavigate] = {
        context = l_Contexts_0.ContactList, 
        eventType = l_EventTypes_0.PhoneBookNavigate, 
        additionalInfo = {
            uid = l_LocalPlayer_0.UserId, 
            universeId = game.GameId, 
            placeId = game.PlaceId, 
            deviceType = v12, 
            playSessionId = l_l_RbxAnalyticsService_0_PlaySessionId_0
        }, 
        formatRulesForAdditionalInfo = {
            eventTimestampMs = v4.identity, 
            startingPage = v4.identity, 
            destinationPage = v4.identity
        }
    }, 
    [v8.PhoneBookSearchClicked] = {
        context = l_Contexts_0.ContactList, 
        eventType = l_EventTypes_0.PhoneBookSearchClicked, 
        additionalInfo = {
            uid = l_LocalPlayer_0.UserId, 
            universeId = game.GameId, 
            placeId = game.PlaceId, 
            deviceType = v12
        }, 
        formatRulesForAdditionalInfo = {
            eventTimestampMs = v4.identity, 
            playSessionId = l_l_RbxAnalyticsService_0_PlaySessionId_0
        }
    }, 
    [v8.PhoneBookSearchAttempted] = {
        context = l_Contexts_0.ContactList, 
        eventType = l_EventTypes_0.PhoneBookSearchAttempted, 
        additionalInfo = {
            uid = l_LocalPlayer_0.UserId, 
            universeId = game.GameId, 
            placeId = game.PlaceId, 
            deviceType = v12, 
            playSessionId = l_l_RbxAnalyticsService_0_PlaySessionId_0
        }, 
        formatRulesForAdditionalInfo = {
            eventTimestampMs = v4.identity, 
            searchQueryString = v4.identity
        }
    }, 
    [v8.PhoneBookSearchFinished] = {
        context = l_Contexts_0.ContactList, 
        eventType = l_EventTypes_0.PhoneBookSearchFinished, 
        additionalInfo = {
            uid = l_LocalPlayer_0.UserId, 
            universeId = game.GameId, 
            placeId = game.PlaceId, 
            deviceType = v12, 
            playSessionId = l_l_RbxAnalyticsService_0_PlaySessionId_0
        }, 
        formatRulesForAdditionalInfo = {
            eventTimestampMs = v4.identity, 
            searchQueryString = v4.identity, 
            searchResultCount = v4.identity
        }
    }, 
    [v8.PhoneBookPlayerMenuOpened] = {
        context = l_Contexts_0.ContactList, 
        eventType = l_EventTypes_0.PhoneBookPlayerMenuOpened, 
        additionalInfo = {
            uid = l_LocalPlayer_0.UserId, 
            universeId = game.GameId, 
            placeId = game.PlaceId, 
            deviceType = v12, 
            playSessionId = l_l_RbxAnalyticsService_0_PlaySessionId_0
        }, 
        formatRulesForAdditionalInfo = {
            eventTimestampMs = v4.identity, 
            friendUserId = v4.identity, 
            searchQueryString = v4.identity, 
            itemListIndex = v4.identity, 
            isSuggestedUser = v4.identity, 
            page = v4.identity
        }
    }, 
    [v8.PhoneBookPlayerMenuUnfriendClicked] = {
        context = l_Contexts_0.ContactList, 
        eventType = l_EventTypes_0.PhoneBookPlayerMenuUnfriendClicked, 
        additionalInfo = {
            uid = l_LocalPlayer_0.UserId, 
            universeId = game.GameId, 
            placeId = game.PlaceId, 
            deviceType = v12, 
            playSessionId = l_l_RbxAnalyticsService_0_PlaySessionId_0
        }, 
        formatRulesForAdditionalInfo = {
            eventTimestampMs = v4.identity, 
            friendUserId = v4.identity
        }
    }, 
    [v8.PhoneBookPlayerMenuUnfriendFinished] = {
        context = l_Contexts_0.ContactList, 
        eventType = l_EventTypes_0.PhoneBookPlayerMenuUnfriendFinished, 
        additionalInfo = {
            uid = l_LocalPlayer_0.UserId, 
            universeId = game.GameId, 
            placeId = game.PlaceId, 
            deviceType = v12, 
            playSessionId = l_l_RbxAnalyticsService_0_PlaySessionId_0
        }, 
        formatRulesForAdditionalInfo = {
            eventTimestampMs = v4.identity, 
            friendUserId = v4.identity, 
            success = v4.identity
        }
    }, 
    [v8.PhoneBookPlayerMenuBlockClicked] = {
        context = l_Contexts_0.ContactList, 
        eventType = l_EventTypes_0.PhoneBookPlayerMenuBlockClicked, 
        additionalInfo = {
            uid = l_LocalPlayer_0.UserId, 
            universeId = game.GameId, 
            placeId = game.PlaceId, 
            deviceType = v12, 
            playSessionId = l_l_RbxAnalyticsService_0_PlaySessionId_0
        }, 
        formatRulesForAdditionalInfo = {
            eventTimestampMs = v4.identity, 
            friendUserId = v4.identity
        }
    }, 
    [v8.PhoneBookCallFriendClicked] = {
        context = l_Contexts_0.ContactList, 
        eventType = l_EventTypes_0.PhoneBookCallFriendClicked, 
        additionalInfo = {
            uid = l_LocalPlayer_0.UserId, 
            universeId = game.GameId, 
            placeId = game.PlaceId, 
            deviceType = v12, 
            playSessionId = l_l_RbxAnalyticsService_0_PlaySessionId_0
        }, 
        formatRulesForAdditionalInfo = {
            eventTimestampMs = v4.identity, 
            friendUserId = v4.identity, 
            searchQueryString = v4.identity, 
            itemListIndex = v4.identity, 
            isSuggestedUser = v4.identity, 
            page = v4.identity
        }
    }, 
    [v8.PhoneBookCallFriendFailed] = {
        context = l_Contexts_0.ContactList, 
        eventType = l_EventTypes_0.PhoneBookCallFriendFailed, 
        additionalInfo = {
            uid = l_LocalPlayer_0.UserId, 
            universeId = game.GameId, 
            placeId = game.PlaceId, 
            deviceType = v12, 
            playSessionId = l_l_RbxAnalyticsService_0_PlaySessionId_0
        }, 
        formatRulesForAdditionalInfo = {
            eventTimestampMs = v4.identity, 
            calleeUserId = v4.identity, 
            callerUserId = v4.identity, 
            errorMsg = v4.identity
        }
    }
};
