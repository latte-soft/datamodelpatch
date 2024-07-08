local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_Modules_0.LuaApp.Themes.Colors);
local v5 = require(l_Modules_0.LuaApp.FitChildren);
local v6 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetLabel);
local v7 = require(l_Modules_0.LuaApp.Components.LocalizedTextLabel);
local v8 = {
    PaddingTop = UDim.new(0, 0), 
    PaddingBottom = UDim.new(0, 0), 
    PaddingLeft = UDim.new(0, 0), 
    PaddingRight = UDim.new(0, 0)
};
local v9 = v3.PureComponent:extend("IconTextBar");
v9.defaultProps = {
    iconSize = 26, 
    gutterSize = 9, 
    textSize = 28, 
    textColor = v4.Green, 
    textFont = Enum.Font.SourceSans
};
v9.render = function(v10)
    local l_layoutOrder_0 = v10.props.layoutOrder;
    local v12 = v2.Dictionary.join(v8, v10.props.padding or {});
    local l_icon_0 = v10.props.icon;
    local l_iconSize_0 = v10.props.iconSize;
    local l_gutterSize_0 = v10.props.gutterSize;
    local l_textKey_0 = v10.props.textKey;
    local l_textSize_0 = v10.props.textSize;
    local l_textColor_0 = v10.props.textColor;
    local l_textFont_0 = v10.props.textFont;
    local v20 = 0;
    if l_icon_0 then
        v20 = -(l_iconSize_0 + l_gutterSize_0);
    end;
    return v3.createElement(v5.FitFrame, {
        LayoutOrder = l_layoutOrder_0, 
        Size = UDim2.new(1, 0, 0, 0), 
        fitAxis = v5.FitAxis.Height, 
        BackgroundTransparency = 1
    }, {
        Layout = v3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, l_gutterSize_0)
        }), 
        Padding = v3.createElement("UIPadding", v12), 
        Icon = l_icon_0 and v3.createElement(v6, {
            LayoutOrder = 1, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, l_iconSize_0, 0, l_iconSize_0), 
            Image = l_icon_0
        }), 
        Text = l_textKey_0 and v3.createElement(v7, {
            LayoutOrder = 2, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Size = UDim2.new(1, v20, 0, l_textSize_0), 
            TextSize = l_textSize_0, 
            TextColor3 = l_textColor_0, 
            Font = l_textFont_0, 
            Text = l_textKey_0
        })
    });
end;
return v9;
