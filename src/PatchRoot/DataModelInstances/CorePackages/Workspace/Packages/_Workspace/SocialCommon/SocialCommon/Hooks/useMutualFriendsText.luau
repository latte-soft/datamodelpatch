local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCommon");
local l_useLocalization_0 = require(l_script_FirstAncestor_0.Parent.Localization).Hooks.useLocalization;
local v2 = require(l_script_FirstAncestor_0.Utils.getMutualFriendsText);
return function(v3)
    return v2({
        mutualFriendsCount = v3, 
        localized = l_useLocalization_0({
            singularMutualFriend = "Feature.Friends.Label.SingularMutualFriend", 
            mutualFriends = "Feature.Friends.Label.MutualFriends"
        })
    });
end;
