local v0 = require(game:GetService("CorePackages").Packages.t);
return {
    validate = v0.strictInterface({
        thumbnailKeyframe = v0.number, 
        thumbnailTime = v0.number, 
        thumbnailZoom = v0.number, 
        thumbnailVerticalOffset = v0.number, 
        thumbnailHorizontalOffset = v0.number, 
        thumbnailCharacterRotation = v0.number
    }), 
    defaultParameters = {
        thumbnailKeyframe = 1, 
        thumbnailTime = 0, 
        thumbnailZoom = 1, 
        thumbnailVerticalOffset = 0, 
        thumbnailHorizontalOffset = 0, 
        thumbnailCharacterRotation = 0
    }, 
    encodeAsATable = function(v1)
        return {
            ThumbnailBundleId = 515, 
            ThumbnailCharacterRotation = v1.thumbnailCharacterRotation, 
            ThumbnailHorizontalOffset = v1.thumbnailHorizontalOffset, 
            ThumbnailVerticalOffset = v1.thumbnailVerticalOffset, 
            ThumbnailZoom = v1.thumbnailZoom, 
            ThumbnailKeyframe = v1.thumbnailKeyframe, 
            ThumbnailTime = v1.thumbnailTime
        };
    end
};
