return {
    mock = function(v0)
        return {
            assetTypeId = -1, 
            assetType = "Image", 
            imageId = v0 or 123456789, 
            videoHash = nil, 
            videoTitle = nil, 
            approved = true, 
            altText = "Alt Text"
        };
    end
};
