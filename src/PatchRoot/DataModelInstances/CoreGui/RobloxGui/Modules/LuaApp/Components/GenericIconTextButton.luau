local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetButton);
local v4 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetLabel);
local v5 = require(l_Modules_0.LuaApp.Components.ShimmerAnimation);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local l_Center_0 = Enum.HorizontalAlignment.Center;
local l_SourceSans_0 = Enum.Font.SourceSans;
local v9 = Rect.new(8, 8, 9, 9);
local v10 = v2.PureComponent:extend("GenericIconTextButton");
v10.defaultProps = {
    AnchorPoint = Vector2.new(0, 0), 
    Position = UDim2.new(0, 0, 0, 0), 
    Size = UDim2.new(1, 0, 1, 0), 
    LayoutOrder = 1, 
    iconRightPadding = 3, 
    iconSize = UDim2.new(0, 16, 0, 16), 
    horizontalAlignment = l_Center_0, 
    setIconTransparencyEnabled = false, 
    iconTransparency = 0, 
    leftIconEnabled = false, 
    Font = l_SourceSans_0, 
    TextSize = 20, 
    Text = "", 
    isDisabled = false, 
    isLoading = false
};
v10.init = function(v11)
    v11.state = {
        isButtonPressed = false
    };
    v11.onInputBegan = function()
        v11:setState({
            isButtonPressed = true
        });
    end;
    v11.onInputEnded = function()
        v11:setState({
            isButtonPressed = false
        });
    end;
end;
local function _(v12, v13)
    return 1 - (1 - v12) * (1 - v13);
end;
v10.render = function(v15)
    local l_themeSettings_0 = v15.props.themeSettings;
    local l_Size_0 = v15.props.Size;
    local l_Text_0 = v15.props.Text;
    local l_Font_0 = v15.props.Font;
    local l_TextSize_0 = v15.props.TextSize;
    local l_buttonRef_0 = v15.props.buttonRef;
    local l_LayoutOrder_0 = v15.props.LayoutOrder;
    local l_iconImage_0 = v15.props.iconImage;
    local l_iconSize_0 = v15.props.iconSize;
    local l_onActivated_0 = v15.props.onActivated;
    local l_isDisabled_0 = v15.props.isDisabled;
    local l_isLoading_0 = v15.props.isLoading;
    local v28 = not l_isLoading_0;
    local v29 = l_themeSettings_0.Border.Hidden == false;
    local l_iconRightPadding_0 = v15.props.iconRightPadding;
    local l_isButtonPressed_0 = v15.state.isButtonPressed;
    local l_horizontalAlignment_0 = v15.props.horizontalAlignment;
    local l_leftIconEnabled_0 = v15.props.leftIconEnabled;
    local l_Color_0 = l_themeSettings_0.Color;
    local v35 = 0;
    if not l_isLoading_0 and not l_isDisabled_0 then
        if l_isButtonPressed_0 then
            l_Color_0 = l_themeSettings_0.OnPressColor;
            v35 = l_themeSettings_0.OnPressTransparency;
        end;
    else
        l_Color_0 = l_themeSettings_0.DisabledColor;
        v35 = l_themeSettings_0.DisabledTransparency;
    end;
    local l_NextSelectionDown_0 = v15.props.NextSelectionDown;
    local l_NextSelectionLeft_0 = v15.props.NextSelectionLeft;
    local l_NextSelectionRight_0 = v15.props.NextSelectionRight;
    local l_NextSelectionUp_0 = v15.props.NextSelectionUp;
    local v40 = 1 - (1 - v35) * (1 - l_themeSettings_0.Transparency);
    local v41 = not not v29 and 1 - (1 - v35) * (1 - l_themeSettings_0.Border.Transparency) or 1;
    return l_withStyle_0(function(v42)
        return v2.createElement(v3, {
            Size = l_Size_0, 
            LayoutOrder = l_LayoutOrder_0, 
            BackgroundTransparency = 1, 
            Image = "LuaApp/buttons/buttonFill", 
            ImageColor3 = l_Color_0 or v42.Theme.SystemPrimaryDefault.Color, 
            ImageTransparency = v40 or v42.Theme.SystemPrimaryDefault.Transparency, 
            BorderSizePixel = 0, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(8, 8, 9, 9), 
            NextSelectionDown = l_NextSelectionDown_0, 
            NextSelectionLeft = l_NextSelectionLeft_0, 
            NextSelectionRight = l_NextSelectionRight_0, 
            NextSelectionUp = l_NextSelectionUp_0, 
            ClipsDescendants = false, 
            [v2.Event.Activated] = not not v28 and l_onActivated_0 or nil, 
            [v2.Event.InputBegan] = v15.onInputBegan, 
            [v2.Event.InputEnded] = v15.onInputEnded, 
            [v2.Ref] = l_buttonRef_0
        }, {
            Border = v2.createElement(v4, {
                Size = UDim2.new(1, 0, 1, 0), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                ImageTransparency = v41, 
                ImageColor3 = l_themeSettings_0.Border.Color, 
                Image = "LuaApp/buttons/buttonStroke", 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = v9
            }), 
            AlignmentContainer = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = l_Size_0, 
                Position = UDim2.new(0.5, 0, 0, 0), 
                AnchorPoint = Vector2.new(0.5, 0), 
                AutomaticSize = Enum.AutomaticSize.XY
            }, {
                Layout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = l_horizontalAlignment_0, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                LeftIcon = l_leftIconEnabled_0 and v2.createElement(v4, {
                    Size = l_iconSize_0, 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    Image = l_iconImage_0, 
                    ImageTransparency = v42.Theme.IconEmphasis.Transparency, 
                    ImageColor3 = v42.Theme.IconEmphasis.Color, 
                    LayoutOrder = 1, 
                    ScaleType = Enum.ScaleType.Fit, 
                    [v2.Children] = {
                        UIPadding = v2.createElement("UIPadding", {
                            PaddingRight = UDim.new(0, l_iconRightPadding_0)
                        })
                    }
                }), 
                Text = v2.createElement("TextLabel", {
                    LayoutOrder = 2, 
                    AutomaticSize = Enum.AutomaticSize.X, 
                    Text = l_Text_0, 
                    Font = l_Font_0, 
                    TextSize = l_TextSize_0, 
                    TextColor3 = l_themeSettings_0.Text.Color or v42.Theme.SystemPrimaryContent.Color, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    BackgroundTransparency = 1
                })
            }), 
            ShimmerAnimation = l_isLoading_0 and v2.createElement(v5, {
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(0, 0, 0, 0), 
                shimmerSpeed = 1.5
            })
        });
    end);
end;
return v10;
