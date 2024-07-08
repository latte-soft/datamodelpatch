local l_Url_0 = require(script:FindFirstAncestor("GameTile").Parent.Http).Url;
return function(v1, v2)
    return v1(string.format("%sv1/sponsored-games/click", l_Url_0.ADS_URL), "POST", {
        postBody = "\"" .. v2 .. "\""
    });
end;
