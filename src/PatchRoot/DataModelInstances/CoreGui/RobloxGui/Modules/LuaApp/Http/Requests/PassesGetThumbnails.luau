local l_Url_0 = require(game:GetService("CorePackages").Workspace.Packages.Http).Url;
return function(v1, v2, v3)
    return v1(string.format("%sv1/game-passes?%s", l_Url_0.THUMBNAILS_URL, (l_Url_0:makeQueryString({
        gamePassIds = table.concat(v2, ","), 
        format = "png", 
        size = v3, 
        isCircular = true
    }))), "GET");
end;
