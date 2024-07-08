local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v7 = require(l_CorePackages_0.UIBlox);
local l_ButtonType_0 = v7.App.Button.Enum.ButtonType;
local l_PartialPageModal_0 = v7.App.Dialog.Modal.PartialPageModal;
local l_withStyle_0 = v7.Style.withStyle;
local v11 = require(l_Modules_0.LuaApp.withLocalization);
local v12 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local l_LinkButton_0 = v7.App.Button.LinkButton;
local v14 = require(l_Modules_0.LuaApp.AppPage);
local v15 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v16 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v17 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local v18 = require(l_Modules_0.LuaApp.Thunks.Verification.OpenEmailUpsellModal);
local v19 = require(l_Modules_0.LuaApp.Thunks.Verification.OpenContactMethodPromptModal);
local v20 = v3.PureComponent:extend(script.Name);
local v21 = require(l_Modules_0.LuaApp.Flags.GetFStringContactMethodPromptHelpLink);
local v22 = require(l_Modules_0.LuaApp.Thunks.Authentication.Logout);
local v23 = require(l_Modules_0.LuaApp.Enum.TransitionAnimation);
local v24 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames);
local l_Images_0 = v7.App.ImageSet.Images;
local l_ImageSetLabel_0 = v7.Core.ImageSet.ImageSetLabel;
v20.defaultProps = {
    titleKey = "Feature.VerificationUpsell.Heading.VerificationRequired", 
    bodyKey = "Feature.VerificationUpsell.Heading.AddEmail", 
    primaryButtonKey = "Feature.VerificationUpsell.Action.AddPhoneNumber", 
    secondaryButtonKey = "Feature.VerificationUpsell.Action.AddEmailAddress", 
    firstHeaderKey = "Feature.VerificationUpsell.Heading.DontGetLockedOut", 
    firstBodyKey = "Feature.VerificationUpsell.Label.RecoverIfPasswordLost", 
    firstImagePath = "icons/graphic/passcode_large", 
    secondHeaderKey = "Feature.VerificationUpsell.Heading.ImproveAccountSecurity", 
    secondBodyKey = "Feature.VerificationUpsell.Label.KeepBadActorsOut", 
    logOutButtonKey = "Feature.VerificationUpsell.Action.LogOutText", 
    supportButtonKey = "Feature.VerificationUpsell.Action.Support", 
    secondImagePath = "icons/graphic/security_large", 
    sectionLoggingValue = "mandatory", 
    originLoggingValue = "homepage", 
    contextLoggingValue = "contactMethodModal"
};
v20.didMount = function(v27)
    v27.isMounted = true;
    v27.props.authEventAnalytics.reportModalShownWithSection(v27.props.contextLoggingValue, v27.props.originLoggingValue, v27.props.sectionLoggingValue);
end;
v20.init = function(v28)
    v28.emailButtonClickCallback = function()
        v28.props.authEventAnalytics.reportButtonClickedWithSectionAndOrigin(v28.props.contextLoggingValue, v15.Button.Email, v28.props.sectionLoggingValue, v28.props.originLoggingValue);
        v28.props.addEmailContactMethod(v28.props.networking);
    end;
    v28.phoneButtonClickCallback = function()
        v28.props.authEventAnalytics.reportButtonClickedWithSectionAndOrigin(v28.props.contextLoggingValue, v15.Button.Phone, v28.props.sectionLoggingValue, v28.props.originLoggingValue);
        local v30 = {
            name = v14.PhoneVerification, 
            extraProps = {
                closeCallback = function(v29)
                    if not v29 then
                        v28.props.relaunchContactMethodPrompt();
                    end;
                end
            }
        };
        v28.closeOverlay();
        v28.props.navigateDown(v30);
    end;
    v28.supportButtonClickCallback = function()
        v28.props.authEventAnalytics.reportButtonClickedWithSectionAndOrigin(v28.props.contextLoggingValue, v15.Button.Support, v28.props.sectionLoggingValue, v28.props.originLoggingValue);
        v28.props.navigateDown({
            name = v14.GenericWebPage, 
            detail = v21(), 
            extraProps = {
                title = "", 
                transitionAnimation = v23.SlideInFromRight
            }
        });
    end;
    v28.logoutButtonClickCallback = function()
        v28.props.authEventAnalytics.reportButtonClickedWithSectionAndOrigin(v28.props.contextLoggingValue, v15.Button.Logout, v28.props.sectionLoggingValue, v28.props.originLoggingValue);
        v28.props.logout(v28.props.networking, v28.props.guiService);
    end;
    v28.closeOverlay = function()
        if v28.isMounted then
            v28.props.authEventAnalytics.reportModalDismissedWithSection(v28.props.contextLoggingValue, v28.props.originLoggingValue, v28.props.sectionLoggingValue);
            v28.props.closePrompt();
        end;
    end;
    v28.iconDescriptionRowElement = function(v31, v32, v33, v34)
        local v35 = UDim2.new(1, -72, 0, 0);
        local v36 = v31.Font.Body.RelativeSize * v31.Font.BaseSize;
        return v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            ListLayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, 24)
            }), 
            ImageIcon = v3.createElement(l_ImageSetLabel_0, {
                Size = UDim2.new(0, 48, 0, 48), 
                Image = v32, 
                ImageColor3 = v31.Theme.SystemPrimaryDefault.Color, 
                ImageTransparency = v31.Theme.SystemPrimaryDefault.Transparency, 
                BackgroundTransparency = 1
            }), 
            TextFrame = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = v35, 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                VerticalLayout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    Padding = UDim.new(0, 8)
                }), 
                HeaderText = v3.createElement("TextLabel", {
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Text = v33, 
                    TextSize = v36, 
                    TextColor3 = v31.Theme.TextEmphasis.Color, 
                    TextTransparency = v31.Theme.TextDefault.Transparency, 
                    Font = v31.Font.Header2.Font, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextWrapped = true, 
                    Size = UDim2.new(1, 0, 0, 0)
                }), 
                BodyText = v3.createElement("TextLabel", {
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Text = v34, 
                    TextSize = v36, 
                    TextColor3 = v31.Theme.TextDefault.Color, 
                    TextTransparency = v31.Theme.TextDefault.Transparency, 
                    Font = v31.Font.Body.Font, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextWrapped = true, 
                    Size = UDim2.new(1, 0, 0, 0)
                })
            })
        });
    end;
end;
v20.render = function(v37)
    local v38 = {
        title = v37.props.titleKey, 
        body = v37.props.bodyKey, 
        primaryButtonText = v37.props.primaryButtonKey, 
        secondaryButtonText = v37.props.secondaryButtonKey, 
        firstHeaderKey = v37.props.firstHeaderKey, 
        firstBodyKey = v37.props.firstBodyKey, 
        secondHeaderKey = v37.props.secondHeaderKey, 
        secondBodyKey = v37.props.secondBodyKey, 
        logOutButtonKey = v37.props.logOutButtonKey, 
        supportButtonKey = v37.props.supportButtonKey
    };
    return l_withStyle_0(function(v39)
        return v11(v38)(function(v40)
            return v3.createElement(l_PartialPageModal_0, {
                title = v40.title, 
                screenSize = v37.props.screenSize, 
                buttonStackProps = {
                    buttonHeight = 36, 
                    forcedFillDirection = Enum.FillDirection.Vertical, 
                    buttons = {
                        {
                            buttonType = l_ButtonType_0.Secondary, 
                            props = {
                                onActivated = v37.emailButtonClickCallback, 
                                text = v40.secondaryButtonText
                            }
                        }, 
                        {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            props = {
                                onActivated = v37.phoneButtonClickCallback, 
                                text = v40.primaryButtonText
                            }
                        }
                    }
                }, 
                footerContent = function()
                    return v3.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 64), 
                        AutomaticSize = Enum.AutomaticSize.Y
                    }, {
                        HorizontalLayout = v3.createElement("UIListLayout", {
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            FillDirection = Enum.FillDirection.Horizontal, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            Padding = UDim.new(0, 32)
                        }), 
                        UIPadding = v3.createElement("UIPadding", {
                            PaddingTop = UDim.new(0, 24)
                        }), 
                        SupportText = v3.createElement(l_LinkButton_0, {
                            text = v40.supportButtonKey, 
                            fontStyle = "CaptionBody", 
                            colorStyleDefault = "TextDefault", 
                            colorStyleHover = "TextDefault", 
                            layoutOrder = 1, 
                            underlineAlwaysEnabled = true, 
                            onActivated = v37.supportButtonClickCallback
                        }), 
                        LogoutText = v3.createElement(l_LinkButton_0, {
                            text = v40.logOutButtonKey, 
                            fontStyle = "CaptionBody", 
                            colorStyleDefault = "TextDefault", 
                            colorStyleHover = "TextDefault", 
                            layoutOrder = 2, 
                            underlineAlwaysEnabled = true, 
                            onActivated = v37.logoutButtonClickCallback
                        })
                    });
                end
            }, {
                Middle = v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, 0, 0, 0)
                }, {
                    ContentPadding = v3.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 24), 
                        PaddingBottom = UDim.new(0, 24)
                    }), 
                    ListLayout = v3.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        Padding = UDim.new(0, 24)
                    }), 
                    iconTextFrame1 = v37.iconDescriptionRowElement(v39, l_Images_0[v37.props.firstImagePath], v40.firstHeaderKey, v40.firstBodyKey), 
                    iconTextFrame2 = v37.iconDescriptionRowElement(v39, l_Images_0[v37.props.secondImagePath], v40.secondHeaderKey, v40.secondBodyKey)
                })
            });
        end);
    end);
end;
return (l_RoactServices_0.connect({
    networking = v5, 
    authEventAnalytics = v12, 
    guiService = l_AppGuiService_0
})((v4.connect(function(v41, _)
    return {
        screenSize = v41.ScreenSize
    };
end, function(v43)
    return {
        closePrompt = function()
            return v43(v17());
        end, 
        relaunchContactMethodPrompt = function(v44)
            v43(v19(v44, {}));
        end, 
        addEmailContactMethod = function(v45)
            return v43(v18({
                addEmailOver13TextKey = "Feature.ContactMethodUpsell.Label.PleaseAddEmail", 
                addEmailTitleKey = "Feature.AccountSecurityPrompt.Action.AbortDismissForeverAddEmail", 
                isEmailModalCalledFromHomePage = true, 
                failureCallback = function()
                    v43(v19(v45, {}));
                end, 
                eventContext = "verificationUpsell", 
                origin = "homepage", 
                section = "addEmail"
            }));
        end, 
        navigateDown = function(v46)
            v43(v16(v46));
        end, 
        logout = function(v47, v48)
            v43(v22(v47, v48, v24.ContactMethodPrompt));
        end
    };
end)(v20))));
