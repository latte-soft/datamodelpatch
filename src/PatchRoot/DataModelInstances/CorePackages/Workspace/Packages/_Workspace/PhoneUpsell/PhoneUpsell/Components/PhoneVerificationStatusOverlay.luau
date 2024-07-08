local l_Parent_0 = script:FindFirstAncestor("PhoneUpsell").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_Colors_0 = v2.App.Style.Colors;
return function(v5)
    local v6 = l_useStyle_0();
    return v1.createElement("Frame", {
        BackgroundTransparency = 0.3, 
        BackgroundColor3 = l_Colors_0.Black, 
        Size = UDim2.new(1, 0, 1, 0)
    }, {
        MiddleContent = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1
        }, {
            ListLayout = v1.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, 24)
            }), 
            Image = v5.image, 
            Padding = v1.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v6.Tokens.Global.Size_300), 
                PaddingRight = UDim.new(0, v6.Tokens.Global.Size_300)
            }), 
            VerifyingText = v1.createElement("TextLabel", {
                AutomaticSize = Enum.AutomaticSize.XY, 
                TextSize = v6.Font.BaseSize * v6.Font.Header1.RelativeSize, 
                TextColor3 = l_Colors_0.White, 
                Text = v5.text, 
                Font = v6.Font.Header1.Font, 
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                TextWrapped = true
            })
        })
    });
end;
