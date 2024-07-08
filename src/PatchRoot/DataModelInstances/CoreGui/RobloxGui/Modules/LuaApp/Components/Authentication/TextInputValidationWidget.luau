local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v4 = require(l_Modules_0.LuaApp.withLocalization);
local _ = require(l_CorePackages_0.Packages.Promise);
local l_Text_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Text;
local v7 = require(l_CorePackages_0.UIBlox);
local v8 = require(l_CorePackages_0.Workspace.Packages.AuthCommon);
local v9 = require(l_Modules_0.LuaApp.Components.Authentication.AuthBackAndNextButton);
local l_ImageSetLabel_0 = v7.Core.ImageSet.ImageSetLabel;
local l_GetImageData_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppAssets).GetImageData;
local v12 = require(l_Modules_0.LuaApp.Components.Authentication.IssueTracker);
local l_PasswordBox_0 = v8.Components.PasswordBox;
local v14 = require(l_Modules_0.LuaApp.FitChildren);
local l_GenericTextBox_0 = v8.Components.GenericTextBox;
local l_AuthStatefulRoundCornerBorder_0 = v8.Components.AuthStatefulRoundCornerBorder;
local l_withStyle_0 = v7.Style.withStyle;
local v18 = require(l_Modules_0.LuaApp.Enum.InputValidity);
local v19 = v2.PureComponent:extend("TextInputValidationWidget");
v19.defaultProps = {
    captureFocusOnMount = false, 
    continueButtonActionInProgress = false
};
v19.init = function(v20)
    v20.state = {
        inputTextToValidate = "", 
        validatedInputText = "", 
        inputValidity = v18.Unvalidated, 
        inputTextBoxAlignment = Enum.TextXAlignment.Left, 
        textBoxFocused = false
    };
    v20.isMounted = false;
    v20.inputBoxRef = v2.createRef();
    v20.onInputTextChanged = function(v21)
        v20.updateTextBoxAlignment(v21);
        v20.textInputChangedCallback(v21);
    end;
    v20.updateTextBoxAlignment = function(v22)
        local l_inputTextBoxAlignment_0 = v20.state.inputTextBoxAlignment;
        local v24 = l_Text_0.GetTextWidth(v22.Text, v22.Font, v22.TextSize);
        local v25 = nil;
        v25 = if v22.AbsoluteSize.X < v24 then Enum.TextXAlignment.Right else Enum.TextXAlignment.Left;
        spawn(function()
            if v20.isMounted and l_inputTextBoxAlignment_0 ~= v25 then
                v20:setState({
                    inputTextBoxAlignment = v25
                });
            end;
        end);
    end;
    v20.textInputChangedCallback = function(v26)
        spawn(function()
            if v20.isMounted then
                v20:setState({
                    inputTextToValidate = v26.Text
                });
            end;
        end);
    end;
    v20.onTextValidated = function(v27, v28)
        spawn(function()
            if v20.isMounted and v20.state.inputTextToValidate == v27 then
                v20:setState({
                    validatedInputText = v27, 
                    inputValid = v28, 
                    inputValidity = v28
                });
            end;
        end);
    end;
    v20.continueButtonActivated = function(_)
        if not (not (v20.state.inputValidity == v18.Valid) or not v20.props.continueButtonActivated) then
            v20.props.continueButtonActivated(v20.state.inputTextToValidate);
        end;
    end;
    v20.onTextInputBoxFocused = function()
        spawn(function()
            if v20.isMounted then
                v20:setState({
                    textBoxFocused = true
                });
                v20.props.textInputOnFocus();
            end;
        end);
    end;
    v20.onTextInputBoxFocusLost = function()
        spawn(function()
            if v20.isMounted then
                v20:setState({
                    textBoxFocused = false
                });
            end;
        end);
    end;
    v20.textInputBox = function(v30)
        return l_withStyle_0(function(v31)
            local l_inputTextBoxAlignment_1 = v20.state.inputTextBoxAlignment;
            local l_Font_0 = v31.Font.Body.Font;
            local v34 = v31.Font.BaseSize * v31.Font.Body.RelativeSize;
            local l_Color_0 = v31.Theme.TextDefault.Color;
            local l_Transparency_0 = v31.Theme.TextDefault.Transparency;
            local l_Color_1 = v31.Theme.BackgroundUIContrast.Color;
            local l_Transparency_1 = v31.Theme.BackgroundUIContrast.Transparency;
            local l_Color_2 = v31.Theme.UIDefault.Color;
            local l_layoutOrder_0 = v30.layoutOrder;
            local l_textInputType_0 = v20.props.textInputType;
            local l_returnKeyType_0 = v20.props.returnKeyType;
            return v4({
                passwordPlaceholderText = "Authentication.Login.Label.Password", 
                usernamePlaceholderText = "Authentication.Login.Label.Username"
            })(function(v43)
                if l_textInputType_0 == Enum.TextInputType.Password then
                    return v2.createElement(l_PasswordBox_0, {
                        LayoutOrder = l_layoutOrder_0, 
                        Size = UDim2.new(1, 0, 0, 36), 
                        Position = UDim2.new(0, 0, 0, 0), 
                        Color = l_Color_1, 
                        TextSize = v34, 
                        TextColor = l_Color_0, 
                        TextTransparency = l_Transparency_0, 
                        Text = "", 
                        ReturnKeyType = l_returnKeyType_0, 
                        TextBoxRef = v20.inputBoxRef, 
                        onChangeText = v20.onInputTextChanged, 
                        onReturnPressedFromOnScreenKeyboard = v20.continueButtonActivated, 
                        onFocused = v20.onTextInputBoxFocused, 
                        onFocusLost = v20.onTextInputBoxFocusLost, 
                        PlaceholderText = v43.passwordPlaceholderText, 
                        PlaceholderColor = l_Color_2
                    });
                else
                    return v2.createElement(l_GenericTextBox_0, {
                        LayoutOrder = l_layoutOrder_0, 
                        Size = UDim2.new(1, 0, 0, 36), 
                        Text = "", 
                        Font = l_Font_0, 
                        TextSize = v34, 
                        onChangeText = v20.onInputTextChanged, 
                        TextXAlignment = l_inputTextBoxAlignment_1, 
                        TextColor = l_Color_0, 
                        TextTransparency = l_Transparency_0, 
                        ClearTextOnFocus = false, 
                        Color = l_Color_1, 
                        Transparency = l_Transparency_1, 
                        TextInputType = l_textInputType_0, 
                        ReturnKeyType = l_returnKeyType_0, 
                        PaddingX = 8, 
                        TextBoxRef = v20.inputBoxRef, 
                        onReturnPressedFromOnScreenKeyboard = v20.continueButtonActivated, 
                        onFocused = v20.onTextInputBoxFocused, 
                        onFocusLost = v20.onTextInputBoxFocusLost, 
                        PlaceholderText = v43.usernamePlaceholderText, 
                        PlaceholderColor = l_Color_2
                    });
                end;
            end);
        end);
    end;
end;
v19.defaultProps = {
    widgetHeight = 0, 
    continueButtonKey = "Authentication.SignUp.Label.Continue"
};
v19.didMount = function(v44)
    v44.isMounted = true;
    local l_captureFocusOnMount_0 = v44.props.captureFocusOnMount;
    spawn(function()
        if not (not l_captureFocusOnMount_0 or not v44.inputBoxRef.current) then
            v44.inputBoxRef.current:captureFocus();
        end;
    end);
end;
v19.willUnmount = function(v46)
    v46.isMounted = false;
end;
v19.render = function(v47)
    local l_widgetHeight_0 = v47.props.widgetHeight;
    local l_continueButtonKey_0 = v47.props.continueButtonKey;
    local l_continueButtonActionInProgress_0 = v47.props.continueButtonActionInProgress;
    local v51 = v47.props.formFactor == l_FormFactor_0.WIDE;
    local l_validator_0 = v47.props.validator;
    local l_validatorAdditionalProps_0 = v47.props.validatorAdditionalProps;
    local l_inputTextToValidate_0 = v47.state.inputTextToValidate;
    return l_withStyle_0(function(v55)
        return v4({
            continue = l_continueButtonKey_0
        })(function(v56)
            local l_Transparency_2 = v55.Theme.BackgroundDefault.Transparency;
            local l_Default_0 = l_AuthStatefulRoundCornerBorder_0.BorderState.Default;
            local v59 = v47.state.inputValidity == v18.Valid;
            if not (v47.state.inputValidity == v18.Invalid) then
                if v47.state.textBoxFocused then
                    l_Default_0 = l_AuthStatefulRoundCornerBorder_0.BorderState.Focused;
                end;
            else
                l_Default_0 = l_AuthStatefulRoundCornerBorder_0.BorderState.Error;
            end;
            if v51 then
                l_Transparency_2 = 1;
            end;
            return v2.createElement(l_ImageSetLabel_0, {
                Size = UDim2.new(1, 0, 0, l_widgetHeight_0), 
                BackgroundColor3 = v55.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = l_Transparency_2, 
                BorderSizePixel = 0, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(9, 9, 9, 9), 
                ClipsDescendants = true, 
                Image = l_GetImageData_0("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill", 
                ImageColor3 = v55.Theme.BackgroundDefault.Color, 
                ImageTransparency = v55.Theme.BackgroundDefault.Transparency
            }, {
                UIPadding = v2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 8), 
                    PaddingRight = UDim.new(0, 12), 
                    PaddingLeft = UDim.new(0, 12), 
                    PaddingBottom = UDim.new(0, 8)
                }), 
                UsernameInputField = v2.createElement(v14.FitFrame, {
                    Size = UDim2.new(1, 0, 0, 0), 
                    fitAxis = v14.FitAxis.Height, 
                    BackgroundTransparency = 1
                }, {
                    UIListLayout = v2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 5)
                    }), 
                    TextInputBorder = v2.createElement(l_AuthStatefulRoundCornerBorder_0, {
                        size = UDim2.new(1, 0, 0, 36), 
                        layoutOrder = 1, 
                        borderState = l_Default_0
                    }, {
                        TextInput = v2.createElement(v47.textInputBox)
                    }), 
                    IssueTrackerWrapper = v2.createElement(v14.FitFrame, {
                        LayoutOrder = 2, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        fitAxis = v14.FitAxis.Height, 
                        BackgroundTransparency = 1
                    }, {
                        Padding = v2.createElement("UIPadding", {
                            PaddingRight = UDim.new(0, 12), 
                            PaddingLeft = UDim.new(0, 12)
                        }), 
                        IssueTracker = v2.createElement(v12, {
                            height = (((l_widgetHeight_0 - 36) - 36) - 16) - 5, 
                            validator = l_validator_0, 
                            validatorAdditionalProps = l_validatorAdditionalProps_0, 
                            textToValidate = l_inputTextToValidate_0, 
                            onTextValidated = v47.onTextValidated
                        })
                    })
                }), 
                AuthBackAndNextButton = v2.createElement(v9, {
                    size = UDim2.new(1, 0, 0, 36), 
                    position = UDim2.new(0.5, 0, 1, 0), 
                    anchorPoint = Vector2.new(0.5, 1), 
                    backButtonIsDisabled = l_continueButtonActionInProgress_0, 
                    nextButtonText = v56.continue, 
                    nextButtonIsDisabled = not v59, 
                    nextButtonIsLoading = l_continueButtonActionInProgress_0, 
                    nextButtonOnActivated = v47.continueButtonActivated
                })
            });
        end);
    end);
end;
return v19;
