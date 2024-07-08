local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local l_StyledTextLabel_0 = require(l_CorePackages_0.UIBlox).App.Text.StyledTextLabel;
return function(v3)
    local l_stylePalette_0 = v3.stylePalette;
    local l_Font_0 = l_stylePalette_0.Font;
    local l_Theme_0 = l_stylePalette_0.Theme;
    return v1.createElement("Frame", {
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1
    }, {
        UIListLayout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Padding = UDim.new(0, 12)
        }), 
        Header = v1.createElement(l_StyledTextLabel_0, {
            text = v3.localizationTable.DSATransparencyLabel, 
            fontStyle = l_Font_0.Header2, 
            colorStyle = l_Theme_0.TextDefault, 
            layoutOrder = 1, 
            size = UDim2.fromScale(1, 0), 
            automaticSize = Enum.AutomaticSize.Y
        }), 
        Message = v1.createElement(l_StyledTextLabel_0, {
            text = v3.message, 
            fontStyle = l_Font_0.Header2, 
            colorStyle = l_Theme_0.TextEmphasis, 
            layoutOrder = 2, 
            size = UDim2.fromScale(1, 0), 
            automaticSize = Enum.AutomaticSize.Y
        })
    });
end;
