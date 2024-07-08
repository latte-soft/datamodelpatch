local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.UIBlox);
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.RoactRodux);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v8 = require(l_Modules_0.LuaApp.withLocalization);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_Text_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Text;
local v11 = require(l_CorePackages_0.Workspace.Packages.React);
local l_useEffect_0 = v11.useEffect;
local _ = v11.useCallback;
local v14 = require(l_Modules_0.LuaApp.Components.SystemPrimaryButtonRetheme);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v16 = require(l_Modules_0.LuaApp.Components.GenericTextButton);
local l_Button_0 = v3.App.Button.Button;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local v21 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local v22 = require(l_Modules_0.LuaApp.AppPage);
local _ = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableHomePageUpsellCard);
local v24 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableHomePageEmailUpsellCard);
local v25 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v26 = require(l_Modules_0.LuaApp.Actions.SetHomePageUpsellCardVariation);
local v27 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v28 = require(l_Modules_0.LuaApp.Thunks.Verification.OpenEmailUpsellModal);
local v29 = require(l_Modules_0.LuaApp.Thunks.Verification.OpenPhoneUpsellModal);
local v30 = require(l_Modules_0.LuaApp.Components.DiscoverabilityModal.useNavigateToDiscoverabilityModal);
local l_EntryPoints_0 = require(l_CorePackages_0.Workspace.Packages.DiscoverabilityModal).Analytics.EntryPoints;
local v32 = require(l_Modules_0.LuaApp.Enum.OptionalContactMethodUpsellTypes);
local v33 = require(l_Modules_0.LuaApp.Experiment.RoactAppExperiment);
local l_useUserExperiment_0 = v33.useUserExperiment;
local l_IXPService_0 = game:GetService("IXPService");
local v36 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local v37 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableUpdateAddPhoneDescriptionTextExperiment);
local v38 = require(l_Modules_0.Personalization.Flags.GetFFlagUseUpsellCardOmniFeedItem);
local v39 = require(l_Modules_0.LuaApp.Flags.GetFFlagUseUIBloxButtonsUpsellCard);
local v40 = require(l_Modules_0.LuaApp.Flags.GetFFlagRefactorHomePageUpsellCardWithIconToFunctional);
local l_withStyle_0 = v3.Style.withStyle;
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_Images_0 = v3.App.ImageSet.Images;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local v45 = l_Images_0["icons/graphic/passcode_large"];
local v46 = l_Images_0["icons/controls/microphone"];
local v47 = not v39() and 650 or 800;
local function v48()
end;
if not v40() then
    local v49 = v4.PureComponent:extend("HomePageUpsellCardWithIcon");
    local v50 = "phone";
    local v51 = "";
    local v52 = nil;
    local v53 = nil;
    v49.didMount = function(v54)
        if v54.props.upsellCardVariation then
            v51 = v54.props.upsellCardVariation.upsellCardType;
        end;
        if not (v51 ~= v32.ContactMethodPhoneNumberEmailHorizontalLayout) or v51 == v32.ContactMethodPhoneNumberEmailVerticalLayout then
            v50 = "emailOrPhone";
        end;
        v54.props.authEventAnalytics.reportModalShownWithSection("verificationUpsell", "homepage", v50);
    end;
    v49.render = function(v55)
        return l_withStyle_0(function(v56)
            local l_Theme_0 = v56.Theme;
            local l_Color_0 = l_Theme_0.TextEmphasis.Color;
            local l_Font_0 = v56.Font;
            local l_Font_1 = l_Font_0.Header2.Font;
            local v61 = v56.Font.BaseSize * v56.Font.Header2.RelativeSize;
            local l_formFactor_0 = v55.props.formFactor;
            local l_Color_1 = l_Theme_0.TextDefault.Color;
            local l_Font_2 = l_Font_0.CaptionBody.Font;
            local v65 = v56.Font.BaseSize * v56.Font.CaptionBody.RelativeSize;
            local l_Top_0 = Enum.VerticalAlignment.Top;
            local l_Horizontal_0 = Enum.FillDirection.Horizontal;
            local v68 = 10;
            local v69 = 1;
            local v70 = 2;
            if v55.props.upsellCardVariation then
                v51 = v55.props.upsellCardVariation.upsellCardType;
            end;
            if (v55.props.upsellCardVariation and v55.props.upsellCardVariation.titleTextOverride ~= "") and v55.props.upsellCardVariation.bodyTextOverride ~= "" then
                v52 = v55.props.upsellCardVariation.titleTextOverride;
                v53 = v55.props.upsellCardVariation.bodyTextOverride;
            end;
            v55.contactMethodAddedToAccountCallback = function()
                v55.props.hideUpsellCard();
            end;
            v55.emailButtonClickCallback = function()
                v55.props.authEventAnalytics.reportButtonClickedWithSectionAndOrigin(v25.Context.HomepageUpsellCard, v25.Button.Email, v50, "homepage");
                v55.props.addEmailContactMethod(v55.props.networking, v55.contactMethodAddedToAccountCallback);
            end;
            local v71 = "Feature.VerificationUpsell.Description.VerificationCodeSmsFeesMayApply";
            v55.phoneButtonClickCallback = function()
                v55.props.authEventAnalytics.reportButtonClickedWithSectionAndOrigin(v25.Context.HomepageUpsellCard, v25.Button.Phone, v50, "homepage");
                l_IXPService_0:LogUserLayerExposure(v36.PhoneVerificationEntryLayer);
                if not (not v37() or not v55.props.updatePhoneVerificationText) then
                    v71 = "Feature.VerificationUpsell.Description.AddPhoneBody";
                end;
                local v72 = nil;
                if v51 == v32.ContactMethodPhoneNumberVoiceOptIn then
                    v72 = true;
                end;
                if not v55.props.usePhoneVerificationFlow then
                    v55.props.navigateDown({
                        name = v22.PhoneVerification, 
                        extraProps = {
                            onSuccessCallback = v55.contactMethodAddedToAccountCallback
                        }
                    });
                    return ;
                else
                    v55.props.addPhoneContactMethod(function()
                        v55.props.hideUpsellCard();
                        v55.props.navigateToDiscoverabilityModal({
                            isStandaloneDiscoverabilityModal = true, 
                            navigateOnActivated = v48, 
                            entryPoint = l_EntryPoints_0.HomePage
                        });
                    end, v71, v72);
                    return ;
                end;
            end;
            return v8({
                addButtonText = "Feature.ContactMethodUpsell.Action.AddPhoneNumber", 
                bodyText = "Feature.ContactMethodUpsell.Label.RecoverYourAccount", 
                titleText = "Feature.ContactMethodUpsell.Title.HomePageUpsellCardLockOutTitle", 
                addEmailInstead = "Feature.ContactUpsell.Action.AddEmailInstead", 
                addPhone = "Feature.ContactMethodUpsell.Label.AddPhone", 
                addEmail = "Feature.ContactMethodUpsell.Label.AddEmail"
            })(function(v73)
                local v74 = UDim2.new(1, 0, 0, 0);
                local v75 = UDim2.new(1, 0, 0, 28);
                local v76 = UDim2.new(0.5, 0, 0, 28);
                local v77 = 12;
                local v78 = 12;
                local l_Vertical_0 = Enum.FillDirection.Vertical;
                local v80 = UDim2.new(1, -25, 0, 0);
                local v81 = if not v24() then nil else v73.addEmail;
                if l_formFactor_0 == l_FormFactor_0.WIDE then
                    v77 = not v38() and 20 or 12;
                    l_Vertical_0 = Enum.FillDirection.Horizontal;
                    v76 = UDim2.new(1, 0, 0, 28);
                    v78 = 20;
                    l_Top_0 = Enum.VerticalAlignment.Center;
                    l_Horizontal_0 = Enum.FillDirection.Vertical;
                    v68 = 0;
                    v69 = 2;
                    v70 = 1;
                    v73.addEmail = v73.addEmailInstead;
                    v73.addPhone = v73.addButtonText;
                    v74 = UDim2.new(1, -l_Text_0.GetTextWidth(v73.addButtonText, v56.Font.CaptionHeader.Font, v56.Font.BaseSize * v56.Font.CaptionHeader.RelativeSize) - 30, 0, 0);
                    v75 = UDim2.new(0, l_Text_0.GetTextWidth(v73.addButtonText, v56.Font.CaptionHeader.Font, v56.Font.BaseSize * v56.Font.CaptionHeader.RelativeSize) + 15, 0, 28);
                end;
                local l_createElement_0 = v4.createElement;
                local v83 = "Frame";
                local v84 = {
                    Position = if not not v38() and v55.props.isCentered then UDim2.new(0.5, 0, 0, 0) else nil, 
                    AnchorPoint = if not not v38() and v55.props.isCentered then Vector2.new(0.5, 0) else nil, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 0, 
                    BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                    AutomaticSize = Enum.AutomaticSize.Y
                };
                local v85 = {
                    UISizeConstraint = v4.createElement("UISizeConstraint", {
                        MaxSize = Vector2.new(v47, math.huge)
                    }), 
                    Layout = v4.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = l_Vertical_0, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        Padding = UDim.new(0, v77)
                    }), 
                    UICorner = v4.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 12)
                    }), 
                    UIStroke = v4.createElement("UIStroke", {
                        Thickness = 1, 
                        Color = l_Theme_0.SystemPrimaryDefault.Color, 
                        Transparency = 0.7
                    }), 
                    UIPadding = v4.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 12), 
                        PaddingRight = UDim.new(0, not v38() and 12 or v78), 
                        PaddingTop = UDim.new(0, 12), 
                        PaddingBottom = UDim.new(0, 12)
                    }), 
                    IconAndTextFrame = v4.createElement("Frame", {
                        Size = v74, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1, 
                        AutomaticSize = Enum.AutomaticSize.Y
                    }, {
                        HorizontalLayout = v4.createElement("UIListLayout", {
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            FillDirection = Enum.FillDirection.Horizontal, 
                            VerticalAlignment = l_Top_0
                        }), 
                        ImageIcon = v4.createElement(l_ImageSetLabel_0, {
                            AnchorPoint = Vector2.new(1, 0.5), 
                            Size = UDim2.new(0, 40, 0, 40), 
                            Position = UDim2.new(1, 0, 0.5, 0), 
                            Image = if v51 == v32.ContactMethodPhoneNumberVoiceOptIn then v46 else v45, 
                            ImageColor3 = v56.Theme.SystemPrimaryDefault.Color, 
                            ImageTransparency = v56.Theme.SystemPrimaryDefault.Transparency, 
                            BackgroundTransparency = 1
                        }), 
                        TextFrame = v4.createElement("Frame", {
                            Size = v80, 
                            BackgroundTransparency = 1, 
                            LayoutOrder = 2, 
                            AutomaticSize = Enum.AutomaticSize.Y
                        }, {
                            VerticalLayout = v4.createElement("UIListLayout", {
                                SortOrder = Enum.SortOrder.LayoutOrder, 
                                FillDirection = Enum.FillDirection.Vertical, 
                                VerticalAlignment = Enum.VerticalAlignment.Center, 
                                Padding = UDim.new(0, 4)
                            }), 
                            UIPadding = v4.createElement("UIPadding", {
                                PaddingLeft = UDim.new(0, 12)
                            }), 
                            TitleTextLabel = v4.createElement("TextLabel", {
                                Size = v80, 
                                LayoutOrder = 1, 
                                Font = l_Font_1, 
                                BorderSizePixel = 0, 
                                Text = v52 or v73.titleText, 
                                TextColor3 = l_Color_0, 
                                TextSize = v61, 
                                TextWrapped = true, 
                                TextXAlignment = Enum.TextXAlignment.Left, 
                                BackgroundTransparency = 0, 
                                BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                                AutomaticSize = Enum.AutomaticSize.Y
                            }), 
                            BodyTextLabel = v4.createElement("TextLabel", {
                                Size = v80, 
                                LayoutOrder = 2, 
                                Font = l_Font_2, 
                                BorderSizePixel = 0, 
                                Text = v53 or v73.bodyText, 
                                TextColor3 = l_Color_1, 
                                TextSize = v65, 
                                TextWrapped = true, 
                                TextXAlignment = Enum.TextXAlignment.Left, 
                                BackgroundTransparency = 0, 
                                BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                                AutomaticSize = Enum.AutomaticSize.Y
                            })
                        })
                    })
                };
                local v86 = false;
                if v51 == v32.ContactMethodPhoneNumberEmailHorizontalLayout then
                    v86 = v4.createElement("Frame", {
                        Size = v75, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 2
                    }, {
                        OrientationLayout = v4.createElement("UIListLayout", {
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            FillDirection = l_Horizontal_0, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            Padding = UDim.new(0, 10)
                        }), 
                        UIPadding = v4.createElement("UIPadding", {
                            PaddingRight = UDim.new(0, v68)
                        }), 
                        HorizontalCallToActionButton = v4.createElement(v16, {
                            Size = v76, 
                            BackgroundTransparency = 0, 
                            Text = v73.addEmail, 
                            LayoutOrder = v69, 
                            Font = v56.Font.CaptionHeader.Font, 
                            TextSize = v56.Font.BaseSize * v56.Font.CaptionHeader.RelativeSize, 
                            onActivated = v55.emailButtonClickCallback, 
                            BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                            themeSettings = {
                                Color = l_Theme_0.SystemPrimaryContent.Color, 
                                Transparency = l_Theme_0.SystemPrimaryContent.Transparency, 
                                OnPressTransparency = 0.5, 
                                DisabledTransparency = 0.5, 
                                Text = {
                                    Color = l_Theme_0.SystemPrimaryDefault.Color, 
                                    Transparency = l_Theme_0.SystemPrimaryDefault.Transparency
                                }, 
                                Border = {
                                    Hidden = false, 
                                    Transparency = 0, 
                                    Color = l_Theme_0.SystemPrimaryDefault.Color
                                }
                            }
                        }), 
                        SecondHorizontalCallToActionButton = if not v39() then v4.createElement(v14, {
                            Size = v76, 
                            BackgroundTransparency = 0, 
                            Text = v73.addPhone, 
                            LayoutOrder = v70, 
                            fontStyle = "CaptionHeader", 
                            onActivated = v55.phoneButtonClickCallback, 
                            BackgroundColor3 = l_Theme_0.BackgroundOnHover.Color
                        }) else v4.createElement(l_Button_0, {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            size = v76, 
                            text = v73.addPhone, 
                            layoutOrder = v70, 
                            fontStyle = "CaptionHeader", 
                            onActivated = v55.phoneButtonClickCallback
                        })
                    });
                end;
                v85.FirstVariantFrame = v86;
                if not v24() then
                    v86 = v51 ~= v32.ContactMethodPhoneNumberEmailHorizontalLayout;
                else
                    v86 = false;
                    if v51 ~= v32.ContactMethodPhoneNumberEmailHorizontalLayout then
                        v86 = v51 ~= v32.ContactMethodEmail;
                    end;
                end;
                if v86 then
                    v86 = v4.createElement;
                    local v87 = "Frame";
                    local v88 = {
                        Size = v75, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 2, 
                        AutomaticSize = Enum.AutomaticSize.Y
                    };
                    local v89 = {
                        VerticalLayout = v4.createElement("UIListLayout", {
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            FillDirection = Enum.FillDirection.Vertical, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            Padding = UDim.new(0, 10)
                        }), 
                        CallToActionButton = if not v39() then v4.createElement(v14, {
                            Size = v75, 
                            BackgroundTransparency = 0, 
                            Text = v73.addButtonText, 
                            LayoutOrder = 1, 
                            fontStyle = "CaptionHeader", 
                            onActivated = v55.phoneButtonClickCallback, 
                            BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color
                        }) else v4.createElement(l_Button_0, {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            size = v75, 
                            text = v73.addButtonText, 
                            layoutOrder = 1, 
                            fontStyle = "CaptionHeader", 
                            onActivated = v55.phoneButtonClickCallback
                        })
                    };
                    local v90 = false;
                    if v51 == v32.ContactMethodPhoneNumberEmailVerticalLayout then
                        v90 = v4.createElement(v16, {
                            Size = v75, 
                            BackgroundTransparency = 0, 
                            Text = v73.addEmailInstead, 
                            LayoutOrder = 2, 
                            Font = v56.Font.CaptionHeader.Font, 
                            TextSize = v56.Font.BaseSize * v56.Font.CaptionHeader.RelativeSize, 
                            onActivated = v55.emailButtonClickCallback, 
                            BackgroundColor3 = l_Theme_0.BackgroundOnHover.Color, 
                            themeSettings = {
                                Color = l_Theme_0.SystemPrimaryContent.Color, 
                                Transparency = l_Theme_0.SystemPrimaryContent.Transparency, 
                                OnPressTransparency = 0.5, 
                                DisabledTransparency = 0.5, 
                                Text = {
                                    Color = l_Theme_0.SystemPrimaryDefault.Color, 
                                    Transparency = l_Theme_0.SystemPrimaryDefault.Transparency
                                }, 
                                Border = {
                                    Hidden = false, 
                                    Transparency = 1
                                }
                            }
                        });
                    end;
                    v89.SecondVerticalCallToActionButton = v90;
                    v86 = v86(v87, v88, v89);
                end;
                v85.SecondVariantFrame = v86;
                v86 = v24();
                if v86 then
                    v86 = false;
                    if v51 == v32.ContactMethodEmail then
                        v86 = v4.createElement("Frame", {
                            Size = v75, 
                            BackgroundTransparency = 1, 
                            LayoutOrder = 2
                        }, {
                            OrientationLayout = v4.createElement("UIListLayout", {
                                SortOrder = Enum.SortOrder.LayoutOrder, 
                                FillDirection = l_Horizontal_0, 
                                VerticalAlignment = Enum.VerticalAlignment.Center, 
                                Padding = UDim.new(0, 10)
                            }), 
                            UIPadding = v4.createElement("UIPadding", {
                                PaddingRight = UDim.new(0, v68)
                            }), 
                            HorizontalCallToActionButton = v4.createElement(l_Button_0, {
                                buttonType = l_ButtonType_0.PrimarySystem, 
                                size = v75, 
                                text = v81, 
                                layoutOrder = 1, 
                                fontStyle = "CaptionHeader", 
                                onActivated = v55.emailButtonClickCallback
                            })
                        });
                    end;
                end;
                v85.EmailVariantFrame = v86;
                return l_createElement_0(v83, v84, v85);
            end);
        end);
    end;
    v49 = v33.connectUserLayer({
        v36.PhoneVerificationEntryLayer
    }, function(v91, _)
        local v93 = v91[v36.PhoneVerificationEntryLayer] or {};
        return {
            usePhoneVerificationFlow = v93.ShouldUseLuaPhoneVerificationFlow, 
            updatePhoneVerificationText = v93.ShouldUseUpdatedPhoneVerificationText
        };
    end)((l_RoactServices_0.connect({
        authEventAnalytics = v21
    })((v5.connect(function(v94, _)
        return {
            formFactor = v94.FormFactor
        };
    end, function(v96)
        return {
            hideUpsellCard = function()
                return v96(v26("", "", ""));
            end, 
            addEmailContactMethod = function(_, v98)
                return v96(v28({
                    successCallback = v98, 
                    addEmailOver13TextKey = "Feature.ContactMethodUpsell.Label.PleaseAddEmail", 
                    addEmailTitleKey = "Feature.AccountSecurityPrompt.Action.AbortDismissForeverAddEmail", 
                    isEmailModalCalledFromHomePage = true, 
                    eventContext = "verificationUpsell", 
                    origin = "homepage", 
                    section = "addEmail"
                }));
            end, 
            addPhoneContactMethod = function(v99, v100, v101)
                return v96(v29({
                    onSuccess = v99, 
                    onCancelled = v48, 
                    onAbandoned = v48, 
                    eventContext = "verificationUpsell", 
                    origin = "homepage", 
                    shouldAutofillAndroidPhoneNumberAtLaunch = true, 
                    addPhoneDescriptionKey = v100
                }, v101));
            end, 
            navigateDown = function(v102)
                v96(v27(v102));
            end
        };
    end)(v49)))));
    HomePageUpsellCardWithIconWrapper = function(v103)
        return v4.createElement(v49, v2.Dictionary.join({
            navigateToDiscoverabilityModal = v30()
        }, v103));
    end;
    return HomePageUpsellCardWithIconWrapper;
else
    return function(v104)
        local v105 = "phone";
        local v106 = "";
        local v107 = nil;
        local v108 = nil;
        if v104.upsellCardVariation then
            v106 = v104.upsellCardVariation.upsellCardType;
            if v104.upsellCardVariation.titleTextOverride ~= "" and v104.upsellCardVariation.bodyTextOverride ~= "" then
                v107 = v104.upsellCardVariation.titleTextOverride;
                v108 = v104.upsellCardVariation.bodyTextOverride;
            end;
        end;
        if not (v106 ~= v32.ContactMethodPhoneNumberEmailHorizontalLayout) or v106 == v32.ContactMethodPhoneNumberEmailVerticalLayout then
            v105 = "emailOrPhone";
        end;
        local v109 = l_useRoactService_0(v21);
        l_useEffect_0(function()
            v109.reportModalShownWithSection("verificationUpsell", "homepage", v105);
        end, {});
        local v112, v113 = l_useUserExperiment_0({
            v36.PhoneVerificationEntryLayer
        }, function(v110)
            local v111 = v110[v36.PhoneVerificationEntryLayer] or {};
            return v111.ShouldUseLuaPhoneVerificationFlow, v111.ShouldUseUpdatedPhoneVerificationText;
        end);
        local v114 = l_useStyle_0();
        local v115 = v30();
        local v116 = l_useLocalization_0({
            addButtonText = "Feature.ContactMethodUpsell.Action.AddPhoneNumber", 
            bodyText = "Feature.ContactMethodUpsell.Label.RecoverYourAccount", 
            titleText = "Feature.ContactMethodUpsell.Title.HomePageUpsellCardLockOutTitle", 
            addEmailInstead = "Feature.ContactUpsell.Action.AddEmailInstead", 
            addPhone = "Feature.ContactMethodUpsell.Label.AddPhone", 
            addEmail = "Feature.ContactMethodUpsell.Label.AddEmail"
        });
        local v118 = l_useSelector_0(function(v117)
            return v117.FormFactor;
        end);
        local v119 = l_useDispatch_0();
        local function v120()
            return v119(v26("", "", ""));
        end;
        local function _(v121)
            return v119(v28({
                successCallback = v121, 
                addEmailOver13TextKey = "Feature.ContactMethodUpsell.Label.PleaseAddEmail", 
                addEmailTitleKey = "Feature.AccountSecurityPrompt.Action.AbortDismissForeverAddEmail", 
                isEmailModalCalledFromHomePage = true, 
                eventContext = "verificationUpsell", 
                origin = "homepage", 
                section = "addEmail"
            }));
        end;
        local function _(v123, v124, v125)
            return v119(v29({
                onSuccess = v123, 
                onCancelled = v48, 
                onAbandoned = v48, 
                eventContext = "verificationUpsell", 
                origin = "homepage", 
                shouldAutofillAndroidPhoneNumberAtLaunch = true, 
                addPhoneDescriptionKey = v124
            }, v125));
        end;
        local function _(v127)
            v119(v27(v127));
        end;
        local l_Theme_1 = v114.Theme;
        local l_Color_2 = l_Theme_1.TextEmphasis.Color;
        local l_Font_3 = v114.Font;
        local l_Font_4 = l_Font_3.Header2.Font;
        local v133 = v114.Font.BaseSize * v114.Font.Header2.RelativeSize;
        local l_Color_3 = l_Theme_1.TextDefault.Color;
        local l_Font_5 = l_Font_3.CaptionBody.Font;
        local v136 = v114.Font.BaseSize * v114.Font.CaptionBody.RelativeSize;
        local l_Top_1 = Enum.VerticalAlignment.Top;
        local l_Horizontal_1 = Enum.FillDirection.Horizontal;
        local v139 = 10;
        local v140 = 1;
        local v141 = 2;
        local function v143()
            v109.reportButtonClickedWithSectionAndOrigin(v25.Context.HomepageUpsellCard, v25.Button.Email, v105, "homepage");
            local _ = v119(v28({
                successCallback = v120, 
                addEmailOver13TextKey = "Feature.ContactMethodUpsell.Label.PleaseAddEmail", 
                addEmailTitleKey = "Feature.AccountSecurityPrompt.Action.AbortDismissForeverAddEmail", 
                isEmailModalCalledFromHomePage = true, 
                eventContext = "verificationUpsell", 
                origin = "homepage", 
                section = "addEmail"
            }));
        end;
        local v144 = "Feature.VerificationUpsell.Description.VerificationCodeSmsFeesMayApply";
        local function v148()
            v109.reportButtonClickedWithSectionAndOrigin(v25.Context.HomepageUpsellCard, v25.Button.Phone, v105, "homepage");
            l_IXPService_0:LogUserLayerExposure(v36.PhoneVerificationEntryLayer);
            if not (not v37() or not v113) then
                v144 = "Feature.VerificationUpsell.Description.AddPhoneBody";
            end;
            local v145 = nil;
            if v106 == v32.ContactMethodPhoneNumberVoiceOptIn then
                v145 = true;
            end;
            if not v112 then
                v119(v27({
                    name = v22.PhoneVerification, 
                    extraProps = {
                        onSuccessCallback = v120
                    }
                }));
                return ;
            else
                local _ = v119(v29({
                    onSuccess = function()
                        local _ = v119(v26("", "", ""));
                        v115({
                            isStandaloneDiscoverabilityModal = true, 
                            navigateOnActivated = v48, 
                            entryPoint = l_EntryPoints_0.HomePage
                        });
                    end, 
                    onCancelled = v48, 
                    onAbandoned = v48, 
                    eventContext = "verificationUpsell", 
                    origin = "homepage", 
                    shouldAutofillAndroidPhoneNumberAtLaunch = true, 
                    addPhoneDescriptionKey = v144
                }, v145));
                return ;
            end;
        end;
        local v149 = UDim2.new(1, 0, 0, 0);
        local v150 = UDim2.new(1, 0, 0, 28);
        local v151 = UDim2.new(0.5, 0, 0, 28);
        local v152 = 12;
        local v153 = 12;
        local l_Vertical_1 = Enum.FillDirection.Vertical;
        local v155 = UDim2.new(1, -25, 0, 0);
        local v156 = if not v24() then nil else v116.addEmail;
        if v118 == l_FormFactor_0.WIDE then
            v152 = not v38() and 20 or 12;
            l_Vertical_1 = Enum.FillDirection.Horizontal;
            v151 = UDim2.new(1, 0, 0, 28);
            v153 = 20;
            l_Top_1 = Enum.VerticalAlignment.Center;
            l_Horizontal_1 = Enum.FillDirection.Vertical;
            v139 = 0;
            v140 = 2;
            v141 = 1;
            v116.addEmail = v116.addEmailInstead;
            v116.addPhone = v116.addButtonText;
            v149 = UDim2.new(1, -l_Text_0.GetTextWidth(v116.addButtonText, v114.Font.CaptionHeader.Font, v114.Font.BaseSize * v114.Font.CaptionHeader.RelativeSize) - 30, 0, 0);
            v150 = UDim2.new(0, l_Text_0.GetTextWidth(v116.addButtonText, v114.Font.CaptionHeader.Font, v114.Font.BaseSize * v114.Font.CaptionHeader.RelativeSize) + 15, 0, 28);
        end;
        local l_createElement_1 = v4.createElement;
        local v158 = "Frame";
        local v159 = {
            Position = if not not v38() and v104.isCentered then UDim2.new(0.5, 0, 0, 0) else nil, 
            AnchorPoint = if not not v38() and v104.isCentered then Vector2.new(0.5, 0) else nil, 
            Size = UDim2.new(1, 0, 0, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 0, 
            BackgroundColor3 = l_Theme_1.BackgroundUIDefault.Color, 
            AutomaticSize = Enum.AutomaticSize.Y
        };
        local v160 = {
            UISizeConstraint = v4.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(v47, math.huge)
            }), 
            Layout = v4.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = l_Vertical_1, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, v152)
            }), 
            UICorner = v4.createElement("UICorner", {
                CornerRadius = UDim.new(0, 12)
            }), 
            UIStroke = v4.createElement("UIStroke", {
                Thickness = 1, 
                Color = l_Theme_1.SystemPrimaryDefault.Color, 
                Transparency = 0.7
            }), 
            UIPadding = v4.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 12), 
                PaddingRight = UDim.new(0, not v38() and 12 or v153), 
                PaddingTop = UDim.new(0, 12), 
                PaddingBottom = UDim.new(0, 12)
            }), 
            IconAndTextFrame = v4.createElement("Frame", {
                Size = v149, 
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                HorizontalLayout = v4.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = l_Top_1
                }), 
                ImageIcon = v4.createElement(l_ImageSetLabel_0, {
                    AnchorPoint = Vector2.new(1, 0.5), 
                    Size = UDim2.new(0, 40, 0, 40), 
                    Position = UDim2.new(1, 0, 0.5, 0), 
                    Image = if v106 == v32.ContactMethodPhoneNumberVoiceOptIn then v46 else v45, 
                    ImageColor3 = v114.Theme.SystemPrimaryDefault.Color, 
                    ImageTransparency = v114.Theme.SystemPrimaryDefault.Transparency, 
                    BackgroundTransparency = 1
                }), 
                TextFrame = v4.createElement("Frame", {
                    Size = v155, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2, 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, {
                    VerticalLayout = v4.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        Padding = UDim.new(0, 4)
                    }), 
                    UIPadding = v4.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 12)
                    }), 
                    TitleTextLabel = v4.createElement("TextLabel", {
                        Size = v155, 
                        LayoutOrder = 1, 
                        Font = l_Font_4, 
                        BorderSizePixel = 0, 
                        Text = v107 or v116.titleText, 
                        TextColor3 = l_Color_2, 
                        TextSize = v133, 
                        TextWrapped = true, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        BackgroundTransparency = 0, 
                        BackgroundColor3 = l_Theme_1.BackgroundUIDefault.Color, 
                        AutomaticSize = Enum.AutomaticSize.Y
                    }), 
                    BodyTextLabel = v4.createElement("TextLabel", {
                        Size = v155, 
                        LayoutOrder = 2, 
                        Font = l_Font_5, 
                        BorderSizePixel = 0, 
                        Text = v108 or v116.bodyText, 
                        TextColor3 = l_Color_3, 
                        TextSize = v136, 
                        TextWrapped = true, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        BackgroundTransparency = 0, 
                        BackgroundColor3 = l_Theme_1.BackgroundUIDefault.Color, 
                        AutomaticSize = Enum.AutomaticSize.Y
                    })
                })
            })
        };
        local v161 = false;
        if v106 == v32.ContactMethodPhoneNumberEmailHorizontalLayout then
            v161 = v4.createElement("Frame", {
                Size = v150, 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, {
                OrientationLayout = v4.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = l_Horizontal_1, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = UDim.new(0, 10)
                }), 
                UIPadding = v4.createElement("UIPadding", {
                    PaddingRight = UDim.new(0, v139)
                }), 
                HorizontalCallToActionButton = v4.createElement(v16, {
                    Size = v151, 
                    BackgroundTransparency = 0, 
                    Text = v116.addEmail, 
                    LayoutOrder = v140, 
                    Font = v114.Font.CaptionHeader.Font, 
                    TextSize = v114.Font.BaseSize * v114.Font.CaptionHeader.RelativeSize, 
                    onActivated = v143, 
                    BackgroundColor3 = l_Theme_1.BackgroundUIDefault.Color, 
                    themeSettings = {
                        Color = l_Theme_1.SystemPrimaryContent.Color, 
                        Transparency = l_Theme_1.SystemPrimaryContent.Transparency, 
                        OnPressTransparency = 0.5, 
                        DisabledTransparency = 0.5, 
                        Text = {
                            Color = l_Theme_1.SystemPrimaryDefault.Color, 
                            Transparency = l_Theme_1.SystemPrimaryDefault.Transparency
                        }, 
                        Border = {
                            Hidden = false, 
                            Transparency = 0, 
                            Color = l_Theme_1.SystemPrimaryDefault.Color
                        }
                    }
                }), 
                SecondHorizontalCallToActionButton = if not v39() then v4.createElement(v14, {
                    Size = v151, 
                    BackgroundTransparency = 0, 
                    Text = v116.addPhone, 
                    LayoutOrder = v141, 
                    fontStyle = "CaptionHeader", 
                    onActivated = v148, 
                    BackgroundColor3 = l_Theme_1.BackgroundOnHover.Color
                }) else v4.createElement(l_Button_0, {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    size = v151, 
                    text = v116.addPhone, 
                    layoutOrder = v141, 
                    fontStyle = "CaptionHeader", 
                    onActivated = v148
                })
            });
        end;
        v160.FirstVariantFrame = v161;
        if not v24() then
            v161 = v106 ~= v32.ContactMethodPhoneNumberEmailHorizontalLayout;
        else
            v161 = false;
            if v106 ~= v32.ContactMethodPhoneNumberEmailHorizontalLayout then
                v161 = v106 ~= v32.ContactMethodEmail;
            end;
        end;
        if v161 then
            v161 = v4.createElement;
            local v162 = "Frame";
            local v163 = {
                Size = v150, 
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                AutomaticSize = Enum.AutomaticSize.Y
            };
            local v164 = {
                VerticalLayout = v4.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = UDim.new(0, 10)
                }), 
                CallToActionButton = if not v39() then v4.createElement(v14, {
                    Size = v150, 
                    BackgroundTransparency = 0, 
                    Text = v116.addButtonText, 
                    LayoutOrder = 1, 
                    fontStyle = "CaptionHeader", 
                    onActivated = v148, 
                    BackgroundColor3 = l_Theme_1.BackgroundUIDefault.Color
                }) else v4.createElement(l_Button_0, {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    size = v150, 
                    text = v116.addButtonText, 
                    layoutOrder = 1, 
                    fontStyle = "CaptionHeader", 
                    onActivated = v148
                })
            };
            local v165 = false;
            if v106 == v32.ContactMethodPhoneNumberEmailVerticalLayout then
                v165 = v4.createElement(v16, {
                    Size = v150, 
                    BackgroundTransparency = 0, 
                    Text = v116.addEmailInstead, 
                    LayoutOrder = 2, 
                    Font = v114.Font.CaptionHeader.Font, 
                    TextSize = v114.Font.BaseSize * v114.Font.CaptionHeader.RelativeSize, 
                    onActivated = v143, 
                    BackgroundColor3 = l_Theme_1.BackgroundOnHover.Color, 
                    themeSettings = {
                        Color = l_Theme_1.SystemPrimaryContent.Color, 
                        Transparency = l_Theme_1.SystemPrimaryContent.Transparency, 
                        OnPressTransparency = 0.5, 
                        DisabledTransparency = 0.5, 
                        Text = {
                            Color = l_Theme_1.SystemPrimaryDefault.Color, 
                            Transparency = l_Theme_1.SystemPrimaryDefault.Transparency
                        }, 
                        Border = {
                            Hidden = false, 
                            Transparency = 1
                        }
                    }
                });
            end;
            v164.SecondVerticalCallToActionButton = v165;
            v161 = v161(v162, v163, v164);
        end;
        v160.SecondVariantFrame = v161;
        v161 = v24();
        if v161 then
            v161 = false;
            if v106 == v32.ContactMethodEmail then
                v161 = v4.createElement("Frame", {
                    Size = v150, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2
                }, {
                    OrientationLayout = v4.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = l_Horizontal_1, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        Padding = UDim.new(0, 10)
                    }), 
                    UIPadding = v4.createElement("UIPadding", {
                        PaddingRight = UDim.new(0, v139)
                    }), 
                    HorizontalCallToActionButton = v4.createElement(l_Button_0, {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        size = v150, 
                        text = v156, 
                        layoutOrder = 1, 
                        fontStyle = "CaptionHeader", 
                        onActivated = v143
                    })
                });
            end;
        end;
        v160.EmailVariantFrame = v161;
        return l_createElement_1(v158, v159, v160);
    end;
end;
