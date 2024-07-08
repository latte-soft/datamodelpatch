return {
    mock = function()
        return {};
    end, 
    fromDefaultInfo = function(v0)
        return {
            defaultInfo = {
                attachment = {
                    cframe = v0.attachmentCFrame
                }, 
                accessory = {
                    cframe = v0.accessoryCFrame, 
                    scale = v0.accessoryScale
                }
            }
        };
    end, 
    fromUserInfo = function(v1)
        return {
            userAdjustedInfo = {
                cframe = v1.adjustedCFrame, 
                scale = v1.adjustedScale
            }
        };
    end
};
