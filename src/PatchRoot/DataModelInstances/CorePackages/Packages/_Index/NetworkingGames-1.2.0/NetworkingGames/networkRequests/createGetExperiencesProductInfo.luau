local v0 = require(script.Parent.Parent.GAMES_URL);
return function(v1)
    return v1.roduxNetworking.GET({
        Name = "GetExperiencesProductInfo"
    }, function(v2, v3)
        return v2(v0):path("v1"):path("games"):path("games-product-info"):expandedQueryArgsWithIds("universeIds", v3);
    end);
end;
