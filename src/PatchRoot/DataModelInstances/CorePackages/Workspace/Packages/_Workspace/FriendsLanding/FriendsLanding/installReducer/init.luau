local v0 = require(script:FindFirstAncestor("FriendsLanding").dependencies);
local l_Rodux_0 = v0.Rodux;
local l_RoduxNetworking_0 = v0.RoduxNetworking;
local l_RoduxGames_0 = v0.RoduxGames;
local l_RoduxUserPermissions_0 = v0.RoduxUserPermissions;
local l_RoduxAnalytics_0 = v0.RoduxAnalytics;
local v6 = require(script.contactImporterWarning);
local l_ShowContactImporterParams_0 = v0.ShowContactImporterParams;
local l_getFFlagVerifiedBadgeInFriendsLanding_0 = v0.getFFlagVerifiedBadgeInFriendsLanding;
return function()
    return l_Rodux_0.combineReducers({
        DeletedUsers = require(script.DeletedUsers), 
        VerifiedUsers = if not l_getFFlagVerifiedBadgeInFriendsLanding_0() then nil else require(script.VerifiedUsers), 
        InactiveFriends = require(script.InactiveFriends), 
        IsUserFollowing = require(script.IsUserFollowing), 
        Games = l_RoduxGames_0.installReducer(), 
        Users = require(script.Users), 
        Friends = require(script.Friends)(), 
        Presence = require(script.Presence), 
        UserPermissions = l_RoduxUserPermissions_0.installReducer(), 
        NetworkStatus = l_RoduxNetworking_0.installReducer(), 
        RequestsFromOriginSourceType = require(script.RequestsFromOriginSourceType), 
        ShowContactImporterParams = l_ShowContactImporterParams_0, 
        ContactImporterWarning = v6, 
        Analytics = l_RoduxAnalytics_0.installReducer()
    });
end;
