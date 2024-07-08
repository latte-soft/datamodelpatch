local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_useStyle_0 = require(l_CorePackages_0.UIBlox).Core.Style.useStyle;
return function(v3)
    local l_frameRef_0 = v3.frameRef;
    local l_gradientStyle_0 = v3.gradientStyle;
    local l_height_0 = v3.height;
    local l_ZIndex_0 = v3.ZIndex;
    local l_Theme_0 = l_useStyle_0().Theme;
    local v9 = not not l_gradientStyle_0 and l_gradientStyle_0.Color or l_Theme_0.BackgroundDefault.Color;
    local v10 = not not l_gradientStyle_0 and l_gradientStyle_0.Transparency or l_Theme_0.BackgroundDefault.Transparency;
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        ZIndex = l_ZIndex_0, 
        ref = l_frameRef_0
    }, {
        Left = v1.createElement("Frame", {
            BackgroundTransparency = v10, 
            BackgroundColor3 = v9, 
            Size = UDim2.new(0, 50, 0, l_height_0)
        }, {
            Gradient = v1.createElement("UIGradient", {
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0), 
                    NumberSequenceKeypoint.new(1, 1)
                })
            })
        }), 
        Right = v1.createElement("Frame", {
            BackgroundTransparency = v10, 
            BackgroundColor3 = v9, 
            AnchorPoint = Vector2.new(1, 0), 
            Position = UDim2.fromScale(1, 0), 
            Size = UDim2.new(0, 50, 0, l_height_0)
        }, {
            Gradient = v1.createElement("UIGradient", {
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1), 
                    NumberSequenceKeypoint.new(1, 0)
                })
            })
        })
    });
end;
