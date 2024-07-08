return function(v0)
    assert(v0, "attachmentName cannot be nil");
    return {
        ClassName = "Accessory", 
        _children = {
            {
                Name = "ThumbnailConfiguration", 
                ClassName = "Configuration", 
                _optional = true, 
                _children = {
                    {
                        Name = "ThumbnailCameraTarget", 
                        ClassName = "ObjectValue"
                    }, 
                    {
                        Name = "ThumbnailCameraValue", 
                        ClassName = "CFrameValue"
                    }
                }
            }, 
            {
                Name = "Handle", 
                ClassName = "MeshPart", 
                _children = {
                    {
                        Name = v0, 
                        ClassName = "Attachment"
                    }, 
                    {
                        ClassName = "WrapLayer"
                    }, 
                    {
                        ClassName = "SurfaceAppearance", 
                        _optional = true
                    }, 
                    {
                        ClassName = "StringValue", 
                        Name = "AvatarPartScaleType", 
                        _optional = true
                    }, 
                    {
                        ClassName = "TouchTransmitter", 
                        _optional = true
                    }
                }
            }
        }
    };
end;
