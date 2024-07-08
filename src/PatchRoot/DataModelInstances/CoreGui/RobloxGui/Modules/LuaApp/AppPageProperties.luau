local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.FlagSettings);
local v3 = require(l_Modules_0.LuaApp.AppPage);
local v4 = require(l_Modules_0.LuaApp.Enum.SystemBarVisibility);
local v5 = require(l_Modules_0.LuaApp.Enum.HeaderBarDisplayOptions);
local v6 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v7 = require(l_Modules_0.LuaApp.getExperienceDetailsPageNavBarVisible);
local v8 = require(l_Modules_0.LuaApp.getSquadLobbyTabBarVisible);
local l_GetFFlagLuaAppEnableSquadPage_0 = v6.GetFFlagLuaAppEnableSquadPage;
local v10 = require(l_Modules_0.LuaApp.Flags.getFFlagContactImporterHideBottomBar);
local l_GetFFlagEnableAbuseReport10ft_0 = v6.GetFFlagEnableAbuseReport10ft;
local l_GetFFlagLuafiedReportEntryPoints_0 = v6.GetFFlagLuafiedReportEntryPoints;
local l_GetFFlagLuaAppChallengeDialogContainerPageEnabled_0 = require(l_CorePackages_0.Workspace.Packages.ChallengeDialog).GetFFlagLuaAppChallengeDialogContainerPageEnabled;
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local l_GetFFlagLuaAppNewStreamNotificationsEnabled_0 = v6.GetFFlagLuaAppNewStreamNotificationsEnabled;
local v16 = game:DefineFastFlag("LuaAppIncorrectWebViewProperty", false);
local v17 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableSponsoredAdsGameCarouselTooltip);
local v18 = require(l_Modules_0.LuaApp.Flags.FFlagLuaAppSingleHeaderBar);
local v19 = game:DefineFastFlag("HideTabBarForContactsList", false);
local v20 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableNativeWrapperAppPage);
local v21 = {
    [v3.None] = {
        nameLocalizationKey = "CommonUI.Features.Label.Nil"
    }, 
    [v3.Startup] = {
        tabBarHidden = v4.Hidden, 
        nameLocalizationKey = "CommonUI.Features.Label.Startup"
    }, 
    [v3.Landing] = {
        tabBarHidden = v4.Hidden, 
        nameLocalizationKey = "CommonUI.Features.Label.Startup", 
        appShellReporterFeature = Enum.AppShellFeature.Landing
    }, 
    [v3.Login] = {
        nameLocalizationKey = "Authentication.Login.Heading.Login", 
        tabBarHidden = v4.Hidden
    }, 
    [v3.LoginV2] = {
        nameLocalizationKey = "Authentication.Login.Heading.Login", 
        tabBarHidden = v4.Hidden
    }, 
    [v3.CrossDeviceLogin] = {
        nameLocalizationKey = "Authentication.CrossDevice.Heading.QuickLogin", 
        tabBarHidden = v4.Hidden, 
        headerBarDisplayOption = if not v18 then nil else v5.ShowAll
    }, 
    [v3.TwoStep] = {
        nameLocalizationKey = "Authentication.TwoStepVerification.Label.TwoStepVerification", 
        tabBarHidden = v4.Hidden
    }, 
    [v3.Birthday] = {
        nameLocalizationKey = "Authentication.SignUp.Label.WhensYourBirthday", 
        tabBarHidden = v4.Hidden
    }, 
    [v3.CharacterSelectionPage] = {
        nameLocalizationKey = "Authentication.SignUp.Heading.SelectStartingAvatar", 
        tabBarHidden = v4.Hidden
    }, 
    [v3.UsernameSelectionPage] = {
        nameLocalizationKey = "Authentication.SignUp.Heading.UsernamePage", 
        tabBarHidden = v4.Hidden
    }, 
    [v3.PasswordSelectionPage] = {
        nameLocalizationKey = "Authentication.SignUp.Heading.PasswordPage", 
        tabBarHidden = v4.Hidden
    }, 
    [v3.SinglePageSignUp] = {
        nameLocalizationKey = "Authentication.SignUp.Label.SignUp", 
        tabBarHidden = v4.Hidden
    }, 
    [v3.LuobuSignUpPage] = {
        nameLocalizationKey = "Authentication.SignUp.Label.SignUp", 
        tabBarHidden = v4.Hidden
    }, 
    [v3.WeChatLoginWrapper] = {
        nativeWrapper = true, 
        tabBarHidden = v4.Hidden
    }, 
    [v3.Home] = {
        nameLocalizationKey = "CommonUI.Features.Label.Home", 
        appShellReporterFeature = Enum.AppShellFeature.HomePage, 
        tabBarHidden = v4.Visible, 
        headerBarDisplayOption = if not v18 then nil else v5.ShowAll
    }, 
    [v3.Games] = {
        nameLocalizationKey = v2.GetGamesTabName(), 
        appShellReporterFeature = Enum.AppShellFeature.GamePage, 
        tabBarHidden = v4.Visible, 
        headerBarDisplayOption = if not v18 then nil else v5.ShowAll
    }, 
    [v3.GameDetail] = {
        nameLocalizationKey = "CommonUI.Features.Heading.GameDetails", 
        tabBarHidden = v7, 
        renderUnderlyingPage = true, 
        blurUnderlyingPage = true, 
        appShellReporterFeature = Enum.AppShellFeature.GamePage, 
        isPeekView = true
    }, 
    [v3.AvatarExperienceRoot] = {
        nameLocalizationKey = "CommonUI.Features.Label.Avatar", 
        tabBarHidden = v4.Visible, 
        overridesAppRouterTabBarControl = true, 
        appShellReporterFeature = Enum.AppShellFeature.AvatarEditor, 
        disableBackButton = true
    }, 
    [v3.Chat] = {
        nameLocalizationKey = "CommonUI.Features.Label.Chat", 
        overridesAppRouterTabBarControl = true, 
        appShellReporterFeature = Enum.AppShellFeature.Chat
    }, 
    [v3.ShareGameToChat] = {
        tabBarHidden = v4.PolicyDependent
    }, 
    [v3.AvatarExperienceWrapper] = {
        overridesAppRouterTabBarControl = true, 
        appShellReporterFeature = Enum.AppShellFeature.AvatarEditor, 
        disableBackButton = true
    }, 
    [v3.AvatarExperienceWrapperTransparent] = {
        overridesAppRouterTabBarControl = true, 
        renderUnderlyingPage = true, 
        appShellReporterFeature = Enum.AppShellFeature.AvatarEditor, 
        disableBackButton = true
    }, 
    [v3.SearchPage] = {
        tabBarHidden = v4.Visible, 
        overridesAppRouterTabBarControl = false, 
        headerBarDisplayOption = if not v18 then nil else v5.ShowAll
    }, 
    [v3.More] = {
        nameLocalizationKey = "CommonUI.Features.Label.More", 
        tabBarHidden = v4.Visible, 
        appShellReporterFeature = Enum.AppShellFeature.More, 
        headerBarDisplayOption = if not v18 then nil else v5.ShowAll
    }, 
    [v3.AccountInfo] = {
        webView = true, 
        nativeWrapper = true, 
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v3.About] = {
        nameLocalizationKey = "CommonUI.Features.Label.About", 
        tabBarHidden = v4.Visible, 
        headerBarDisplayOption = if not v18 then nil else v5.ShowAll
    }, 
    [v3.SafetySupport] = {
        nameLocalizationKey = "CommonUI.Features.Label.HelpAndSafety", 
        tabBarHidden = v4.Visible
    }, 
    [v3.Settings] = {
        nameLocalizationKey = "CommonUI.Features.Label.Settings", 
        tabBarHidden = v4.Visible, 
        headerBarDisplayOption = if not v18 then nil else v5.ShowAll
    }, 
    [v3.Accessibility] = {
        nameLocalizationKey = "CommonUI.Features.Label.Accessibility", 
        tabBarHidden = v4.Visible, 
        headerBarDisplayOption = if not v18 then nil else v5.ShowAll
    }, 
    [v3.Licensing] = {
        nameLocalizationKey = "CommonUI.Features.Label.Licensing", 
        tabBarHidden = v4.Visible, 
        headerBarDisplayOption = if not v18 then nil else v5.ShowAll
    }, 
    [v3.DevSubs] = {
        nameLocalizationKey = "CommonUI.Features.Label.DevSubs", 
        tabBarHidden = v4.Visible
    }, 
    [v3.AddFriendsPage] = {
        nameLocalizationKey = "Feature.Friends.Feature.Friends.Heading.AddFriends", 
        nativeWrapper = true, 
        tabBarHidden = v4.PolicyDependent, 
        bottomTabBarHidden = true, 
        sideTabBarHidden = false
    }, 
    [v3.BuildersClub] = {
        webView = true, 
        nativeWrapper = true, 
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v3.InviteLinkExpiredModal] = {
        absorbInput = true, 
        renderUnderlyingPage = true
    }, 
    [v3.ShareLinkInvalidModal] = {
        absorbInput = true, 
        renderUnderlyingPage = true
    }, 
    [v3.VerifiedBadgeModal] = {
        renderUnderlyingPage = true
    }, 
    [v3.ShareVirtualEventModal] = {
        renderUnderlyingPage = true
    }, 
    [v3.EventNotificationsModal] = {
        renderUnderlyingPage = true
    }, 
    [v3.EventDetails] = {
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = false, 
        blurUnderlyingPage = true
    }, 
    [v3.TencentHelp] = {
        nameLocalizationKey = "CommonUI.Features.Label.Help", 
        nativeWrapper = true, 
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v3.TencentNoticeCenter] = {
        nameLocalizationKey = "CommonUI.Features.Label.TencentNotice", 
        tabBarHidden = v4.Visible
    }, 
    [v3.TencentNoticeContent] = {
        nameLocalizationKey = "CommonUI.Features.Label.TencentNotice", 
        tabBarHidden = v4.Visible
    }, 
    [v3.GenericWebPage] = {
        webView = true, 
        nativeWrapper = true, 
        renderUnderlyingPage = true
    }, 
    [v3.SettingsSubPage] = {
        webView = true, 
        nativeWrapper = true, 
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v3.YouTubePlayer] = {
        webView = true, 
        nativeWrapper = true, 
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v3.PurchaseRobux] = {
        webView = true, 
        nativeWrapper = true, 
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = not l_IsVRAppBuild_0() and true or false
    }, 
    [v3.Payment] = {
        webView = true, 
        nativeWrapper = true, 
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v3.RobuxUpsell] = {
        webView = false, 
        nativeWrapper = true, 
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v3.Notifications] = {
        webView = true, 
        nativeWrapper = true, 
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v3.LogoutConfirmation] = {
        nativeWrapper = true, 
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v3.AddFriends] = {
        webView = true, 
        nativeWrapper = true, 
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v3.ViewUserProfile] = {
        webView = true, 
        nativeWrapper = true, 
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v3.ViewProfile] = {
        webView = true, 
        nativeWrapper = true, 
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v3.AccountSelectorPeekView] = {
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = true, 
        disableBackButton = true, 
        isPeekView = true
    }, 
    [v3.AccountSwitchingAddAccountPeekView] = {
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = true, 
        disableBackButton = true, 
        isPeekView = true
    }, 
    [v3.LoginNative] = {
        nativeWrapper = true, 
        tabBarHidden = v4.Hidden, 
        renderUnderlyingPage = true
    }, 
    [v3.CaptchaNative] = {
        nativeWrapper = true, 
        tabBarHidden = v4.Hidden, 
        renderUnderlyingPage = true
    }, 
    [v3.ViewFriends] = {
        webView = false, 
        nativeWrapper = true, 
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = false
    }, 
    [v3.ShareSheet] = {
        nativeWrapper = true, 
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v3.SdkShare] = {
        nativeWrapper = false, 
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = true, 
        disableBackButton = true
    }, 
    [v3.ReportAbuse] = {
        webView = true, 
        nativeWrapper = true, 
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v3.ScanQrCode] = {
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v3.GenericOpaqueWebPage] = {
        nativeWrapper = true, 
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = false
    }, 
    [v3.ChallengeHybridOverlayPage] = {
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v3.ChallengeHybridWebView] = {
        nativeWrapper = true, 
        tabBarHidden = v4.Hidden, 
        renderUnderlyingPage = true
    }, 
    [v3.ProfilePeekView] = {
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = true, 
        disableBackButton = true, 
        isPeekView = true
    }, 
    [v3.ProfilePlatform] = if not v6.FFlagProfilePlatformDevFlag then nil else {
        nameLocalizationKey = "CommonUI.Features.Label.Profile", 
        tabBarHidden = v4.Visible
    }, 
    [v3.PhoneVerification] = {
        webView = not v16 and true or nil, 
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v3.EditUsername] = {
        webView = not v16 and true or nil, 
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v3.ExperienceGuidelinesExplained] = {
        nameLocalizationKey = "Feature.GameDetails.Label.AgeGuidelines", 
        disableBackButton = false, 
        renderUnderlyingPage = true
    }, 
    [v3.AgeVerificationRequired] = {
        disableBackButton = false, 
        renderUnderlyingPage = true
    }, 
    [v3.AccountSettingsUpsell] = {
        renderUnderlyingPage = true
    }, 
    [v3.IDVUpsellContainer] = {
        renderUnderlyingPage = true
    }, 
    [v3.AmpWizardContainer] = {
        renderUnderlyingPage = true
    }, 
    [v3.GamesList] = {
        headerBarDisplayOption = if not v18 then nil else v5.ShowAll
    }, 
    [v3.ContactImporter] = {
        tabBarHidden = not not v10() and v4.Hidden, 
        bottomTabBarHidden = not not v10() or false, 
        sideTabBarHidden = not not v10() or false, 
        renderUnderlyingPage = true, 
        disableBackButton = true
    }, 
    [v3.ContactsList] = {
        tabBarHidden = if not v19 then nil else v4.PolicyDependent
    }, 
    [v3.U13Block] = {
        tabBarHidden = v4.Hidden, 
        nameLocalizationKey = "CommonUI.Features.Label.Startup"
    }, 
    [v3.PassesPage] = {
        nameLocalizationKey = "Feature.GamePass.Heading.PassesForThisGame", 
        appShellReporterFeature = Enum.AppShellFeature.GamePage
    }, 
    [v3.SocialMessageToast] = {
        renderUnderlyingPage = true, 
        disableBackButton = true
    }, 
    [v3.ProfileQRCodePage] = {
        absorbInput = true, 
        renderUnderlyingPage = true
    }, 
    [v3.ParentVerification] = {
        webView = true
    }, 
    [v3.EmailVerification] = {
        webView = true
    }, 
    [v3.AddAuthMethodPage] = {
        tabBarHidden = v4.Hidden
    }, 
    [v3.SponsoredTooltipPeekView] = if not v17() then nil else {
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = true, 
        disableBackButton = true, 
        isPeekView = true
    }, 
    [v3.InfoPeekView] = {
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = true, 
        disableBackButton = true, 
        isPeekView = true
    }
};
if l_GetFFlagLuaAppChallengeDialogContainerPageEnabled_0() then
    v21[v3.ChallengeDialogModalContainer] = {
        tabBarHidden = v4.Hidden, 
        renderUnderlyingPage = true
    };
end;
if l_GetFFlagLuaAppEnableSquadPage_0() then
    v21[v3.SquadPage] = {
        renderUnderlyingPage = true, 
        tabBarHidden = v8
    };
end;
if not (not l_GetFFlagLuafiedReportEntryPoints_0() and not l_GetFFlagLuaAppNewStreamNotificationsEnabled_0()) then
    v21[v3.ReportDialog] = {
        disableBackButton = false, 
        renderUnderlyingPage = true
    };
end;
if l_GetFFlagEnableAbuseReport10ft_0() then
    v21[v3.ReportScreen] = {
        nameLocalizationKey = "Feature.GameDetails.Label.ReportAbuse", 
        tabBarHidden = v4.Visible, 
        renderUnderlyingPage = false
    };
end;
if v20() then
    v21[v3.ChallengeNativeWrapper] = {
        nativeWrapper = true, 
        tabBarHidden = v4.Hidden, 
        renderUnderlyingPage = true
    };
end;
return v21;
