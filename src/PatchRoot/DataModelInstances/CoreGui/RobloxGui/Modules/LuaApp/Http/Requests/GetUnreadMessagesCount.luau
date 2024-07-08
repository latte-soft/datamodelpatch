local l_Url_0 = require(game:GetService("CorePackages").Workspace.Packages.Http).Url;
return function(v1)
    return v1(string.format("%s/messages/unread/count", l_Url_0.PRIVATEMESSAGES_URL), "GET");
end;
