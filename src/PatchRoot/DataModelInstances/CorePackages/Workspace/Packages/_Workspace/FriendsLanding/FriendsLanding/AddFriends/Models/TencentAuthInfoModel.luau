local l_t_0 = require(script:FindFirstAncestor("AddFriends").dependencies).t;
local v1 = {};
v1.__index = v1;
v1.new = function(v2)
    assert(v1.isValid(v2));
    v1.__index = v1;
    setmetatable(v2, v1);
    return v2;
end;
v1.mock = function(v3)
    v3 = v3 or {};
    return (v1.new({
        appType = v3.appType or "PlayerMobile", 
        type = v3.type or "QQ", 
        userAccessToken = v3.userAccessToken or "userAccessTokenStringFromTencentMSDK", 
        userOpenId = v3.userOpenId or "userOpenIDStringFromTencentMSDK"
    }));
end;
v1.isValid = function(v4)
    return l_t_0.interface({
        appType = l_t_0.string, 
        type = l_t_0.string, 
        userAccessToken = l_t_0.string, 
        userOpenId = l_t_0.string
    })(v4);
end;
return v1;
