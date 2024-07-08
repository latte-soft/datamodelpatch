local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_AnimatedFrame_0 = require(l_CorePackages_0.UIBlox).Utility.SpringAnimatedItem.AnimatedFrame;
local v3 = require(l_CorePackages_0.Packages.Dash);
local v4 = {
    dampingRatio = 1, 
    frequency = 3.5
};
local function v7(v5)
    return v1.createElement(l_AnimatedFrame_0, {
        regularProps = {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = v5.LayoutOrder, 
            ClipsDescendants = true, 
            ref = v5.frameRef, 
            NextSelectionUp = v5.NextSelectionUp, 
            NextSelectionDown = v5.NextSelectionDown, 
            NextSelectionLeft = v5.NextSelectionLeft, 
            NextSelectionRight = v5.NextSelectionRight, 
            [v1.Change.AbsoluteSize] = v5.onAbsoluteSizeChanged
        }, 
        animatedValues = {
            yOffset = not v5.isExpanded and 0 or v5.Size.Y.Offset, 
            yScale = not v5.isExpanded and 0 or v5.Size.Y.Scale
        }, 
        mapValuesToProps = function(v6)
            return {
                Size = UDim2.new(v5.Size.X.Scale, v5.Size.X.Offset, v6.yScale, v6.yOffset)
            };
        end, 
        springOptions = v4
    }, v5.children);
end;
return v1.forwardRef(function(v8, v9)
    return v1.createElement(v7, v3.join(v8, {
        frameRef = v9
    }));
end);
