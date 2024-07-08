local v0 = require(script:FindFirstAncestor("FriendsLanding").dependencies);
local l_t_0 = v0.t;
local l_llama_0 = v0.llama;
local v3 = require(script.Parent.friendsPerLoadGroup);
local v4 = l_t_0.interface({
    visibleRows = l_t_0.number, 
    itemSize = l_t_0.number, 
    filter = l_t_0.string
});
local v5 = l_t_0.interface({
    width = l_t_0.number, 
    filterFriendCounts = l_t_0.table
});
return function(v6, v7)
    assert(v5(v6));
    assert(v4(v7));
    return {
        filterFriendCounts = l_llama_0.Dictionary.join(v6.filterFriendCounts, {
            [v7.filter] = v6.filterFriendCounts[v7.filter] + v3(v6, v7)
        })
    };
end;
