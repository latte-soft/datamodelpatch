local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(script.Parent.EventNames);
local l_Enums_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums;
local l_Contexts_0 = l_Enums_0.Contexts;
local l_SubPages_0 = l_Enums_0.SubPages;
local l_EventTypes_0 = l_Enums_0.EventTypes;
local function v7(v6)
    return v6;
end;
return {
    [v1.RequestFriendship] = {
        context = l_Contexts_0.FriendsLanding, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            subpage = l_SubPages_0.PlayerContextualMenu, 
            btn = "addFriend"
        }, 
        formatRulesForAdditionalInfo = {
            profileUserId = v7
        }
    }, 
    [v1.Unfriend] = {
        context = l_Contexts_0.FriendsLanding, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            subpage = l_SubPages_0.PlayerContextualMenu, 
            btn = "unFriend"
        }, 
        formatRulesForAdditionalInfo = {
            profileUserId = v7
        }
    }, 
    [v1.AcceptFriendRequest] = {
        context = l_Contexts_0.FriendsLanding, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            subpage = l_SubPages_0.PlayerContextualMenu, 
            btn = "acceptFriend"
        }, 
        formatRulesForAdditionalInfo = {
            profileUserId = v7
        }
    }, 
    [v1.IgnoreFriendRequest] = {
        context = l_Contexts_0.FriendsLanding, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            subpage = l_SubPages_0.PlayerContextualMenu, 
            btn = "ignoreFriend"
        }, 
        formatRulesForAdditionalInfo = {
            profileUserId = v7
        }
    }, 
    [v1.BlockPlayer] = {
        context = l_Contexts_0.FriendsLanding, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            subpage = l_SubPages_0.PlayerContextualMenu, 
            btn = "block"
        }, 
        formatRulesForAdditionalInfo = {
            profileUserId = v7
        }
    }, 
    [v1.ReportPlayer] = {
        context = l_Contexts_0.FriendsLanding, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            subpage = l_SubPages_0.PlayerContextualMenu, 
            btn = "report"
        }, 
        formatRulesForAdditionalInfo = {
            profileUserId = v7
        }
    }, 
    [v1.JoinExperience] = {
        context = l_Contexts_0.FriendsLanding, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            subpage = l_SubPages_0.PlayerContextualMenu, 
            btn = "joinUser"
        }, 
        formatRulesForAdditionalInfo = {
            profileUserId = v7
        }
    }, 
    [v1.ViewExperienceDetails] = {
        context = l_Contexts_0.FriendsLanding, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            subpage = l_SubPages_0.PlayerContextualMenu, 
            btn = "viewExperienceDetails"
        }, 
        formatRulesForAdditionalInfo = {
            profileUserId = v7
        }
    }, 
    [v1.ViewPlatformProfile] = {
        context = l_Contexts_0.FriendsLanding, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            subpage = l_SubPages_0.PlayerContextualMenu, 
            btn = "viewPlatformProfile"
        }, 
        formatRulesForAdditionalInfo = {
            profileUserId = v7
        }
    }
};
