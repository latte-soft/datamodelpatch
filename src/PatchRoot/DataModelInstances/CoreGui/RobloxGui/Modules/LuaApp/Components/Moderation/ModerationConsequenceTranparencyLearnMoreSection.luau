local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.UIBlox);
local l_StyledTextLabel_0 = v2.App.Text.StyledTextLabel;
local l_LinkButton_0 = v2.App.Button.LinkButton;
return function(v5)
    local l_stylePalette_0 = v5.stylePalette;
    return v1.createElement("Frame", {
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        LayoutOrder = v5.layoutOrder
    }, {
        UIListLayout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Padding = UDim.new(0, 12)
        }), 
        Sentence = v1.createElement(l_StyledTextLabel_0, {
            text = v5.localizationTable.DSALearnMoreBody, 
            fontStyle = l_stylePalette_0.Font.Body, 
            colorStyle = l_stylePalette_0.Theme.TextDefault, 
            layoutOrder = 1, 
            size = UDim2.fromScale(1, 0), 
            automaticSize = Enum.AutomaticSize.Y
        }), 
        Link = v1.createElement(l_LinkButton_0, {
            text = v5.localizationTable.DSALearnMoreLink, 
            onActivated = v5.dsaLearnMoreActivated, 
            layoutOrder = 2
        })
    });
end;
