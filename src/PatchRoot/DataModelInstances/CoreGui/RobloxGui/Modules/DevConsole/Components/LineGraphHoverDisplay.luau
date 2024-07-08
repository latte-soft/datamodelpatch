local v0 = require(game:GetService("CorePackages").Roact);
local v1 = require(script.Parent.Parent.Constants);
local l_HoverGreen_0 = v1.Color.HoverGreen;
local l_LineWidth_0 = v1.GeneralFormatting.LineWidth;
local l_TextPadding_0 = v1.Graph.TextPadding;
local l_InnerPaddingY_0 = v1.Graph.InnerPaddingY;
return function(v6)
    local l_hoverLineX_0 = v6.hoverLineX;
    local l_hoverLineY_0 = v6.hoverLineY;
    local l_hoverValX_0 = v6.hoverValX;
    local l_hoverValY_0 = v6.hoverValY;
    local l_stringFormatX_0 = v6.stringFormatX;
    local l_stringFormatY_0 = v6.stringFormatY;
    return v0.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        hoverLine = v0.createElement("Frame", {
            Size = UDim2.new(0, l_LineWidth_0, 1, 0), 
            Position = UDim2.new(0, l_hoverLineX_0, 0, 0), 
            BackgroundColor3 = l_HoverGreen_0, 
            BorderSizePixel = 0
        }), 
        HoverHorizontal = v0.createElement("Frame", {
            Size = UDim2.new(0, l_hoverLineX_0 + l_TextPadding_0, 0, l_LineWidth_0), 
            Position = UDim2.new(0, -l_TextPadding_0, 1 - l_InnerPaddingY_0, -l_hoverLineY_0), 
            BackgroundColor3 = l_HoverGreen_0, 
            BorderSizePixel = 0
        }), 
        HoverTextY = v0.createElement("TextLabel", {
            Text = not not l_stringFormatY_0 and l_stringFormatY_0(l_hoverValY_0) or l_hoverValY_0, 
            TextColor3 = l_HoverGreen_0, 
            TextXAlignment = Enum.TextXAlignment.Right, 
            Position = UDim2.new(0, -l_TextPadding_0 - 2, 1 - l_InnerPaddingY_0, -l_hoverLineY_0), 
            BackgroundTransparency = 1
        }), 
        HoverTextX = v0.createElement("TextLabel", {
            Text = not not l_stringFormatX_0 and l_stringFormatX_0(l_hoverValX_0) or l_hoverValX_0, 
            TextColor3 = l_HoverGreen_0, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            Position = UDim2.new(0, l_hoverLineX_0, 1, l_TextPadding_0), 
            BackgroundTransparency = 1
        })
    });
end;
