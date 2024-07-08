local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_FFlagContactRecs_0 = require(l_Parent_0.SharedFlags).FFlagContactRecs;
local v3 = require(l_script_FirstAncestor_0.Utils.getMutualFriendsText);
local l_RecommendationContextType_0 = (if not l_FFlagContactRecs_0 then require(l_Parent_0.LuaSocialLibrariesDeps).RoduxFriends.config({
    keyPath = "SocialCommon.Friends"
}) else require(l_Parent_0.RoduxFriends).config({
    keyPath = "SocialCommon.Friends"
})).Enums.RecommendationContextType;
local l_Images_0 = require(l_Parent_0.UIBlox).App.ImageSet.Images;
return function(v6)
    local v7 = nil;
    local v8 = nil;
    local v9 = v6.recommendation.contextType and v6.recommendation.contextType.rawValue();
    local v10 = v6.recommendation.mutualFriendsCount or 0;
    if l_FFlagContactRecs_0 and v9 == l_RecommendationContextType_0.Contacts.rawValue() then
        v7 = v6.localized.contacts;
    elseif v9 == l_RecommendationContextType_0.MutualFriends.rawValue() and v10 > 0 then
        v7 = v3({
            mutualFriendsCount = v10, 
            localized = {
                mutualFriends = v6.localized.mutualFriends, 
                singularMutualFriend = v6.localized.singularMutualFriend
            }
        });
        v8 = l_Images_0["icons/status/player/friend"];
    elseif v9 == l_RecommendationContextType_0.Frequents.rawValue() then
        v7 = v6.localized.frequents;
    end;
    if v6.recommendation.hasIncomingFriendRequest then
        v7 = v6.localized.friendRequests;
        v8 = nil;
    end;
    return {
        text = v7, 
        icon = v8
    };
end;
