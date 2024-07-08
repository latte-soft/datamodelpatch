local l_HttpService_0 = game:GetService("HttpService");
local l_UrlBuilder_0 = require(script:FindFirstAncestor("PhoneUpsell").Parent.UrlBuilder).UrlBuilder;
return function(v2, v3)
    assert(type(v3) == "string", "invalid code in verify phone code");
    assert(not string.match(v3, "%D"), "invalid code in verify phone code");
    return v2(l_UrlBuilder_0.fromString("accountinformation:phone/verify")(), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            code = v3
        })
    });
end;
