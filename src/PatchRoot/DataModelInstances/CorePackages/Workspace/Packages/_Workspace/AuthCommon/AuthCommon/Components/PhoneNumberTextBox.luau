local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_CoreGui_0 = game:GetService("CoreGui");
local v3 = require(l_Parent_0.Roact);
local v4 = require(l_Parent_0.UIBlox);
local l_withStyle_0 = v4.Style.withStyle;
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_GetImageData_0 = require(l_Parent_0.RobloxAppAssets).GetImageData;
local v9 = require(l_script_FirstAncestor_0.Components.CountryCodeSelector);
local v10 = v3.Component:extend("PhoneNumberTextBox");
v10.defaultProps = {
    CountryCodeSize = 70, 
    InnerPadding = 12
};
v10.init = function(v11)
    v11:setState({
        CountryCodeHover = false, 
        CountryCodeSearchVisible = false
    });
    v11.CountryCodeMouseEnter = function()
        v11:setState({
            CountryCodeHover = true
        });
    end;
    v11.CountryCodeMouseLeave = function()
        v11:setState({
            CountryCodeHover = false
        });
    end;
    v11.OpenCountryCode = function()
        v11:setState({
            CountryCodeSearchVisible = true
        });
        if v11.props.phoneCountryCodeSelectorCallback then
            v11.props.phoneCountryCodeSelectorCallback(true);
        end;
    end;
    v11.CloseCountryCode = function()
        v11:setState({
            CountryCodeSearchVisible = false
        });
        if v11.props.phoneCountryCodeSelectorCallback then
            v11.props.phoneCountryCodeSelectorCallback(false);
        end;
    end;
    v11.SelectCountryCode = function(v12)
        if v11.props.SetCountryCode then
            v11.props.SetCountryCode(v12);
        end;
        v11.CloseCountryCode();
    end;
end;
v10.render = function(v13)
    return l_withStyle_0(function(v14)
        local l_Color_0 = v13.props.Color;
        local l_Color_1 = v14.Theme.BackgroundMuted.Color;
        local l_Transparency_0 = v13.props.Transparency;
        local l_Font_0 = v14.Font.Body.Font;
        local v19 = v14.Font.BaseSize * v14.Font.Body.RelativeSize;
        local l_Color_2 = v14.Theme.TextDefault.Color;
        local l_Transparency_1 = v14.Theme.TextDefault.Transparency;
        local l_Color_3 = v14.Theme.UIDefault.Color;
        local _ = v13.props.PlaceholderText or "";
        local v24 = v13.props.Text or "";
        local v25 = v13.props.TextInputTypeOverride or Enum.TextInputType.Phone;
        local v26 = " +" .. v13.props.CountryCode.prefix;
        local v27 = math.max(l_Text_0.GetTextWidth(v26, l_Font_0, v19) + v13.props.InnerPadding * 2, v13.props.CountryCodeSize);
        return v3.createElement("TextButton", {
            Size = v13.props.Size, 
            Position = v13.props.Position, 
            AnchorPoint = v13.props.AnchorPoint, 
            LayoutOrder = v13.props.LayoutOrder, 
            BackgroundTransparency = 1, 
            Text = "", 
            [v3.Event.MouseEnter] = v13.props.onMouseEnter, 
            [v3.Event.MouseLeave] = v13.props.onMouseLeave
        }, {
            InputWrapper = v3.createElement("Frame", {
                Size = UDim2.new(1, -v27 - 2, 1, 0), 
                Position = UDim2.new(0, v27 + 2, 0, 0), 
                BackgroundTransparency = 1, 
                ClipsDescendants = true
            }, {
                Background = v3.createElement(l_ImageSetLabel_0, {
                    Size = UDim2.new(1, 18, 1, 0), 
                    Position = UDim2.new(0, -18, 0, 0), 
                    BackgroundTransparency = 1, 
                    Image = l_GetImageData_0("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill", 
                    ImageColor3 = l_Color_0, 
                    ImageTransparency = l_Transparency_0, 
                    BorderSizePixel = 0, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = Rect.new(8, 8, 9, 9)
                }), 
                InputField = v3.createElement("TextBox", {
                    BackgroundTransparency = 1, 
                    ZIndex = 2, 
                    Size = UDim2.new(1, -v13.props.InnerPadding * 2, 1, 0), 
                    Position = UDim2.new(0, v13.props.InnerPadding, 0, 0), 
                    PlaceholderColor3 = l_Color_3, 
                    PlaceholderText = v13.props.PlaceholderText, 
                    Text = v24, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextColor3 = l_Color_2, 
                    TextSize = v19, 
                    TextInputType = v25, 
                    Font = l_Font_0, 
                    ClearTextOnFocus = false, 
                    [v3.Event.Focused] = v13.props.onFocused, 
                    [v3.Event.FocusLost] = v13.props.onFocusLost, 
                    [v3.Change.Text] = v13.props.onChangeText
                })
            }), 
            CountryCodeButton = v3.createElement("TextButton", {
                Size = UDim2.new(0, v27, 1, 0), 
                ZIndex = 2, 
                Text = "", 
                BackgroundTransparency = 1, 
                ClipsDescendants = true, 
                [v3.Event.MouseEnter] = v13.CountryCodeMouseEnter, 
                [v3.Event.MouseLeave] = v13.CountryCodeMouseLeave, 
                [v3.Event.Activated] = v13.OpenCountryCode
            }, {
                Background = v3.createElement(l_ImageSetLabel_0, {
                    Size = UDim2.new(1, 18, 1, 0), 
                    BackgroundTransparency = 1, 
                    Image = l_GetImageData_0("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill", 
                    ImageColor3 = not not v13.state.CountryCodeHover and l_Color_1 or l_Color_0, 
                    ImageTransparency = l_Transparency_0, 
                    BorderSizePixel = 0, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = Rect.new(8, 8, 9, 9)
                }), 
                Prefix = v3.createElement("TextLabel", {
                    Size = UDim2.new(1, -v13.props.InnerPadding, 1, 0), 
                    TextXAlignment = Enum.TextXAlignment.Right, 
                    ZIndex = 2, 
                    Font = l_Font_0, 
                    Text = "<u>" .. v26 .. "</u>", 
                    TextSize = v19, 
                    TextColor3 = l_Color_2, 
                    TextTransparency = l_Transparency_1, 
                    BackgroundTransparency = 1, 
                    RichText = true
                })
            }), 
            Divider = v3.createElement("Frame", {
                BackgroundColor3 = l_Color_1, 
                Size = UDim2.new(0, 2, 1, 0), 
                Position = UDim2.new(0, v27, 0, 0), 
                BackgroundTransparency = l_Transparency_0, 
                BorderSizePixel = 0, 
                ZIndex = 2
            }), 
            CountryCodePortal = v3.createElement(v3.Portal, {
                target = l_CoreGui_0
            }, {
                CountryCodeSelectionGui = v3.createElement("ScreenGui", {
                    Enabled = true, 
                    ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                    DisplayOrder = 13
                }, {
                    CountryCodeSelector = v3.createElement(v9, {
                        WidgetVisible = v13.state.CountryCodeSearchVisible, 
                        CloseCallback = v13.CloseCountryCode, 
                        SelectionCallback = v13.SelectCountryCode
                    })
                })
            })
        });
    end);
end;
return v10;
