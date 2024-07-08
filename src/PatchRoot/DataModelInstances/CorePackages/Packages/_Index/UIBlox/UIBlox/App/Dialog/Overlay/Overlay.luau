local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_0.Core.Style.useStyle);
local v4 = require(l_Parent_1.ReactOtter);
local v5 = {
    dampingRatio = 1, 
    frequency = 3
};
local v6 = {
    top = 270, 
    topRight = 305, 
    right = 0, 
    bottomRight = 45, 
    bottom = 90, 
    bottomLeft = 135, 
    left = 180, 
    topLeft = 225
};
return function(v7)
    local l_Theme_0 = v3().Theme;
    local v9, v10 = v4.useAnimatedBinding(not v7.showGradient and 1 or 0);
    v2.useEffect(function()
        if v7.showGradient == false then
            v10(v4.spring(1, v5));
            return ;
        else
            v10(v4.spring(0, v5));
            return ;
        end;
    end, {
        v7.showGradient
    });
    return v2.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ClipsDescendants = true, 
        ZIndex = v7.ZIndex
    }, {
        Overlay = v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundColor3 = l_Theme_0.Overlay.Color, 
            BackgroundTransparency = l_Theme_0.Overlay.Transparency, 
            ZIndex = 1
        }), 
        Gradient = v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = v9, 
            ZIndex = 2
        }, {
            UIGradient = v2.createElement("UIGradient", {
                Rotation = v6[v7.gradientDirection], 
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)), 
                    ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0))
                }), 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0), 
                    NumberSequenceKeypoint.new(1, 0.89)
                })
            })
        })
    });
end;
