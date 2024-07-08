local l_t_0 = require(script:FindFirstAncestor("FriendsLanding").dependencies).t;
local v1 = l_t_0.interface({
    width = l_t_0.number, 
    itemSize = l_t_0.number, 
    minimumItemsPerRow = l_t_0.optional(l_t_0.number)
});
return function(v2)
    assert(v1(v2));
    return (math.max(math.floor(v2.width / v2.itemSize), v2.minimumItemsPerRow or 2));
end;
