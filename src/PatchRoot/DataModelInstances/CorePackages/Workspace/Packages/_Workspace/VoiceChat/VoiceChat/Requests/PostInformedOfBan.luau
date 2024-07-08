local l_Url_0 = require(game:GetService("CorePackages").Workspace.Packages.Http).Url;
local l_HttpService_0 = game:GetService("HttpService");
return function(v2, v3)
    assert(type(v3) == "boolean", "PostInformedOfBan request expects informedOfBan to be a boolean");
    return v2(string.format("%sv1/moderation/informed-of-ban", l_Url_0.VOICE_URL), "POST", (l_HttpService_0:JSONEncode({
        informedOfBan = v3
    })));
end;
