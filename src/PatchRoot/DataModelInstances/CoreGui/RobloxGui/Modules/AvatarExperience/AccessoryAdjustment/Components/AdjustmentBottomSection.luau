local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v3.Style.withStyle;
local l_Images_0 = v3.App.ImageSet.Images;
local l_ImageSetButton_0 = v3.Core.ImageSet.ImageSetButton;
local l_Button_0 = v3.App.Button.Button;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local v9 = l_Images_0["icons/placeholder/placeholderOn"];
local v10 = v1.PureComponent:extend("AdjustmentBottomSection");
v10.validateProps = v2.strictInterface({
    LayoutOrder = v2.number
});
v10.render = function(v11)
    return l_withStyle_0(function(v12)
        return v11:renderWithProviders(v12);
    end);
end;
v10.renderWithProviders = function(v13, v14)
    local l_Theme_0 = v14.Theme;
    return v1.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BackgroundTransparency = 1, 
        LayoutOrder = v13.props.LayoutOrder
    }, {
        UIListLayout = v1.createElement("UIListLayout", {
            Padding = UDim.new(0, 12), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        UIPadding = v1.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 4)
        }), 
        ResetButton = v1.createElement(l_ImageSetButton_0, {
            Size = UDim2.new(0, 28, 0, 28), 
            BackgroundTransparency = 1, 
            Image = v9, 
            ImageColor3 = l_Theme_0.DropShadow.Color, 
            ImageTransparency = 0, 
            LayoutOrder = 1, 
            ZIndex = 2, 
            [v1.Event.Activated] = function()
            end
        }), 
        DoneButton = v1.createElement(l_Button_0, {
            buttonType = l_ButtonType_0.PrimarySystem, 
            size = UDim2.new(1, -40, 0, 48), 
            layoutOrder = 2, 
            text = "Done", 
            onActivated = function()
            end
        })
    });
end;
return v10;
