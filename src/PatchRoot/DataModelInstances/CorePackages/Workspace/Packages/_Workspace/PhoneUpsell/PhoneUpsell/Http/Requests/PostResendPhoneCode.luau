local l_UrlBuilder_0 = require(script:FindFirstAncestor("PhoneUpsell").Parent.UrlBuilder).UrlBuilder;
return function(v1)
    return v1(l_UrlBuilder_0.fromString("accountinformation:phone/resend")(), "POST", {
        postBody = ""
    });
end;
