local l_getDeepValue_0 = require(script.Parent.Parent.Parent.dependencies).SocialLibraries.Dictionary.getDeepValue;
return function(v1, v2)
    return {
        friendStatus = l_getDeepValue_0(v1, string.format("Profile.FriendshipStatus.%s", v2.profileUserId)) or Enum.FriendStatus.Unknown
    };
end;
