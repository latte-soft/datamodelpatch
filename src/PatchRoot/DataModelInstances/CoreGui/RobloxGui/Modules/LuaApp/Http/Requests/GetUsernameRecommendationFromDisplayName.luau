local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.UrlBuilder).UrlBuilder.new({
    base = require(l_CorePackages_0.Workspace.Packages.Http).Url.AUTH_URL, 
    path = "v1/validators/recommendedUsernameFromDisplayName", 
    query = "DisplayName={displayName}&BirthDay={birthday}"
});
return function(v2, v3, v4)
    return v2(v1({
        displayName = v3, 
        birthday = v4
    }), "GET", {
        maxRetryCount = 0
    });
end;
