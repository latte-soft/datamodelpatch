local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_Url_0 = require(l_CorePackages_0.Workspace.Packages.Http).Url;
return function(v3, v4)
    return v3(string.format("%s/start-one-to-one-conversation", l_Url_0.CHAT_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            participantuserId = v4
        })
    });
end;
