local v0 = require(script:FindFirstAncestor("FriendsLanding").dependencies);
local l_t_0 = v0.t;
local l_Dictionary_0 = v0.llama.Dictionary;
local v3 = require(script.Parent.friendsPerLoadGroup);
local v4 = l_t_0.interface({
    visibleRows = l_t_0.number, 
    itemSize = l_t_0.number, 
    filter = l_t_0.string
});
local v5 = l_t_0.interface({
    filterFriendCounts = l_t_0.table
});
return function(v6)
    return function(v7, v8)
        assert(v4(v8));
        assert(v5(v7));
        local v9 = v3({
            width = v6
        }, v8);
        return {
            width = v6, 
            filterFriendCounts = l_Dictionary_0.join(v7.filterFriendCounts, l_Dictionary_0.map(v7.filterFriendCounts, function(v10)
                return (math.max(v9, v10));
            end))
        };
    end;
end;
