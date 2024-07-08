local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local v2 = require(l_script_FirstAncestor_0.User);
local l_SocialLibraries_0 = v1.SocialLibraries;
local l_SelfViewProfileDiscoverabilityUpsellIXP_0 = v1.SelfViewProfileDiscoverabilityUpsellIXP;
local l_getDeepValue_0 = l_SocialLibraries_0.Dictionary.getDeepValue;
return function(v6, v7)
    local v8 = if not l_SelfViewProfileDiscoverabilityUpsellIXP_0.SetupEnabled() then nil else l_getDeepValue_0(v6, "SocialTab.ShowContactImporterParams") or {};
    return {
        unreadConversationCount = v6.SocialTab.UnreadConversationCount or 0, 
        numberOfNotifications = v6.NotificationBadgeCounts.TopBarNotificationIcon, 
        localUser = v2.mapToUsers(v6, v7)(v6.LocalUserId), 
        localUserId = v6.LocalUserId or nil, 
        isPhoneVerified = if not l_SelfViewProfileDiscoverabilityUpsellIXP_0.SetupEnabled() then nil else v8.isPhoneVerified, 
        isDiscoverabilityUnset = if not l_SelfViewProfileDiscoverabilityUpsellIXP_0.SetupEnabled() then nil else v8.isDiscoverabilityUnset
    };
end;
