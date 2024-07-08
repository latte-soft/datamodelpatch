local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Common_0 = l_Modules_0.Common;
local v4 = require(l_Common_0.Roact);
local v5 = require(l_Common_0.RoactRodux);
local v6 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v9 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v10 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local v11 = require(l_Modules_0.LuaApp.AppPage);
local l_AppOmniRecommendationsRequest_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppOmniRecommendationsRequest;
local v13 = require(l_Modules_0.LuaApp.Components.Authentication.LogoWithContentsLayout);
local v14 = require(l_Modules_0.LuaApp.Components.CheckBox);
local v15 = require(l_Modules_0.LuaApp.Components.AdjacentTextAndLink);
local v16 = require(l_Modules_0.LuaApp.Components.Authentication.FloodcheckTextAndLink);
local v17 = require(l_Modules_0.LuaApp.Components.Authentication.CodeBox);
local v18 = require(l_Modules_0.LuaApp.Components.SystemPrimaryButtonRetheme);
local v19 = require(l_Modules_0.LuaApp.Actions.SetBackNavigationDisabled);
local v20 = require(l_Modules_0.LuaApp.Thunks.Authentication.VerifyTwoStep);
local v21 = require(l_Modules_0.LuaApp.Thunks.Authentication.ResendTwoStep);
local v22 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v23 = require(l_Modules_0.LuaApp.Thunks.Authentication.LaunchApp);
local v24 = require(l_Modules_0.LuaApp.Enum.LaunchContext);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v26 = require(l_Modules_0.LuaApp.Enum.TransitionAnimation);
local v27 = require(l_Modules_0.LuaApp.FitChildren);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v29 = require(l_Modules_0.LuaApp.withLocalization);
local v30 = require(l_Modules_0.LuaApp.Analytics.Events.reportEphemeralCounter);
local v31 = require(l_Modules_0.LuaApp.Analytics.Events.AppLoginCounterNames);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local v33 = require(l_Modules_0.LuaApp.Enum.Alignment);
local v34 = require(l_Modules_0.LuaApp.EventStreamConstants);
local l_IsPrefetchOneCopyEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).IsPrefetchOneCopyEnabled;
local v36 = v4.PureComponent:extend("TwoStepPage");
v36.init = function(v37)
    v37.state = {
        trustDeviceChecked = false, 
        errorText = "", 
        codeBoxesValue = "", 
        isContinuingInProgress = false
    };
    v37.updateIsContinuingInProgress = function(v38)
        spawn(function()
            local l_isContinuingInProgress_0 = v37.state.isContinuingInProgress;
            if v37.isMounted and l_isContinuingInProgress_0 ~= v38 then
                v37:setState({
                    isContinuingInProgress = v38
                });
            end;
        end);
    end;
    v37.onHelpButtonActivated = function()
        if not v37.state.isContinuingInProgress then
            local l_navigateToPage_0 = v37.props.navigateToPage;
            v37.props.authAnalytics.report2SVHelpButtonClicked(v34.Context.TwoStepAuthScreen);
            l_navigateToPage_0({
                name = v11.GenericWebPage, 
                detail = "https://en.help.roblox.com/hc/articles/212459863", 
                extraProps = {
                    title = "", 
                    transitionAnimation = v26.SlideInFromRight
                }
            });
            return ;
        else
            return ;
        end;
    end;
    v37.onResendButtonActivated = function()
        if not v37.state.isContinuingInProgress then
            local l_resendTwoStep_0 = v37.props.resendTwoStep;
            local l_networking_0 = v37.props.networking;
            v37.props.authAnalytics.reportResendCodeButtonClicked(v34.Context.TwoStepAuthScreen);
            l_resendTwoStep_0(l_networking_0);
            return ;
        else
            return ;
        end;
    end;
    v37.onTrustCheckBoxActivated = function()
        if not v37.state.isContinuingInProgress then
            local v43 = not v37.state.trustDeviceChecked;
            v37.props.authAnalytics.reportRememberDeviceButtonClicked(v34.Context.TwoStepAuthScreen);
            if v37.isMounted then
                v37:setState({
                    trustDeviceChecked = v43
                });
            end;
            return ;
        else
            return ;
        end;
    end;
    v37.handleTwoStepSequence = function(v44)
        local l_networking_1 = v37.props.networking;
        local l_analytics_0 = v37.props.analytics;
        local l_appPolicy_0 = v37.props.appPolicy;
        local l_verifyTwoStep_0 = v37.props.verifyTwoStep;
        local l_trustDeviceChecked_0 = v37.state.trustDeviceChecked;
        local l_launchApp_0 = v37.props.launchApp;
        local l_setBackNavigationDisabled_0 = v37.props.setBackNavigationDisabled;
        local l_omniRecommendationsRequest_0 = v37.props.omniRecommendationsRequest;
        local l_l_UserInputService_0_FocusedTextBox_0 = l_UserInputService_0:GetFocusedTextBox();
        if l_l_UserInputService_0_FocusedTextBox_0 ~= nil then
            l_l_UserInputService_0_FocusedTextBox_0:ReleaseFocus();
        end;
        l_setBackNavigationDisabled_0(true);
        l_verifyTwoStep_0(l_networking_1, v44, l_trustDeviceChecked_0):andThen(function(_)
            l_setBackNavigationDisabled_0(false);
            v30(v31.Success, 1);
            l_launchApp_0(l_networking_1, l_omniRecommendationsRequest_0, l_analytics_0, l_appPolicy_0);
        end, function(v55)
            l_setBackNavigationDisabled_0(false);
            if v37.isMounted then
                v37:setState({
                    errorText = v55, 
                    codeBoxesValue = ""
                });
            end;
            v37.props.authAnalytics.report2SVInvalidCode(v34.Context.TwoStepAuthScreen, "");
            v37.updateIsContinuingInProgress(false);
        end);
    end;
    v37.onContinueButtonActivated = function()
        if #v37.state.codeBoxesValue < 6 then
            return ;
        elseif not v37.state.isContinuingInProgress then
            v37.updateIsContinuingInProgress(true);
            v37.props.authAnalytics.reportContinueButtonClicked(v34.Context.TwoStepAuthScreen);
            v37.handleTwoStepSequence(v37.state.codeBoxesValue);
            return ;
        else
            return ;
        end;
    end;
    v37.onFocusLost = function(_, v57, v58)
        if v57 or v58 and v58.KeyCode == Enum.KeyCode.Return then
            v37.onContinueButtonActivated();
        end;
    end;
    v37.onValueChanged = function(v59)
        if v37.state.codeBoxesValue ~= v59 and v37.isMounted then
            v37:setState({
                codeBoxesValue = v59, 
                errorText = ""
            });
            return ;
        else
            return ;
        end;
    end;
    v37.invisibleTextBoxDidGainFocus = false;
    v37.onInvisibleTextBoxFocused = function(v60)
        if v37.state.isContinuingInProgress then
            v60:ReleaseFocus();
        end;
        if not v37.invisibleTextBoxDidGainFocus then
            v37.invisibleTextBoxDidGainFocus = true;
            v37.props.authAnalytics.report2SVCodeFocus(v34.Context.TwoStepAuthScreen);
        end;
    end;
    v37.props.authAnalytics.reportScreenLoaded(v34.Context.TwoStepAuthScreen);
end;
v36.didMount = function(v61)
    v61.isMounted = true;
end;
v36.willUnmount = function(v62)
    v62.isMounted = false;
end;
v36.render = function(v63)
    local v64 = v63.state.errorText ~= "" and v63.state.errorText or nil;
    return l_withStyle_0(function(v65)
        return v29({
            localizedError = v64, 
            twoStepVerification = "Authentication.TwoStepVerification.Label.TwoStepVerification", 
            enterEmailCode = "Authentication.TwoStepVerification.Label.EnterEmailCode", 
            simpleNeedHelp = "Authentication.TwoStepVerification.Label.SimpleNeedHelp", 
            clickHere = "Authentication.TwoStepVerification.Action.ClickHere", 
            didNotReceive = "Authentication.TwoStepVerification.Label.DidNotReceive", 
            resend = "Authentication.TwoStepVerification.Label.Resend", 
            trustThisDevice = "Authentication.TwoStepVerification.Label.TrustThisDevice", 
            continueText = "Authentication.SignUp.Label.Continue", 
            codeBoxPlaceholder = "Authentication.TwoStepVerification.Label.CodeInputPlaceholderText"
        })(function(v66)
            local v67 = v63.props.formFactor == l_FormFactor_0.WIDE;
            local v68 = #v63.state.codeBoxesValue == 6;
            local v69 = 1;
            local v70 = UDim2.new(0, 0, 0, 0);
            local v71 = Vector2.new(0, 0);
            if not v67 then
                v69 = v65.Theme.BackgroundDefault.Transparency;
                v70 = UDim2.new(0, 0, 1, 0);
                v71 = Vector2.new(0, 1);
            end;
            return v4.createElement(v13, {
                ContentAlign = not not v67 and v33.Top or v33.Bottom, 
                topButtonEnabled = not v63.state.isContinuingInProgress
            }, {
                UISizeConstraint = not not v67 and v4.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(400, math.huge)
                }) or nil, 
                TwoStepContents = v4.createElement(v27.FitImageLabel, {
                    Size = UDim2.new(1, 0, 0, 0), 
                    fitAxis = v27.FitAxis.Height, 
                    Position = v70, 
                    BackgroundColor3 = v65.Theme.BackgroundDefault.Color, 
                    BackgroundTransparency = v69, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = Rect.new(9, 9, 9, 9), 
                    Image = "LuaApp/buttons/buttonFill", 
                    ImageColor3 = v65.Theme.BackgroundDefault.Color, 
                    ImageTransparency = v65.Theme.BackgroundDefault.Transparency, 
                    BorderSizePixel = 0, 
                    AnchorPoint = v71, 
                    Visible = true
                }, {
                    UIListLayout = v4.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center
                    }), 
                    Header = v4.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, 48), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        LayoutOrder = 1
                    }, {
                        TextLabel = v4.createElement("TextLabel", {
                            Size = UDim2.new(1, -40, 0, 28), 
                            Position = UDim2.new(0, 20, 0.5, 0), 
                            AnchorPoint = Vector2.new(0, 0.5), 
                            TextSize = 20, 
                            BackgroundTransparency = 1, 
                            TextColor3 = Color3.new(1, 1, 1), 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            Font = l_AppFonts_0.default:getBold(), 
                            Text = v66.twoStepVerification
                        })
                    }), 
                    Messages = v4.createElement(v27.FitFrame, {
                        Size = UDim2.new(1, 0, 0, 81), 
                        fitAxis = v27.FitAxis.Height, 
                        AnchorPoint = Vector2.new(0.5, 0), 
                        BackgroundColor3 = v65.Theme.BackgroundMuted.Color, 
                        BorderSizePixel = 0, 
                        LayoutOrder = 2
                    }, {
                        UIListLayout = v4.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            Padding = UDim.new(0, 10)
                        }), 
                        UIPadding = v4.createElement("UIPadding", {
                            PaddingTop = UDim.new(0, 10), 
                            PaddingBottom = UDim.new(0, 10), 
                            PaddingLeft = UDim.new(0, 20), 
                            PaddingRight = UDim.new(0, 20)
                        }), 
                        EnterTheCode = v4.createElement("TextLabel", {
                            Size = UDim2.new(1, 0, 0, 12), 
                            AnchorPoint = Vector2.new(0, 0.5), 
                            BackgroundTransparency = 1, 
                            TextSize = v65.Font.Footer.RelativeSize * v65.Font.BaseSize, 
                            Font = l_AppFonts_0.default:getDefault(), 
                            TextWrapped = true, 
                            TextColor3 = v65.Theme.TextDefault.Color, 
                            Text = v66.enterEmailCode, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            LayoutOrder = 1
                        }), 
                        Help = v4.createElement(v15, {
                            LayoutOrder = 2, 
                            fontStyle = "Footer", 
                            Width = UDim.new(1, 0), 
                            AnchorPoint = Vector2.new(0, 0.5), 
                            textLabelColor = v65.Theme.TextDefault.Color, 
                            textLabelText = v66.simpleNeedHelp, 
                            linkColorStyle = "TextEmphasis", 
                            linkText = v66.clickHere, 
                            onActivated = v63.onHelpButtonActivated
                        }), 
                        Resend = v4.createElement(v16, {
                            LayoutOrder = 3, 
                            fontStyle = "Footer", 
                            Width = UDim.new(1, 0), 
                            textLabelColor = v65.Theme.TextDefault.Color, 
                            textLabelText = v66.didNotReceive, 
                            linkColorStyle = "TextEmphasis", 
                            linkText = v66.resend, 
                            textButtonEnabled = not v63.state.isContinuingInProgress, 
                            onActivated = v63.onResendButtonActivated
                        })
                    }), 
                    Form = v4.createElement(v27.FitFrame, {
                        Size = UDim2.new(1, 0, 0, 0), 
                        fitAxis = v27.FitAxis.Height, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 3
                    }, {
                        UIListLayout = v4.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            Padding = UDim.new(0, 10)
                        }), 
                        UIPadding = v4.createElement("UIPadding", {
                            PaddingTop = UDim.new(0, 15), 
                            PaddingBottom = UDim.new(0, 15), 
                            PaddingLeft = UDim.new(0, 20), 
                            PaddingRight = UDim.new(0, 20)
                        }), 
                        CodeBoxesAndErrorContainer = v4.createElement(v27.FitFrame, {
                            Size = UDim2.new(1, 0, 0, 0), 
                            fitAxis = v27.FitAxis.Height, 
                            BackgroundTransparency = 1, 
                            LayoutOrder = 1
                        }, {
                            UIListLayout = v4.createElement("UIListLayout", {
                                FillDirection = Enum.FillDirection.Vertical, 
                                SortOrder = Enum.SortOrder.LayoutOrder, 
                                Padding = UDim.new(0, 5)
                            }), 
                            CodeBoxes = v4.createElement(v17, {
                                characterCount = 6, 
                                PlaceholderText = string.gsub(v66.codeBoxPlaceholder, "{.-}", 6), 
                                LayoutOrder = 1, 
                                textFilter = "%D", 
                                errorState = v64 ~= nil, 
                                shouldFocus = not v63.state.isContinuingInProgress, 
                                onFocused = v63.onInvisibleTextBoxFocused, 
                                onFocusLost = v63.onFocusLost, 
                                onValueChanged = v63.onValueChanged
                            }), 
                            ErrorText = v64 and v4.createElement("TextLabel", {
                                Size = UDim2.new(1, 0, 0, 17), 
                                Text = v66.localizedError or "", 
                                Font = l_AppFonts_0.default:getDefault(), 
                                TextSize = 12, 
                                TextXAlignment = Enum.TextXAlignment.Left, 
                                TextYAlignment = Enum.TextYAlignment.Center, 
                                TextColor3 = Color3.new(0.9686274509803922, 0.29411764705882354, 0.3215686274509804), 
                                BackgroundTransparency = 1, 
                                LayoutOrder = 2
                            })
                        }), 
                        TrustContainer = v4.createElement("Frame", {
                            Size = UDim2.new(1, 0, 0, 26), 
                            BackgroundTransparency = 1, 
                            LayoutOrder = 2
                        }, {
                            UITextLabel = v4.createElement("UIListLayout", {
                                FillDirection = Enum.FillDirection.Horizontal, 
                                SortOrder = Enum.SortOrder.LayoutOrder, 
                                Padding = UDim.new(0, 8)
                            }), 
                            CheckBox = v4.createElement(v14, {
                                Selected = v63.state.trustDeviceChecked, 
                                Enabled = not v63.state.isContinuingInProgress, 
                                Height = 26, 
                                OnActivated = v63.onTrustCheckBoxActivated, 
                                LayoutOrder = 10
                            }), 
                            TextLabel = v4.createElement("TextLabel", {
                                Size = UDim2.new(1, -34, 1, 0), 
                                BackgroundTransparency = 1, 
                                TextXAlignment = Enum.TextXAlignment.Left, 
                                TextYAlignment = Enum.TextYAlignment.Center, 
                                TextSize = 12, 
                                Font = l_AppFonts_0.default:getDefault(), 
                                TextColor3 = Color3.new(1, 1, 1), 
                                LayoutOrder = 20, 
                                Text = v66.trustThisDevice
                            })
                        }), 
                        ContinueButton = v4.createElement(v18, {
                            LayoutOrder = 3, 
                            Text = v66.continueText, 
                            Size = UDim2.new(1, 0, 0, 48), 
                            isDisabled = not v68, 
                            isLoading = v63.state.isContinuingInProgress, 
                            onActivated = v63.onContinueButtonActivated
                        })
                    })
                })
            });
        end);
    end);
end;
return (l_RoactAppPolicy_0.connect(function(v72, _)
    return {
        appPolicy = v72
    };
end)((v5.connect(function(v74, _)
    return {
        formFactor = v74.FormFactor
    };
end, function(v76)
    return {
        launchApp = function(v77, v78, v79, v80)
            return v76(v23(v77, v78, v79, v80, v24.Login));
        end, 
        setBackNavigationDisabled = function(v81)
            return v76(v19(v81));
        end, 
        verifyTwoStep = function(v82, v83, v84)
            return v76(v20(v82, v83, v84));
        end, 
        resendTwoStep = function(v85)
            return v76(v21(v85));
        end, 
        navigateToPage = function(v86)
            return v76(v22(v86));
        end
    };
end)((l_RoactServices_0.connect({
    networking = v6, 
    analytics = v9, 
    authAnalytics = v10, 
    omniRecommendationsRequest = if not l_IsPrefetchOneCopyEnabled_0() then nil else l_AppOmniRecommendationsRequest_0
})(v36))))));
