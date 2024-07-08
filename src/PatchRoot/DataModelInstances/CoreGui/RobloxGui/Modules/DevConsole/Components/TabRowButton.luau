local v0 = require(game:GetService("CorePackages").Roact);
local v1 = require(script.Parent.Parent.Constants);
local l_HighlightHeight_0 = v1.TabRowFormatting.HighlightHeight;
local l_FrameHeight_0 = v1.TabRowFormatting.FrameHeight;
return function(v4)
    local l_index_0 = v4.index;
    local l_name_0 = v4.name;
    local l_textWidth_0 = v4.textWidth;
    local l_padding_0 = v4.padding;
    local l_isSelected_0 = v4.isSelected;
    local l_layoutOrder_0 = v4.layoutOrder;
    local l_onTabButtonClicked_0 = v4.onTabButtonClicked;
    l_textWidth_0 = l_textWidth_0 + l_padding_0;
    local l_UnselectedTextTransparency_0 = v1.TabRowFormatting.UnselectedTextTransparency;
    if l_isSelected_0 then
        l_UnselectedTextTransparency_0 = v1.TabRowFormatting.SelectedTextTransparency;
    end;
    return v0.createElement("TextButton", {
        Text = l_name_0, 
        TextSize = v1.DefaultFontSize.TabBar, 
        Font = v1.Font.TabBar, 
        TextScaled = false, 
        TextTransparency = l_UnselectedTextTransparency_0, 
        Size = UDim2.new(0, l_textWidth_0, 0, l_FrameHeight_0), 
        AutoButtonColor = false, 
        TextColor3 = v1.Color.Text, 
        BackgroundColor3 = v1.Color.UnselectedGray, 
        BorderSizePixel = 0, 
        LayoutOrder = l_layoutOrder_0, 
        [v0.Event.Activated] = function(_)
            l_onTabButtonClicked_0(l_index_0);
        end
    }, {
        BlueHighlight = l_isSelected_0 and v0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, -l_HighlightHeight_0), 
            Position = UDim2.new(0, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = v1.Color.HighlightBlue
        })
    });
end;
