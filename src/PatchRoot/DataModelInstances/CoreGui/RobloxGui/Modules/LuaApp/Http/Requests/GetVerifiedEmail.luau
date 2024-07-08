local l_UrlBuilder_0 = require(game:GetService("CorePackages").Packages.UrlBuilder).UrlBuilder;
return function(v1)
    return v1(l_UrlBuilder_0.static.email.getSetEmail(), "GET");
end;
