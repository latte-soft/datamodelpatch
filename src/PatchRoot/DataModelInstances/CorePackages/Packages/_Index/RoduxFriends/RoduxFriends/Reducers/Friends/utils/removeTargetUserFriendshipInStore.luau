local v0 = require(script:FindFirstAncestor("RoduxFriends").Parent.llama);
local v1 = require(script.Parent.removeUser);
return function(v2, v3)
    local v4 = tostring(v3.additionalData.currentUserId);
    local v5 = tostring(v3.namedIds.users);
    local v6 = v0.Dictionary.join(v2, {
        [v4] = v1(v2[v4], v5), 
        [v5] = v1(v2[v5], v4)
    });
    v6[v5] = nil;
    return v6;
end;
