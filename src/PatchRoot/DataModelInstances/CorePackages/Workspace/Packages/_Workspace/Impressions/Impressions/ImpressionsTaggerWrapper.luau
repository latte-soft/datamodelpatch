local v0 = require(script:FindFirstAncestor("Impressions").Parent.React);
local v1 = require(script.Parent.useImpressionsTagger);
return function(v2)
    local v3 = v0.useRef(nil);
    v1(v3, v2.impressionsTag, v2.impressionsIndex);
    return v0.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        LayoutOrder = v2.impressionsIndex, 
        ref = v3
    }, {
        ComponentWithImpressionsTag = v2.renderComponent()
    });
end;
