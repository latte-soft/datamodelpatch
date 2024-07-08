local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(game:GetService("CorePackages").Cryo);
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Common.Text);
local v4 = require(l_Modules_0.LuaApp.Constants);
local v5 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetButton);
local v6 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetLabel);
local l_WHITE_0 = v4.Color.WHITE;
local l_SourceSans_0 = Enum.Font.SourceSans;
local l_GREEN_PRIMARY_0 = v4.Color.GREEN_PRIMARY;
local l_Center_0 = Enum.HorizontalAlignment.Center;
local v11 = Rect.new(3, 3, 4, 4);
local l_Slice_0 = Enum.ScaleType.Slice;
local l_game_EngineFeature_0 = game:GetEngineFeature("TextBoundsRoundUp");
local v14 = v2.PureComponent:extend("FitImageTextButton");
v14.defaultProps = {
    backgroundColor = l_GREEN_PRIMARY_0, 
    height = 32, 
    iconRightPadding = 3, 
    iconSize = 16, 
    layoutOrder = 0, 
    text = "", 
    textColor = l_WHITE_0, 
    textFont = l_SourceSans_0, 
    textSize = 20, 
    horizontalPadding = 7, 
    verticalPadding = 0, 
    maxWidth = 0, 
    minWidth = 1000, 
    scaleType = l_Slice_0, 
    sliceCenter = v11, 
    anchorPoint = Vector2.new(0, 0), 
    position = UDim2.new(0, 0, 0, 0)
};
v14.getImageButtonAndTextWidth = function(v15)
    local l_maxWidth_0 = v15.props.maxWidth;
    local l_minWidth_0 = v15.props.minWidth;
    local l_text_0 = v15.props.text;
    local l_textFont_0 = v15.props.textFont;
    local l_textSize_0 = v15.props.textSize;
    local l_horizontalPadding_0 = v15.props.horizontalPadding;
    local _ = v15.props.verticalPadding;
    local v23 = v15.props.leftIcon and true;
    local v24 = v3.GetTextWidth(l_text_0, l_textFont_0, l_textSize_0);
    local l_l_Center_0_0 = l_Center_0;
    if not l_game_EngineFeature_0 then
        v24 = v24 - 2;
    end;
    local v26 = v24 + 2 * l_horizontalPadding_0;
    if v23 then
        v26 = (v26 + v15.props.iconRightPadding) + v15.props.iconSize;
    end;
    if l_maxWidth_0 < v26 then
        l_l_Center_0_0 = Enum.HorizontalAlignment.Left;
    end;
    return math.max(l_minWidth_0, (math.min(v26, l_maxWidth_0))), v24, l_l_Center_0_0;
end;
v14.render = function(v27)
    local l_backgroundImage_0 = v27.props.backgroundImage;
    local l_backgroundColor_0 = v27.props.backgroundColor;
    local l_backgroundTransparency_0 = v27.props.backgroundTransparency;
    local l_height_0 = v27.props.height;
    local l_horizontalPadding_1 = v27.props.horizontalPadding;
    local l_verticalPadding_1 = v27.props.verticalPadding;
    local l_iconRightPadding_0 = v27.props.iconRightPadding;
    local l_iconSize_0 = v27.props.iconSize;
    local l_iconColor_0 = v27.props.iconColor;
    local l_layoutOrder_0 = v27.props.layoutOrder;
    local l_leftIcon_0 = v27.props.leftIcon;
    local l_onActivated_0 = v27.props.onActivated;
    local l_text_1 = v27.props.text;
    local l_textColor_0 = v27.props.textColor;
    local l_textTransparency_0 = v27.props.textTransparency;
    local l_textFont_1 = v27.props.textFont;
    local l_textSize_1 = v27.props.textSize;
    local l_sliceCenter_0 = v27.props.sliceCenter;
    local l_scaleType_0 = v27.props.scaleType;
    local v47 = l_leftIcon_0 and true;
    local l_anchorPoint_0 = v27.props.anchorPoint;
    local l_position_0 = v27.props.position;
    local v50, v51, v52 = v27:getImageButtonAndTextWidth();
    return v2.createElement(v5, {
        AutoButtonColor = false, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Image = l_backgroundImage_0, 
        ImageColor3 = l_backgroundColor_0, 
        ImageTransparency = l_backgroundTransparency_0, 
        LayoutOrder = l_layoutOrder_0, 
        ScaleType = l_scaleType_0, 
        SliceCenter = l_sliceCenter_0, 
        Size = UDim2.new(0, v50, 0, l_height_0), 
        AnchorPoint = l_anchorPoint_0, 
        Position = l_position_0, 
        [v2.Event.Activated] = l_onActivated_0, 
        [v2.Ref] = v27.props.forwardRef
    }, {
        Padding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_horizontalPadding_1), 
            PaddingRight = UDim.new(0, l_horizontalPadding_1), 
            PaddingTop = UDim.new(0, l_verticalPadding_1), 
            PaddingBottom = UDim.new(0, l_verticalPadding_1)
        }), 
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = v52, 
            Padding = UDim.new(0, not not v47 and l_iconRightPadding_0 or 0), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        LeftIcon = v47 and v2.createElement(v6, {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Image = l_leftIcon_0, 
            LayoutOrder = 1, 
            ScaleType = Enum.ScaleType.Fit, 
            Size = UDim2.new(0, l_iconSize_0, 0, l_iconSize_0), 
            ImageColor3 = l_iconColor_0
        }), 
        Text = v2.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Font = l_textFont_1, 
            LayoutOrder = 2, 
            Size = UDim2.new(0, v51, 1, 0), 
            Text = l_text_1, 
            TextColor3 = l_textColor_0, 
            TextTransparency = l_textTransparency_0, 
            TextSize = l_textSize_1, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center
        })
    });
end;
return v2.forwardRef(function(v53, v54)
    return v2.createElement(v14, v1.Dictionary.join(v53, {
        forwardRef = v54
    }));
end);
