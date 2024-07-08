local l_GuiService_0 = game:GetService("GuiService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local _ = require(l_CorePackages_0.Workspace.Packages.Navigation);
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.WebViewProtocol).default;
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local l_createLazyComponent_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Components.createLazyComponent;
local v9 = require(l_CorePackages_0.Workspace.Packages.TenFootUiCommon);
local l_ScreenKind_0 = v9.TenFootUiRNTypes.ScreenKind;
local l_GlobalNavDisplayOption_0 = v9.TenFootUiRNTypes.GlobalNavDisplayOption;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v13 = require(l_Modules_0.LuaApp.Navigation.wrapAppPageForRoactNavigation);
local v14 = require(l_Modules_0.LuaApp.Navigation.wrapPageInScreenGui);
local v15 = require(l_Modules_0.LuaApp.Navigation.createMainSwitchNavigator);
local v16 = require(l_Modules_0.LuaApp.Navigation.MainTabsRouteConfig);
local l_Navigator_0 = require(l_Modules_0.LuaApp.Components.ContactImporter.api).Navigator;
local v18 = require(l_Modules_0.LuaApp.FlagSettings);
local v19 = require(l_Modules_0.LuaApp.Constants);
local v20 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local v21 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v22 = require(l_Modules_0.LuaApp.Enum.WebViewWindow);
local v23 = require(l_Modules_0.LuaApp.AppPageProperties);
local v24 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local _, v26 = require(l_Modules_0.LuaApp.GetIABottomBarItems)();
local v27 = {
    MorePage = require(l_Modules_0.LuaApp.Components.More.MorePage), 
    AboutPage = require(l_Modules_0.LuaApp.Components.More.AboutPage), 
    SafetySupportPage = require(l_Modules_0.LuaApp.Components.More.SafetySupportPage), 
    SettingsPage = require(l_Modules_0.LuaApp.Components.More.SettingsPage), 
    AccessibilityPage = require(l_Modules_0.LuaApp.Components.More.AccessibilityPage), 
    LicensingPage = require(l_Modules_0.LuaApp.Components.More.LicensingPage), 
    DevSubsPage = require(l_Modules_0.LuaApp.Components.More.DevSubsPage), 
    TencentNoticeCenterPage = require(l_Modules_0.Luobu.Components.More.TencentNoticeCenter.TencentNoticeCenterPage), 
    TencentNoticeContentPage = require(l_Modules_0.Luobu.Components.More.TencentNoticeCenter.TencentNoticeContentPage), 
    CrossDeviceLoginPage = require(l_Modules_0.LuaApp.Components.Authentication.CrossDeviceLogin.CrossDeviceLoginPage)
};
local v28 = {
    CharacterSelectionPage = require(l_Modules_0.LuaApp.Components.Authentication.CharacterSelectPage), 
    UsernameSelectionPage = require(l_Modules_0.LuaApp.Components.Authentication.UsernameSelectionPage), 
    PasswordSelectionPage = require(l_Modules_0.LuaApp.Components.Authentication.PasswordSelectionPage), 
    TwoStepPage = require(l_Modules_0.LuaApp.Components.Authentication.TwoStepPage), 
    LoginView = require(l_Modules_0.LuaApp.Components.Authentication.LoginView), 
    StartupPage = require(l_Modules_0.LuaApp.Components.Authentication.StartupPage), 
    U13BlockPage = require(l_Modules_0.LuaApp.Components.Authentication.U13BlockPage), 
    LandingPage = require(l_Modules_0.LuaApp.Components.Authentication.LandingPage), 
    LuobuLandingPage = require(l_Modules_0.Luobu.Components.Authentication.LuobuLandingPage), 
    BirthdayPage = require(l_Modules_0.LuaApp.Components.Authentication.BirthdayPage), 
    SinglePageSignUp = require(l_Modules_0.LuaApp.Components.Authentication.SinglePageSignUp), 
    LuobuSignUpPage = require(l_Modules_0.Luobu.Components.Authentication.LuobuSignUpPage), 
    AddAuthMethodPage = require(l_Modules_0.LuaApp.Components.Authentication.AddAuthMethodPage), 
    CaptchaPageBrowserServiceWrapper = require(l_Modules_0.LuaApp.Components.CaptchaPageBrowserServiceWrapper)
};
local v29 = require(l_Modules_0.LuaApp.Components.ExperienceDetails.Navigation.ExperienceDetailsSelector);
local v30 = require(l_Modules_0.LuaApp.Components.Passes.PassesPage);
local l_InviteLinkExpiredModal_0 = require(l_Modules_0.LuaApp.Components.InviteLinkExpiredModal.api).InviteLinkExpiredModal;
local l_ShareLinkInvalidModal_0 = require(l_Modules_0.LuaApp.Components.ShareLinkInvalidModal.api).ShareLinkInvalidModal;
local l_ProfileQRCodeEntryPoint_0 = require(l_Modules_0.LuaApp.Components.ProfileQRCodePage.api).ProfileQRCodeEntryPoint;
local l_RootScreen_0 = require(l_Modules_0.LuaApp.Components.SocialMessageToast.api).RootScreen;
local l_EditUsernameWrapper_0 = require(l_CorePackages_0.Workspace.Packages.EditProfile).EditUsernameWrapper;
local l_AccountSelectorPeekView_0 = require(l_CorePackages_0.Workspace.Packages.AccountSelector).AccountSelectorPeekView;
local l_AccountSwitchingAddAccountPeekView_0 = require(l_CorePackages_0.Workspace.Packages.AccountSelector).AccountSwitchingAddAccountPeekView;
local v38 = require(l_CorePackages_0.Workspace.Packages.VirtualEvents);
local v39 = require(l_CorePackages_0.Workspace.Packages.VerifiedBadges);
local v40 = require(l_Modules_0.LuaApp.Components.VirtualEvents.EventDetailsWrapper);
local v41 = require(l_Modules_0.LuaApp.Components.VirtualEvents.EventNotificationsModalWrapper);
local v42 = require(l_Modules_0.LuaApp.Components.Search.SearchPage);
local v43 = require(l_Modules_0.LuaApp.Components.YouTubePageWrapper);
local v44 = require(l_Modules_0.LuaApp.Components.GenericWebPageWrapper);
local v45 = require(l_Modules_0.LuaApp.Components.GenericNativePageWrapper);
local v46 = require(l_Modules_0.ShareTargetGame.Components.ShareTargetGameEntrypoint);
local v47 = require(l_Modules_0.LuaApp.Components.Authentication.WeChatLoginWrapper);
local v48 = require(l_Modules_0.LuaApp.Components.NativeViewUserProfileWrapper);
local v49 = require(l_Modules_0.LuaApp.Components.NativeViewProfileWrapper);
local v50 = require(l_Modules_0.LuaApp.Components.NativePageWithUrlWrapper);
local v51 = require(l_Modules_0.LuaApp.Components.NativeReportAbuseWrapper);
local v52 = require(l_Modules_0.LuaApp.Components.NativePurchaseRobuxPageWrapper);
local v53 = require(l_Modules_0.LuaApp.Components.More.AccountInfoPage);
local v54 = require(l_Modules_0.LuaApp.Components.ShareSheetWrapper);
local v55 = require(l_Modules_0.LuaApp.Components.SdkShareWrapper);
local v56 = require(l_Modules_0.Luobu.Components.More.TencentHelp.TencentHelpWrapper);
local v57 = require(l_Modules_0.LuaApp.Components.Authentication.VerificationUpsell.PhoneVerificationNativeWrapper);
local v58 = require(l_Modules_0.LuaApp.Components.SettingsNativeWrapper);
local v59 = require(l_Modules_0.LuaApp.Components.FriendsLanding.FriendsLandingUniversalAppWrapper.Container);
local v60 = require(l_Modules_0.LuaApp.Components.FriendsLanding.AddFriendsUniversalAppWrapper);
local v61 = require(l_Modules_0.LuaApp.Components.Profile.ProfileUniversalAppWrapper.Container);
local v62 = require(l_Modules_0.LuaApp.Components.ContactImporter.ContactsListUniversalAppWrapper);
local v63 = require(l_Modules_0.LuaApp.Components.More.ParentVerificationPage);
local v64 = require(l_Modules_0.LuaApp.Components.WebViewStub);
local v65 = require(l_Modules_0.LuaApp.Components.WebView.AppWebView);
local v66 = require(l_Modules_0.LuaApp.Components.Challenge.HybridOverlayPage);
local v67 = require(l_Modules_0.LuaApp.Components.Challenge.HybridWebView);
local v68 = require(l_Modules_0.LuaApp.Components.Challenge.NativeWrapper);
local l_ChallengeDialogModalContainer_0 = require(l_CorePackages_0.Workspace.Packages.ChallengeDialog).ChallengeDialogModalContainer;
local v70 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.AvatarExperienceWrapper);
local l_IDVUpsellContainer_0 = require(l_CorePackages_0.Workspace.Packages.AmpUpsell).IDVUpsellContainer;
local v72 = require(l_Modules_0.LuaApp.Components.ExperienceGuidelines.ExperienceGuidelinesExplained);
local v73 = require(l_Modules_0.LuaApp.Components.AgeVerification.AgeVerificationModal);
local v74 = require(l_Modules_0.LuaApp.Components.RobuxUpsell.RobuxUpsellContainer);
local v75 = require(l_Modules_0.LuaApp.Components.BuyRobux.BuyRobuxContainer);
local l_SquadMainStackNavigator_0 = require(l_CorePackages_0.Workspace.Packages.Squads).Navigators.SquadMainStackNavigator;
local v77 = require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportContainer);
local v78 = require(l_Modules_0.LuaApp.Components.Games.SponsoredTooltipPeekView);
local l_InfoPeekView_0 = require(l_CorePackages_0.Workspace.Packages.AppBlox).InfoPeekView;
local v80 = require(l_Modules_0.LuaApp.Components.Games.GamesList);
local v81 = require(l_Modules_0.LuaApp.Components.AmpUpsell.AccountSettingsUpsellWrapper);
local v82 = require(l_Modules_0.LuaApp.Components.AmpUpsell.AmpWizardContainerWrapper);
local l_ProfilePlatformEntrypoint_0 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform).ProfilePlatformEntrypoint;
local v84 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v85 = {
    FFlagEnableLuaLoginRevamp = require(l_Modules_0.LuaApp.Flags.FFlagEnableLuaLoginRevamp), 
    FFlagFetchUserNameOnCloseAccountInfo = require(l_Modules_0.LuaApp.Flags.FFlagFetchUserNameOnCloseAccountInfo), 
    GetFFlagEnableUnifiedStaticWebViews = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableUnifiedStaticWebViews), 
    GetFFlagLuaAppEnableSquadPage = v84.GetFFlagLuaAppEnableSquadPage, 
    GetFFlagLuaAppUseSettingsNativeWrapper = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUseSettingsNativeWrapper), 
    GetFFlagLuaAppLuaBuyRobuxPage = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppLuaBuyRobuxPage), 
    GetFFlagEnableAccountSettingsUpsell = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableAccountSettingsUpsell), 
    GetFFlagEnableAmpUpsellWizard = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableAmpUpsellWizard), 
    GetFFlagLuafiedReportEntryPoints = v84.GetFFlagLuafiedReportEntryPoints, 
    GetFFlagEnableAmpIDVUpsellSupport = require(l_CorePackages_0.Workspace.Packages.AmpUpsell).GetFFlagEnableAmpIDVUpsellSupport, 
    GetFFlagLuaAppChallengeDialogContainerPageEnabled = require(l_CorePackages_0.Workspace.Packages.ChallengeDialog).GetFFlagLuaAppChallengeDialogContainerPageEnabled, 
    GetFFlagLuaAppNewStreamNotificationsEnabled = v84.GetFFlagLuaAppNewStreamNotificationsEnabled, 
    GetFFlagEnableSponsoredAdsGameCarouselTooltip = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableSponsoredAdsGameCarouselTooltip), 
    GetFFlagLuaAppChallengeNativeWrapperEnabled = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppChallengeNativeWrapperEnabled), 
    GetFFlagEnableTransparentNativeChallengeWrapper = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableTransparentNativeChallengeWrapper), 
    FFlagProfilePlatformDevFlag = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagProfilePlatformDevFlag
};
local v86 = require(l_Modules_0.LuaApp.Flags.UseGameDetailsPeekView);
local v87 = game:DefineFastFlag("ModerationVerificationEnabled2", false);
local l_FFlagUnifyNavigationGraph_0 = v84.FFlagUnifyNavigationGraph;
local function v92(v89)
    local v90 = (v23[v89] or {}).renderUnderlyingPage or false;
    local l_v90_0 = v90;
    if not ((((((((not v86() or v89 ~= l_AppPage_0.GameDetail) and v89 ~= v24.ItemDetails) and v89 ~= l_AppPage_0.ProfilePeekView) and v89 ~= l_AppPage_0.SocialMessageToast) and v89 ~= l_AppPage_0.AccountSelectorPeekView) and v89 ~= l_AppPage_0.AccountSwitchingAddAccountPeekView) and v89 ~= l_AppPage_0.AvatarExperienceWrapperTransparent) and (not v85.GetFFlagEnableSponsoredAdsGameCarouselTooltip() or v89 ~= l_AppPage_0.SponsoredTooltipPeekView)) or v89 == l_AppPage_0.InfoPeekView then
        l_v90_0 = false;
    end;
    return {
        transparent = v90, 
        overlayEnabled = l_v90_0
    };
end;
return function(v93)
    local v286 = {
        [l_AppPage_0.None] = function()
            return nil;
        end, 
        [l_AppPage_0.Startup] = not l_FFlagUnifyNavigationGraph_0 and function(v94)
            return v14(v28.StartupPage, l_AppPage_0.Startup, v94);
        end or nil, 
        [l_AppPage_0.U13Block] = function(v95)
            return v14(v28.U13BlockPage, l_AppPage_0.U13Block, v95);
        end, 
        [l_AppPage_0.Login] = not l_FFlagUnifyNavigationGraph_0 and function(v96)
            if not v18.LuaAppLoginUIEnabled() then
                return nil;
            else
                return v14(v28.LoginView, l_AppPage_0.Login, v96);
            end;
        end or nil, 
        [l_AppPage_0.LoginV2] = function(v97)
            if not v85.FFlagEnableLuaLoginRevamp then
                return nil;
            else
                return v14(require(l_CorePackages_0.Workspace.Packages.LoginV2).Components.LoginV2Container, l_AppPage_0.Login, v97);
            end;
        end, 
        [l_AppPage_0.TwoStep] = function(v98)
            if not v18.LuaAppLoginUIEnabled() then
                return nil;
            else
                return v14(v28.TwoStepPage, l_AppPage_0.TwoStep, v98);
            end;
        end, 
        [l_AppPage_0.CharacterSelectionPage] = function(v99)
            return v14(v28.CharacterSelectionPage, l_AppPage_0.CharacterSelectionPage, v99);
        end, 
        [l_AppPage_0.UsernameSelectionPage] = function(v100)
            return v14(v28.UsernameSelectionPage, l_AppPage_0.UsernameSelectionPage, v100);
        end, 
        [l_AppPage_0.PasswordSelectionPage] = function(v101)
            return v14(v28.PasswordSelectionPage, l_AppPage_0.PasswordSelectionPage, v101);
        end, 
        [l_AppPage_0.SinglePageSignUp] = not l_FFlagUnifyNavigationGraph_0 and function(v102)
            return v14(v28.SinglePageSignUp, l_AppPage_0.SinglePageSignUp, v102);
        end or nil, 
        [l_AppPage_0.LuobuSignUpPage] = function(v103)
            return v14(v28.LuobuSignUpPage, l_AppPage_0.LuobuSignUpPage, v103);
        end, 
        [l_AppPage_0.WeChatLoginWrapper] = function(v104)
            if not v18.WeChatLoginEnabled() then
                return nil;
            else
                return v14(v47, l_AppPage_0.WeChatLoginWrapper, v104);
            end;
        end, 
        [l_AppPage_0.GamesList] = not l_FFlagUnifyNavigationGraph_0 and function(v105)
            return v14(v80, l_AppPage_0.GamesList, v105);
        end or nil, 
        [l_AppPage_0.SearchPage] = not l_FFlagUnifyNavigationGraph_0 and function(v106, v107, v108)
            local v109 = v108 and v108.omniSearchInfo;
            return v14(v42, l_AppPage_0.SearchPage, v106, not not v107 and {
                searchUuid = v107, 
                omniSearchUuid = v109 and v109.omniSearchUuid
            } or nil);
        end or nil, 
        [l_AppPage_0.GameDetail] = function(v110)
            return v14(v29, l_AppPage_0.GameDetail, v110);
        end, 
        [l_AppPage_0.ExperienceDetail] = not l_FFlagUnifyNavigationGraph_0 and function(v111)
            return v14(v29, l_AppPage_0.ExperienceDetail, v111);
        end or nil, 
        [l_AppPage_0.ShareGameToChat] = function(v112, v113)
            return v14(v46, l_AppPage_0.ShareGameToChat, v112, {
                placeId = v113
            });
        end, 
        [l_AppPage_0.Landing] = function(v114)
            if not v18.LuaAuthEnabledForLuobu() or not v93.useLuobuAuthentication() then
                return v14(v28.LandingPage, l_AppPage_0.Landing, v114);
            else
                return v14(v28.LuobuLandingPage, l_AppPage_0.Landing, v114);
            end;
        end, 
        [l_AppPage_0.Birthday] = function(v115)
            return v14(v28.BirthdayPage, l_AppPage_0.Birthday, v115);
        end, 
        [l_AppPage_0.About] = not l_FFlagUnifyNavigationGraph_0 and function(v116)
            return v14(v27.AboutPage, l_AppPage_0.About, v116);
        end or nil, 
        [l_AppPage_0.SafetySupport] = function(v117)
            return v14(v27.SafetySupportPage, l_AppPage_0.SafetySupport, v117);
        end, 
        [l_AppPage_0.Settings] = not l_FFlagUnifyNavigationGraph_0 and function(v118)
            return v14(v27.SettingsPage, l_AppPage_0.Settings, v118);
        end or nil, 
        [l_AppPage_0.Accessibility] = function(v119)
            return v14(v27.AccessibilityPage, l_AppPage_0.Accessibility, v119);
        end, 
        [l_AppPage_0.Licensing] = function(v120)
            return v14(v27.LicensingPage, l_AppPage_0.Licensing, v120);
        end, 
        [l_AppPage_0.DevSubs] = function(v121, v122)
            return v14(v27.DevSubsPage, l_AppPage_0.DevSubs, v121, v122 and {
                selectedGame = v122
            });
        end, 
        [l_AppPage_0.EventDetails] = function(v123, v124, v125)
            return v14(v40, l_AppPage_0.EventDetails, v123, v3.Dictionary.join(v125 or {}, {
                virtualEventId = v124
            }));
        end, 
        [l_AppPage_0.AccountSelectorPeekView] = function(v126, _, v128)
            return v14(l_AccountSelectorPeekView_0, l_AppPage_0.AccountSelectorPeekView, v126, v128);
        end, 
        [l_AppPage_0.AccountSwitchingAddAccountPeekView] = function(v129, _, v131)
            return v14(l_AccountSwitchingAddAccountPeekView_0, l_AppPage_0.AccountSwitchingAddAccountPeekView, v129, v131);
        end, 
        [l_AppPage_0.ShareVirtualEventModal] = function(v132, _, v134)
            return v14(v38.ShareEventModal, l_AppPage_0.ShareVirtualEventModal, v132, v134);
        end, 
        [l_AppPage_0.EventNotificationsModal] = function(v135, _, v137)
            return v14(v41, l_AppPage_0.EventNotificationsModal, v135, v137);
        end, 
        [l_AppPage_0.TencentHelp] = function(v138, v139, v140)
            return v2.createElement(v56, {
                navigationProps = v138, 
                detail = v139, 
                extraProps = v140
            });
        end, 
        [l_AppPage_0.TencentNoticeCenter] = function(v141)
            return v14(v27.TencentNoticeCenterPage, l_AppPage_0.TencentNoticeCenter, v141);
        end, 
        [l_AppPage_0.TencentNoticeContent] = function(v142, _, v144)
            return v14(v27.TencentNoticeContentPage, l_AppPage_0.TencentNoticeContent, v142, v144);
        end, 
        [l_AppPage_0.CrossDeviceLogin] = not l_FFlagUnifyNavigationGraph_0 and function(v145, _, v147)
            return v14(v27.CrossDeviceLoginPage, l_AppPage_0.CrossDeviceLogin, v145, v147 or {});
        end or nil, 
        [l_AppPage_0.GenericWebPage] = function(v148, v149, v150)
            if not l_default_0.isEnabled() or v85.GetFFlagEnableUnifiedStaticWebViews() then
                return v2.createElement(v44, {
                    isVisible = v148.isVisible, 
                    DisplayOrder = v148.displayOrder, 
                    url = v149, 
                    title = v150.title, 
                    titleKey = v150.titleKey, 
                    searchParams = v150.searchParams, 
                    transitionAnimation = not not v150 and v150.transitionAnimation or nil, 
                    onClose = not not v150 and v150.onClose or nil
                });
            else
                return v2.createElement(v64, {
                    isVisible = v148.isVisible, 
                    DisplayOrder = v148.displayOrder
                });
            end;
        end, 
        [l_AppPage_0.GenericOpaqueWebPage] = function(v151, v152, v153)
            return v2.createElement(v44, {
                isVisible = v151.isVisible, 
                DisplayOrder = v151.displayOrder, 
                url = v152, 
                title = v153.title, 
                titleKey = v153.titleKey, 
                searchParams = v153.searchParams, 
                transitionAnimation = not not v153 and v153.transitionAnimation or nil, 
                onClose = not not v153 and v153.onClose or nil
            });
        end, 
        [l_AppPage_0.SettingsSubPage] = function(v154, v155, v156)
            if not v85.GetFFlagLuaAppUseSettingsNativeWrapper() then
                if not l_default_0.isEnabled() or v85.GetFFlagEnableUnifiedStaticWebViews() then
                    return v2.createElement(v50, {
                        isVisible = v154.isVisible, 
                        DisplayOrder = v154.displayOrder, 
                        notificationType = v156.notificationType or v20.OPEN_SETTINGS_WEBVIEW, 
                        url = v155, 
                        title = v156.title, 
                        titleKey = v156.titleKey, 
                        searchParams = if not v85.GetFFlagEnableUnifiedStaticWebViews() then nil else v156.searchParams, 
                        transitionAnimation = not not v156 and v156.transitionAnimation or nil, 
                        onClose = not not v156 and v156.onClose or nil
                    });
                else
                    return v2.createElement(v64, {
                        isVisible = v154.isVisible, 
                        DisplayOrder = v154.displayOrder
                    });
                end;
            else
                return v2.createElement(v58, {
                    url = v155, 
                    titleKey = v156.titleKey, 
                    windowCloseCallback = not not v156 and v156.onClose or nil, 
                    isVisible = v154.isVisible, 
                    displayOrder = v154.displayOrder
                });
            end;
        end, 
        [l_AppPage_0.YouTubePlayer] = function(v157, v158, v159)
            if not l_default_0.isEnabled() or v85.GetFFlagEnableUnifiedStaticWebViews() then
                return v2.createElement(v43, {
                    isVisible = v157.isVisible, 
                    DisplayOrder = v157.displayOrder, 
                    url = v158, 
                    title = v159.title, 
                    transitionAnimation = not not v159 and v159.transitionAnimation or nil
                });
            else
                return v2.createElement(v64, {
                    isVisible = v157.isVisible, 
                    DisplayOrder = v157.displayOrder
                });
            end;
        end, 
        [l_AppPage_0.ScanQrCode] = function(v160, _, v162)
            return v2.createElement(v45, {
                isVisible = v160.isVisible, 
                DisplayOrder = v160.displayOrder, 
                transitionAnimation = not not v162 and v162.transitionAnimation or nil, 
                notificationType = v20.SCAN_QR_CODE
            });
        end, 
        [l_AppPage_0.ProfilePeekView] = function(v163)
            return v14(v61, l_AppPage_0.ProfilePeekView, v163);
        end, 
        [l_AppPage_0.ProfilePlatform] = if not v85.FFlagProfilePlatformDevFlag then nil else function(v164)
            return v14(l_ProfilePlatformEntrypoint_0, l_AppPage_0.ProfilePlatform, v164);
        end, 
        [l_AppPage_0.AvatarExperienceWrapper] = function(v165, _, v167)
            return v14(v70, l_AppPage_0.AvatarExperienceWrapper, v165, v167);
        end, 
        [l_AppPage_0.AvatarExperienceWrapperTransparent] = function(v168, _, v170)
            return v14(v70, l_AppPage_0.AvatarExperienceWrapperTransparent, v168, v170);
        end, 
        [l_AppPage_0.BuildersClub] = function(v171, _, v173)
            if not l_default_0.isEnabled() then
                return v2.createElement(v45, {
                    isVisible = v171.isVisible, 
                    DisplayOrder = v171.displayOrder, 
                    notificationType = v20.OPEN_BUILDERS_CLUB, 
                    titleTextLocalizationKey = "CommonUI.Features.Label.Premium", 
                    transitionAnimation = not not v173 and v173.transitionAnimation or nil
                });
            elseif not v85.GetFFlagEnableUnifiedStaticWebViews() then
                return v2.createElement(v64, {
                    isVisible = v171.isVisible, 
                    DisplayOrder = v171.displayOrder
                });
            else
                return v2.createElement(v65, {
                    url = v21.fromString("www:premium/membership")(), 
                    titleKey = "CommonUI.Features.Label.Premium", 
                    transitionAnimation = v173.transitionAnimation, 
                    overlayProps = {
                        isVisible = v171.isVisible, 
                        DisplayOrder = v171.displayOrder
                    }
                });
            end;
        end, 
        [l_AppPage_0.PurchaseRobux] = not l_FFlagUnifyNavigationGraph_0 and function(v174, _, v176)
            if not v85.GetFFlagLuaAppLuaBuyRobuxPage() or not l_IsVRAppBuild_0() then
                return v2.createElement(v52, {
                    url = if not v85.GetFFlagEnableUnifiedStaticWebViews() then nil else v21.fromString("www:Upgrades/Robux.aspx")(), 
                    isVisible = v174.isVisible, 
                    DisplayOrder = v174.displayOrder, 
                    transitionAnimation = not not v176 and v176.transitionAnimation or nil
                });
            else
                return v14(v75, l_AppPage_0.PurchaseRobux, v174, v176);
            end;
        end or nil, 
        [l_AppPage_0.Payment] = function(v177, v178, v179)
            return v2.createElement(v52, {
                url = if not v85.GetFFlagEnableUnifiedStaticWebViews() then nil else v21.fromString("www:upgrades/paymentmethods?ap={productId}")({
                    productId = v178
                }), 
                isVisible = v177.isVisible, 
                DisplayOrder = v177.displayOrder, 
                transitionAnimation = not not v179 and v179.transitionAnimation or nil
            });
        end, 
        [l_AppPage_0.Notifications] = function(v180, _, v182)
            if not l_default_0.isEnabled() then
                return v2.createElement(v45, {
                    isVisible = v180.isVisible, 
                    DisplayOrder = v180.displayOrder, 
                    notificationType = v20.VIEW_NOTIFICATIONS, 
                    transitionAnimation = not not v182 and v182.transitionAnimation or nil, 
                    titleTextLocalizationKey = "Feature.AccountSettings.Heading.Tab.Notifications", 
                    onClose = not not v182 and v182.onClose or nil
                });
            elseif not v85.GetFFlagEnableUnifiedStaticWebViews() then
                return v2.createElement(v64, {
                    isVisible = v180.isVisible, 
                    DisplayOrder = v180.displayOrder
                });
            else
                return v2.createElement(v65, {
                    url = v21.fromString("www:notificationstream/embedded")(), 
                    titleKey = "Feature.AccountSettings.Heading.Tab.Notifications", 
                    windowType = v22.Dialog, 
                    transitionAnimation = v182.transitionAnimation, 
                    searchParams = v182.searchParams, 
                    windowCloseCallback = v182.onClose, 
                    overlayProps = {
                        isVisible = v180.isVisible, 
                        DisplayOrder = v180.displayOrder
                    }
                });
            end;
        end, 
        [l_AppPage_0.LogoutConfirmation] = function(v183, _, v185)
            return v2.createElement(v45, {
                isVisible = v183.isVisible, 
                DisplayOrder = v183.displayOrder, 
                notificationType = v20.ACTION_LOG_OUT, 
                transitionAnimation = not not v185 and v185.transitionAnimation or nil
            });
        end, 
        [l_AppPage_0.AddFriends] = function(v186, _, v188)
            if not l_default_0.isEnabled() then
                return v2.createElement(v45, {
                    isVisible = v186.isVisible, 
                    DisplayOrder = v186.displayOrder, 
                    notificationType = v20.UNIVERSAL_FRIENDS, 
                    transitionAnimation = not not v188 and v188.transitionAnimation or nil, 
                    titleTextLocalizationKey = "CommonUI.Features.Label.Friends", 
                    onClose = not not v188 and v188.onClose or nil
                });
            elseif not v85.GetFFlagEnableUnifiedStaticWebViews() then
                return v2.createElement(v64, {
                    isVisible = v186.isVisible, 
                    DisplayOrder = v186.displayOrder
                });
            else
                return v2.createElement(v65, {
                    url = v21.fromString("www:users/friends#/friend-requests?onlyShowContents=true")(), 
                    titleKey = "CommonUI.Features.Label.Friends", 
                    transitionAnimation = v188.transitionAnimation, 
                    searchParams = {
                        searchType = "Players"
                    }, 
                    windowCloseCallback = v188.onClose, 
                    overlayProps = {
                        isVisible = v186.isVisible, 
                        DisplayOrder = v186.displayOrder
                    }
                });
            end;
        end, 
        [l_AppPage_0.AddFriendsPage] = not l_FFlagUnifyNavigationGraph_0 and function(v189)
            return v14(v60, l_AppPage_0.AddFriendsPage, v189);
        end or nil, 
        [l_AppPage_0.ViewUserProfile] = function(v190, v191, v192)
            if not l_default_0.isEnabled() or v85.GetFFlagEnableUnifiedStaticWebViews() then
                return v2.createElement(v48, {
                    isVisible = v190.isVisible, 
                    DisplayOrder = v190.displayOrder, 
                    userId = v191, 
                    onClose = not not v192 and v192.onClose or nil
                });
            else
                return v2.createElement(v64, {
                    isVisible = v190.isVisible, 
                    DisplayOrder = v190.displayOrder
                });
            end;
        end, 
        [l_AppPage_0.ViewProfile] = function(v193, v194)
            if not l_default_0.isEnabled() or v85.GetFFlagEnableUnifiedStaticWebViews() then
                return v2.createElement(v49, {
                    isVisible = v193.isVisible, 
                    DisplayOrder = v193.displayOrder, 
                    url = v194
                });
            else
                return v2.createElement(v64, {
                    isVisible = v193.isVisible, 
                    DisplayOrder = v193.displayOrder
                });
            end;
        end, 
        [l_AppPage_0.LoginNative] = function(v195, _, v197)
            return v2.createElement(v45, {
                isVisible = v195.isVisible, 
                DisplayOrder = v195.displayOrder, 
                notificationType = v20.ACTION_LOG_IN, 
                transitionAnimation = not not v197 and v197.transitionAnimation or nil
            });
        end, 
        [l_AppPage_0.CaptchaNative] = function(v198, _, v200)
            local v201 = v200.captchaType == "signup";
            if not (v200.captchaType == "login") and not v201 then
                return v2.createElement(v28.CaptchaPageBrowserServiceWrapper, {
                    isVisible = v198.isVisible, 
                    DisplayOrder = v198.displayOrder, 
                    captchaType = v200.captchaType, 
                    cvalueType = v200.cvalueType, 
                    cvalue = v200.cvalue, 
                    captchaCallback = v200.captchaCallback, 
                    backNavigationDisabledWhileLoading = v200.backNavigationDisabledWhileLoading, 
                    transitionAnimation = not not v200 and v200.transitionAnimation or nil, 
                    webViewVisible = false
                });
            else
                return v2.createElement(v28.CaptchaPageBrowserServiceWrapper, {
                    isVisible = v198.isVisible, 
                    DisplayOrder = v198.displayOrder, 
                    captchaType = v200.captchaType, 
                    cvalueType = v200.cvalueType, 
                    cvalue = v200.cvalue, 
                    dxBlob = v200.dxBlob, 
                    captchaId = v200.captchaId, 
                    captchaCallback = v200.captchaCallback, 
                    backNavigationDisabledWhileLoading = v200.backNavigationDisabledWhileLoading, 
                    transitionAnimation = not not v200 and v200.transitionAnimation or nil, 
                    webViewVisible = false
                });
            end;
        end, 
        [l_AppPage_0.ViewFriends] = function(v202)
            return v14(v59, l_AppPage_0.ViewFriends, v202);
        end, 
        [l_AppPage_0.SearchUsers] = function(v203, _, v205)
            return v14(v59, l_AppPage_0.SearchUsers, v203, {
                entryPage = l_AppPage_0.SearchUsers, 
                passedNavParams = {
                    EntryPage = l_AppPage_0.SearchUsers, 
                    shouldShowUserSearchLandingPage = true, 
                    screenTopBarParams = {
                        shouldAutoFocusCenter = true, 
                        shouldRenderCenter = true
                    }, 
                    userSearchSource = v205.entryPoint
                }
            });
        end, 
        [l_AppPage_0.RobuxUpsell] = function(v206, _, v208)
            return v14(v74, l_AppPage_0.RobuxUpsell, v206, v208);
        end, 
        [l_AppPage_0.ShareSheet] = function(v209, _, v211)
            return v2.createElement(v54, {
                isVisible = v209.isVisible, 
                DisplayOrder = v209.displayOrder, 
                data = v211
            });
        end, 
        [l_AppPage_0.SdkShare] = function(v212, _, v214)
            return v2.createElement(v55, {
                isVisible = v212.isVisible, 
                DisplayOrder = v212.displayOrder, 
                data = v214
            });
        end, 
        [l_AppPage_0.ReportAbuse] = function(v215, v216, v217)
            if not l_default_0.isEnabled() or v85.GetFFlagEnableUnifiedStaticWebViews() then
                return v2.createElement(v51, {
                    isVisible = v215.isVisible, 
                    DisplayOrder = v215.displayOrder, 
                    url = v216, 
                    onClose = not not v217 and v217.onClose or nil
                });
            else
                return v2.createElement(v64, {
                    isVisible = v215.isVisible, 
                    DisplayOrder = v215.displayOrder
                });
            end;
        end, 
        [l_AppPage_0.PhoneVerification] = function(_, _, v220)
            return v2.createElement(v57, v220);
        end, 
        [l_AppPage_0.EditUsername] = function(_, _, v223)
            return v2.createElement(l_EditUsernameWrapper_0, v223);
        end, 
        [l_AppPage_0.ChallengeHybridOverlayPage] = function(v224, _, v226)
            return v14(v66, l_AppPage_0.ChallengeHybridOverlayPage, v224, v226);
        end, 
        [l_AppPage_0.ChallengeDialogModalContainer] = if not v85.GetFFlagLuaAppChallengeDialogContainerPageEnabled() then nil else function(v227, _, v229)
            return v14(l_ChallengeDialogModalContainer_0, l_AppPage_0.ChallengeDialogModalContainer, v227, v229);
        end, 
        [l_AppPage_0.ExperienceGuidelinesExplained] = function(v230, v231)
            return v14(v72, l_AppPage_0.ExperienceGuidelinesExplained, v230, not not v231 and {
                universeId = v231
            } or nil);
        end, 
        [l_AppPage_0.ReportDialog] = (v85.GetFFlagLuafiedReportEntryPoints() or v85.GetFFlagLuaAppNewStreamNotificationsEnabled()) and function(v232)
            return v14(v77, l_AppPage_0.ReportDialog, v232);
        end or nil, 
        [l_AppPage_0.AgeVerificationRequired] = function(v233, v234)
            return v14(v73, l_AppPage_0.AgeVerificationRequired, v233, not not v234 and {
                universeId = v234
            } or nil);
        end, 
        [l_AppPage_0.ChallengeHybridWebView] = function(v235, _, v237)
            return v2.createElement(v67, v3.Dictionary.join(v237, {
                appContainerNavigation = v235
            }));
        end, 
        [l_AppPage_0.InviteLinkExpiredModal] = function(v238, _, v240)
            return v14(l_InviteLinkExpiredModal_0, l_AppPage_0.InviteLinkExpiredModal, v238, v240);
        end, 
        [l_AppPage_0.ShareLinkInvalidModal] = function(v241, _, v243)
            return v14(l_ShareLinkInvalidModal_0, l_AppPage_0.ShareLinkInvalidModal, v241, v243);
        end, 
        [l_AppPage_0.ProfileQRCodePage] = function(v244, _, v246)
            return v14(l_ProfileQRCodeEntryPoint_0, l_AppPage_0.ProfileQRCodePage, v244, v246);
        end, 
        [l_AppPage_0.AccountInfo] = function(v247, v248, v249)
            if not v85.FFlagFetchUserNameOnCloseAccountInfo then
                return nil;
            else
                return v2.createElement(v53, v3.Dictionary.join(v249, {
                    isVisible = v247.isVisible, 
                    displayOrder = v247.displayOrder, 
                    url = v248
                }));
            end;
        end, 
        [l_AppPage_0.ParentVerification] = function(_, v251)
            if not v87 then
                return v2.createElement(v63, {
                    url = v21.fromString("www:parents/account-setup")()
                });
            else
                return v2.createElement(v63, {
                    url = v251
                });
            end;
        end, 
        [l_AppPage_0.EmailVerification] = function(_, v253)
            if not v87 then
                return v2.createElement(v63, {
                    url = v21.fromString("www:")()
                });
            else
                return v2.createElement(v63, {
                    url = v253
                });
            end;
        end, 
        [l_AppPage_0.VerifiedBadgeModal] = function(v254, _, v256)
            return v14(v39.AboutVerifiedBadgeModal, l_AppPage_0.VerifiedBadgeModal, v254, v256);
        end, 
        [l_AppPage_0.SocialMessageToast] = function(v257, _, v259)
            return v14(l_RootScreen_0, l_AppPage_0.SocialMessageToast, v257, v259);
        end, 
        [l_AppPage_0.PassesPage] = function(v260, v261, v262)
            local v263 = {
                universeId = v261
            };
            if v262 then
                v263 = v3.Dictionary.join(v262, v263);
            end;
            return v14(v30, l_AppPage_0.PassesPage, v260, v263);
        end, 
        [l_AppPage_0.ContactsList] = function(v264, _, v266)
            return v14(v62, l_AppPage_0.ContactsList, v264, v266);
        end, 
        [l_AppPage_0.AccountSettingsUpsell] = if not v85.GetFFlagEnableAccountSettingsUpsell() then nil else function(v267, _, v269)
            return v14(v81, l_AppPage_0.AccountSettingsUpsell, v267, v269);
        end, 
        [l_AppPage_0.AmpWizardContainer] = if not v85.GetFFlagEnableAmpUpsellWizard() then nil else function(v270, _, v272)
            return v14(v82, l_AppPage_0.AmpWizardContainer, v270, v272);
        end, 
        [l_AppPage_0.IDVUpsellContainer] = if not v85.GetFFlagEnableAmpIDVUpsellSupport() then nil else function(v273, _, v275)
            return v14(l_IDVUpsellContainer_0, l_AppPage_0.IDVUpsellContainer, v273, v275);
        end, 
        [l_AppPage_0.AddAuthMethodPage] = function(v276)
            return v14(v28.AddAuthMethodPage, l_AppPage_0.AddAuthMethodPage, v276);
        end, 
        [l_AppPage_0.SponsoredTooltipPeekView] = if not v85.GetFFlagEnableSponsoredAdsGameCarouselTooltip() then nil else function(v277, _, v279)
            return v14(v78, l_AppPage_0.SponsoredTooltipPeekView, v277, v279);
        end, 
        [l_AppPage_0.InfoPeekView] = function(v280, _, v282)
            return v14(l_InfoPeekView_0, l_AppPage_0.InfoPeekView, v280, v282);
        end, 
        [l_AppPage_0.ChallengeNativeWrapper] = if not l_FFlagUnifyNavigationGraph_0 then v85.GetFFlagLuaAppChallengeNativeWrapperEnabled() and function(v283, _, v285)
            return v14(v68, l_AppPage_0.ChallengeNativeWrapper, v283, v285);
        end or nil else nil
    };
    local v287 = {};
    if not l_FFlagUnifyNavigationGraph_0 then
        for v288, v289 in pairs(v286) do
            if not v26[v288] then
                table.insert(v287, {
                    [v288] = v13(v289, v288)
                });
            end;
        end;
        table.insert(v287, {
            [v19.TempRnSwitchNavigatorName] = v15(v16)
        });
        table.insert(v287, {
            [l_AppPage_0.ContactImporter] = l_Navigator_0
        });
        if v85.GetFFlagLuaAppEnableSquadPage() then
            table.insert(v287, {
                [l_AppPage_0.SquadPage] = l_SquadMainStackNavigator_0
            });
        end;
        return v287, v286;
    else
        for v290, v291 in v286, nil, nil do
            table.insert(v287, {
                [v290] = {
                    screen = v13(v291, v290), 
                    navigationOptions = v92(v290)
                }
            });
        end;
        table.insert(v287, {
            [l_AppPage_0.AvatarExperienceRoot] = {
                screen = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarExperienceRootContainer), 
                navigationOptions = {
                    hasSubNavigation = true
                }
            }
        });
        table.insert(v287, {
            [l_AppPage_0.Chat] = l_createLazyComponent_0(function()
                return require(l_Modules_0.LuaApp.Components.SocialTab.SocialTabUniversalAppWrapper.Container);
            end)
        });
        table.insert(v287, {
            [l_AppPage_0.PurchaseRobux] = {
                screen = v13(function(v292, _, v294)
                    if not (v85.GetFFlagLuaAppLuaBuyRobuxPage() and l_IsVRAppBuild_0()) and not l_GuiService_0:IsTenFootInterface() then
                        return v2.createElement(v52, {
                            url = if not v85.GetFFlagEnableUnifiedStaticWebViews() then nil else v21.fromString("www:Upgrades/Robux.aspx")(), 
                            isVisible = v292.isVisible, 
                            DisplayOrder = v292.displayOrder, 
                            transitionAnimation = not not v294 and v294.transitionAnimation or nil
                        });
                    else
                        return v14(v75, l_AppPage_0.PurchaseRobux, v292, v294);
                    end;
                end, l_AppPage_0.PurchaseRobux), 
                navigationOptions = v3.Dictionary.join({
                    screenKind = l_ScreenKind_0.FullScreen, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
                }, (v92(l_AppPage_0.PurchaseRobux)))
            }
        });
        table.insert(v287, {
            [l_AppPage_0.ReportScreen] = {
                screen = l_createLazyComponent_0(function()
                    return require(l_CorePackages_0.Workspace.Packages.AbuseReporting).ReportScreen;
                end), 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.FullScreen, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
                }
            }
        });
        table.insert(v287, {
            [l_AppPage_0.AddFriendsPage] = {
                screen = l_createLazyComponent_0(function()
                    return require(l_Modules_0.LuaApp.Components.FriendsLanding.AddFriendsUniversalAppWrapper);
                end), 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.Default, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.OptionGroupOnly
                }
            }
        });
        table.insert(v287, {
            [l_AppPage_0.ChallengeNativeWrapper] = {
                screen = l_createLazyComponent_0(function()
                    return require(l_Modules_0.LuaApp.Components.Challenge.NativeWrapper);
                end), 
                navigationOptions = {
                    transparent = not not v85.GetFFlagEnableTransparentNativeChallengeWrapper() or nil, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.OptionGroupOnly
                }
            }
        });
        table.insert(v287, {
            [l_AppPage_0.ContactImporter] = {
                screen = l_Navigator_0, 
                navigationOptions = v92(l_AppPage_0.ContactImporter)
            }
        });
        if v85.GetFFlagLuaAppEnableSquadPage() then
            table.insert(v287, {
                [l_AppPage_0.SquadPage] = {
                    screen = l_SquadMainStackNavigator_0, 
                    navigationOptions = v92(l_AppPage_0.SquadPage)
                }
            });
        end;
        return v287;
    end;
end;
