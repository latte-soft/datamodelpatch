local v0 = require(script:FindFirstAncestor("FriendsLanding").AddFriends.dependencies);
local l_Rodux_0 = v0.Rodux;
local l_t_0 = v0.t;
return l_Rodux_0.makeActionCreator(script.Name, function(v3)
    assert(l_t_0.table(v3), "TencentAuthInfoModel should be a table.");
    return {
        tencentAuthInfo = v3
    };
end);
