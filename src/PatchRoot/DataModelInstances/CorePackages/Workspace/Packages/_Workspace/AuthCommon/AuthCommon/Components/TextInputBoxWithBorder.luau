local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local l_withStyle_0 = require(l_Parent_0.UIBlox).Style.withStyle;
local v4 = require(l_script_FirstAncestor_0.Components.PasswordBox);
local v5 = require(l_script_FirstAncestor_0.Components.GenericTextBox);
local v6 = require(l_script_FirstAncestor_0.Components.AuthStatefulRoundCornerBorder);
local l_GetFFlagEnableAuthStatefulTextInputUpdates_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableAuthStatefulTextInputUpdates;
local v8 = v2.PureComponent:extend(script.Name);
v8.defaultProps = {
    text = "", 
    textInputType = Enum.TextInputType.NoSuggestions, 
    textInputHeight = 30, 
    textInputListPadding = 12, 
    borderState = v6.BorderState.Default
};
v8.render = function(v9)
    local l_text_0 = v9.props.text;
    local l_textInputType_0 = v9.props.textInputType;
    local l_textInputHeight_0 = v9.props.textInputHeight;
    local v13 = not l_GetFFlagEnableAuthStatefulTextInputUpdates_0() and 12 or v9.props.textInputListPadding;
    local l_layoutOrder_0 = v9.props.layoutOrder;
    local l_borderState_0 = v9.props.borderState;
    local l_placeholderText_0 = v9.props.placeholderText;
    local l_onChangeTextCallback_0 = v9.props.onChangeTextCallback;
    local l_onFocused_0 = v9.props.onFocused;
    local l_onFocusLost_0 = v9.props.onFocusLost;
    local l_labelText_0 = v9.props.labelText;
    local l_errorText_0 = v9.props.errorText;
    local v22 = v9.props.textInputType == Enum.TextInputType.Password;
    return l_withStyle_0(function(v23)
        local l_Font_0 = v23.Font.Body.Font;
        local v25 = v23.Font.BaseSize * v23.Font.Body.RelativeSize;
        local l_Color_0 = v23.Theme.TextDefault.Color;
        local l_Transparency_0 = v23.Theme.TextDefault.Transparency;
        local l_Color_1 = v23.Theme.BackgroundUIContrast.Color;
        local l_Transparency_1 = v23.Theme.BackgroundUIContrast.Transparency;
        local l_Color_2 = v23.Theme.UIDefault.Color;
        return v2.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = l_layoutOrder_0, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            ListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, v13)
            }), 
            TextBoxLabel = l_labelText_0 and v2.createElement("TextLabel", {
                LayoutOrder = 1, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                Text = l_labelText_0, 
                TextWrapped = true, 
                Font = v23.Font.CaptionHeader.Font, 
                TextSize = v23.Font.BaseSize * v23.Font.CaptionHeader.RelativeSize, 
                TextColor3 = v23.Theme.TextEmphasis.Color, 
                TextTransparency = v23.Theme.TextEmphasis.Transparency, 
                TextXAlignment = Enum.TextXAlignment.Left
            }), 
            TextBox = v2.createElement(v6, {
                size = UDim2.new(1, 0, 0, l_textInputHeight_0), 
                layoutOrder = if not l_GetFFlagEnableAuthStatefulTextInputUpdates_0() then l_layoutOrder_0 else 2, 
                borderState = l_borderState_0
            }, {
                PasswordBox = v22 and v2.createElement(v4, {
                    LayoutOrder = if l_GetFFlagEnableAuthStatefulTextInputUpdates_0() then nil else 2, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    Color = l_Color_1, 
                    Transparency = l_Transparency_1, 
                    TextSize = v25, 
                    TextColor = l_Color_0, 
                    TextTransparency = l_Transparency_0, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Text = l_text_0, 
                    PlaceholderText = l_placeholderText_0, 
                    PlaceholderColor3 = l_Color_2, 
                    ManualFocusRelease = false, 
                    CaptureFocusOnTapStart = true, 
                    onChangeText = l_onChangeTextCallback_0
                }), 
                GenericTextBox = not v22 and v2.createElement(v5, {
                    LayoutOrder = if l_GetFFlagEnableAuthStatefulTextInputUpdates_0() then nil else 2, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    Text = l_text_0, 
                    Font = l_Font_0, 
                    TextSize = v25, 
                    TextColor = l_Color_0, 
                    TextTransparency = l_Transparency_0, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    ClearTextOnFocus = false, 
                    Color = l_Color_1, 
                    Transparency = l_Transparency_1, 
                    TextInputType = l_textInputType_0, 
                    onChangeText = l_onChangeTextCallback_0, 
                    PlaceholderText = l_placeholderText_0, 
                    PlaceholderColor = l_Color_2, 
                    PaddingX = 12, 
                    onFocused = l_onFocused_0, 
                    onFocusLost = l_onFocusLost_0, 
                    TextBoxRef = if not l_GetFFlagEnableAuthStatefulTextInputUpdates_0 then nil else v9.props.textBoxRef
                })
            }), 
            ErrorText = l_errorText_0 and v2.createElement("TextLabel", {
                LayoutOrder = 3, 
                BackgroundTransparency = 1, 
                Text = l_errorText_0, 
                TextSize = v23.Font.CaptionBody.RelativeSize * v23.Font.BaseSize, 
                Font = v23.Font.SubHeader1.Font, 
                TextColor3 = v23.Theme.Alert.Color, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextWrapped = true, 
                Size = UDim2.new(1, 0, 0, 0)
            })
        });
    end);
end;
return v8;
