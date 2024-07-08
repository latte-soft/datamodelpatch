local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Parent.React);
local v2 = require(l_Parent_0.Core.ImageSet.ImageSetComponent);
local v3 = require(l_Parent_0.App.ImageSet.Images);
local v4 = require(script.Parent.AnimatedGradient);
return (v1.forwardRef(function(v5, v6)
    return v1.createElement(v2.Label, {
        Image = v3["component_assets/circle_42_stroke_3"], 
        ImageColor3 = Color3.new(1, 1, 1), 
        BackgroundTransparency = 1, 
        Size = UDim2.fromOffset(42, 42), 
        Position = UDim2.new(0.5, -21, 0.5, -21), 
        ref = v6
    }, {
        AnimatedGradient = not not v5.isVisible and v1.createElement(v4) or nil
    });
end));
