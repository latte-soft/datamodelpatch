local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.t);
local v4 = require(l_Parent_0.Core.Style.withStyle);
local v5 = require(l_Parent_0.Core.ImageSet.ImageSetComponent);
local v6 = require(l_Parent_0.App.ImageSet.Images);
local v7 = require(script.Parent.AnimatedGradient);
local v8 = v3.strictInterface({
    cursorRef = v3.table, 
    isVisible = v3.boolean
});
return function(v9)
    assert(v8(v9));
    return v4(function(v10)
        return v2.createElement(v5.Label, {
            Image = v6["component_assets/circle_15_stroke_3"], 
            ImageColor3 = v10.Theme.SelectionCursor.AnimatedColor, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(7, 7, 8, 8), 
            [v2.Ref] = v9.cursorRef
        }, {
            AnimatedGradient = not not v9.isVisible and v2.createElement(v7) or nil
        });
    end);
end;
