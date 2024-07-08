local l_CorePackages_0 = game:GetService("CorePackages");
local l_IXPService_0 = game:GetService("IXPService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Logging);
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.RoactRodux);
local v6 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppPermissions_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppPermissions;
local v9 = require(l_CorePackages_0.Cryo);
local v10 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v10.Style.withStyle;
local v12 = require(l_Modules_0.LuaApp.withLocalization);
local l_PartialPageModal_0 = v10.App.Dialog.Modal.PartialPageModal;
local v14 = require(l_Modules_0.LuaApp.Http.Url);
local v15 = require(l_Modules_0.LuaApp.Components.Verification.IdentityVerification.IdentityVerificationModalContent);
local v16 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v17 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v18 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local l_Images_0 = v10.App.ImageSet.Images;
local v20 = require(l_Modules_0.LuaApp.AppPage);
local l_ButtonType_0 = v10.App.Button.Enum.ButtonType;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v23 = require(l_CorePackages_0.Workspace.Packages.VoiceChat);
local l_PostUserOptIn_0 = v23.PostUserOptIn;
local v25 = require(l_Modules_0.LuaApp.Analytics.Events.VoiceUpsellAnalytics);
local v26 = game:DefineFastFlag("VoiceConsentCopyV2", false);
local v27 = game:DefineFastFlag("VoiceUpsellNewAnalytics", false);
local v28 = v23.Flags.GetFStringVoiceUpsellLayer();
local v29 = v4.PureComponent:extend("EnableVoiceModal");
local v30 = require(l_Modules_0.LuaApp.Http.Requests.PostAgeVerificationOptOutCheckbox);
local v31 = require(l_Modules_0.LuaApp.Flags.GetFFlagVoiceUpsellConsentCheckbox);
v29.init = function(v32)
    v32.isMounted = false;
    v32.state = {
        dontShowModalAgain = false
    };
    if v31() then
        v32.state.consentGiven = not v32.props.RequireExplicitVoiceConsent;
    end;
    v32.enableVoice = function()
        if v27 then
            v32.props.voiceUpsellAnalytics.enableVoiceChatUpsell();
        end;
        l_PostUserOptIn_0(v32.props.networking, true, true):andThen(function(v33)
            if not v33 then
                v32.props.setNetworkingErrorToast();
                v3.warn("Error getting UserOptIn. " .. tostring(v33));
                return ;
            else
                v32.props.launchGame();
                v32.props.closeOverlay();
                v32.props.setShowVoiceOptIn({
                    voiceEnabled = true, 
                    showVoiceOptInOverlay = false
                });
                return ;
            end;
        end):catch(function()
            v32.props.setNetworkingErrorToast();
            v3.warn("Exception posting PostUserOptIn");
        end);
    end;
    v32.joinAnyways = function()
        v32.props.voiceUpsellAnalytics.joinWithoutVoiceChat(v32.state.dontShowModalAgain == true);
        if not (not v32.state.dontShowModalAgain and not v31()) then
            v32.props.setShowVoiceOptIn({
                voiceEnabled = false, 
                showVoiceOptInOverlay = false
            });
        end;
        v32.props.launchGame();
        v32.props.closeOverlay();
    end;
    v32.onOverlayOptOutCheckBoxActivated = function(v34)
        if v32.isMounted then
            v30(v32.props.networking, not v34):catch(function(v35)
                v3.warn("Error posting ShowOverlay for AgeVerificationOptOutCheckbox. " .. tostring(v35));
            end);
            v32:setState({
                dontShowModalAgain = v34
            });
        end;
    end;
    v32.consentActivated = function()
        if v32.isMounted then
            v32:setState({
                consentGiven = not v32.state.consentGiven
            });
        end;
    end;
    v32.closeEnableVoiceModal = function()
        if v31() then
            v32.props.setShowVoiceOptIn({
                showVoiceOptInOverlay = false
            });
        end;
        v32.props.voiceUpsellAnalytics.closeEnableVoiceChatModal();
        v32.props.closeOverlay();
    end;
end;
v29.didMount = function(v36)
    v36.isMounted = true;
    if not (not v31() or not v36.props.postUserSeenModal) then
        v36.props.postUserSeenModal():andThen(function()
            v3.warn("UserSeenModal request succeeded");
        end):catch(function(_)
            v3.warn("UserSeenModal request failed");
        end);
    end;
    if not (not (v28 ~= "") or not v27) then
        l_IXPService_0:LogUserLayerExposure(v28);
    end;
    v36.props.voiceUpsellAnalytics.showEnableVoiceChatModal();
end;
v29.willUnmount = function(v38)
    v38.isMounted = false;
end;
v29.render = function(v39)
    local l_showNewContent_0 = v39.props.showNewContent;
    return v12(v9.Dictionary.join({
        EnableVoiceChat = "Verification.Identity.Label.EnableVoiceChat", 
        LearnMoreAboutVoiceRecording = "Verification.Identity.Label.LearnMoreAboutVoiceRecording", 
        SkipVoiceChat = "Verification.Identity.Action.SkipVoiceChat", 
        UsesVoiceChat = "Verification.Identity.Label.UsesVoiceChat", 
        DontShowAgain = "Verification.Identity.Label.DontShowAgain", 
        ConsentText = "Verification.Identity.Label.VoiceCollectionConsent", 
        EnableVoiceContent1 = "Verification.Identity.Label.EnableVoiceChat1", 
        EnableVoiceContent2 = "Verification.Identity.Label.EnableVoiceChat2", 
        ClickToConsent = "Verification.Identity.Label.VoiceCollectionConsent2", 
        LetsChat = "Verification.Identity.Heading.LetsChat", 
        VoiceFAQ = "InGame.CommonUI.Label.FAQWebviewTitle"
    }, if not l_showNewContent_0 then {} else {
        EnableVoiceChat = "Verification.Identity.Label.EnableMicrophone", 
        SkipVoiceChat = "Verification.Identity.Label.JoinWithoutMicrophone", 
        EnableVoiceContent1 = "Verification.Identity.Label.EnableChatWithVoice", 
        LetsChat = "Verification.Identity.Heading.YourNewWayToChat"
    }, if not v26 then {} else {
        LetsChat = "Verification.Identity.Heading.V2LetsChat", 
        ClickToConsent = "Verification.Identity.Label.V2ClickToConsent", 
        EnableVoiceChat = "Verification.Identity.Label.V2EnableVoiceChat", 
        EnableVoiceContent1 = "Verification.Identity.Label.V2EnableVoiceChat1", 
        SkipVoiceChat = "Verification.Identity.Label.V2JoinWithout"
    }))(function(v41)
        return l_withStyle_0(function(v42)
            local l_Theme_0 = v42.Theme;
            local l_CaptionHeader_0 = v42.Font.CaptionHeader;
            local v45 = l_CaptionHeader_0.RelativeSize * v42.Font.BaseSize;
            local v46 = not v39.props.RequireExplicitVoiceConsent;
            local v47 = v4.createElement(v15, v9.Dictionary.join({
                MainText = {
                    v41.UsesVoiceChat
                }, 
                LocalizedOptOutText = v41.DontShowAgain, 
                centerCheckbox = true, 
                onActivated = v39.onOverlayOptOutCheckBoxActivated, 
                checkboxSelected = v39.state.dontShowModalAgain
            }, if not v31() then {} else {
                MainText = {
                    {
                        content = v41.EnableVoiceContent1, 
                        image = l_Images_0["icons/graphic/voicechat_large"]
                    }, 
                    "", 
                    {
                        content = v41.EnableVoiceContent2, 
                        image = l_Images_0["icons/graphic/hearts_large"]
                    }
                }, 
                LocalizedOptOutText = false, 
                centerCheckbox = false, 
                showConsentCheckbox = true, 
                consentText = if not v46 then v41.ConsentText else v41.ClickToConsent, 
                consentActivated = v39.consentActivated, 
                consentSelected = v39.state.consentGiven, 
                hideConsent = v46
            }));
            local v48 = {
                {
                    buttonType = l_ButtonType_0.Secondary, 
                    props = {
                        onActivated = v39.joinAnyways, 
                        text = v41.SkipVoiceChat
                    }
                }, 
                {
                    buttonType = if not l_showNewContent_0 then l_ButtonType_0.PrimarySystem else l_ButtonType_0.Secondary, 
                    props = {
                        isDisabled = if not v31() then nil else not v39.state.consentGiven, 
                        onActivated = v39.enableVoice, 
                        text = v41.EnableVoiceChat
                    }
                }
            };
            return v4.createElement(l_PartialPageModal_0, {
                title = if not v31() then v41.EnableVoiceChat else v41.LetsChat, 
                screenSize = v39.props.screenSize, 
                onCloseClicked = v39.closeEnableVoiceModal, 
                buttonStackProps = v48 and {
                    buttonHeight = 48, 
                    buttons = v48
                }, 
                footerContent = function()
                    return v4.createFragment({
                        Divider = v4.createElement("Frame", {
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            Position = UDim2.new(0.5, 0, 0, 16), 
                            BorderSizePixel = 0, 
                            BackgroundColor3 = l_Theme_0.Divider.Color, 
                            BackgroundTransparency = l_Theme_0.Divider.Transparency, 
                            LayoutOrder = 2, 
                            Size = UDim2.new(1, 0, 0, 1)
                        }), 
                        FooterText = v4.createElement("TextButton", {
                            Text = v41.LearnMoreAboutVoiceRecording or "Learn More about Voice Recording", 
                            AutomaticSize = Enum.AutomaticSize.X, 
                            Position = UDim2.new(0.5, 0, 0.5, 24), 
                            TextColor3 = v42.Theme.TextEmphasis.Color, 
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            BackgroundTransparency = 1, 
                            Font = l_CaptionHeader_0.Font, 
                            TextSize = v45, 
                            BorderSizePixel = 0, 
                            RichText = true, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            Size = UDim2.new(0, 0, 0, 20), 
                            [v4.Event.Activated] = function()
                                v39.props.openVoiceFAQ(v41.VoiceFAQ or "Voice FAQ");
                                if v27 then
                                    v39.props.voiceUpsellAnalytics.learnMoreAboutVoiceRecordingUpsell();
                                end;
                            end
                        })
                    });
                end
            }, {
                OuterFrame = v4.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 0), 
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, {
                    ListLayout = v4.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        Padding = UDim.new(0, 24), 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center
                    }), 
                    Padding = v4.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 24), 
                        PaddingBottom = UDim.new(0, 24)
                    }), 
                    ContentFrame = v4.createElement("Frame", {
                        LayoutOrder = 2, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1
                    }, {
                        Content = v47
                    })
                })
            });
        end);
    end);
end;
return v5.connect(function(v49, _)
    return {
        formFactor = v49.FormFactor, 
        screenSize = v49.ScreenSize
    };
end, function(v51)
    return {
        closeOverlay = function()
            v51(v17());
        end, 
        setNetworkingErrorToast = function(_)
            v51(v18({
                HttpError = Enum.HttpError.OK
            }));
        end, 
        openVoiceFAQ = function(v53)
            return v51(v16({
                name = v20.GenericWebPage, 
                detail = string.format("%sinfo/voice-faq", v14.BASE_URL), 
                extraProps = {
                    title = v53
                }
            }));
        end
    };
end)((l_RoactServices_0.connect({
    networking = v6, 
    permissions = l_AppPermissions_0, 
    voiceUpsellAnalytics = v25
})((l_RoactAppPolicy_0.connect(function(v54, _)
    return {
        showNewContent = v54.getGameInfoShowChatFeatures()
    };
end)(v29)))));
