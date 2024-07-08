local l_Url_0 = require(game:GetService("CorePackages").Workspace.Packages.Http).Url;
return function(v1)
    return v1(string.format("%sv1/moderation/informed-of-ban", l_Url_0.VOICE_URL), "GET");
end;
