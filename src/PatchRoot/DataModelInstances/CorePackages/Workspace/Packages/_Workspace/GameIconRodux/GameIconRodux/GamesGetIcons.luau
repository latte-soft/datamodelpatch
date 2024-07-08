local l_Url_0 = require(script:FindFirstAncestor("GameIconRodux").Parent.Http).Url;
return function(v1, v2, v3)
    return v1(string.format("%sv1/games/icons?%s", l_Url_0.THUMBNAILS_URL, (l_Url_0:makeQueryString({
        universeIds = table.concat(v2, ","), 
        format = "png", 
        size = v3
    }))), "GET");
end;
