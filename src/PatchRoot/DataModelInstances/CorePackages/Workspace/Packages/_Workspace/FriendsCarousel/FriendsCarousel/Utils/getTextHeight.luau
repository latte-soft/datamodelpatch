local l_Text_0 = require(script:FindFirstAncestor("FriendsCarousel").dependencies).Text;
return function(v1, v2, v3)
    return l_Text_0.GetTextHeight(v1 or "", v2, v3);
end;
