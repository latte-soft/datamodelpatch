local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactGamepad);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.UIBlox);
local l_Focusable_0 = v2.Focusable;
local l_withStyle_0 = v4.Style.withStyle;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_SystemSlider_0 = v4.App.Slider.SystemSlider;
local v9 = v1.PureComponent:extend("SliderWithLabelAndIcons");
v9.validateProps = v3.strictInterface({
    layoutOrder = v3.number, 
    text = v3.string, 
    leftIcon = v3.table, 
    rightIcon = v3.table, 
    value = v3.number, 
    onSliderChanged = v3.callback, 
    min = v3.number, 
    max = v3.number, 
    baseRef = v3.table, 
    NextSelectionUp = v3.optional(v3.table), 
    NextSelectionDown = v3.optional(v3.table)
});
v9.init = function(v10)
    v10.sliderRef = v1.createRef();
end;
v9.render = function(v11)
    return l_withStyle_0(function(v12)
        local l_Font_0 = v12.Font;
        local v14 = l_Font_0.CaptionHeader.RelativeSize * l_Font_0.BaseSize;
        local l_Font_1 = l_Font_0.CaptionHeader.Font;
        local v16 = 50 - v14;
        return v1.createElement(l_Focusable_0.Frame, {
            Size = UDim2.new(0.9, 0, 0, 50), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = v11.props.layoutOrder, 
            defaultChild = v11.sliderRef, 
            [v1.Ref] = v11.props.baseRef
        }, {
            TopFrame = v1.createElement("Frame", {
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, v14)
            }, {
                SliderLabel = v1.createElement("TextLabel", {
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    Text = v11.props.text, 
                    Size = UDim2.new(1, -2 * v16, 1, 0), 
                    Position = UDim2.fromOffset(v16, 0), 
                    TextColor3 = v12.Theme.TextEmphasis.Color, 
                    Font = l_Font_1, 
                    TextSize = v14, 
                    TextXAlignment = Enum.TextXAlignment.Left
                })
            }), 
            BottomFrame = v1.createElement("Frame", {
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, v16), 
                Position = UDim2.fromOffset(0, v14)
            }, {
                LeftIcon = v1.createElement(l_ImageSetLabel_0, {
                    BackgroundTransparency = 1, 
                    Image = v11.props.leftIcon, 
                    Size = UDim2.fromOffset(v16, v16), 
                    Position = UDim2.fromOffset(0, 0), 
                    ImageColor3 = v12.Theme.TextEmphasis.Color
                }), 
                SliderBar = v1.createElement(l_SystemSlider_0, {
                    min = v11.props.min, 
                    max = v11.props.max, 
                    stepInterval = 1, 
                    value = v11.props.value, 
                    onValueChanged = v11.props.onSliderChanged, 
                    width = UDim.new(1, -2 * v16), 
                    position = UDim2.new(0, v16, 0.5, 0), 
                    anchorPoint = Vector2.new(0, 0.5), 
                    NextSelectionUp = v11.props.NextSelectionUp, 
                    NextSelectionDown = v11.props.NextSelectionDown, 
                    [v1.Ref] = v11.sliderRef
                }), 
                RightIcon = v1.createElement(l_ImageSetLabel_0, {
                    BackgroundTransparency = 1, 
                    Image = v11.props.rightIcon, 
                    AnchorPoint = Vector2.new(1, 0), 
                    Size = UDim2.fromOffset(v16, v16), 
                    Position = UDim2.fromScale(1, 0), 
                    ImageColor3 = v12.Theme.TextEmphasis.Color
                })
            })
        });
    end);
end;
return v9;
