local l_HttpService_0 = game:GetService("HttpService");
local l_UrlBuilder_0 = require(script:FindFirstAncestor("PhoneUpsell").Parent.UrlBuilder).UrlBuilder;
return function(v2, v3, v4, v5, v6)
    assert(type(v3) == "string", "invalid country code in set phone number");
    assert(type(v4) == "string", "invalid prefix in set phone number");
    assert(type(v5) == "string", "invalid phone number in set phone number");
    local v7 = true;
    if type(v6) ~= "string" then
        v7 = v6 == nil;
    end;
    assert(v7, "invalid password in set phone number");
    return v2(l_UrlBuilder_0.fromString("accountinformation:phone")(), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            password = v6, 
            countryCode = v3, 
            prefix = v4, 
            phone = v5
        })
    });
end;
