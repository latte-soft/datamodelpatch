local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local v6 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v8 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v10 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v11 = require(l_CorePackages_0.UIBlox);
local v12 = require(l_CorePackages_0.Packages.t);
local l_withStyle_0 = v11.Style.withStyle;
local v14 = require(l_Modules_0.LuaApp.withLocalization);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v16 = require(l_Modules_0.LuaApp.Enum.UserGender);
local v17 = require(l_Modules_0.LuaApp.Enum.InputValidity);
local v18 = require(l_Modules_0.LuaApp.Components.FullscreenPageWithSafeArea);
local v19 = require(l_Modules_0.LuaApp.Components.Authentication.BackgroundFill);
local l_ImageSetLabel_0 = v11.Core.ImageSet.ImageSetLabel;
local l_GetImageData_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppAssets).GetImageData;
local l_ImageSetButton_0 = v11.Core.ImageSet.ImageSetButton;
local l_Images_0 = v11.App.ImageSet.Images;
local v24 = require(l_Modules_0.LuaApp.Components.Authentication.AuthBirthdayBar);
local v25 = require(l_Modules_0.LuaApp.Components.Authentication.CollapsingTextInputValidator);
local v26 = require(l_Modules_0.LuaApp.Components.Authentication.SignUpGenderSelector);
local l_Button_0 = v11.App.Button.Button;
local l_ButtonType_0 = v11.App.Button.Enum.ButtonType;
local v29 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v30 = require(l_Modules_0.LuaApp.Models.Authentication.Birthday);
local v31 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local v32 = require(l_Modules_0.LuaApp.Thunks.Authentication.DisplayNameValidator);
local v33 = require(l_Modules_0.Luobu.Thunks.RequestSignUp);
local v34 = require(l_Modules_0.Luobu.Actions.SetSignUpInProgress);
local v35 = require(l_Modules_0.Luobu.Actions.SetSignUpInfo);
local v36 = require(l_Modules_0.LuaApp.Actions.SetBackNavigationDisabled);
local v37 = Vector2.new(540, 1080);
local v38 = UDim2.new(0, 36, 0, 36);
local v39 = l_Images_0["icons/navigation/close"];
local v40 = v3.PureComponent:extend("LuobuSignUpPage");
v40.validateProps = v12.strictInterface({
    formFactor = v12.string, 
    isSignUpInProgress = v12.boolean, 
    prefilledDisplayName = v12.string, 
    voucher = v12.string, 
    authMethod = v12.string, 
    channelId = v12.number, 
    agreedUserAgreements = v12.array(v12.strictInterface({
        id = v12.string, 
        agreementType = v12.string, 
        clientType = v12.string, 
        displayUrl = v12.string, 
        regulationType = v12.string
    })), 
    setSignUpInProgress = v12.callback, 
    resetSignUpInfo = v12.callback, 
    navigateBack = v12.callback, 
    setBackNavigationDisabled = v12.callback, 
    requestSignUp = v12.callback, 
    networking = v12.callback, 
    authEventAnalytics = v12.table, 
    analytics = v12.table, 
    appPolicy = v12.table
});
local function _(v41)
    return ({
        [v16.Unknown] = 1, 
        [v16.Male] = 2, 
        [v16.Female] = 3
    })[v41];
end;
v40.init = function(v43)
    v43.state = {
        birthday = nil, 
        displayName = "", 
        gender = v16.Unknown, 
        onScreenKeyboardHeight = 0, 
        displayNameValid = v17.Unvalidated
    };
    v43.isMounted = false;
    v43.onBirthdaySelected = function(v44)
        v10.assert(v30.is(v44), "CentralOverlayForSignUpBirthdayPicker should pass back a Birthday when closing.");
        v43:setState({
            birthday = v44
        });
    end;
    v43.onDisplayNameTextChanged = function(v45, v46)
        v43:setState({
            displayName = v45, 
            displayNameValid = v46
        });
    end;
    v43.onDisplayNameTextBoxFocused = function()
        v43.props.authEventAnalytics.reportDisplayNameFocus(v29.Context.LuobuSignUpPage);
    end;
    v43.onGenderChanged = function(v47)
        if v43.isMounted then
            v43:setState({
                gender = v47
            });
        end;
    end;
    v43.onSignUpClick = function()
        local l_setSignUpInProgress_0 = v43.props.setSignUpInProgress;
        local l_setBackNavigationDisabled_0 = v43.props.setBackNavigationDisabled;
        l_setSignUpInProgress_0(true);
        l_setBackNavigationDisabled_0(true);
        local l_requestSignUp_0 = v43.props.requestSignUp;
        local l_networking_0 = v43.props.networking;
        local l_analytics_0 = v43.props.analytics;
        local l_appPolicy_0 = v43.props.appPolicy;
        v43.props.authEventAnalytics.reportSignUpButtonClicked(v29.Context.LuobuSignUpPage);
        local v54, _ = l_requestSignUp_0(l_networking_0, l_analytics_0, l_appPolicy_0, v43.props.authMethod, {
            birthday = v43.state.birthday:FormatForEndpoint(), 
            displayName = v43.state.displayName, 
            gender = ({
                [v16.Unknown] = 1, 
                [v16.Male] = 2, 
                [v16.Female] = 3
            })[v43.state.gender], 
            voucher = v43.props.voucher, 
            channelId = v43.props.channelId, 
            agreementIds = v43.props.agreedUserAgreements
        }):await();
        l_setBackNavigationDisabled_0(false);
        if not v54 then
            l_setSignUpInProgress_0(false);
        end;
    end;
end;
v40.didMount = function(v56)
    v56.isMounted = true;
    v56.keyboardVisibleChanged = l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function()
        v56:setState({
            onScreenKeyboardHeight = not not l_UserInputService_0.OnScreenKeyboardVisible and l_UserInputService_0.OnScreenKeyboardSize.Y or 0
        });
    end);
end;
v40.willUnmount = function(v57)
    v57.props.resetSignUpInfo();
    v57.props.setSignUpInProgress(false);
    v57.isMounted = false;
    if v57.keyboardVisibleChanged then
        v57.keyboardVisibleChanged:disconnect();
        v57.keyboardVisibleChanged = nil;
    end;
end;
v40.render = function(v58)
    local v59 = 0;
    local v60 = 0;
    local v61 = v58.props.formFactor == l_FormFactor_0.WIDE;
    local v62 = v58.state.onScreenKeyboardHeight > 0;
    if v61 then
        if not v62 then
            v59 = 48;
            v60 = 24;
        else
            v59 = v58.state.onScreenKeyboardHeight + 10;
        end;
    end;
    local l_isSignUpInProgress_0 = v58.props.isSignUpInProgress;
    local l_birthday_0 = v58.state.birthday;
    local l_gender_0 = v58.state.gender;
    local v66 = (l_birthday_0 and v58.state.displayName) and v58.state.displayNameValid == v17.Valid;
    local v67 = "Authentication.SignUp.Label.ErrorsWithUsername";
    if not l_birthday_0 then
        v67 = "Authentication.SignUp.Response.BirthdayMustBeSetFirst";
    end;
    local l_prefilledDisplayName_0 = v58.props.prefilledDisplayName;
    return l_withStyle_0(function(v69)
        return v14({
            signUpText = "Authentication.SignUp.Label.SignUp"
        })(function(v70)
            return v3.createElement(v18, {
                BackgroundTransparency = 1, 
                includeStatusBar = true, 
                renderFullscreenBackground = function()
                    return v3.createElement("Frame", {
                        Size = UDim2.new(1, 0, 1, 0), 
                        BackgroundTransparency = not v61 and 0 or 1, 
                        BackgroundColor3 = v69.Theme.BackgroundUIDefault.Color
                    }, {
                        Background = v61 and v3.createElement(v19, {
                            Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/GridBackground.jpg"
                        }), 
                        Mask = v61 and v3.createElement("ImageLabel", {
                            ZIndex = 2, 
                            Size = UDim2.new(1, 0, 1, 0), 
                            BackgroundColor3 = Color3.new(0, 0, 0), 
                            BackgroundTransparency = 0.5
                        })
                    });
                end
            }, {
                UserInputSink = l_isSignUpInProgress_0 and v3.createElement("ImageButton", {
                    ZIndex = 2, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    Image = ""
                }), 
                Container = v3.createElement(l_ImageSetLabel_0, {
                    Size = UDim2.new(1, 0, 1, -v59), 
                    Position = UDim2.new(0.5, 0, 0, v60), 
                    AnchorPoint = Vector2.new(0.5, 0), 
                    BackgroundTransparency = 1, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = Rect.new(9, 9, 9, 9), 
                    Image = l_GetImageData_0("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill", 
                    ImageColor3 = v69.Theme.BackgroundUIDefault.Color, 
                    ClipsDescendants = true
                }, {
                    SizeConstraint = v3.createElement("UISizeConstraint", {
                        MaxSize = v37
                    }), 
                    HeaderFrame = v3.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, 48), 
                        Position = UDim2.new(0.5, 0, 0, 0), 
                        AnchorPoint = Vector2.new(0.5, 0), 
                        BackgroundTransparency = 1
                    }, {
                        BackButton = v3.createElement(l_ImageSetButton_0, {
                            Size = v38, 
                            AutoButtonColor = false, 
                            BorderSizePixel = 0, 
                            BackgroundTransparency = 1, 
                            Position = UDim2.new(0, 12, 0.5, 0), 
                            AnchorPoint = Vector2.new(0, 0.5), 
                            ScaleType = Enum.ScaleType.Fit, 
                            Image = v39, 
                            ImageColor3 = v69.Theme.UIEmphasis.Color, 
                            ImageTransparency = v69.Theme.BackgroundUIDefault.Transparency, 
                            [v3.Event.Activated] = v58.props.navigateBack
                        }), 
                        Title = v70.signUpText and v3.createElement("TextLabel", {
                            Position = UDim2.new(0, 0, 0.5, 0), 
                            Size = UDim2.new(1, 0, 0, 0), 
                            AnchorPoint = Vector2.new(0, 0.5), 
                            BackgroundTransparency = 1, 
                            Text = v70.signUpText or "", 
                            TextWrapped = true, 
                            Font = v69.Font.CaptionHeader.Font, 
                            TextSize = v69.Font.BaseSize * v69.Font.Header1.RelativeSize, 
                            TextColor3 = v69.Theme.TextEmphasis.Color, 
                            TextTransparency = v69.Theme.TextEmphasis.Transparency, 
                            TextXAlignment = Enum.TextXAlignment.Center
                        })
                    }), 
                    Divider = v3.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, 1), 
                        Position = UDim2.new(0.5, 0, 0, 48), 
                        AnchorPoint = Vector2.new(0.5, 0), 
                        BackgroundTransparency = 0, 
                        BackgroundColor3 = v69.Theme.UIEmphasis.Color
                    }), 
                    ContentFrame = v3.createElement("Frame", {
                        Size = UDim2.new(1, 0, 1, -49), 
                        Position = UDim2.new(0.5, 0, 0, 49), 
                        AnchorPoint = Vector2.new(0.5, 0), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        AutomaticSize = Enum.AutomaticSize.XY
                    }, {
                        ContentPadding = v3.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0, 24), 
                            PaddingRight = UDim.new(0, 24), 
                            PaddingTop = UDim.new(0, not v61 and 48 or 25)
                        }), 
                        ListLayout = v3.createElement("UIListLayout", {
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                            Padding = UDim.new(0, 5)
                        }), 
                        BirthdayBar = v3.createElement(v24, {
                            layoutOrder = 1, 
                            onBirthdaySelected = v58.onBirthdaySelected, 
                            autoFocusOnMount = false
                        }), 
                        DisplayNameValidator = v3.createElement(v25, {
                            layoutOrder = 2, 
                            titleTextKey = "Authentication.Login.Label.Username", 
                            summaryErrorTextKey = v67, 
                            prerequisiteMet = not not l_birthday_0 or false, 
                            onInputTextChanged = v58.onDisplaynameTextChanged, 
                            onInputTextValidated = v58.onDisplayNameTextChanged, 
                            validator = v32, 
                            validatorAdditionalProps = {
                                birthday = not not l_birthday_0 and l_birthday_0:FormatForEndpoint() or ""
                            }, 
                            returnKeyType = Enum.ReturnKeyType.Next, 
                            prefilledText = l_prefilledDisplayName_0
                        }), 
                        GenderSelector = v3.createElement(v26, {
                            layoutOrder = 3, 
                            gender = l_gender_0, 
                            onGenderChanged = v58.onGenderChanged
                        }), 
                        Spacing = v3.createElement("Frame", {
                            LayoutOrder = 4, 
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(1, 0, 0, 38)
                        }), 
                        SignUpButton = v3.createElement(l_Button_0, {
                            buttonType = l_ButtonType_0.PrimaryContextual, 
                            layoutOrder = 5, 
                            size = UDim2.new(1, 0, 0, 36), 
                            text = v70.signUpText, 
                            isDisabled = not v66, 
                            isLoading = l_isSignUpInProgress_0, 
                            onActivated = v58.onSignUpClick
                        })
                    })
                })
            });
        end);
    end);
end;
return (l_RoactAppPolicy_0.connect(function(v71, _)
    return {
        appPolicy = v71
    };
end)((l_RoactServices_0.connect({
    networking = v8, 
    authEventAnalytics = v5, 
    analytics = v6
})((v4.connect(function(v73, _)
    return {
        formFactor = v73.FormFactor, 
        isSignUpInProgress = v73.Luobu.SignUp.signUpInProgress, 
        prefilledDisplayName = v73.Luobu.SignUp.prefilledDisplayName, 
        voucher = v73.Luobu.SignUp.signUpVoucher, 
        authMethod = v73.Luobu.SignUp.authMethod, 
        channelId = v73.Luobu.SignUp.channelId, 
        agreedUserAgreements = v73.Luobu.SignUp.agreedUserAgreements
    };
end, function(v75)
    return {
        setSignUpInProgress = function(v76)
            return v75(v34(v76));
        end, 
        resetSignUpInfo = function()
            return v75(v35("", "", "", ""));
        end, 
        navigateBack = function()
            return v75(v31());
        end, 
        setBackNavigationDisabled = function(v77)
            return v75(v36(v77));
        end, 
        requestSignUp = function(v78, v79, v80, v81, v82)
            return v75(v33(v78, v79, v80, v81, v82));
        end
    };
end)(v40))))));
