local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_Modules_0.LuaApp.Themes.Colors);
local v5 = require(l_Modules_0.LuaApp.FitChildren);
local v6 = require(l_Modules_0.LuaApp.Components.Generic.IconTextBar);
local l_White_0 = v4.White;
local v8 = Rect.new(9, 9, 9, 9);
local v9 = {
    PaddingTop = UDim.new(0, 0), 
    PaddingBottom = UDim.new(0, 0), 
    PaddingLeft = UDim.new(0, 0), 
    PaddingRight = UDim.new(0, 0)
};
local v10 = {
    PaddingTop = UDim.new(0, 0), 
    PaddingBottom = UDim.new(0, 0), 
    PaddingLeft = UDim.new(0, 0), 
    PaddingRight = UDim.new(0, 0)
};
local v11 = v3.PureComponent:extend("Widget");
v11.defaultProps = {
    backgroundColor = l_White_0, 
    backgroundTransparency = 0, 
    iconSize = 26, 
    titleGutterSize = 9, 
    titleSize = 28, 
    titleFont = Enum.Font.SourceSans
};
v11.render = function(v12)
    local l_layoutOrder_0 = v12.props.layoutOrder;
    local v14 = v2.Dictionary.join(v9, v12.props.titlePadding or {});
    local v15 = v2.Dictionary.join(v10, v12.props.contentPadding or {});
    local l_backgroundImage_0 = v12.props.backgroundImage;
    local l_backgroundColor_0 = v12.props.backgroundColor;
    local l_backgroundTransparency_0 = v12.props.backgroundTransparency;
    local l_icon_0 = v12.props.icon;
    local l_iconSize_0 = v12.props.iconSize;
    local l_titleGutterSize_0 = v12.props.titleGutterSize;
    local l_titleKey_0 = v12.props.titleKey;
    local l_titleSize_0 = v12.props.titleSize;
    local l_titleColor_0 = v12.props.titleColor;
    local l_titleFont_0 = v12.props.titleFont;
    local l_renderContent_0 = v12.props.renderContent;
    return v3.createElement(v5.FitImageLabel, {
        LayoutOrder = l_layoutOrder_0, 
        Size = UDim2.new(1, 0, 0, 0), 
        fitAxis = v5.FitAxis.Height, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = v8, 
        ClipsDescendants = true, 
        Image = l_backgroundImage_0, 
        ImageColor3 = l_backgroundColor_0, 
        ImageTransparency = l_backgroundTransparency_0
    }, {
        Layout = v3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        TitleBar = v3.createElement(v6, {
            layoutOrder = 1, 
            padding = v14, 
            icon = l_icon_0, 
            iconSize = l_iconSize_0, 
            gutterSize = l_titleGutterSize_0, 
            textKey = l_titleKey_0, 
            textSize = l_titleSize_0, 
            textColor = l_titleColor_0, 
            textFont = l_titleFont_0
        }), 
        ContentFrame = l_renderContent_0 and v3.createElement(v5.FitFrame, {
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 0, 0), 
            fitAxis = v5.FitAxis.Height, 
            BackgroundTransparency = 1
        }, {
            Layout = v3.createElement("UIListLayout"), 
            Padding = v3.createElement("UIPadding", v15), 
            Content = v3.createElement(l_renderContent_0)
        })
    });
end;
return v11;
