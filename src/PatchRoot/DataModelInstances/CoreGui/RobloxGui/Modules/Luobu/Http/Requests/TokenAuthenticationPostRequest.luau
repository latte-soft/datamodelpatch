local l_HttpService_0 = game:GetService("HttpService");
local l_Url_0 = require(game:GetService("CorePackages").Workspace.Packages.Http).Url;
return function(v2, v3, v4)
    return v2(string.format("%s/v1/%s/token-authentication?apiKey=%s", l_Url_0.AUTH_URL, v3, "d631f3d9-fce0-4711-8cf4-6f9a9756638b"), "POST", {
        postBody = l_HttpService_0:JSONEncode(v4)
    });
end;
