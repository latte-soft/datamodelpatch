local v0 = require(script:FindFirstAncestor("AbuseReportMenu").Components.Constants);
getMenuItemDimensions = function(v1)
    if v1 < v0.SmallLayoutThreshold then
        return {
            LeftWidth = v0.LeftContainerWidthSmall, 
            RightWidth = v0.RightContainerWidthSmall, 
            TextSize = v0.FieldLabelSizeSmall
        };
    else
        return {
            LeftWidth = v0.LeftContainerWidth, 
            RightWidth = v0.RightContainerWidth, 
            TextSize = v0.FieldLabelSize
        };
    end;
end;
return getMenuItemDimensions;
