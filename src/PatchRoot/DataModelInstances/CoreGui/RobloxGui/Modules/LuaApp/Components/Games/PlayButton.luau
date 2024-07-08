local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Roact);
local v2 = require(l_Modules_0.LuaApp.Enum.PlayButtonStates);
local v3 = require(l_Modules_0.LuaApp.FitChildren);
local v4 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
local v5 = require(l_Modules_0.LuaApp.withTheme_DEPRECATED);
local l_CorePackages_0 = game:GetService("CorePackages");
local v7 = require(l_CorePackages_0.UIBlox);
local l_ImageSetButton_0 = v7.Core.ImageSet.ImageSetButton;
local l_ImageSetLabel_0 = v7.Core.ImageSet.ImageSetLabel;
local l_ShimmerPanel_0 = v7.App.Loading.ShimmerPanel;
local l_withStyle_0 = v7.Core.Style.withStyle;
local l_GetFFlagLuaAppUseUIBloxColorPalettes_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppUseUIBloxColorPalettes;
local l_GetUIBloxUseNewThemeColorPalettes_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).UIBlox.GetUIBloxUseNewThemeColorPalettes;
local l_Images_0 = v7.App.ImageSet.Images;
local v15 = l_Images_0["component_assets/circle_17"];
local v16 = l_Images_0["icons/common/play"];
local v17 = l_Images_0["icons/status/private"];
local v18 = l_Images_0["icons/status/unavailable"];
local v19 = l_Images_0["icons/common/robux"];
local function _(v20)
    return 0.5 * v20 + 0.5;
end;
local v22 = v1.PureComponent:extend("PlayButton");
v22.defaultProps = {
    smallPlayButton = false
};
v22.init = function(v23)
    v23.state = {
        isButtonPressed = false
    };
    v23.onInputBegan = function()
        v23:setState({
            isButtonPressed = true
        });
    end;
    v23.onInputEnded = function()
        v23:setState({
            isButtonPressed = false
        });
    end;
end;
v22.renderWithStyle = function(v24, v25)
    local l_appTheme_0 = v24.props.appTheme;
    local l_Size_0 = v24.props.Size;
    local l_Position_0 = v24.props.Position;
    local l_LayoutOrder_0 = v24.props.LayoutOrder;
    local l_Font_0 = v24.props.Font;
    local l_price_0 = v24.props.price;
    local l_smallPlayButton_0 = v24.props.smallPlayButton;
    local l_playButtonState_0 = v24.props.playButtonState;
    local l_onActivated_0 = v24.props.onActivated;
    local l_isButtonPressed_0 = v24.state.isButtonPressed;
    local v36 = nil;
    local v37 = not v25 and 0 or v25.ContextualPrimaryDefault.Transparency;
    if l_playButtonState_0 == v2.Loading then
        if not v25 then
            v37 = l_appTheme_0.ContextPrimaryButton.LoadingTransparency;
        end;
        v36 = v1.createElement(l_ShimmerPanel_0, {
            Size = UDim2.new(1, 0, 2, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            shimmerSpeed = 1.5
        });
    elseif l_playButtonState_0 == v2.Playable then
        if l_isButtonPressed_0 then
            v37 = if not v25 then l_appTheme_0.ContextPrimaryButton.OnPressTransparency else 0.5 * v37 + 0.5;
        end;
        v36 = v1.createElement(l_ImageSetLabel_0, {
            Size = UDim2.new(0, 36, 0, 36), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Image = v16, 
            ImageColor3 = if not v25 then nil else v25.ContextualPrimaryContent.Color, 
            ImageTransparency = v37
        });
    elseif l_playButtonState_0 == v2.PaidAccess then
        if l_isButtonPressed_0 then
            v37 = if not v25 then l_appTheme_0.ContextPrimaryButton.OnPressTransparency else 0.5 * v37 + 0.5;
        end;
        v36 = if not l_smallPlayButton_0 then v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1
        }, {
            Layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 5)
            }), 
            RobuxIcon = v1.createElement(l_ImageSetLabel_0, {
                Size = UDim2.new(0, 26, 0, 26), 
                BackgroundTransparency = 1, 
                Image = v19, 
                ImageColor3 = if not v25 then nil else v25.ContextualPrimaryContent.Color, 
                ImageTransparency = v37, 
                LayoutOrder = 1
            }), 
            RobuxText = v1.createElement(v4, {
                Size = UDim2.new(0, 0, 0, 22), 
                BackgroundTransparency = 1, 
                Text = l_price_0, 
                Font = l_Font_0, 
                TextSize = 22, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextWrapped = false, 
                TextColor3 = if not v25 then l_appTheme_0.ContextPrimaryButton.Text.Color else v25.ContextualPrimaryContent.Color, 
                TextTransparency = v37, 
                LayoutOrder = 2, 
                fitAxis = v3.FitAxis.Width
            })
        }) else v1.createElement(l_ImageSetLabel_0, {
            Size = UDim2.new(0, 36, 0, 36), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Image = v16, 
            ImageColor3 = if not v25 then nil else v25.ContextualPrimaryContent.Color, 
            ImageTransparency = v37
        });
    elseif l_playButtonState_0 == v2.Private then
        v37 = if not v25 then l_appTheme_0.ContextPrimaryButton.DisabledTransparency else v25.ContextualPrimaryContent.Transparency;
        v36 = v1.createElement(l_ImageSetLabel_0, {
            Size = UDim2.new(0, 36, 0, 36), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Image = v17, 
            ImageColor3 = if not v25 then nil else v25.ContextualPrimaryContent.Color, 
            ImageTransparency = v37
        });
    elseif l_playButtonState_0 == v2.UnplayableOther then
        v37 = if not v25 then l_appTheme_0.ContextPrimaryButton.DisabledTransparency else v25.ContextualPrimaryContent.Transparency;
        v36 = v1.createElement(l_ImageSetLabel_0, {
            Size = UDim2.new(0, 36, 0, 36), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Image = v18, 
            ImageColor3 = if not v25 then nil else v25.ContextualPrimaryContent.Color, 
            ImageTransparency = v37
        });
    else
        error("invalid play button state");
    end;
    return v1.createElement(l_ImageSetButton_0, {
        Size = l_Size_0, 
        Position = l_Position_0, 
        LayoutOrder = l_LayoutOrder_0, 
        AutoButtonColor = false, 
        BackgroundTransparency = 1, 
        Image = v15, 
        ImageColor3 = if not v25 then l_appTheme_0.ContextPrimaryButton.Color else v25.ContextualPrimaryDefault.Color, 
        ImageTransparency = v37, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(8, 8, 9, 9), 
        ClipsDescendants = true, 
        [v1.Event.InputBegan] = v24.onInputBegan, 
        [v1.Event.InputEnded] = v24.onInputEnded, 
        [v1.Event.Activated] = l_onActivated_0
    }, {
        PlayButton = v36
    });
end;
v22.render = function(v38)
    if not l_GetFFlagLuaAppUseUIBloxColorPalettes_0() or not l_GetUIBloxUseNewThemeColorPalettes_0() then
        return v38:renderWithStyle(nil);
    else
        return l_withStyle_0(function(v39)
            return v38:renderWithStyle(v39.Theme);
        end);
    end;
end;
return (v5(v22));
