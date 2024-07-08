local v0 = require(game:GetService("CorePackages").Packages.t);
local v1 = {
    validateJson = v0.interface({
        appType = v0.string, 
        type = v0.string, 
        userAccessToken = v0.string, 
        userOpenId = v0.string
    }), 
    new = function()
        return {};
    end
};
v1.mock = function()
    local v2 = v1.new();
    v2.appType = "PlayerMobile";
    v2.type = "QQ";
    v2.userAccessToken = "userAccessTokenStringFromTencentMSDK";
    v2.userOpenId = "userOpenIDStringFromTencentMSDK";
    return v2;
end;
v1.fromJsonData = function(v3)
    assert(v1.validateJson(v3), "Error: TencentAuthInfo JSON is not valid.");
    local v4 = v1.new();
    v4.appType = v3.appType;
    v4.type = v3.type;
    v4.userAccessToken = v3.userAccessToken;
    v4.userOpenId = v3.userOpenId;
    return v4;
end;
return v1;
