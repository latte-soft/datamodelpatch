local l_SetTencentAuthInfo_0 = require(script:FindFirstAncestor("FriendsLanding").Actions.AddFriends).SetTencentAuthInfo;
return function(v1)
    return {
        setTencentAuthInfo = function(v2)
            return v1(l_SetTencentAuthInfo_0(v2));
        end
    };
end;
