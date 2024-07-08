local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local v6 = require(l_CorePackages_0.UIBlox);
local l_useStyle_0 = v6.Core.Style.useStyle;
local l_Images_0 = v6.App.ImageSet.Images;
local l_ImageSetButton_0 = v6.Core.ImageSet.ImageSetButton;
local l_Button_0 = v6.App.Button.Button;
local l_ButtonType_0 = v6.App.Button.Enum.ButtonType;
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local l_GetImageData_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppAssets).GetImageData;
local v14 = require(l_Modules_0.LuaApp.FitChildren);
local v15 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
local v16 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local v19 = require(l_CorePackages_0.Workspace.Packages.AuthCommon);
local v20 = require(l_Modules_0.LuaApp.Enum.UsernameValidationContext);
local _ = require(l_Modules_0.LuaApp.Components.Authentication.Enum.InputValidity);
local v22 = require(l_Modules_0.LuaApp.Components.Authentication.AuthBirthdayBar);
local v23 = require(l_Modules_0.LuaApp.Components.Authentication.GenderDropdownSelector);
local v24 = require(l_Modules_0.LuaApp.Components.Authentication.BirthdateDropdownSelector);
local v25 = require(l_Modules_0.LuaApp.Components.Authentication.CollapsingTextInputValidator);
local v26 = require(l_Modules_0.LuaApp.Components.Authentication.SuggestionsFrame);
local v27 = require(l_Modules_0.LuaApp.Thunks.Authentication.UsernameSuggestor);
local v28 = require(l_Modules_0.LuaApp.Components.Authentication.SignUpGenderSelector);
local v29 = require(l_Modules_0.LuaApp.Components.Authentication.TitleAndParagraph);
local v30 = require(l_Modules_0.LuaApp.Components.Authentication.DisclaimerLinks);
local v31 = require(l_Modules_0.LuaApp.Components.Authentication.ContactInfoField);
local l_PasswordBox_0 = v19.Components.PasswordBox;
local l_TextBoxStateWrapper_0 = v19.Components.TextBoxStateWrapper;
local v34 = require(l_Modules_0.LuaApp.Components.Authentication.BackgroundFill);
local v35 = require(l_Modules_0.LuaApp.Components.FullscreenPageWithSafeArea);
local v36 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local v37 = require(l_Modules_0.LuaApp.Util.DateHelper);
local l_GetFFlagEnableTextFieldContentType_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableTextFieldContentType;
local v39 = require(l_Modules_0.LuaApp.Flags.GetFFlagRefactorAuthPageForTenFoot);
local v40 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppEnable10ftSignUpView);
local v41 = require(l_Modules_0.LuaApp.Flags.GetFIntLuaLoginGenderSelector);
local v42 = UDim2.new(0, 36, 0, 36);
local v43 = Vector2.new(540, 1080);
local v44 = Vector2.new(850, 1080);
game:DefineFastFlag("EnableSignupPlaceholderText", false);
return function(v45)
    local v46 = l_useStyle_0();
    local v47 = l_useUiModeInfo_0();
    local v48;
    if v39() then
        v48 = true;
        if not (v47.uiMode ~= l_UiMode_0.TenFoot) then
            goto label0;
        end;
    end;
    v48 = v47.uiMode == l_UiMode_0.VR;
    ::label0::;
    local v49 = v40() or v47.uiMode == l_UiMode_0.VR;
    local v50 = if not v49 then nil else l_useDesignTokens_0();
    local v51 = if not not v49 and v50 then v50.LuaApps.SignUpView else nil;
    local v53 = v36(function(v52)
        return v52.getPlatformAccountName();
    end);
    local v54 = v16({
        signUpText = "Authentication.SignUp.Label.SignUp", 
        retypePasswordLabelText = "Authentication.SignUp.Description.ConfirmPassword", 
        usernamePlaceholder = "Authentication.SignUp.Message.Username.NoRealNameUse", 
        passwordPlaceholder = "Authentication.SignUp.Label.PasswordPlaceholder", 
        unknownError = "Feature.Reauthentication.Message.Error.Default"
    });
    local v56 = l_useSelector_0(function(v55)
        return v55.FormFactor;
    end) == l_FormFactor_0.WIDE;
    local v57, v58 = v2.useState(false);
    local v59 = v2.useCallback(function()
        v58(true);
    end);
    local v60 = v2.useCallback(function()
        v58(false);
    end);
    local v61 = v2.useCallback(function()
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = not v56 and 0 or 1, 
            BackgroundColor3 = v46.Theme.BackgroundUIDefault.Color
        }, {
            Background = v56 and v2.createElement(v34, {
                Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/GridBackground.jpg"
            }), 
            Mask = v56 and v2.createElement("ImageLabel", {
                ZIndex = 2, 
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundColor3 = Color3.new(0, 0, 0), 
                BackgroundTransparency = 0.5
            })
        });
    end, {
        v56, 
        v46
    });
    local v62 = v45.useUsernameSuggestions();
    local l_birthday_0 = v45.birthday;
    local l_EnableSignupPlaceholderText_0 = game:GetFastFlag("EnableSignupPlaceholderText");
    local v65 = 0;
    local v66 = 0;
    local v67 = v45.onScreenKeyboardHeight > 0;
    local v68 = v45.useVerifiedSignup();
    local v69 = v45.useRetypePassword();
    local v70 = v45.getHidePassword();
    local v71 = (not not v56 and v68) and 12 or 0;
    local v72 = true;
    local v73 = true;
    local v74 = not v45.validUsernameEntered();
    local v75 = "Authentication.SignUp.Label.ErrorsWithUsername";
    local v76 = "Authentication.SignUp.Label.ErrorsWithPassword";
    if l_birthday_0 then
        if v74 then
            v76 = "Authentication.SignUp.Response.UsernameMustBeSetFirst";
            v73 = false;
        end;
    else
        v75 = "Authentication.SignUp.Response.BirthdayMustBeSetFirst";
        v76 = v75;
        v74 = true;
        v72 = false;
    end;
    if v56 then
        if not v67 then
            v65 = 48;
            v66 = 24;
        else
            v65 = v45.onScreenKeyboardHeight + 10;
        end;
    end;
    local v77 = not not l_birthday_0 or false;
    local v78 = not not l_GetFFlagEnableTextFieldContentType_0() and Enum.TextInputType.Username or Enum.TextInputType.NoSuggestions;
    local v79 = 36;
    local v80 = v46.Font.BaseSize * v46.Font.Header1.RelativeSize;
    local v81 = v46.Font.BaseSize * v46.Font.CaptionBody.RelativeSize;
    local v82 = 5;
    local v83 = 1;
    local v84 = nil;
    local v85 = {
        "Authentication.SignUp.Description.VerificationPage"
    };
    local v86 = {
        {}
    };
    if not (not v48 or not v53) then
        v85 = {
            "Authentication.SignUp.Description.VerificationLinkingText"
        };
        v86 = {
            {
                platform = v53
            }
        };
    end;
    if not (not v49 or not v51) then
        v66 = v51.marginTop;
        v81 = v51.textCaptionHeaderSize;
        v80 = v51.textHeaderSize;
        v79 = v51.buttonHeight;
        v82 = v51.contentPadding;
        v83 = v51.headerPadding;
        v84 = {
            Size = UDim2.fromScale(1, 1), 
            TextSize = v51.buttonTextSize
        };
    end;
    local l_createElement_0 = v2.createElement;
    local l_v35_0 = v35;
    local v89 = {
        BackgroundTransparency = 1, 
        includeStatusBar = true, 
        renderFullscreenBackground = if not v48 then v61 else nil
    };
    local v90 = {
        UserInputSink = v45.isSignUpInProgress and v2.createElement("ImageButton", {
            ZIndex = 2, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            Image = ""
        })
    };
    local l_createElement_1 = v2.createElement;
    local l_l_ImageSetLabel_0_0 = l_ImageSetLabel_0;
    local v93 = {
        Size = UDim2.new(1, 0, 1, -v65), 
        Position = UDim2.new(0.5, 0, 0, v66), 
        AnchorPoint = Vector2.new(0.5, 0), 
        BackgroundTransparency = 1, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(9, 9, 9, 9), 
        Image = l_GetImageData_0("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill", 
        ImageColor3 = v46.Theme.BackgroundUIDefault.Color, 
        ImageTransparency = not v48 and 0 or 1, 
        ClipsDescendants = true
    };
    local v94 = {
        ContainerListLayout = if not v49 then nil else v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Padding = UDim.new(0, v83)
        }), 
        SizeConstraint = v2.createElement("UISizeConstraint", {
            MaxSize = if not v48 then v43 else v44
        }), 
        HeaderFrame = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 48), 
            Position = UDim2.new(0.5, 0, 0, 0), 
            AnchorPoint = Vector2.new(0.5, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            AutomaticSize = if not v49 then nil else Enum.AutomaticSize.Y
        }, {
            BackButton = if v47.uiMode ~= l_UiMode_0.VR and v49 then nil else v2.createElement(l_ImageSetButton_0, {
                Size = v42, 
                AutoButtonColor = false, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                Position = UDim2.new(0, 12, 0.5, 0), 
                AnchorPoint = Vector2.new(0, 0.5), 
                ScaleType = Enum.ScaleType.Fit, 
                Image = l_Images_0["icons/navigation/close"], 
                ImageColor3 = v46.Theme.UIEmphasis.Color, 
                ImageTransparency = 0, 
                [v2.Event.Activated] = v45.navigateBack
            }), 
            Title = v54.signUpText and v2.createElement(v15, {
                Position = UDim2.new(0, 0, 0.5, 0), 
                Size = UDim2.new(1, 0, 0, 0), 
                AnchorPoint = Vector2.new(0, 0.5), 
                fitAxis = v14.FitAxis.Height, 
                BackgroundTransparency = 1, 
                Text = v54.signUpText or "", 
                TextWrapped = true, 
                Font = v46.Font.CaptionHeader.Font, 
                TextSize = v80, 
                TextColor3 = v46.Theme.TextEmphasis.Color, 
                TextTransparency = v46.Theme.TextEmphasis.Transparency, 
                TextXAlignment = Enum.TextXAlignment.Center
            })
        }), 
        Divider = if v49 then nil else v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 1), 
            Position = UDim2.new(0.5, 0, 0, 48), 
            AnchorPoint = Vector2.new(0.5, 0), 
            BackgroundTransparency = 0, 
            BackgroundColor3 = v46.Theme.UIEmphasis.Color, 
            LayoutOrder = 2
        })
    };
    local l_createElement_2 = v2.createElement;
    local l_FitScrollingFrame_0 = v14.FitScrollingFrame;
    local v98 = {
        Selectable = if not v48 then nil else false, 
        Size = UDim2.new(1, 0, 1, -(49 + v71)), 
        Position = UDim2.new(0.5, 0, 0, 49), 
        AnchorPoint = Vector2.new(0.5, 0), 
        fitFields = {
            CanvasSize = v14.FitAxis.Height
        }, 
        ScrollBarThickness = 0, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ScrollingEnabled = not (v45.isUsernameAnimating or v45.isPasswordAnimating), 
        CanvasPosition = v45.scrollCanvasTargetPositionY:map(function(v97)
            return v45.getScrollingFrameCanvasPosition(v97);
        end), 
        ref = v45.signUpContentFrameRef, 
        LayoutOrder = 3, 
        [v2.Change.CanvasSize] = v45.onSignUpContentFrameCanvasSizeChange
    };
    local v99 = {
        ContentPadding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 24), 
            PaddingRight = UDim.new(0, 24), 
            PaddingTop = UDim.new(0, not v56 and 48 or 25)
        }), 
        ListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, v82)
        }), 
        BirthdayBar = if not v48 then v2.createElement(v22, {
            layoutOrder = 1, 
            onBirthdaySelected = v45.onBirthdaySelected, 
            onBirthdayFocused = v45.onBirthdayFocused, 
            autoFocusOnMount = v68
        }) else nil, 
        BirthdayGenderPicker = if not v48 then nil else v2.createElement("Frame", {
            LayoutOrder = 1, 
            Size = UDim2.new(1, 0, 0, 140), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ZIndex = 2
        }, {
            BirthdayPicker = v2.createElement(v24, {
                onBirthdaySelected = v45.onBirthdaySelected, 
                alignment = Enum.HorizontalAlignment.Left, 
                layoutOrder = 1
            }), 
            GenderSelector = v2.createElement(v23, {
                onGenderChanged = v45.onGenderChanged, 
                alignment = Enum.HorizontalAlignment.Right, 
                layoutOrder = 2
            })
        }), 
        ContactInfoField = v68 and v2.createElement(v31, {
            layoutOrder = 2, 
            Under13 = l_birthday_0 and v37:isRecentOrFutureDate(l_birthday_0.Month, l_birthday_0.Day, l_birthday_0.Year + 13), 
            SetContactMethod = v45.SetContactMethod, 
            SetPhoneNumber = v45.SetPhoneNumber, 
            SetEmail = v45.SetEmail, 
            contactMethod = v45.contactMethod, 
            phoneCountryCodeSelectorCallback = v45.phoneCountryCodeSelectorCallback
        }), 
        BackgroundPanel = v68 and v2.createElement("Frame", {
            Size = UDim2.new(0, 0, 0, 6), 
            LayoutOrder = 3, 
            BackgroundTransparency = 1
        }, {
            LightPanel = v2.createElement("Frame", {
                BorderSizePixel = 0, 
                Size = UDim2.new(0, 100000, 0, 100000), 
                Position = UDim2.new(0, 0, 1, 0), 
                BackgroundColor3 = v46.Theme.UIDefault.Color, 
                AnchorPoint = Vector2.new(0.5, 0)
            })
        }), 
        UsernameValidator = v2.createElement(v25, {
            layoutOrder = 4, 
            titleTextKey = "Authentication.Login.Label.Username", 
            summaryErrorTextKey = v75, 
            prerequisiteMet = v77, 
            textInputType = v78, 
            onInputTextChanged = v45.onUsernameTextChanged, 
            onInputTextValidated = not not v62 and v45.onUsernameTextValidated or v45.onUsernameTextChanged, 
            validator = v45.UsernameValidator, 
            placeholderText = not not l_EnableSignupPlaceholderText_0 and v54.usernamePlaceholder or nil, 
            validatorAdditionalProps = {
                birthday = not not l_birthday_0 and l_birthday_0:FormatForEndpoint() or "", 
                context = v20.Signup
            }, 
            textBoxFocusedCallback = v45.onUsernameTextBoxFocused, 
            textBoxFocusLostCallback = v45.onTextBoxFocusLost, 
            focusedTextBoxPositionChangedCallback = v45.onFocusedTextBoxPositionChanged, 
            returnKeyType = Enum.ReturnKeyType.Next, 
            onReturnPressedFromOnScreenKeyboard = v45.onUsernameTextChangeCompletedFromKeyboard, 
            onAnimationStateChangeCallback = v45.onAnimationStateChangeCallback, 
            textBoxRef = v45.usernameTextFieldRef, 
            pillClicked = v57, 
            updatePillClicked = v59, 
            resetPillClicked = v60, 
            issueCondition = v45.issueCondition, 
            updateIssueCondition = v45.updateIssueCondition, 
            loadingSuggestions = v45.loadingSuggestions, 
            tokens = v51, 
            showDetailedError = v72
        }), 
        SuggestionsFrame = v62 and v2.createElement(v26, {
            layoutOrder = 4, 
            textBoxRef = v45.usernameTextFieldRef, 
            usernameValid = v45.usernameValid, 
            birthday = not not l_birthday_0 and l_birthday_0:FormatForEndpoint() or "", 
            suggest = v27, 
            context = v20.Signup, 
            pillClicked = v57, 
            updatePillClicked = v59, 
            resetPillClicked = v60, 
            issueCondition = v45.issueCondition, 
            usernameSuggestionClicked = v45.usernameSuggestionClicked, 
            usernameSuggestionsShown = v45.usernameSuggestionsShown, 
            shouldSuggest = v45.shouldSuggest, 
            updateSuggestionControlState = v45.updateSuggestionControlState, 
            useRefreshButton = v45.useRefreshButton, 
            logRefreshButtonClicked = v45.logRefreshButtonClicked, 
            loadSuggestions = v45.loadSuggestions, 
            finishSuggestions = v45.finishSuggestions, 
            loadingSuggestions = v45.loadingSuggestions
        }), 
        PasswordValidator = v2.createElement(v25, {
            disabled = v45.birthdayFocused, 
            layoutOrder = 5, 
            titleTextKey = "CommonUI.Messages.Label.Password", 
            summaryErrorTextKey = v76, 
            prerequisiteMet = not v74, 
            textInputType = Enum.TextInputType.Password, 
            onInputTextChanged = v45.onPasswordTextChanged, 
            onInputTextValidated = v45.onPasswordTextChanged, 
            validator = v45.PasswordValidator, 
            placeholderText = not not l_EnableSignupPlaceholderText_0 and v54.passwordPlaceholder or nil, 
            validatorAdditionalProps = {
                username = v45.username
            }, 
            returnKeyType = Enum.ReturnKeyType.Next, 
            textBoxFocusedCallback = v45.onPasswordTextBoxFocused, 
            textBoxFocusLostCallback = v45.onTextBoxFocusLost, 
            focusedTextBoxPositionChangedCallback = v45.onFocusedTextBoxPositionChanged, 
            onReturnPressedFromOnScreenKeyboard = v45.onPasswordTextChangeCompletedFromKeyboard, 
            onAnimationStateChangeCallback = v45.onAnimationStateChangeCallback, 
            textBoxRef = v45.passwordTextFieldRef, 
            centralOverlayBlocksInput = v68, 
            captureFocusOnTapStart = not v45.isCountryCodeSearchVisible, 
            frameRef = v69 and v45.passwordFrameRef, 
            hidePassword = if v69 then v70 else nil, 
            onToggleCallback = v69 and v45.passwordVisibilityToggleCallback, 
            tokens = v51, 
            showDetailedError = v73, 
            IsKeyboardOverlayUsed = not (v47.uiMode == l_UiMode_0.VR)
        }), 
        RetypePassword = v69 and v2.createElement(l_TextBoxStateWrapper_0, {
            ChildClass = l_PasswordBox_0, 
            Size = UDim2.new(1, 0, 0, 36), 
            LayoutOrder = 6, 
            LabelText = v54.retypePasswordLabelText, 
            ErrorText = v45.isRetypePasswordInErrorState and v45.retypePasswordErrorText, 
            ErrorState = v45.isRetypePasswordInErrorState, 
            TextBoxLabelPadding = 5, 
            InnerSidePadding = 12, 
            onPositionChangedCallback = v45.onRetypePasswordFocusedTextBoxPositionChanged, 
            ChildProps = {
                Text = "", 
                TextSize = v46.Font.BaseSize * v46.Font.Body.RelativeSize, 
                TextColor = v46.Theme.TextDefault.Color, 
                IsKeyboardOverlayUsed = not (v47.uiMode == l_UiMode_0.VR), 
                onChangeText = v45.onRetypePasswordTextChanged, 
                onFocused = v45.onRetypePasswordTextBoxFocused, 
                onFocusLost = v45.onRetypePasswordTextBoxFocusLost, 
                CaptureFocusOnTapStart = true, 
                Color = v46.Theme.BackgroundUIContrast.Color, 
                Transparency = v46.Theme.BackgroundUIContrast.Transparency, 
                TextBoxRef = v45.retypePasswordTextFieldRef, 
                onReturnPressedFromOnScreenKeyboard = v45.onRetypePasswordTextChangeCompletedFromKeyboard, 
                hidePassword = v70, 
                onToggleCallback = v45.retypePasswordVisibilityToggleCallback, 
                Disabled = v45.birthdayFocused
            }
        })
    };
    local v100;
    if not v48 then
        v100 = false;
        if v41() ~= 2 then
            v100 = v2.createElement(v28, {
                layoutOrder = 7, 
                onGenderChanged = v45.onGenderChanged
            });
        end;
    else
        v100 = nil;
    end;
    v99.GenderSelector = v100;
    v99.Spacing = if v48 then nil else v2.createElement("Frame", {
        LayoutOrder = 8, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 38)
    });
    v99.ErrorLabel = if not v45.signUpError then nil else v2.createElement(v15, {
        LayoutOrder = 9, 
        Size = UDim2.new(1, 0, 0, 0), 
        fitAxis = v14.FitAxis.Height, 
        BackgroundTransparency = 1, 
        Text = v54.unknownError, 
        TextWrapped = true, 
        Font = v46.Font.CaptionBody.Font, 
        TextSize = v81, 
        TextColor3 = v46.Theme.Alert.Color, 
        TextTransparency = v46.Theme.TextDefault.Transparency, 
        TextXAlignment = Enum.TextXAlignment.Left
    });
    v99.SignUpPageButton = v2.createElement(l_Button_0, {
        buttonType = l_ButtonType_0.PrimaryContextual, 
        layoutOrder = 10, 
        size = UDim2.new(1, 0, 0, v79), 
        text = v54.signUpText, 
        isDisabled = not v45.isSignUpButtonEnabled, 
        isLoading = v45.isSignUpInProgress, 
        onActivated = v45.onSignUpClick, 
        buttonTextOverride = v84
    });
    v99.DisclaimerText = v2.createElement(v29, {
        layoutOrder = 11, 
        textXAlignment = Enum.TextXAlignment.Center, 
        paragraphTextKeys = v85, 
        paragraphTextArgs = v86
    });
    v99.DisclaimerLinks = v2.createElement(v30, {
        isDualLayout = v49, 
        fillDirection = Enum.FillDirection.Horizontal, 
        LayoutOrder = 12
    });
    v99.ScrollPadding = v67 and v2.createElement("Frame", {
        LayoutOrder = 13, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, v45.onScreenKeyboardHeight * 2)
    });
    v94.SignUpContentFrame = l_createElement_2(l_FitScrollingFrame_0, v98, v99);
    v94.Footer = (v68 and v56) and v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 12), 
        Position = UDim2.new(0, 0, 1, -12), 
        BackgroundTransparency = 1, 
        ClipsDescendants = true
    }, {
        Rounding = v2.createElement(l_ImageSetLabel_0, {
            Size = UDim2.new(1, 0, 2, 0), 
            Position = UDim2.new(0, 0, -1, 0), 
            BackgroundTransparency = 1, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(9, 9, 9, 9), 
            Image = l_GetImageData_0("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill", 
            ImageColor3 = v46.Theme.UIDefault.Color
        })
    });
    v90.Container = l_createElement_1(l_l_ImageSetLabel_0_0, v93, v94);
    return l_createElement_0(l_v35_0, v89, v90);
end;
