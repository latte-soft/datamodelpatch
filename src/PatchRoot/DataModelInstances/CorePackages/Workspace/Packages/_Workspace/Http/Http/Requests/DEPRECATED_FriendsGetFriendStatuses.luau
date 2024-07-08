local l_Players_0 = game:GetService("Players");
local v1 = require(script:FindFirstAncestor("Http").Url);
return function(v2, v3)
    return v2(string.format("%s/users/%s/friends/statuses?userIds=%s", v1.FRIEND_URL, tostring(l_Players_0.LocalPlayer.UserId), (table.concat(v3, ","))), "GET");
end;
