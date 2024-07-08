local v0 = require(script:FindFirstAncestor("UserLib").Utils.Constants);
local v1 = {
    new = function()
        return {
            thumbnailType = v0.RbxAvatarThumbnailTypesFromEnum.HeadShot, 
            thumbnailSize = v0.RbxThumbnailSizes.Size150x150
        };
    end
};
v1.fromData = function(v2, v3)
    local v4 = v1.new();
    v4.thumbnailType = v2;
    v4.thumbnailSize = v3;
    return v4;
end;
return v1;
