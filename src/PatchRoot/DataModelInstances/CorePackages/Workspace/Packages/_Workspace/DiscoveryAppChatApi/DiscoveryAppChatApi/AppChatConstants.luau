local l_Constants_0 = require(script:FindFirstAncestor("DiscoveryAppChatApi").Parent.AppChat).Constants;
return {
    PresenceIndicatorSize = {
        Size6x6 = l_Constants_0.PresenceIndicatorSize.Size6x6, 
        Size8x8 = l_Constants_0.PresenceIndicatorSize.Size8x8, 
        Size10x10 = l_Constants_0.PresenceIndicatorSize.Size10x10, 
        Size12x12 = l_Constants_0.PresenceIndicatorSize.Size12x12, 
        Size14x14 = l_Constants_0.PresenceIndicatorSize.Size14x14, 
        DEFAULT = l_Constants_0.PresenceIndicatorSize.DEFAULT
    }, 
    PresenceIndicatorImagesBySize = {
        Size6x6 = l_Constants_0.PresenceIndicatorImagesBySize.Size6x6, 
        Size8x8 = l_Constants_0.PresenceIndicatorImagesBySize.Size8x8, 
        Size10x10 = l_Constants_0.PresenceIndicatorImagesBySize.Size10x10, 
        Size12x12 = l_Constants_0.PresenceIndicatorImagesBySize.Size12x12, 
        Size14x14 = l_Constants_0.PresenceIndicatorImagesBySize.Size14x14, 
        DEFAULT = l_Constants_0.PresenceIndicatorImagesBySize.DEFAULT
    }, 
    GetPresenceIndicatorSizeKey = function(v1, v2)
        local _ = nil;
        if v2 == 6 then
            return v1.PresenceIndicatorSize.Size6x6;
        elseif v2 == 8 then
            return v1.PresenceIndicatorSize.Size8x8;
        elseif v2 == 10 then
            return v1.PresenceIndicatorSize.Size10x10;
        elseif v2 == 12 then
            return v1.PresenceIndicatorSize.Size12x12;
        elseif v2 == 14 then
            return v1.PresenceIndicatorSize.Size14x14;
        else
            return v1.PresenceIndicatorSize.DEFAULT;
        end;
    end
};
