local l_RecommendationContextType_0 = require(script:FindFirstAncestor("SocialLibraries").dependencies).RoduxFriends.Enums.RecommendationContextType;
local v1 = {
    SingularMutualFriend = "Feature.Friends.Label.SingularMutualFriend", 
    MutualFriends = "Feature.Friends.Label.MutualFriends", 
    PlayedTogether = "Feature.Friends.Label.Frequent"
};
local function _(v2)
    if not v2.mutualFriendsCount then
        return not not v2.mutualFriendsList and #v2.mutualFriendsList or 0;
    else
        return v2.mutualFriendsCount;
    end;
end;
return function(v4)
    local v5 = nil;
    local v6 = nil;
    local v7 = nil;
    local v8 = not not v4.contextType and v4.contextType.rawValue() or nil;
    local v9 = if not v4.mutualFriendsCount then v4.mutualFriendsList and #v4.mutualFriendsList or 0 else v4.mutualFriendsCount;
    if v8 == l_RecommendationContextType_0.MutualFriends.rawValue() and v9 > 0 then
        v7 = function(v10)
            if not v10 then
                return nil;
            else
                return tostring(v9) .. " " .. string.lower(v10);
            end;
        end;
        v6 = if v9 == 1 then v1.SingularMutualFriend else v1.MutualFriends;
        v5 = {
            path = "icons/status/player/friend"
        };
    elseif v8 == l_RecommendationContextType_0.Frequents.rawValue() then
        v6 = v1.PlayedTogether;
    end;
    return {
        icon = v5, 
        label = {
            formatter = v7, 
            text = nil, 
            textKey = v6
        }
    };
end;
