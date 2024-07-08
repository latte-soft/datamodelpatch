local v0 = require(script:FindFirstAncestor("NetworkingCurrentlyWearing").Parent.Dash);
local v1 = require(script.Parent.Parent.CATALOG_URL);
return function(v2)
    return v2.roduxNetworking.POST({
        Name = "GetItemDetails"
    }, function(v3, v4)
        return v3(v1):path("v1"):path("catalog"):path("items"):path("details"):body({
            items = v0.map(v4, function(v5)
                return {
                    itemType = "Asset", 
                    id = v5
                };
            end)
        });
    end);
end;
