local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Core_0 = l_Parent_1.Core;
local v4 = require(l_Parent_2.React);
local _ = require(l_Parent_0.Style.StyleTypes);
local v6 = require(l_Core_0.Style.useStyle);
return function(v7)
    local l_frameRef_0 = v7.frameRef;
    local l_gradientStyle_0 = v7.gradientStyle;
    local l_height_0 = v7.height;
    local l_ZIndex_0 = v7.ZIndex;
    local l_Theme_0 = v6().Theme;
    local v13 = not not l_gradientStyle_0 and l_gradientStyle_0.Color or l_Theme_0.BackgroundDefault.Color;
    local v14 = not not l_gradientStyle_0 and l_gradientStyle_0.Transparency or l_Theme_0.BackgroundDefault.Transparency;
    return v4.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        ZIndex = l_ZIndex_0, 
        ref = l_frameRef_0
    }, {
        Left = v4.createElement("Frame", {
            BackgroundTransparency = v14, 
            BackgroundColor3 = v13, 
            Size = UDim2.new(0, 50, 0, l_height_0)
        }, {
            Gradient = v4.createElement("UIGradient", {
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0), 
                    NumberSequenceKeypoint.new(1, 1)
                })
            })
        }), 
        Right = v4.createElement("Frame", {
            BackgroundTransparency = v14, 
            BackgroundColor3 = v13, 
            AnchorPoint = Vector2.new(1, 0), 
            Position = UDim2.fromScale(1, 0), 
            Size = UDim2.new(0, 50, 0, l_height_0)
        }, {
            Gradient = v4.createElement("UIGradient", {
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1), 
                    NumberSequenceKeypoint.new(1, 0)
                })
            })
        })
    });
end;
