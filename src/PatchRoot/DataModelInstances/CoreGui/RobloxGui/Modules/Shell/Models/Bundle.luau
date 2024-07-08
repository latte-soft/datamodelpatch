local v0 = {};
local v1 = {
    ["59"] = true, 
    ["60"] = true
};
v0.fromData = function(v2)
    local v3 = {
        bundleId = v2.id, 
        name = v2.name, 
        description = v2.description, 
        productId = v2.productId
    };
    if not v1[tostring(v2.id)] then
        v3.isStarterPack = false;
    else
        v3.isStarterPack = true;
    end;
    v3.priceInRobux = v2.priceInRobux or 0;
    v3.creatorId = v2.creatorId;
    v3.partIds = v2.partIds;
    return v3;
end;
return v0;
