local l_Parent_0 = script.Parent.Parent.Parent;
local l_getDeepValue_0 = require(l_Parent_0.dependencies).SocialLibraries.Dictionary.getDeepValue;
local _ = require(l_Parent_0.Reducers.Root);
local v3 = require(l_Parent_0.Utils.isUserInGame);
return function(v4, v5)
    return {
        friendStatus = l_getDeepValue_0(v4, string.format("Profile.FriendshipStatus.%s", v5.profileUserId)) or Enum.FriendStatus.NotFriend, 
        isBlocked = l_getDeepValue_0(v4, string.format("Profile.IsBlockedByMe.%s", v5.profileUserId)) or false, 
        screenSize = v4.ScreenSize, 
        isInExperience = v3(l_getDeepValue_0(v4, string.format("Profile.Presence.byUserId.%s.userPresenceType", v5.profileUserId)), l_getDeepValue_0(v4, string.format("Profile.Presence.byUserId.%s.lastLocation", v5.profileUserId)) or "")
    };
end;
