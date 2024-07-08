local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.Core.Style.withStyle);
local v3 = require(l_Parent_0.Core.ImageSet.ImageSetComponent);
local v4 = require(l_Parent_0.App.ImageSet.Images);
local v5 = require(script.Parent.AnimatedGradient);
local v6 = v4["component_assets/circle_22_stroke_3"];
return function(v7)
    return v2(function(v8)
        return v1.createElement(v3.Label, {
            Image = v6, 
            ImageColor3 = v8.Theme.SelectionCursor.AnimatedColor, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 22, 1, 22), 
            Position = UDim2.new(0, -11, 0, -11), 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(11, 11, 12, 12), 
            [v1.Ref] = v7.cursorRef
        }, {
            AnimatedGradient = not not v7.isVisible and v1.createElement(v5) or nil
        });
    end);
end;
