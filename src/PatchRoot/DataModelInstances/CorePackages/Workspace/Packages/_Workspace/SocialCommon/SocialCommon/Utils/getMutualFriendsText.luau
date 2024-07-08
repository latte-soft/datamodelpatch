return function(v0)
    if v0.mutualFriendsCount > 1 then
        return tostring(v0.mutualFriendsCount) .. " " .. string.lower(v0.localized.mutualFriends);
    else
        return tostring(v0.mutualFriendsCount) .. " " .. v0.localized.singularMutualFriend;
    end;
end;
