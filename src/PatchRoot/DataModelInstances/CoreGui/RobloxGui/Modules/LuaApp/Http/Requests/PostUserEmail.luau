local l_HttpService_0 = game:GetService("HttpService");
local l_UrlBuilder_0 = require(game:GetService("CorePackages").Packages.UrlBuilder).UrlBuilder;
return function(v2, v3, v4)
    assert(type(v3) == "string", "invalid email address in UpdateUserEmail");
    local v5 = true;
    if type(v4) ~= "string" then
        v5 = v4 == nil;
    end;
    assert(v5, "invalid password in UpdateUserEmail");
    return v2(l_UrlBuilder_0.static.email.getSetEmail(), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            password = v4, 
            emailAddress = v3
        })
    });
end;
