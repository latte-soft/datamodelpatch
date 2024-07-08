local l_Parent_0 = script:FindFirstAncestor("AuthCommon").Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local v3 = require(l_Parent_0.Promise);
return function(v4, v5, v6)
    if type(v5) == "string" and type(v6) == "string" then
        return v4(l_UrlBuilder_0.fromString("apis:auth-token-service/v1/login/status")(), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                code = v5, 
                privateKey = v6
            })
        });
    elseif type(v5) ~= "string" then
        return v3.reject("invalid login code");
    else
        return v3.reject("invalid private key");
    end;
end;
