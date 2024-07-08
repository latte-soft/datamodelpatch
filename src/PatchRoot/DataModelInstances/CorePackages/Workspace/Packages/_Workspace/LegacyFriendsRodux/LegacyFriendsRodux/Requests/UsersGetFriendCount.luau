local l_Parent_0 = script:FindFirstAncestor("LegacyFriendsRodux").Parent;
local l_Players_0 = game:GetService("Players");
local l_Url_0 = require(l_Parent_0.Http).Url;
local l_isNewFriendsEndpointsEnabled_0 = require(l_Parent_0.SharedFlags).isNewFriendsEndpointsEnabled;
return function(v4)
    local v5 = string.format("%s/user/get-friendship-count?%s", l_Url_0.API_URL, (tostring(l_Players_0.LocalPlayer.UserId)));
    if l_isNewFriendsEndpointsEnabled_0() then
        v5 = string.format("%s/my/friends/count", l_Url_0.FRIEND_URL);
    end;
    return v4(v5, "GET");
end;
