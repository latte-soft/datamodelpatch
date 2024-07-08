local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local l_Common_0 = l_Modules_0.Common;
local v5 = require(l_Common_0.Roact);
local v6 = require(l_Common_0.RoactRodux);
local v7 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v10 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v11 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local _ = require(l_Modules_0.LuaApp.AppPage);
local v13 = require(l_Modules_0.LuaApp.Components.AdjacentTextAndLink);
local v14 = require(l_Modules_0.LuaApp.Components.Authentication.FloodcheckTextAndLink);
local _ = require(l_Modules_0.LuaApp.Components.Authentication.CodeBoxes);
local v16 = require(l_Modules_0.LuaApp.Components.Authentication.CodeBox);
local v17 = require(l_Modules_0.LuaApp.Components.SystemPrimaryButtonRetheme);
local v18 = require(l_Modules_0.LuaApp.Actions.SetBackNavigationDisabled);
local v19 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local _ = require(l_Modules_0.LuaApp.Enum.LaunchContext);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local _ = require(l_Modules_0.LuaApp.Enum.TransitionAnimation);
local v23 = require(l_Modules_0.LuaApp.FitChildren);
local v24 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v24.Style.withStyle;
local v26 = require(l_Modules_0.LuaApp.withLocalization);
local _ = require(l_Modules_0.LuaApp.Analytics.Events.reportEphemeralCounter);
local _ = require(l_Modules_0.LuaApp.Analytics.Events.AppLoginCounterNames);
local l_LinkButton_0 = v24.App.Button.LinkButton;
local _ = require(l_Modules_0.LuaApp.Enum.Alignment);
local v31 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v32 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v33 = require(l_Modules_0.LuaApp.Thunks.Authentication.GetVerifiedSignupChallenge);
local v34 = require(l_Modules_0.LuaApp.Thunks.Authentication.VerifyPhoneNumberCode);
local v35 = v5.PureComponent:extend("VerifyPhoneNumber");
local v36 = require(l_Modules_0.LuaApp.Components.OnScreenKeyboardWindow);
local v37 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v38 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v39 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local l_Images_0 = v24.App.ImageSet.Images;
local l_ImageSetButton_0 = v24.Core.ImageSet.ImageSetButton;
local v42 = UDim2.new(0, 36, 0, 36);
local v43 = l_Images_0["icons/navigation/close"];
v35.defaultProps = {
    phoneNumber = ""
};
v35.init = function(v44)
    v44:setState({
        errorText = "", 
        hasMadeTooManyResendCodeAttempts = false, 
        codeBoxesValue = "", 
        isContinuingInProgress = false, 
        challenge = v44.props.challenge
    });
    v44.updateIsContinuingInProgress = function(v45)
        spawn(function()
            local l_isContinuingInProgress_0 = v44.state.isContinuingInProgress;
            if v44.isMounted and l_isContinuingInProgress_0 ~= v45 then
                v44:setState({
                    isContinuingInProgress = v45
                });
            end;
        end);
    end;
    v44.onResendButtonActivated = function()
        if not v44.state.isContinuingInProgress then
            v33(v44.props.networking, v44.props.deliveryTarget):andThen(function(v47)
                v44:setState({
                    challenge = v47.challenge
                });
            end, function(v48)
                if v48 == "Authentication.TwoStepVerification.Response.TooManyAttempts" then
                    v44.props.showTooManyAttemptsErrorToast(v48);
                    v44:setState({
                        hasMadeTooManyResendCodeAttempts = true
                    });
                    return ;
                else
                    v44.props.showErrorToast();
                    return ;
                end;
            end);
            v44.props.authAnalytics.reportInteractWithAction(v31.Context.PhoneVerification, v31.Field.ResendCode, v31.ActionType.Click, "", "");
            return ;
        else
            return ;
        end;
    end;
    v44.handlePhoneNumberVerificationSequence = function(v49)
        local l_networking_0 = v44.props.networking;
        local _ = v44.props.analytics;
        local _ = v44.props.appPolicy;
        local l_verifyCode_0 = v44.props.verifyCode;
        local l_setBackNavigationDisabled_0 = v44.props.setBackNavigationDisabled;
        local l_l_UserInputService_0_FocusedTextBox_0 = l_UserInputService_0:GetFocusedTextBox();
        if l_l_UserInputService_0_FocusedTextBox_0 ~= nil then
            l_l_UserInputService_0_FocusedTextBox_0:ReleaseFocus();
        end;
        l_setBackNavigationDisabled_0(true);
        l_verifyCode_0(l_networking_0, v49, v44.state.challenge):andThen(function(v56)
            l_setBackNavigationDisabled_0(false);
            v44.props.verifyPhoneNumberCallback(v56.voucher);
            v44.props.closeAlert();
        end, function(v57)
            l_setBackNavigationDisabled_0(false);
            if v44.isMounted then
                v44:setState({
                    errorText = v57, 
                    codeBoxesValue = ""
                });
            end;
            if v57 == "Authentication.TwoStepVerification.Label.InvalidCode" then
                v44.props.authAnalytics.reportInteractWithAction(v31.Context.PhoneVerification, v31.Field.InvalidCode, v31.ActionType.Shown, "", "");
            end;
            v44.updateIsContinuingInProgress(false);
        end);
    end;
    v44.onContinueButtonActivated = function()
        if #v44.state.codeBoxesValue < 6 then
            return ;
        elseif not v44.state.isContinuingInProgress then
            v44.updateIsContinuingInProgress(true);
            v44.handlePhoneNumberVerificationSequence(v44.state.codeBoxesValue);
            v44.props.authAnalytics.reportButtonClicked(v31.Context.PhoneVerification, v31.Button.Continue);
            return ;
        else
            return ;
        end;
    end;
    v44.onUseEmailClicked = function()
        v44.props.closeAlert();
        v44.props.useEmailOptionClickedCallback();
        v44.props.authAnalytics.reportInteractWithAction(v31.Context.PhoneVerification, v31.Field.UseEmail, v31.ActionType.Click, "", "");
    end;
    v44.onFocusLost = function(_, v59, v60)
        if v59 or v60 and v60.KeyCode == Enum.KeyCode.Return then
            v44.onContinueButtonActivated();
        end;
    end;
    v44.onValueChanged = function(v61)
        if v44.state.codeBoxesValue ~= v61 and v44.isMounted then
            v44:setState({
                codeBoxesValue = v61, 
                errorText = ""
            });
            return ;
        else
            return ;
        end;
    end;
    v44.invisibleTextBoxDidGainFocus = false;
    v44.onInvisibleTextBoxFocused = function(v62)
        if v44.state.isContinuingInProgress then
            v62:ReleaseFocus();
        end;
        if not v44.invisibleTextBoxDidGainFocus then
            v44.invisibleTextBoxDidGainFocus = true;
        end;
        v44.props.authAnalytics.reportInteractWithAction(v31.Context.PhoneVerification, v31.Field.VerificationCode, v31.ActionType.Focus, "", "");
    end;
end;
v35.didMount = function(v63)
    v63.isMounted = true;
end;
v35.willUnmount = function(v64)
    v64.isMounted = false;
    if v64.keyboardVisibleChanged then
        v64.keyboardVisibleChanged:disconnect();
        v64.keyboardVisibleChanged = nil;
    end;
end;
v35.render = function(v65)
    local v66 = v65.state.errorText ~= "" and v65.state.errorText or nil;
    local l_hasMadeTooManyResendCodeAttempts_0 = v65.state.hasMadeTooManyResendCodeAttempts;
    local l_Number_0 = Enum.TextInputType.Number;
    pcall(function()
        l_Number_0 = Enum.TextInputType.OneTimePassword;
    end);
    return l_withStyle_0(function(v69)
        return v26({
            localizedError = v66, 
            verifyPhoneNumber = "Feature.VerificationUpsell.Label.VerifyPhoneNumber", 
            enterCode = "Feature.VerificationUpsell.Label.EnterCode", 
            changePhoneNumber = "Feature.VerificationUpsell.Action.ChangeNumber", 
            didNotReceive = "Authentication.TwoStepVerification.Label.DidNotReceive", 
            resend = "Authentication.TwoStepVerification.Label.Resend", 
            continueText = "Authentication.SignUp.Label.Continue", 
            codeBoxPlaceholder = "Authentication.TwoStepVerification.Label.CodeInputPlaceholderText", 
            useEmail = "Feature.VerificationUpsell.Action.UserEmail"
        })(function(v70)
            local v71 = v65.props.formFactor == l_FormFactor_0.WIDE;
            local v72 = #v65.state.codeBoxesValue == 6;
            local v73 = 1;
            local v74 = UDim2.new(0, 0, 0.5, 0);
            local v75 = Vector2.new(0, 0.5);
            if not v71 then
                v73 = v69.Theme.BackgroundDefault.Transparency;
                v74 = UDim2.new(0, 0, 1, 0);
                v75 = Vector2.new(0, 1);
            end;
            return v5.createElement(v36, {
                Contents = {
                    UISizeConstraint = not not v71 and v5.createElement("UISizeConstraint", {
                        MaxSize = Vector2.new(400, math.huge)
                    }) or nil, 
                    VerifyPhoneNumberContents = v5.createElement(v23.FitImageLabel, {
                        Size = UDim2.new(1, 0, 0, 0), 
                        fitAxis = v23.FitAxis.Height, 
                        Position = v74, 
                        BackgroundColor3 = v69.Theme.BackgroundDefault.Color, 
                        BackgroundTransparency = v73, 
                        ScaleType = Enum.ScaleType.Slice, 
                        SliceCenter = Rect.new(9, 9, 9, 9), 
                        Image = "LuaApp/buttons/buttonFill", 
                        ImageColor3 = v69.Theme.BackgroundDefault.Color, 
                        ImageTransparency = v69.Theme.BackgroundDefault.Transparency, 
                        BorderSizePixel = 0, 
                        AnchorPoint = v75, 
                        Visible = true
                    }, {
                        UIListLayout = v5.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center
                        }), 
                        HeaderFrame = v5.createElement("Frame", {
                            Size = UDim2.new(1, 0, 0, 0), 
                            BackgroundTransparency = 1
                        }, {
                            BackButton = v5.createElement(l_ImageSetButton_0, {
                                Size = v42, 
                                AutoButtonColor = false, 
                                BorderSizePixel = 0, 
                                BackgroundTransparency = 1, 
                                Position = UDim2.new(0, 10, 0, -35), 
                                AnchorPoint = Vector2.new(0, 0), 
                                ScaleType = Enum.ScaleType.Fit, 
                                Image = v43, 
                                ImageColor3 = v69.Theme.UIEmphasis.Color, 
                                [v5.Event.Activated] = v65.props.closeAlert
                            })
                        }), 
                        Header = v5.createElement("Frame", {
                            Size = UDim2.new(1, 0, 0, 48), 
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            LayoutOrder = 1
                        }, {
                            TextLabel = v5.createElement("TextLabel", {
                                Size = UDim2.new(1, -40, 0, 28), 
                                Position = UDim2.new(0, 20, 0.5, 0), 
                                AnchorPoint = Vector2.new(0, 0.5), 
                                TextSize = 20, 
                                BackgroundTransparency = 1, 
                                TextColor3 = Color3.new(1, 1, 1), 
                                TextXAlignment = Enum.TextXAlignment.Left, 
                                Font = l_AppFonts_0.default:getBold(), 
                                Text = v70.verifyPhoneNumber
                            }), 
                            LinkButton = v5.createElement(l_LinkButton_0, {
                                fontStyle = "Footer", 
                                size = UDim2.fromScale(0, 1), 
                                text = v70.useEmail, 
                                colorStyleDefault = "TextEmphasis", 
                                colorStyleHover = "TextEmphasis", 
                                onActivated = v65.onUseEmailClicked, 
                                position = UDim2.new(0.7, 0, 0.05, 0)
                            })
                        }), 
                        Messages = v5.createElement(v23.FitFrame, {
                            Size = UDim2.new(1, 0, 0, 81), 
                            fitAxis = v23.FitAxis.Height, 
                            AnchorPoint = Vector2.new(0.5, 0), 
                            BackgroundColor3 = v69.Theme.BackgroundMuted.Color or Color3.new(0.09411764705882353, 0.09803921568627451, 0.10588235294117647), 
                            BorderSizePixel = 0, 
                            LayoutOrder = 2
                        }, {
                            UIListLayout = v5.createElement("UIListLayout", {
                                FillDirection = Enum.FillDirection.Vertical, 
                                SortOrder = Enum.SortOrder.LayoutOrder, 
                                Padding = UDim.new(0, 10)
                            }), 
                            UIPadding = v5.createElement("UIPadding", {
                                PaddingTop = UDim.new(0, 10), 
                                PaddingBottom = UDim.new(0, 10), 
                                PaddingLeft = UDim.new(0, 20), 
                                PaddingRight = UDim.new(0, 20)
                            }), 
                            Help = v5.createElement(v13, {
                                LayoutOrder = 2, 
                                fontStyle = "Footer", 
                                Width = UDim.new(1, 0), 
                                AnchorPoint = Vector2.new(0, 0.5), 
                                textLabelColor = v69.Theme.TextDefault.Color, 
                                textLabelText = string.gsub(v70.enterCode, "{phoneNumber}", v65.props.phoneNumber), 
                                linkColorStyle = "TextEmphasis", 
                                linkText = v70.changePhoneNumber, 
                                onActivated = v65.props.closeAlert
                            }), 
                            Resend = not l_hasMadeTooManyResendCodeAttempts_0 and v5.createElement(v14, {
                                LayoutOrder = 3, 
                                fontStyle = "Footer", 
                                Width = UDim.new(1, 0), 
                                textLabelColor = v69.Theme.TextDefault.Color, 
                                textLabelText = v70.didNotReceive, 
                                linkColorStyle = "TextEmphasis", 
                                linkText = v70.resend, 
                                textButtonEnabled = not v65.state.isContinuingInProgress, 
                                onActivated = v65.onResendButtonActivated
                            }), 
                            TryEmail = l_hasMadeTooManyResendCodeAttempts_0 and v5.createElement(v14, {
                                LayoutOrder = 3, 
                                fontStyle = "Footer", 
                                Width = UDim.new(1, 0), 
                                textLabelColor = v69.Theme.TextDefault.Color, 
                                textLabelText = v70.didNotReceive, 
                                linkColorStyle = "TextEmphasis", 
                                linkText = v70.useEmail, 
                                textButtonEnabled = not v65.state.isContinuingInProgress, 
                                onActivated = v65.onUseEmailClicked
                            })
                        }), 
                        Form = v5.createElement(v23.FitFrame, {
                            Size = UDim2.new(1, 0, 0, 0), 
                            fitAxis = v23.FitAxis.Height, 
                            BackgroundTransparency = 1, 
                            LayoutOrder = 3
                        }, {
                            UIListLayout = v5.createElement("UIListLayout", {
                                FillDirection = Enum.FillDirection.Vertical, 
                                SortOrder = Enum.SortOrder.LayoutOrder, 
                                Padding = UDim.new(0, 10)
                            }), 
                            UIPadding = v5.createElement("UIPadding", {
                                PaddingTop = UDim.new(0, 15), 
                                PaddingBottom = UDim.new(0, 15), 
                                PaddingLeft = UDim.new(0, 20), 
                                PaddingRight = UDim.new(0, 20)
                            }), 
                            CodeBoxesAndErrorContainer = v5.createElement(v23.FitFrame, {
                                Size = UDim2.new(1, 0, 0, 0), 
                                fitAxis = v23.FitAxis.Height, 
                                BackgroundTransparency = 1, 
                                LayoutOrder = 1
                            }, {
                                UIListLayout = v5.createElement("UIListLayout", {
                                    FillDirection = Enum.FillDirection.Vertical, 
                                    SortOrder = Enum.SortOrder.LayoutOrder, 
                                    Padding = UDim.new(0, 5)
                                }), 
                                CodeBoxes = v5.createElement(v16, {
                                    characterCount = 6, 
                                    PlaceholderText = string.gsub(v70.codeBoxPlaceholder, "{.-}", 6), 
                                    LayoutOrder = 1, 
                                    TextInputType = l_Number_0, 
                                    textFilter = "%D", 
                                    errorState = v66 ~= nil, 
                                    shouldFocus = not v65.state.isContinuingInProgress, 
                                    onFocused = v65.onInvisibleTextBoxFocused, 
                                    onFocusLost = v65.onFocusLost, 
                                    onValueChanged = v65.onValueChanged, 
                                    ManualFocusRelease = true
                                }), 
                                ErrorText = v66 and v5.createElement("TextLabel", {
                                    Size = UDim2.new(1, 0, 0, 17), 
                                    Text = v70.localizedError or "", 
                                    Font = l_AppFonts_0.default:getDefault(), 
                                    TextSize = 12, 
                                    TextXAlignment = Enum.TextXAlignment.Left, 
                                    TextYAlignment = Enum.TextYAlignment.Center, 
                                    TextColor3 = Color3.new(0.9686274509803922, 0.29411764705882354, 0.3215686274509804), 
                                    BackgroundTransparency = 1, 
                                    LayoutOrder = 2
                                })
                            }), 
                            ContinueButton = v5.createElement(v17, {
                                LayoutOrder = 3, 
                                Text = v70.continueText, 
                                Size = UDim2.new(1, 0, 0, 48), 
                                isDisabled = not v72, 
                                isLoading = v65.state.isContinuingInProgress, 
                                onActivated = v65.onContinueButtonActivated
                            })
                        })
                    })
                }
            });
        end);
    end);
end;
return (l_RoactAppPolicy_0.connect(function(v76, _)
    return {
        appPolicy = v76
    };
end)((v6.connect(function(v78, _)
    return {
        formFactor = v78.FormFactor
    };
end, function(v80)
    return {
        setBackNavigationDisabled = function(v81)
            return v80(v18(v81));
        end, 
        verifyCode = function(v82, v83, v84)
            return v80(v34(v82, v83, v84));
        end, 
        navigateToPage = function(v85)
            return v80(v19(v85));
        end, 
        closeAlert = function()
            return v80(v32());
        end, 
        showTooManyAttemptsErrorToast = function(v86)
            return v80(v38({
                toastType = v37.NetworkingError, 
                toastMessage = v86
            }));
        end, 
        showErrorToast = function()
            return v80(v39({
                HttpError = Enum.HttpError.OK
            }));
        end
    };
end)((l_RoactServices_0.connect({
    networking = v7, 
    analytics = v10, 
    authAnalytics = v11
})(v35))))));
