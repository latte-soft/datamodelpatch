local l_HttpService_0 = game:GetService("HttpService");
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Workspace.Packages.Http);
local l_Url_0 = require(l_CorePackages_0.Workspace.Packages.Http).Url;
return function(v4, v5, v6)
    return v4(string.format("%s/v1/%s/signupwithoutpassword?apiKey=%s", l_Url_0.AUTH_URL, v5, "d631f3d9-fce0-4711-8cf4-6f9a9756638b"), "POST", {
        postBody = l_HttpService_0:JSONEncode(v6)
    });
end;
