local l_Roact_0 = require(script:FindFirstAncestor("FriendsLanding").dependencies).Roact;
return function(v1, v2)
    local l_v1_0 = v1;
    for _, v5 in v2, nil, nil do
        l_v1_0 = l_Roact_0.createElement(v5[1], v5[2], {
            l_v1_0
        });
    end;
    return l_v1_0;
end;
