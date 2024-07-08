local v0 = require(script:FindFirstAncestor("RoduxGames").Parent.t);
local v1 = {};
v1.new = function(v2)
    assert(v1.isValid(v2));
    v1.__index = v1;
    setmetatable(v2, v1);
    return v2;
end;
v1.mock = function(v3)
    v3 = v3 or {};
    return (v1.new({
        assetTypeId = v3.assetTypeId or 1, 
        assetType = v3.assetType or "Image", 
        imageId = v3.imageId or 1234567890, 
        approved = v3.approved or false
    }));
end;
v1.format = function(v4)
    return (v1.new({
        assetTypeId = v4.assetTypeId, 
        assetType = v4.assetType, 
        imageId = v4.imageId, 
        videoHash = v4.videoHash, 
        videoTitle = v4.videoTitle, 
        approved = not not v4.approved and v4.approved, 
        altText = v4.altText
    }));
end;
v1.isValid = v0.strictInterface({
    assetTypeId = v0.optional(v0.number), 
    assetType = v0.string, 
    imageId = v0.optional(v0.number), 
    videoHash = v0.optional(v0.string), 
    videoTitle = v0.optional(v0.string), 
    approved = v0.boolean, 
    altText = v0.optional(v0.string)
});
return v1;
