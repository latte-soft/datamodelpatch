local l_UrlBuilder_0 = require(script:FindFirstAncestor("AuthCommon").Parent.UrlBuilder).UrlBuilder;
return function(v1)
    return v1(l_UrlBuilder_0.fromString("apis:auth-token-service/v1/login/create")(), "POST", {
        postBody = ""
    });
end;
