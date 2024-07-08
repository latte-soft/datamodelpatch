local v0 = require(game:GetService("CorePackages").Packages.React);
local v1 = {
    BackgroundTransparency = 1, 
    BorderSizePixel = 0, 
    heightOffset = 0
};
return function(v2)
    local v3 = v2.heightOffset or v1.heightOffset;
    return v0.createElement("Frame", {
        Position = UDim2.new(0, 0, 0, v3), 
        Size = UDim2.new(1, 0, 1, -v3), 
        ZIndex = v2.ZIndex, 
        BackgroundColor3 = v2.BackgroundColor3, 
        BackgroundTransparency = v2.BackgroundTransparency or v1.BackgroundTransparency, 
        BorderSizePixel = v2.BorderSizePixel or v1.BorderSizePixel, 
        ClipsDescendants = v2.ClipsDescendants
    }, v2.children);
end;
