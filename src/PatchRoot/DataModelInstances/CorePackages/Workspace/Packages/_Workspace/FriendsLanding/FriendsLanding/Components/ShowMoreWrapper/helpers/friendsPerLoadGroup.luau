local v0 = require(script:FindFirstAncestor("FriendsLanding").dependencies);
local l_llama_0 = v0.llama;
local l_t_0 = v0.t;
local v3 = require(script.Parent.friendsPerRow);
local v4 = l_t_0.interface({
    width = l_t_0.number
});
local v5 = l_t_0.interface({
    visibleRows = l_t_0.number, 
    itemSize = l_t_0.number, 
    minimumItemsPerRow = l_t_0.optional(l_t_0.number)
});
return function(v6, v7)
    assert(v4(v6));
    assert(v5(v7));
    return v7.visibleRows * v3(l_llama_0.Dictionary.join({
        width = v6.width
    }, v7));
end;
