local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetButton);
local v4 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetLabel);
local v5 = require(l_Modules_0.LuaApp.Components.ShimmerAnimation);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v7 = require(l_Modules_0.LuaApp.withTheme_DEPRECATED);
local v8 = Rect.new(8, 8, 9, 9);
local v9 = Rect.new(8, 8, 9, 9);
local v10 = v2.PureComponent:extend("GenericIconButton");
v10.defaultProps = {
    AnchorPoint = Vector2.new(0, 0), 
    Position = UDim2.new(0, 0, 0, 0), 
    Size = UDim2.new(1, 0, 1, 0), 
    LayoutOrder = 1, 
    isDisabled = false, 
    isChecked = false, 
    isLoading = false, 
    iconComponent = v4
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
v10.render = function(v12)
    local l_IconButton_0 = v12.props.appTheme.IconButton;
    local l_AnchorPoint_0 = v12.props.AnchorPoint;
    local l_Size_0 = v12.props.Size;
    local l_buttonRef_0 = v12.props.buttonRef;
    local l_Position_0 = v12.props.Position;
    local l_LayoutOrder_0 = v12.props.LayoutOrder;
    local l_iconImage_0 = v12.props.iconImage;
    local l_iconSize_0 = v12.props.iconSize;
    local l_onActivated_0 = v12.props.onActivated;
    local l_isDisabled_0 = v12.props.isDisabled;
    local l_isChecked_0 = v12.props.isChecked;
    local l_isLoading_0 = v12.props.isLoading;
    local v25 = not l_isLoading_0;
    local l_isButtonPressed_0 = v12.state.isButtonPressed;
    local l_Off_0 = l_IconButton_0.Border.Off;
    local l_Off_1 = l_IconButton_0.Fill.Off;
    local l_Off_2 = l_IconButton_0.Icon.Off;
    local l_withNewThemeProvider_0 = v12.props.withNewThemeProvider;
    return l_withStyle_0(function(v31)
        if l_isDisabled_0 then
            l_Off_0 = l_IconButton_0.Border.Disabled;
            l_Off_1 = l_IconButton_0.Fill.Disabled;
            l_Off_2 = l_IconButton_0.Icon.Disabled;
            l_isButtonPressed_0 = false;
            l_isChecked_0 = false;
            l_isLoading_0 = false;
        end;
        if l_isChecked_0 then
            l_Off_0 = l_IconButton_0.Border.On;
            l_Off_1 = l_IconButton_0.Fill.On;
            l_Off_2 = l_IconButton_0.Icon.On;
        end;
        if l_isLoading_0 then
            l_Off_0 = l_IconButton_0.Border.Loading;
            l_Off_1 = l_IconButton_0.Fill.Loading;
            l_Off_2 = l_IconButton_0.Icon.Loading;
        end;
        if not (not l_isButtonPressed_0 or not v25) then
            l_Off_0 = l_IconButton_0.Border.OnPress;
            l_Off_1 = l_IconButton_0.Fill.OnPress;
            l_Off_2 = l_IconButton_0.Icon.OnPress;
        end;
        if l_withNewThemeProvider_0 then
            l_Off_1.Transparency = 1;
            l_Off_0.Color = v31.Theme.SecondaryDefault.Color;
            l_Off_2.Color = v31.Theme.SecondaryDefault.Color;
            if l_isChecked_0 then
                l_Off_2.Color = v31.Theme.ContextualPrimaryDefault.Color;
            end;
            if not (not l_isButtonPressed_0 or not v25) then
                l_Off_2.Color = v31.Theme.ContextualPrimaryDefault.Color;
            end;
        end;
        local l_v4_0 = v4;
        if v12.props.iconComponent then
            l_v4_0 = v12.props.iconComponent;
        end;
        return v2.createElement(v3, {
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            AnchorPoint = l_AnchorPoint_0, 
            Size = l_Size_0, 
            Position = l_Position_0, 
            Image = "LuaApp/buttons/buttonFill", 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = v9, 
            ImageTransparency = l_Off_1.Transparency, 
            ImageColor3 = l_Off_1.Color, 
            LayoutOrder = l_LayoutOrder_0, 
            ClipsDescendants = false, 
            [v2.Event.Activated] = not not v25 and l_onActivated_0 or nil, 
            [v2.Event.InputBegan] = v12.onInputBegan, 
            [v2.Event.InputEnded] = v12.onInputEnded, 
            [v2.Ref] = l_buttonRef_0
        }, {
            Border = v2.createElement(v4, {
                Size = UDim2.new(1, 0, 1, 0), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                ImageTransparency = l_Off_0.Transparency, 
                ImageColor3 = l_Off_0.Color, 
                Image = "LuaApp/buttons/buttonStroke", 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = v8
            }, {
                Icon = v2.createElement(l_v4_0, {
                    Size = l_iconSize_0, 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    Image = l_iconImage_0, 
                    ImageTransparency = l_Off_2.Transparency, 
                    ImageColor3 = l_Off_2.Color
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
return (v7(v10));
