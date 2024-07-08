local _ = game:GetService("HttpService");
local l_Url_0 = require(game:GetService("CorePackages").Workspace.Packages.Http).Url;
return function(v2, v3)
    return v2(string.format("%s/v1/%s/metadata?appType=PlayerApplication", l_Url_0.AUTH_URL, v3), "GET", {
        headers = {
            Referer = "https://roblox.cn/"
        }
    });
end;
