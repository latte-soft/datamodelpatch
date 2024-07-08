local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Dash);
local v2 = require(l_CorePackages_0.Packages.React);
local l_useStyle_0 = require(l_CorePackages_0.UIBlox).Core.Style.useStyle;
local v4 = UDim.new(0, 12);
return function(v5)
    local v6 = l_useStyle_0();
    local l_Theme_0 = v6.Theme;
    local l_Font_0 = v6.Font;
    return v2.createElement("Frame", {
        Size = v5.Size, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = v4
        }), 
        Padding = v2.createElement("UIPadding", {
            PaddingTop = v4, 
            PaddingBottom = v4, 
            PaddingLeft = v4, 
            PaddingRight = v4
        }), 
        Title = v2.createElement("TextLabel", {
            LayoutOrder = 1, 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Font = l_Font_0.Header1.Font, 
            TextSize = l_Font_0.Header1.RelativeSize * l_Font_0.BaseSize, 
            Text = v5.title, 
            TextColor3 = l_Theme_0.TextEmphasis.Color, 
            TextTransparency = l_Theme_0.TextEmphasis.Transparency
        }), 
        Content = v2.createElement("Frame", {
            LayoutOrder = 2, 
            Size = v5.contentSize, 
            BackgroundTransparency = l_Theme_0.PlaceHolder.Transparency, 
            BackgroundColor3 = l_Theme_0.PlaceHolder.Color, 
            BorderSizePixel = 0
        }, v1.join({
            Layout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical
            }), 
            UICorner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            })
        }, v5.children))
    });
end;
