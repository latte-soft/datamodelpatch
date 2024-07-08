local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script.Parent.Parent;
local l_Placements_0 = require(l_Parent_0.AppSystemBar).Enum.Placements;
local l_IsVRAppBuild_0 = require(l_Parent_0.AppCommonLib).IsVRAppBuild;
local v4 = require(l_Parent_0.Cryo);
local v5 = v4.Dictionary.values(require(l_Parent_0.Style).Constants.ThemeName);
local v6 = require(script.Parent.Enum.CrossPlayCapabilities);
local v7 = require(script.Parent.Enum.MorePageLayout);
local v8 = require(l_Parent_0.SharedFlags);
local l_isSubjectToDesktopPolicies_0 = v8.isSubjectToDesktopPolicies;
local l_getFFlagLuaProfileShareWithDesktopPolicy_0 = v8.getFFlagLuaProfileShareWithDesktopPolicy;
local l_GetFFlagEnableSwapToSourceButton_0 = v8.GetFFlagEnableSwapToSourceButton;
local l_GetFFlagEnableTopBarVRPolicyOverride_0 = v8.GetFFlagEnableTopBarVRPolicyOverride;
local l_isRunningInStudio_0 = require(l_Parent_0.AppCommonLib).isRunningInStudio;
local l_GetFFlagUseVoiceExitBetaLanguage_0 = v8.GetFFlagUseVoiceExitBetaLanguage;
local l_GetFFlagDisableCDLQrCodeForMaquettes_0 = v8.GetFFlagDisableCDLQrCodeForMaquettes;
local l_GetFFlagUseEnablePremiumUserFeaturesAppPolicy_0 = v8.GetFFlagUseEnablePremiumUserFeaturesAppPolicy;
local l_GetFFlagTenFootUiSeeAll_0 = v8.GetFFlagTenFootUiSeeAll;
local l_GetFFlagTenFootUiSearch_0 = v8.GetFFlagTenFootUiSearch;
local l_GetFFlagLuafiedReportEntryPoints_0 = v8.GetFFlagLuafiedReportEntryPoints;
local l_GetFFlagLuaAppEnable10ftPlatformName_0 = v8.GetFFlagLuaAppEnable10ftPlatformName;
local l_GetFFlagEnableAbuseReport10ft_0 = v8.GetFFlagEnableAbuseReport10ft;
local l_GetFFlagTenFootUiDisableInviteFriends_0 = v8.GetFFlagTenFootUiDisableInviteFriends;
local l_FFlagRealNamesInDisplayNameExperimentEnabled_0 = v8.FFlagRealNamesInDisplayNameExperimentEnabled;
local l_GetFFlagUseExternalBrowserForAgeGuidelines10ft_0 = v8.GetFFlagUseExternalBrowserForAgeGuidelines10ft;
local l_GetFFlagEnableMaquettesHomePageAgeBlock_0 = v8.GetFFlagEnableMaquettesHomePageAgeBlock;
local l_GetFFlagEnableDetailsPageCommunityLinks_0 = v8.GetFFlagEnableDetailsPageCommunityLinks;
local l_GetFFlagContactsToastPolicyEnabled_0 = v8.GetFFlagContactsToastPolicyEnabled;
local l_GetFFlagEnableGateNotificationPreferencesTab_0 = v8.GetFFlagEnableGateNotificationPreferencesTab;
local l_FFlagLuaAppHomeVngAppUpsell_0 = v8.FFlagLuaAppHomeVngAppUpsell;
local v30 = game:DefineFastFlag("UseGUACforDUARPolicy", false);
local v31 = game:DefineFastFlag("LuaAppEnableRecommendedCarouselForDesktop", false);
local v32 = game:DefineFastFlag("DisableWebViewSupportInStudio", false);
local v33 = game:DefineFastFlag("DebugUseLegacyCrossPlayApi", false);
local v34 = game:DefineFastString("DebugOverrideCrossPlaySettingsKey", "");
local v35 = game:DefineFastString("DebugOverrideCrossPlayQueryParam", "");
local v36 = game:DefineFastFlag("DebugCrossPlaySystemUi", false);
local v37 = game:DefineFastString("DebugOverrideCrossPlayUri", "");
game:DefineFastFlag("LuaAppPromotionalEmailsCheckboxEnabledInAppPolicy", false);
return function(v38)
    local function _(v39, v40)
        if v38[v39] ~= nil then
            return v38[v39];
        elseif not l_IsVRAppBuild_0() then
            return not v40;
        else
            return v40;
        end;
    end;
    return {
        getFriendFinder = function()
            return v38.FriendFinder or false;
        end, 
        getGameDetailsMorePage = function()
            return v38.GameDetailsMorePage or false;
        end, 
        getGameDetailsSubtitle = function()
            return v38.GameDetailsSubtitle or false;
        end, 
        getShowGlobalCounters = function()
            return v38.GameDetailsShowGlobalCounters or false;
        end, 
        getGameDetailsPlayWithFriends = function()
            return v38.GameDetailsPlayWithFriends or false;
        end, 
        getGameInfoList = function()
            return v38.GameInfoList or false;
        end, 
        getGamePlaysAndRatings = function()
            return v38.GamePlaysAndRatings or false;
        end, 
        getNotifications = function()
            return v38.Notifications or false;
        end, 
        getRecommendedGames = function()
            if not v31 then
                if v30 or not l_isSubjectToDesktopPolicies_0() then
                    return v38.RecommendedGames or false;
                else
                    return false;
                end;
            else
                return v38.RecommendedGames or false;
            end;
        end, 
        getSearchBar = function()
            return v38.SearchBar or false;
        end, 
        getSwapToSourceButton = function()
            return (l_GetFFlagEnableSwapToSourceButton_0() or v38.SwapToSourceButton) or false;
        end, 
        getGiftCardsEnabled = function()
            return v38.GiftCardsEnabled or false;
        end, 
        getOfficialStoreEnabled = function()
            return v38.OfficialStoreEnabled or false;
        end, 
        getMorePageType = function()
            return v38.MorePageType or "SimplifiedMore";
        end, 
        getAboutPageType = function()
            return v38.AboutPageType or "CJVAbout";
        end, 
        getSettingsPageType = function()
            return v38.SettingsPageType or "Settings";
        end, 
        getSocialLinks = function()
            return v38.SocialLinks or false;
        end, 
        getSocialGroupLinks = function()
            return v38.SocialGroupLinks or false;
        end, 
        getCommunityLinksEnabled = function()
            if not l_GetFFlagEnableDetailsPageCommunityLinks_0() then
                return false;
            else
                return v38.CommunityLinksEnabled or false;
            end;
        end, 
        getGameInfoShowBadges = function()
            return v38.GameInfoShowBadges or false;
        end, 
        getGameInfoShowCreated = function()
            return v38.GameInfoShowCreated or false;
        end, 
        getGameInfoShowGamepasses = function()
            return v38.GameInfoShowGamepasses or false;
        end, 
        getGameInfoShowGenre = function()
            return v38.GameInfoShowGenre or false;
        end, 
        getGameInfoShowMaxPlayers = function()
            return v38.GameInfoShowMaxPlayers or false;
        end, 
        getGameInfoShowServers = function()
            return v38.GameInfoShowServers or false;
        end, 
        getGameInfoShowUpdated = function()
            return v38.GameInfoShowUpdated or false;
        end, 
        getGameInfoShowAgeRecommendation = function()
            if v38.GameInfoShowAgeRecommendation == nil then
                return true;
            else
                return v38.GameInfoShowAgeRecommendation;
            end;
        end, 
        getGameInfoShowVoiceAndChatFeatures = function()
            if v38.GameInfoShowVoiceAndChatFeatures == nil then
                return true;
            else
                return v38.GameInfoShowVoiceAndChatFeatures;
            end;
        end, 
        getInExperienceCanNavigateHome = function()
            if v38.InExperienceCanNavigateHome == nil then
                return true;
            else
                return v38.InExperienceCanNavigateHome;
            end;
        end, 
        getInExperienceCanListPeopleInSameServer = function()
            if v38.InExperienceCanListPeopleInSameServer == nil then
                return true;
            else
                return v38.InExperienceCanListPeopleInSameServer;
            end;
        end, 
        getSiteMessageBanner = function()
            return v38.SiteMessageBanner or false;
        end, 
        getAlertRateLimit = function()
            return v38.AlertRateLimit or 300;
        end, 
        getSearchAutoComplete = function()
            return v38.SearchAutoComplete or false;
        end, 
        getUseBottomBar = function()
            if v38.UseBottomBar == nil then
                return true;
            else
                return v38.UseBottomBar;
            end;
        end, 
        getSystemBarPlacement = function()
            if not l_IsVRAppBuild_0() then
                if v30 or not l_isSubjectToDesktopPolicies_0() then
                    if l_Placements_0[v38.SystemBarPlacement] ~= nil then
                        return v38.SystemBarPlacement;
                    else
                        return l_Placements_0.Bottom;
                    end;
                else
                    return l_Placements_0.Left;
                end;
            else
                return l_Placements_0.VR;
            end;
        end, 
        getShowStudioCTA = function()
            return v38.ShowStudioCTA or false;
        end, 
        getUseOmniRecommendation = function()
            if v38.UseOmniRecommendation == nil then
                return true;
            else
                return v38.UseOmniRecommendation;
            end;
        end, 
        getUseWidthBasedFormFactorRule = function()
            return v38.UseWidthBasedFormFactorRule or false;
        end, 
        getShowYouTubeAgeAlert = function()
            if v38.ShowYouTubeAgeAlert == nil then
                return true;
            else
                return v38.ShowYouTubeAgeAlert;
            end;
        end, 
        getShowVideoThumbnails = function()
            return v38.ShowVideoThumbnails or false;
        end, 
        getHomeIcon = function()
            return v38.HomeIcon or "LuaApp/icons/ic-roblox-close";
        end, 
        getGameInfoListShowRNVDeveloper = function()
            return v38.GameInfoListShowRNVDeveloper or false;
        end, 
        getGameInfoListDeveloper = function()
            return v38.GameInfoListDeveloper or false;
        end, 
        getShowDisplayName = function()
            if v38.ShowDisplayName == nil then
                return true;
            else
                return v38.ShowDisplayName;
            end;
        end, 
        getShowAlias = function()
            if v38.ShowUserAlias == nil then
                return true;
            else
                return v38.ShowUserAlias;
            end;
        end, 
        getCatalogReportingDisabled = function()
            return v38.CatalogReportingDisabled or false;
        end, 
        getGameReportingDisabled = function()
            return v38.GameReportingDisabled or false;
        end, 
        getGamesPageCreationCenterTitle = function()
            return v38.GamesPageCreationCenterTitle or false;
        end, 
        shouldUseExternalBrowserForDisclaimerLinks = function()
            return v38.UseExternalBrowserForDisclaimerLinks or false;
        end, 
        shouldUseExternalBrowserForMorePageItem = function()
            return v38.UseExternalBrowserForMoreLinks or false;
        end, 
        getFullscreenTitleBarEnabled = function()
            return v38.FullscreenTitleBarEnabled or false;
        end, 
        getShowExitFullscreenToast = function()
            if v38.ExitFullscreenToastEnabled == nil then
                return false;
            else
                return v38.ExitFullscreenToastEnabled;
            end;
        end, 
        getCatalogShow3dView = function()
            return v38.CatalogShow3dView or false;
        end, 
        getItemDetailsFullView = function()
            return v38.ItemDetailsFullView or false;
        end, 
        getCatalogCommunityCreations = function()
            return v38.CatalogCommunityCreations or false;
        end, 
        getCatalogPremiumCategory = function()
            return v38.CatalogPremiumCategory or false;
        end, 
        getShowCatalogPremiumContent = function()
            return v38.CatalogPremiumContent or false;
        end, 
        getRobloxCreatedItemsCreatedByLuobu = function()
            if v38.RobloxCreatedItemsCreatedByLuobu == nil then
                return true;
            else
                return v38.RobloxCreatedItemsCreatedByLuobu;
            end;
        end, 
        getHomePageFriendSection = function()
            return v38.HomePageFriendSection or false;
        end, 
        getHomePageProfileLink = function()
            return v38.HomePageProfileLink or false;
        end, 
        getPurchasePromptIncludingWarning = function()
            if v38.PurchasePromptIncludingWarning == nil then
                return true;
            else
                return v38.PurchasePromptIncludingWarning;
            end;
        end, 
        getCheckUserAgreementsUpdatedOnLogin = function()
            if v38.CheckUserAgreementsUpdatedOnLogin == nil then
                return true;
            else
                return v38.CheckUserAgreementsUpdatedOnLogin;
            end;
        end, 
        getAddUserAgreementIdsToSignupRequest = function()
            return v38.AddUserAgreementIdsToSignupRequest or false;
        end, 
        RequireExplicitVoiceConsent = function()
            return v38.RequireExplicitVoiceConsent or false;
        end, 
        getRequireExplicitAvatarVideoConsent = function()
            return v38.RequireExplicitAvatarVideoConsent or false;
        end, 
        getShowVoiceUpsellV2 = function()
            return v38.ShowVoiceUpsellV2 or false;
        end, 
        getShouldShowGroupsTile = function()
            return v38.ShouldShowGroupsTile or false;
        end, 
        useLuobuAuthentication = function()
            return v38.UseLuobuAuthentication or false;
        end, 
        useMSDKWebAuthentication = function()
            return v38.UseMSDKWebAuthentication or false;
        end, 
        getQrFriendingEnabled = function()
            return v38.QrFriendingEnabled or false;
        end, 
        getShouldShowCameraPermissionInAgreementsPrompt = function()
            return v38.ShouldShowCameraPermissionInAgreementsPrompt or false;
        end, 
        getProfileShareEnabled = function()
            if not l_getFFlagLuaProfileShareWithDesktopPolicy_0() or not l_isSubjectToDesktopPolicies_0() then
                return v38.ProfileShareEnabled or false;
            else
                return false;
            end;
        end, 
        getExperienceInviteShareLinkEnabled = function()
            return v38.ExperienceInviteShareLinkEnabled or false;
        end, 
        getCsatSurveyRestrictTextInput = function()
            return v38.CsatSurveyRestrictTextInput or false;
        end, 
        useGridPageLayout = function()
            if not l_IsVRAppBuild_0() then
                if v38.UseGridPageLayout == nil then
                    return l_isSubjectToDesktopPolicies_0();
                else
                    return v38.UseGridPageLayout;
                end;
            elseif v38.UseGridPageLayout ~= nil then
                return v38.UseGridPageLayout;
            elseif not l_IsVRAppBuild_0() then
                return false;
            else
                return true;
            end;
        end, 
        usePhoneSearchDiscoverEntry = function()
            if v38.UsePhoneSearchDiscoverEntry == nil then
                return not l_isSubjectToDesktopPolicies_0();
            else
                return v38.UsePhoneSearchDiscoverEntry;
            end;
        end, 
        getShouldSystemBarUsuallyBePresent = function()
            if not l_GetFFlagEnableTopBarVRPolicyOverride_0() or not l_IsVRAppBuild_0() then
                return v38.ShouldSystemBarUsuallyBePresent or false;
            elseif v38.ShouldSystemBarUsuallyBePresentForVR ~= nil then
                return v38.ShouldSystemBarUsuallyBePresentForVR;
            elseif not l_IsVRAppBuild_0() then
                return false;
            else
                return true;
            end;
        end, 
        getContactImporterEnabled = function()
            if not l_isSubjectToDesktopPolicies_0() then
                return v38.ContactImporterEnabled or false;
            else
                return false;
            end;
        end, 
        getUse3DPanels = function()
            if v38.Use3DPanels ~= nil then
                return v38.Use3DPanels;
            elseif not l_IsVRAppBuild_0() then
                return false;
            else
                return true;
            end;
        end, 
        getUseVRFTUXPanel = function()
            if v38.UseVRFTUXPanel ~= nil then
                return v38.UseVRFTUXPanel;
            elseif not l_IsVRAppBuild_0() then
                return false;
            else
                return true;
            end;
        end, 
        getWebViewSupport = function()
            if not l_isRunningInStudio_0() then
                if v38.EnableWebViewSupport ~= nil then
                    return v38.EnableWebViewSupport;
                elseif not l_IsVRAppBuild_0() then
                    return true;
                else
                    return false;
                end;
            elseif not v32 then
                return true;
            else
                return false;
            end;
        end, 
        getUseLuafiedReportFlow = function()
            if not l_IsVRAppBuild_0() or not l_GetFFlagLuafiedReportEntryPoints_0() then
                if not l_GetFFlagEnableAbuseReport10ft_0() then
                    return nil;
                else
                    return v38.UseLuafiedReportFlow or false;
                end;
            elseif v38.UseLuafiedReportFlow ~= nil then
                return v38.UseLuafiedReportFlow;
            elseif not l_IsVRAppBuild_0() then
                return false;
            else
                return true;
            end;
        end, 
        getThrottleFramerate = function()
            if v38.ThrottleFramerate ~= nil then
                return v38.ThrottleFramerate;
            elseif not l_IsVRAppBuild_0() then
                return true;
            else
                return false;
            end;
        end, 
        getUseRoundedCorners = function()
            if not l_IsVRAppBuild_0() then
                return false;
            elseif v38.UseRoundedCorners ~= nil then
                return v38.UseRoundedCorners;
            elseif not l_IsVRAppBuild_0() then
                return false;
            else
                return true;
            end;
        end, 
        getGameInfoShowChatFeatures = function()
            if not l_GetFFlagUseVoiceExitBetaLanguage_0() then
                return false;
            else
                return v38.GameInfoShowChatFeatures or false;
            end;
        end, 
        getAllowCameraMovements = function()
            if v38.AllowCameraMovements ~= nil then
                return v38.AllowCameraMovements;
            elseif not l_IsVRAppBuild_0() then
                return true;
            else
                return false;
            end;
        end, 
        getShouldSkipAvatarLandingPage = function()
            if v38.ShouldSkipAvatarLandingPage ~= nil then
                return v38.ShouldSkipAvatarLandingPage;
            elseif not l_IsVRAppBuild_0() then
                return false;
            else
                return true;
            end;
        end, 
        getShowPassesOnExperienceDetails = function()
            return v38.ShowPassesOnExperienceDetails or false;
        end, 
        getDisableCDLQrCodeForMaquettes = function()
            if not l_GetFFlagDisableCDLQrCodeForMaquettes_0() then
                return false;
            else
                return v38.DisableCDLQrCodeForMaquettes;
            end;
        end, 
        getDisableIAPEntryPoint = function()
            return v38.DisableIAPEntryPoint or false;
        end, 
        getEnforceAgeRestrictedLogin = function()
            return v38.EnforceAgeRestrictedLogin or false;
        end, 
        getUrlAuthRoutes = function()
            local v42 = v38.Routes or {};
            if not v42 then
                return {};
            else
                return v42.auth or {};
            end;
        end, 
        getShowDisconnectButton = function()
            return v38.ShowDisconnectButton or false;
        end, 
        getUseSingleSignOn = function()
            if not l_isRunningInStudio_0() then
                return v38.UseSingleSignOn or false;
            else
                return false;
            end;
        end, 
        getGridCarouselSeeAllTilesEnabled = function()
            return v38.UseGridCarouselSeeAllTiles or false;
        end, 
        getSearchWithoutNavigatingEnabled = function()
            if not l_GetFFlagTenFootUiSearch_0() then
                return nil;
            else
                return v38.SingleSearchPageNoNavigation or false;
            end;
        end, 
        getGameListCategoryScrollListEnabled = function()
            if not l_GetFFlagTenFootUiSeeAll_0() then
                return nil;
            else
                return v38.GetGamesListCategoryTabs or false;
            end;
        end, 
        getForceTheme = function()
            local v44 = v4.List.map(v5, function(v43)
                return v43:lower();
            end);
            if not v38.ForceTheme or not v4.List.find(v44, v38.ForceTheme:lower()) then
                return nil;
            else
                return v38.ForceTheme;
            end;
        end, 
        enableExperienceDetailsPanel = function()
            return v38.EnableExperienceDetailsPanel or false;
        end, 
        getDisableRegularLogin = function()
            return not v38.EnableWebViewSupport and (not v38.EnableRegularLoginWithoutWebViewSupport or false);
        end, 
        getAllowPlatformAccountSwitching = function()
            return v38.AllowPlatformAccountSwitching or false;
        end, 
        useLegacyCrossPlayApi = function()
            return (v33 or v38.useLegacyCrossPlayApi) or false;
        end, 
        useCrossPlaySystemUi = function()
            return (v36 or v38.useCrossPlaySystemUi) or false;
        end, 
        getCrossPlayUri = function()
            if v37 ~= "" then
                return v37;
            else
                return v38.crossPlayUri or "";
            end;
        end, 
        getCrossPlayCapabilities = function()
            return v4.List.foldLeft(v38.crossPlayCapabilities or {}, function(v45, v46)
                if not v4.List.find(v45, v46) then
                    return v4.List.join(v45, {
                        v6[v46]
                    });
                else
                    return v45;
                end;
            end, {});
        end, 
        getCrossPlaySettingsKey = function()
            if v34 ~= "" then
                return v34;
            else
                return v38.crossPlaySettingsKey or "";
            end;
        end, 
        getCrossPlayQueryParam = function()
            if v35 ~= "" then
                return v35;
            else
                return v38.crossPlayQueryParam or "";
            end;
        end, 
        getPromotionalEmailsCheckboxEnabled = function()
            if not game:GetFastFlag("LuaAppPromotionalEmailsCheckboxEnabledInAppPolicy") then
                return false;
            else
                return v38.PromotionalEmailsCheckboxEnabled or false;
            end;
        end, 
        getPromotionalEmailsOptInByDefault = function()
            if not game:GetFastFlag("LuaAppPromotionalEmailsCheckboxEnabledInAppPolicy") then
                return false;
            else
                return v38.PromotionalEmailsOptInByDefault or false;
            end;
        end, 
        getMorePageLayout = function()
            return v7[v38.MorePageLayout] or v7.Grid;
        end, 
        getSupportsOverscan = function()
            return v38.SupportsOverscan or false;
        end, 
        getPlatformDisplayName = function()
            return v38.platformDisplayName or "";
        end, 
        getPlatformAccountName = function()
            if not l_GetFFlagLuaAppEnable10ftPlatformName_0() then
                return nil;
            else
                return v38.platformAccountName or nil;
            end;
        end, 
        getSupportsProfileSwitching = function()
            return v38.supportsProfileSwitching or false;
        end, 
        getMountAllOmniFeedItems = function()
            return v38.mountAllOmniFeedItems or false;
        end, 
        getFriendCodeQrCodeScannerEnabled = function()
            return v38.FriendCodeQrCodeScannerEnabled or false;
        end, 
        getInviteFriendsDisabled = function()
            if not l_GetFFlagTenFootUiDisableInviteFriends_0() then
                return nil;
            else
                return v38.InviteFriendsDisabled or false;
            end;
        end, 
        getRealNamesInDisplayNamesEnabled = function()
            if not l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then
                return nil;
            else
                return v38.RealNamesInDisplayNamesEnabled or false;
            end;
        end, 
        getEnablePremiumUserFeatures = function()
            if not l_GetFFlagUseEnablePremiumUserFeaturesAppPolicy_0() then
                return nil;
            else
                return v38.EnablePremiumUserFeatures or false;
            end;
        end, 
        getEnableDualLogin = function()
            return v38.enableDualLogin or false;
        end, 
        getUseExternalBrowserForAgeGuidelines = function()
            if not l_GetFFlagUseExternalBrowserForAgeGuidelines10ft_0() then
                return nil;
            else
                return v38.UseExternalBrowserForAgeGuidelines or false;
            end;
        end, 
        getEnableHomePageAgeBlock = function()
            if not l_GetFFlagEnableMaquettesHomePageAgeBlock_0() then
                return nil;
            else
                return v38.EnableHomePageAgeBlock or false;
            end;
        end, 
        getContactsToastEnabled = function()
            if not l_GetFFlagContactsToastPolicyEnabled_0() then
                return nil;
            else
                return v38.ContactsToastEnabled or false;
            end;
        end, 
        getEnableProfileQrCode = function()
            return v38.EnableProfileQrCode or false;
        end, 
        getIsVNGGames = function()
            return v38.IsVNGGames or false;
        end, 
        getShowVNGAge12Badge = function()
            return v38.ShowVNGAge12Badge or false;
        end, 
        getUseVNGUserAgreementPopup = function()
            return v38.UseVNGUserAgreementPopup or false;
        end, 
        getVerifiedSignupCountry = function()
            return v38.verifiedSignupCountry or false;
        end, 
        getParentalConsentAgreementId = function()
            return v38.parentalConsentAgreementId or "";
        end, 
        getIsStrictComplianceEnabled = function()
            return v38.isStrictComplianceEnabled or false;
        end, 
        getUseKoreaKISAUserAgreementPopup = function()
            return v38.useKoreaKISAUserAgreementPopup or false;
        end, 
        getEnableNotificationPreferencesPage = function()
            if not l_GetFFlagEnableGateNotificationPreferencesTab_0() then
                return nil;
            else
                return v38.EnableNotificationPreferencesPage or false;
            end;
        end, 
        getVNGFormRequired = function()
            return v38.VNGFormRequired or false;
        end, 
        getUpsellVoiceForPhoneVerification = function()
            return v38.UpsellVoiceForPhoneVerification or false;
        end, 
        getIsLinkedVRModeAvailable = function()
            local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
            local v48 = true;
            if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.Windows then
                v48 = l_l_UserInputService_0_Platform_0 == Enum.Platform.UWP;
            end;
            return v48;
        end, 
        getShouldShowPhoneUpsell = function()
            return v38.ShouldShowPhoneUpsell or false;
        end, 
        getTermsOfUseLink = function()
            return v38.TermsOfUseLink or "";
        end, 
        getPrivacyPolicyLink = function()
            return v38.PrivacyPolicyLink or "";
        end, 
        getVngAppUpsell = function()
            if not l_FFlagLuaAppHomeVngAppUpsell_0 then
                return false;
            else
                return v38.VngAppUpsell or false;
            end;
        end
    };
end;
