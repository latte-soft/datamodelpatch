local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_getDeepValue_0 = require(l_script_FirstAncestor_0.dependencies).SocialLibraries.Dictionary.getDeepValue;
local l_RODUX_KEY_0 = require(l_script_FirstAncestor_0.Common.Constants).RODUX_KEY;
return function(v3, v4)
    local v5 = l_getDeepValue_0(v3, "FriendsLanding.RequestsFromOriginSourceType") or {};
    local l_id_0 = v4.user.id;
    return {
        friendStatus = l_getDeepValue_0(v3, string.format("FriendsLanding.Friends.friendshipStatus.%s", l_id_0)) or nil, 
        localUserId = v3.LocalUserId, 
        screenSize = v3.ScreenSize, 
        originSourceType = v5[l_id_0], 
        hasIncomingFriendRequest = l_getDeepValue_0(v3, string.format("%s.Friends.recommendations.hasIncomingFriendRequest.%s", l_RODUX_KEY_0, l_id_0)) or false
    };
end;
