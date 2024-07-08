local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.UIBlox);
local v4 = require(l_CorePackages_0.Workspace.Packages.AuthCommon);
local l_GenericTextBox_0 = v4.Components.GenericTextBox;
local l_PasswordBox_0 = v4.Components.PasswordBox;
local v7 = require(l_Modules_0.LuaApp.Promise);
local l_TextBoxStateWrapper_0 = v4.Components.TextBoxStateWrapper;
local l_withStyle_0 = v3.Style.withStyle;
local v10 = v2.PureComponent:extend(script.Name);
local function v11()
    return v7.resolve(true);
end;
v10.defaultProps = {
    onChanged = v11, 
    onFocused = v11, 
    setError = v11, 
    setValue = v11, 
    textInputType = Enum.TextInputType.NoSuggestions, 
    validate = v11
};
v10.init = function(v12)
    v12.validateAndSetStateForInput = function(v13)
        local l_text_0 = v13.text;
        v12.props.onChanged(l_text_0);
        v12.props.setValue(l_text_0);
        v12.props.validate(l_text_0):andThen(v12.props.setError):catch(print);
    end;
end;
v10.render = function(v15)
    local l_errorText_0 = v15.props.errorText;
    local l_helpComponent_0 = v15.props.helpComponent;
    local l_labelText_0 = v15.props.labelText;
    local l_layoutOrder_0 = v15.props.layoutOrder;
    local l_onFocused_0 = v15.props.onFocused;
    local l_placeholderText_0 = v15.props.placeholderText;
    local l_textInputType_0 = v15.props.textInputType;
    local l_setValue_0 = v15.props.setValue;
    return l_withStyle_0(function(v24)
        local l_Font_0 = v24.Font.Body.Font;
        local v26 = v24.Font.BaseSize * v24.Font.Body.RelativeSize;
        local l_Color_0 = v24.Theme.TextDefault.Color;
        local l_Transparency_0 = v24.Theme.TextDefault.Transparency;
        local l_Color_1 = v24.Theme.BackgroundUIContrast.Color;
        local l_Transparency_1 = v24.Theme.BackgroundUIContrast.Transparency;
        local l_Color_2 = v24.Theme.UIDefault.Color;
        local l_createElement_0 = v2.createElement;
        local l_l_TextBoxStateWrapper_0_0 = l_TextBoxStateWrapper_0;
        local v34 = {
            ChildClass = l_textInputType_0 == Enum.TextInputType.Password and l_PasswordBox_0 or l_GenericTextBox_0, 
            ErrorState = l_errorText_0 ~= nil
        };
        local v35 = false;
        if l_setValue_0 ~= "" then
            v35 = l_errorText_0;
        end;
        v34.ErrorText = v35;
        v34.HelpComponent = l_helpComponent_0;
        v34.LabelText = l_labelText_0;
        v34.LayoutOrder = l_layoutOrder_0;
        v34.Size = UDim2.new(1, 0, 0, 36);
        v34.ChildProps = {
            ClearTextOnFocus = false, 
            Color = l_Color_1, 
            Font = l_Font_0, 
            onChangeText = v15.validateAndSetStateForInput, 
            onFocused = l_onFocused_0, 
            PaddingX = 12, 
            PlaceholderColor = l_Color_2, 
            PlaceholderText = l_placeholderText_0, 
            Text = "", 
            TextColor = l_Color_0, 
            TextInputType = l_textInputType_0, 
            TextSize = v26, 
            TextTransparency = l_Transparency_0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Transparency = l_Transparency_1
        };
        return l_createElement_0(l_l_TextBoxStateWrapper_0_0, v34);
    end);
end;
return v10;
