local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local v4 = require(l_CorePackages_0.UIBlox);
local l_useStyle_0 = v4.Core.Style.useStyle;
local v6 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local v7 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local v8 = require(l_CorePackages_0.Workspace.Packages.AuthCommon);
local v9 = require(l_Modules_0.LuaApp.FitChildren);
local l_TextBoxStateWrapper_0 = v8.Components.TextBoxStateWrapper;
local l_GenericTextBox_0 = v8.Components.GenericTextBox;
local v12 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
local v13 = require(l_Modules_0.LuaApp.Themes.Colors);
local l_PasswordBox_0 = v8.Components.PasswordBox;
local v15 = require(l_Modules_0.LuaApp.Components.SystemPrimaryButtonRetheme);
local v16 = require(l_Modules_0.LuaApp.Components.SecondaryButtonRetheme);
local v17 = require(l_Modules_0.LuaApp.Components.Authentication.DisclaimerLinks);
local l_LinkButton_0 = v4.App.Button.LinkButton;
local l_GetFFlagLuaAppEnable10ftPlatformName_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnable10ftPlatformName;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local v23 = game:DefineFastFlag("FixLoginErrorSizing", false);
return function(v24)
    local v25 = l_useStyle_0();
    local v26 = l_useDesignTokens_0();
    local v27 = l_useUiModeInfo_0();
    local l_LoginView_0 = v26.LuaApps.LoginView;
    local l_Color_0 = v25.Theme.TextDefault.Color;
    local l_Transparency_0 = v25.Theme.TextDefault.Transparency;
    local l_Color_1 = v25.Theme.BackgroundUIContrast.Color;
    local l_Transparency_1 = v25.Theme.BackgroundUIContrast.Transparency;
    local l_Color_2 = v25.Theme.UIDefault.Color;
    local v35 = v6({
        logInText = "Authentication.Login.Action.LogInCapitalized", 
        cvaluePlaceholder = not v24.forceLoginByUsername and "Authentication.Login.Label.UsernameEmailPhone" or "Authentication.Login.Label.Username", 
        passwordPlaceholder = "CommonUI.Messages.Label.Password", 
        linkAccountText = {
            "Authentication.Login.Label.LinkAccountWarning"; 
            platform = if not l_GetFFlagLuaAppEnable10ftPlatformName_0() then nil else v7(function(v34)
                return v34.getPlatformAccountName();
            end) or "Console"
        }, 
        forgotText = "Authentication.Login.Action.ForgotPasswordOrUsernameQuestionCapitalized", 
        emailOtpButtonText = "Authentication.Login.Action.LogInEmailOneTimeCode"
    });
    local l_showLinkAccountText_0 = v24.showLinkAccountText;
    local v37 = v24.showDisclaimerLinks or v24.showDisclaimerButtons;
    local v38 = v24.isDualLayout and not v24.showCredentialHeader;
    local v39 = nil;
    local v40 = l_LoginView_0.textboxHeight * 2 + l_LoginView_0.loginContentsPadding;
    if v24.isDualLayout then
        v39 = l_LoginView_0.textboxLabelHeight;
        v40 = if not v38 then ((l_LoginView_0.textboxHeight + v39) * 2 + l_LoginView_0.textboxLabelPadding) + l_LoginView_0.loginContentsPadding else ((l_LoginView_0.textboxHeight + v39) + l_LoginView_0.textboxLabelPadding) * 2 + l_LoginView_0.loginContentsPadding;
    end;
    local v41 = if not v24.isDualLayout then nil else l_LoginView_0.textboxLabelPadding;
    local l_textboxTextSize_0 = l_LoginView_0.textboxTextSize;
    local v43 = nil;
    if (not v24.isDualLayout or not v24.isTenFootUiMode) or not v23 then
        v43 = if v24.disableRegularLogin then nil else v2.createElement(v12, {
            Size = UDim2.new(1, 0, 0, 0), 
            fitAxis = v9.FitAxis.Height, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Text = (v24.localizedError or v24.localizedErrorMessage) or "", 
            Font = v25.Font.Footer.Font, 
            TextSize = if not v24.isDualLayout then v25.Font.BaseSize * v25.Font.Footer.RelativeSize else v26.Global.FontSize_25, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextColor3 = v13.Red, 
            TextWrapped = true, 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, {
            UISizeConstraint = v2.createElement("UISizeConstraint", {
                MinSize = Vector2.new(0, l_LoginView_0.loginContentsPadding)
            })
        });
    else
        local v44 = (v24.localizedError or v24.localizedErrorMessage) or "";
        v43 = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, {
            ErrorText = if v24.disableRegularLogin then nil else v2.createElement(v12, {
                Size = UDim2.new(1, 0, 0, 0), 
                fitAxis = v9.FitAxis.Height, 
                AnchorPoint = Vector2.new(0, 0), 
                Text = v44, 
                Font = v25.Font.Footer.Font, 
                TextSize = if not v24.isDualLayout then v25.Font.BaseSize * v25.Font.Footer.RelativeSize else l_LoginView_0.errorTextSize, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextColor3 = v13.Red, 
                TextWrapped = true, 
                BackgroundTransparency = 1
            }, {
                UISizeConstraint = v2.createElement("UISizeConstraint", {
                    MinSize = Vector2.new(0, l_LoginView_0.loginContentsPadding)
                })
            }), 
            ErrorPadding = if v44 ~= "" then v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, l_LoginView_0.errorTextPadding), 
                PaddingBottom = UDim.new(0, l_LoginView_0.errorTextPadding)
            }) else nil
        });
    end;
    return v2.createElement(v9.FitFrame, {
        Size = UDim2.new(1, -l_LoginView_0.marginY, 0, 0), 
        fitAxis = v9.FitAxis.Height, 
        Position = UDim2.new(0.5, 0, 0, 0), 
        AnchorPoint = Vector2.new(0.5, 0), 
        BackgroundTransparency = 1
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = if not v24.showDisclaimerLinks then nil else Enum.HorizontalAlignment.Center
        }), 
        UISizeConstraint = if v24.isDualLayout then nil else v2.createElement("UISizeConstraint", {
            MinSize = Vector2.new(0, 0), 
            MaxSize = Vector2.new(v24.maxSizeX, math.huge)
        }), 
        UIPadding = if not v24.isDualLayout then nil else v2.createElement("UIPadding", {
            PaddingLeft = nil, 
            PaddingRight = if not v24.isDualLayout then nil else UDim.new(0, l_LoginView_0.credentialPaddingRight)
        }), 
        TextBoxes = if v24.disableRegularLogin then nil else v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v40), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, l_LoginView_0.loginContentsPadding)
            }), 
            CredentialHeader = if not v24.showCredentialHeader then nil else v2.createElement("TextLabel", {
                Text = "<b>" .. v35.cvaluePlaceholder .. "</b>", 
                RichText = true, 
                Font = v25.Font.Body.Font, 
                TextSize = v25.Font.BaseSize * v25.Font.Body.RelativeSize, 
                TextColor3 = v25.Theme.TextEmphasis.Color, 
                TextTransparency = l_Transparency_0, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }), 
            CValue = v2.createElement(l_TextBoxStateWrapper_0, {
                LabelText = if not v38 then nil else v35.cvaluePlaceholder, 
                TextBoxLabelPadding = v41, 
                TextBoxLabelTextSize = if not v38 then nil else v39, 
                ChildClass = l_GenericTextBox_0, 
                Size = UDim2.new(1, 0, 0, l_LoginView_0.textboxHeight), 
                LayoutOrder = 2, 
                ChildProps = {
                    Text = v24.cvalueText, 
                    PlaceholderText = v35.cvaluePlaceholder, 
                    Font = l_AppFonts_0.default:getDefault(), 
                    TextSize = l_textboxTextSize_0, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Color = l_Color_1, 
                    Transparency = l_Transparency_1, 
                    TextColor = l_Color_0, 
                    PlaceholderColor = l_Color_2, 
                    TextTransparency = l_Transparency_0, 
                    PaddingX = l_LoginView_0.textboxPaddingX, 
                    PaddingY = l_LoginView_0.textboxPaddingY, 
                    ClearTextOnFocus = false, 
                    TextBoxRef = v24.cvalueRef, 
                    LayoutOrder = 1, 
                    TextInputType = v24.usernameTextInputType, 
                    ReturnKeyType = Enum.ReturnKeyType.Next, 
                    ManualFocusRelease = true, 
                    onChangeText = v24.onTextBoxesChanged, 
                    onReturnPressedFromOnScreenKeyboard = v24.onReturnPressedFromOnScreenKeyboardWhenFocusedOnCValue, 
                    onFocused = v24.cvalueTextBoxOnFocus, 
                    NextSelectionUp = v24.forgotLinkRef, 
                    NextSelectionDown = v24.passwordRef
                }
            }), 
            PasswordTextBox = v2.createElement(l_TextBoxStateWrapper_0, {
                LabelText = if not v38 then nil else v35.passwordPlaceholder, 
                TextBoxLabelPadding = v41, 
                TextBoxLabelTextSize = if not v38 then nil else v39, 
                ChildClass = l_PasswordBox_0, 
                Size = UDim2.new(1, 0, 0, l_LoginView_0.textboxHeight), 
                LayoutOrder = 3, 
                ChildProps = {
                    Text = v24.passwordText, 
                    PlaceholderText = v35.passwordPlaceholder, 
                    TextSize = l_textboxTextSize_0, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Color = l_Color_1, 
                    Transparency = l_Transparency_1, 
                    TextColor = l_Color_0, 
                    PlaceholderColor = l_Color_2, 
                    TextTransparency = l_Transparency_0, 
                    PaddingX = l_LoginView_0.textboxPaddingX, 
                    PaddingY = l_LoginView_0.textboxPaddingY, 
                    ClearTextOnFocus = false, 
                    ManualFocusRelease = true, 
                    IsKeyboardOverlayUsed = v27.uiMode ~= l_UiMode_0.VR, 
                    ReturnKeyType = Enum.ReturnKeyType.Done, 
                    TextBoxRef = v24.passwordRef, 
                    onChangeText = v24.onTextBoxesChanged, 
                    onReturnPressedFromOnScreenKeyboard = v24.onReturnPressedFromOnScreenKeyboardWhenFocusedOnPassword, 
                    onFocused = v24.passwordTextBoxOnFocus, 
                    onToggleCallback = v24.passwordVisibilityToggleCallback, 
                    NextSelectionUp = v24.cvalueRef, 
                    NextSelectionDown = v24.loginButtonRef
                }
            })
        }), 
        ErrorText = v43, 
        ErrorPadding = if (not v24.isDualLayout or l_showLinkAccountText_0) or v24.disableRegularLogin then nil else v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, l_LoginView_0.linkAccountPadding), 
            LayoutOrder = 10
        }), 
        LoginButton = if v24.disableRegularLogin then nil else v2.createElement(v15, {
            LayoutOrder = 20, 
            Text = v35.logInText, 
            TextSize = l_LoginView_0.loginTextSize, 
            Size = UDim2.new(1, 0, 0, l_LoginView_0.continueButtonHeight), 
            isDisabled = v24.loginButtonDisabled, 
            isLoading = v24.isLoginInProgress, 
            onActivated = v24.onLoginButtonActivated, 
            NextSelectionUp = v24.passwordRef, 
            NextSelectionDown = not not v24.crossDeviceLoginEnabled and v24.crossDeviceButtonRef or v24.forgotLinkRef, 
            [v2.Ref] = v24.loginButtonRef
        }), 
        EmailOtpPadding = v24.emailOtpEnabled and v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, l_LoginView_0.loginContentsPadding), 
            LayoutOrder = 21
        }), 
        EmailOtpButton = v24.emailOtpEnabled and v2.createElement(v16, {
            LayoutOrder = 22, 
            Size = UDim2.new(1, 0, 0, l_LoginView_0.crossdeviceButtonHeight), 
            Text = v35.emailOtpButtonText, 
            onActivated = v24.onEmailOtpActivated, 
            NextSelectionUp = v24.crossDeviceButtonRef, 
            NextSelectionDown = v24.forgotLinkRef
        }), 
        Padding = if not v24.crossDeviceLoginEnabled or v24.disableRegularLogin then nil else v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, l_LoginView_0.loginContentsPadding), 
            LayoutOrder = 30
        }), 
        CrossDeviceLoginButton = v24.crossDeviceLoginEnabled and v2.createElement(v16, {
            Text = v24.quickLoginButtonText, 
            Size = UDim2.new(1, 0, 0, l_LoginView_0.crossdeviceButtonHeight), 
            onActivated = v24.onCrossDeviceLoginActivated, 
            LayoutOrder = 40, 
            NextSelectionUp = v24.loginButtonRef, 
            NextSelectionDown = v24.forgotLinkRef, 
            [v2.Ref] = v24.crossDeviceButtonRef
        }), 
        LinkAccountPadding = if not l_showLinkAccountText_0 then nil else v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, l_LoginView_0.linkAccountPadding), 
            LayoutOrder = 43
        }), 
        LinkAccountLabel = if not l_showLinkAccountText_0 then nil else v2.createElement("TextLabel", {
            Text = v35.linkAccountText, 
            TextSize = v26.Global.FontSize_25, 
            Font = v25.Font.Footer.Font, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextTransparency = v25.Theme.TextMuted.Transparency, 
            TextColor3 = v25.Theme.TextMuted.Color, 
            TextWrapped = true, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            AnchorPoint = Vector2.new(0, 0.5), 
            BackgroundTransparency = 1, 
            LayoutOrder = 45
        }, {
            UISizeConstraint = v2.createElement("UISizeConstraint", {
                MinSize = Vector2.new(0, l_LoginView_0.loginContentsPadding)
            })
        }), 
        Forgot = if not v24.showForgotButton then nil else v2.createElement(l_LinkButton_0, {
            text = v35.forgotText, 
            size = UDim2.new(0, 0, 0, l_LoginView_0.forgotLinkHeight), 
            fontStyle = "CaptionSubHeader", 
            onActivated = v24.onForgetButtonActivated, 
            colorStyleDefault = "TextDefault", 
            colorStyleHover = "TextDefault", 
            layoutOrder = 48
        }), 
        DisclaimerPadding = if not v37 then nil else v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, l_LoginView_0.disclaimerPadding), 
            LayoutOrder = 50
        }), 
        DisclaimerLinks = if not v37 then nil else v2.createElement(v17, {
            isDualLayout = v24.showDisclaimerButtons, 
            LayoutOrder = 60
        })
    });
end;
