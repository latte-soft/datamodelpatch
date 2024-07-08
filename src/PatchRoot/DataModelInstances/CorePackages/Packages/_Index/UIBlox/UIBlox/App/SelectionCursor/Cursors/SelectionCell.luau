local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Parent.React);
local v2 = require(l_Parent_0.Core.ImageSet.ImageSetComponent);
local v3 = require(l_Parent_0.App.ImageSet.Images);
local v4 = require(script.Parent.AnimatedGradient);
local v5 = Rect.new(3.5, 3.5, 3.5, 3.5);
return (v1.forwardRef(function(v6, v7)
    return v1.createElement(v2.Label, {
        Image = v3["component_assets/square_7_stroke_3"], 
        ImageColor3 = Color3.new(1, 1, 1), 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 54, 1, 4), 
        Position = UDim2.fromOffset(-27, -2), 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = v5, 
        ref = v7
    }, {
        AnimatedGradient = not not v6.isVisible and v1.createElement(v4) or nil
    });
end));
