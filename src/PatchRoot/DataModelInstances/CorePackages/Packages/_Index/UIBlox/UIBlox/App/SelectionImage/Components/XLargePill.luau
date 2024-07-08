local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.Core.Style.withStyle);
local v3 = require(l_Parent_0.Core.ImageSet.ImageSetComponent);
local v4 = require(l_Parent_0.App.ImageSet.Images);
local v5 = require(script.Parent.AnimatedGradient);
return function(v6)
    return v2(function(v7)
        return v1.createElement(v3.Label, {
            Image = v4["component_assets/circle_72_stroke_3"], 
            ImageColor3 = v7.Theme.SelectionCursor.AnimatedColor, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(36, 36, 36, 36), 
            [v1.Ref] = v6.cursorRef
        }, {
            AnimatedGradient = not not v6.isVisible and v1.createElement(v5) or nil
        });
    end);
end;
