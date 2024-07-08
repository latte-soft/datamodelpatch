local l_script_FirstAncestor_0 = script:FindFirstAncestor("LegacyFriendsRodux");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local l_UpdateFriendPresenceCounts_0 = require(l_script_FirstAncestor_0.Actions).UpdateFriendPresenceCounts;
return function(v3, v4)
    v3 = v3 or {};
    if v4.type == l_UpdateFriendPresenceCounts_0.name then
        v3 = v1.Dictionary.join({}, v4.presenceCounts);
    end;
    return v3;
end;
