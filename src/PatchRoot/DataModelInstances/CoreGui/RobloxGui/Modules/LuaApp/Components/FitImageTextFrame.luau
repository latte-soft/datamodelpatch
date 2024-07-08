local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.LuaApp.Constants);
local v4 = require(l_Modules_0.LuaApp.FitChildren);
local v5 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
local v6 = require(l_Modules_0.LuaApp.Components.LocalizedFitTextLabel);
local l_ImageSetLabel_0 = require(l_CorePackages_0.UIBlox).Core.ImageSet.ImageSetLabel;
local v8 = v2.PureComponent:extend("FitImageTextFrame");
v8.defaultProps = {
    Position = UDim2.new(0, 0, 0, 0), 
    Size = UDim2.new(0, 0, 1, 0), 
    LayoutOrder = 1, 
    VerticalAlignment = Enum.VerticalAlignment.Center, 
    padding = 0, 
    imageProps = {
        ImageColor3 = v3.Color.GRAY2, 
        ImageTransparency = 0
    }, 
    textProps = {
        Font = Enum.Font.SourceSans, 
        TextColor3 = v3.Color.GRAY2, 
        TextTransparency = 0, 
        useLocalizedText = false
    }
};
v8.render = function(v9)
    local l_l_ImageSetLabel_0_0 = l_ImageSetLabel_0;
    local l_Position_0 = v9.props.Position;
    local l_Size_0 = v9.props.Size;
    local l_LayoutOrder_0 = v9.props.LayoutOrder;
    local l_VerticalAlignment_0 = v9.props.VerticalAlignment;
    local l_padding_0 = v9.props.padding;
    local l_imageProps_0 = v9.props.imageProps;
    local l_textProps_0 = v9.props.textProps;
    return v2.createElement(v4.FitFrame, {
        Position = l_Position_0, 
        Size = l_Size_0, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = l_LayoutOrder_0, 
        fitAxis = v4.FitAxis.Width
    }, {
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = l_VerticalAlignment_0, 
            Padding = UDim.new(0, l_padding_0)
        }), 
        Image = v2.createElement(l_l_ImageSetLabel_0_0, {
            LayoutOrder = 1, 
            Size = l_imageProps_0.Size, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Image = l_imageProps_0.Image, 
            ImageColor3 = l_imageProps_0.ImageColor3, 
            ImageTransparency = l_imageProps_0.ImageTransparency
        }), 
        Text = v2.createElement(not not l_textProps_0.useLocalizedText and v6 or v5, {
            LayoutOrder = 2, 
            Size = UDim2.new(0, 0, 1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Font = l_textProps_0.Font, 
            Text = l_textProps_0.Text, 
            TextSize = l_textProps_0.TextSize, 
            TextColor3 = l_textProps_0.TextColor3, 
            TextTransparency = l_textProps_0.TextTransparency, 
            fitAxis = v4.FitAxis.Width
        })
    });
end;
return v8;
