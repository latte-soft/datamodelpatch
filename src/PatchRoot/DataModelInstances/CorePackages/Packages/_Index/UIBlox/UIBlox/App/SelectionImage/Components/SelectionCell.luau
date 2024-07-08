local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.Core.Style.withStyle);
local v3 = require(l_Parent_0.Core.ImageSet.ImageSetComponent);
local v4 = require(l_Parent_0.App.ImageSet.Images);
local v5 = require(script.Parent.AnimatedGradient);
return function(v6)
    return v2(function(v7)
        return v1.createElement(v3.Label, {
            Image = v4["component_assets/square_7_stroke_3"], 
            ImageColor3 = v7.Theme.SelectionCursor.AnimatedColor, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 54, 1, 4), 
            Position = UDim2.fromOffset(-27, -2), 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(3.5, 3.5, 3.5, 3.5), 
            [v1.Ref] = v6.cursorRef
        }, {
            AnimatedGradient = not not v6.isVisible and v1.createElement(v5) or nil
        });
    end);
end;
