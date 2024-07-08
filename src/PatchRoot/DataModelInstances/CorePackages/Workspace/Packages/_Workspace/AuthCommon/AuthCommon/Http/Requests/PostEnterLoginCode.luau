local l_Parent_0 = script:FindFirstAncestor("AuthCommon").Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
return function(v3, v4)
    assert(type(v4) == "string", "invalid login code");
    return v3(l_UrlBuilder_0.fromString("apis:auth-token-service/v1/login/entercode")(), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            code = v4
        })
    });
end;
