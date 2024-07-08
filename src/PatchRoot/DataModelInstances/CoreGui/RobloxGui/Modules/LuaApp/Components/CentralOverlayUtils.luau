local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v4 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local _ = require(l_CorePackages_0.Workspace.Packages.React);
local l_createLazyComponent_0 = v4.Components.createLazyComponent;
return {
    OverlayComponent = {
        [v3.VerifyPhoneNumber] = l_createLazyComponent_0(function()
            return require(l_Modules_0.LuaApp.Components.Authentication.VerifyPhoneNumber);
        end), 
        [v3.VerifiedEnableVoice] = l_createLazyComponent_0(function()
            return require(l_Modules_0.LuaApp.Components.Verification.IdentityVerification.VerifiedEnableVoiceModal);
        end), 
        [v3.UserAgreementsUpdatedPopup] = l_createLazyComponent_0(function()
            return require(l_Modules_0.LuaApp.Components.UserAgreement.UserAgreementsUpdatedPopup);
        end), 
        [v3.VNGUserAgreementsPopup] = l_createLazyComponent_0(function()
            return require(l_Modules_0.LuaApp.Components.UserAgreement.VNGUserAgreementsPopup);
        end), 
        [v3.UserAgreementsSecondPrompt] = l_createLazyComponent_0(function()
            return require(l_Modules_0.Luobu.Components.Authentication.UserAgreementsSecondPrompt);
        end), 
        [v3.UserAgreementsPrompt] = l_createLazyComponent_0(function()
            return require(l_Modules_0.Luobu.Components.Authentication.UserAgreementsPrompt);
        end), 
        [v3.TencentNoticePopup] = l_createLazyComponent_0(function()
            return require(l_Modules_0.Luobu.Components.TencentNoticePopup.TencentNoticePopup);
        end), 
        [v3.SimpleTextAlertPrompt] = l_createLazyComponent_0(function()
            return require(l_Modules_0.Luobu.Components.Authentication.SimpleTextAlertPrompt);
        end), 
        [v3.SignUpBirthdayPickerOverlay] = l_createLazyComponent_0(function()
            return require(l_Modules_0.LuaApp.Components.Authentication.SignUpBirthdayPickerOverlay);
        end), 
        [v3.PurchaseGameRobuxShortfall] = l_createLazyComponent_0(function()
            return require(l_Modules_0.LuaApp.Components.GameDetails.PurchaseGameRobuxShortfallPrompt);
        end), 
        [v3.PurchaseGame] = l_createLazyComponent_0(function()
            return require(l_Modules_0.LuaApp.Components.GameDetails.PurchaseGamePrompt);
        end), 
        [v3.PlacesList] = l_createLazyComponent_0(function()
            return require(l_Modules_0.LuaApp.Components.Home.PlacesListContextualMenu);
        end), 
        [v3.PeopleList] = l_createLazyComponent_0(function()
            return require(l_Modules_0.LuaApp.Components.Home.PeopleListContextualMenuFn);
        end), 
        [v3.LoginPasswordResetPrompt] = l_createLazyComponent_0(function()
            return require(l_Modules_0.LuaApp.Components.Authentication.PasswordResetPrompt);
        end), 
        [v3.LoginEmailVerificationPrompt] = l_createLazyComponent_0(function()
            return require(l_Modules_0.LuaApp.Components.Authentication.LoginEmailVerificationPrompt);
        end), 
        [v3.UpdateRequiredPrompt] = if not require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagMoveUpdateCheckToUniversalApp() then nil else l_createLazyComponent_0(function()
            return require(l_Modules_0.LuaApp.Components.UpdateRequiredPrompt);
        end), 
        [v3.LeaveRobloxAlert] = l_createLazyComponent_0(function()
            return require(l_Modules_0.LuaApp.Components.GameDetails.LeaveRobloxAlert);
        end), 
        [v3.ReportLogsOverlay] = l_createLazyComponent_0(function()
            return require(l_Modules_0.LuaApp.Components.More.ReportLogsOverlay);
        end), 
        [v3.GameDetailsPlayWithFriends] = l_createLazyComponent_0(function()
            return require(l_Modules_0.LuaApp.Components.GameDetails.GameDetailsPlayWithFriendsContextualMenu);
        end), 
        [v3.GameDetailMore] = l_createLazyComponent_0(function()
            return require(l_Modules_0.LuaApp.Components.GameDetails.GameDetailMoreContextualMenu);
        end), 
        [v3.ExperienceGuidelinesExplained] = l_createLazyComponent_0(function()
            return require(l_Modules_0.LuaApp.Components.ExperienceGuidelines.ExperienceGuidelinesExplained);
        end), 
        [v3.FindFriendsModal] = l_createLazyComponent_0(function()
            return require(l_Modules_0.LuaApp.Components.ContactImporter.api).FindFriendsModal;
        end), 
        [v3.EmailVerificationUpsellOverlay] = l_createLazyComponent_0(function()
            return require(l_Modules_0.LuaApp.Components.Authentication.VerificationUpsell.EmailVerificationUpsellOverlay);
        end), 
        [v3.PhoneVerificationUpsellOverlay] = l_createLazyComponent_0(function()
            return require(l_CorePackages_0.Workspace.Packages.PhoneUpsell).PhoneVerificationUpsellOverlay;
        end), 
        [v3.PhoneVerificationUpsellOverlayWrapper] = l_createLazyComponent_0(function()
            return require(l_CorePackages_0.Workspace.Packages.PhoneUpsell).PhoneVerificationUpsellOverlayWrapper;
        end), 
        [v3.VoicePhoneVerificationUpsellOverlayWrapper] = l_createLazyComponent_0(function()
            return require(l_CorePackages_0.Workspace.Packages.PhoneUpsell).VoicePhoneVerificationUpsellOverlayWrapper;
        end), 
        [v3.DevSubMore] = l_createLazyComponent_0(function()
            return require(l_Modules_0.LuaApp.Components.DevSubMoreMenu);
        end), 
        [v3.DevSubConfirmCancel] = l_createLazyComponent_0(function()
            return require(l_Modules_0.LuaApp.Components.DevSubConfirmCancelPrompt);
        end), 
        [v3.CrossDeviceLoginConfirmation] = l_createLazyComponent_0(function()
            return require(l_Modules_0.LuaApp.Components.Authentication.CrossDeviceLogin.LoginConfirmationPrompt);
        end), 
        [v3.CrossDeviceCodePrompt] = l_createLazyComponent_0(function()
            return require(l_Modules_0.LuaApp.Components.Authentication.CrossDeviceLogin.LoginCodePrompt);
        end), 
        [v3.ContactsList] = l_createLazyComponent_0(function()
            return require(l_Modules_0.LuaApp.Components.ContactImporter.api).ContactsList;
        end), 
        [v3.ContactMethodPromptModalOverlay] = l_createLazyComponent_0(function()
            return require(l_Modules_0.LuaApp.Components.Authentication.VerificationUpsell.ContactMethodPromptModalOverlay);
        end), 
        [v3.ConfirmSignOut] = l_createLazyComponent_0(function()
            return require(l_Modules_0.LuaApp.Components.Authentication.ConfirmSignOut);
        end), 
        [v3.CameraPermissionPrompt] = l_createLazyComponent_0(function()
            return require(l_Modules_0.LuaApp.Components.CameraPermissionPrompt);
        end), 
        [v3.AgreeToPhoneNumberVerification] = l_createLazyComponent_0(function()
            return require(l_Modules_0.LuaApp.Components.Authentication.AgreeToPhoneNumberVerification);
        end), 
        [v3.AccountAuthenticationFailureOverlay] = l_createLazyComponent_0(function()
            return require(l_Modules_0.LuaApp.Components.Authentication.AccountAuthenticationFailureOverlay);
        end), 
        [v3.PurchasePass] = l_createLazyComponent_0(function()
            return require(l_Modules_0.LuaApp.Components.Passes.PurchasePassPrompt);
        end), 
        [v3.PurchasePassInsufficientRobux] = l_createLazyComponent_0(function()
            return require(l_Modules_0.LuaApp.Components.Passes.PurchasePassInsufficientRobuxPrompt);
        end), 
        [v3.AccountSecurityPromptOverlay] = if not require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppAccountSecurityPromptEnabled)() then nil else l_createLazyComponent_0(function()
            return require(l_Modules_0.LuaApp.Components.AccountSecurity.PromptOverlay);
        end), 
        [v3.DiscoverabilityUpsell] = if not require(l_CorePackages_0.Workspace.Packages.DiscoverabilityModal).Flags.SelfViewProfileDiscoverabilityUpsellIXP.SetupEnabled() then nil else l_createLazyComponent_0(function()
            return require(l_Modules_0.LuaApp.Components.DiscoverabilityModal.api).DiscoverabilityOverlay;
        end), 
        [v3.SurveyPrompt] = l_createLazyComponent_0(function()
            return require(l_Modules_0.LuaApp.Components.EventReceivers.SurveyPrompt);
        end), 
        [v3.PlayerContextualMenu] = l_createLazyComponent_0(function()
            return require(l_CorePackages_0.Workspace.Packages.PlayerContextualMenu).Component;
        end), 
        [v3.GamepadDisconnected] = l_createLazyComponent_0(function()
            return require(l_CorePackages_0.Workspace.Packages.InputUi).Gamepad.GamepadDisconnectedModal;
        end), 
        [v3.IapExperienceAnimator] = l_createLazyComponent_0(function()
            return require(l_CorePackages_0.Workspace.Packages.IAPExperience).Animator;
        end), 
        [v3.AccountSelector] = if not require(l_Modules_0.LuaApp.Flags.GetFFlagEnableLoginAccountSelector)() then nil else l_createLazyComponent_0(function()
            return require(l_CorePackages_0.Workspace.Packages.AccountSelector).AccountSelectorOverlay;
        end), 
        [v3.EmailOtp] = if not require(l_Modules_0.LuaApp.Flags.GetFFlagEnableOtpEmailLogin)() then nil else l_createLazyComponent_0(function()
            return require(l_CorePackages_0.Workspace.Packages.OtpLogin).EmailOtpOverlay;
        end), 
        [v3.VngContactInfoFormWebviewPopup] = l_createLazyComponent_0(function()
            return require(l_Modules_0.LuaApp.Components.Vng.VngContactInfoFormWebviewPopup);
        end), 
        [v3.NewAppAvailableModal] = if not require(l_Modules_0.LuaApp.Flags.GetFFlagEnableVNGNewAppAvailableModal)() then nil else l_createLazyComponent_0(function()
            return require(l_Modules_0.LuaApp.Components.Authentication.NewAppAvailableInteractiveAlert);
        end), 
        [v3.AccountSwitchingErrorOverlay] = if not require(l_Modules_0.LuaApp.Flags.FFlagEnableLuaAccountSwitch) then nil else l_createLazyComponent_0(function()
            return require(l_CorePackages_0.Workspace.Packages.AccountSwitching).AccountSwitchingErrorOverlay;
        end), 
        [v3.CloseOnlyInteractiveAlert] = if not require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppSortTooltipEnableVR() then nil else l_createLazyComponent_0(function()
            return require(l_CorePackages_0.Workspace.Packages.AppBlox).CloseOnlyInteractiveAlert;
        end), 
        [v3.SquadLeavePrompt] = if not require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableSquadPage() then nil else l_createLazyComponent_0(function()
            return require(l_CorePackages_0.Workspace.Packages.Squads).SquadLeavePrompt;
        end), 
        [v3.VngComplianceLoadingPopup] = if not require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagUseUpdatedVNGAgreementsWorkflow() then nil else l_createLazyComponent_0(function()
            return require(l_Modules_0.LuaApp.Components.Vng.VngComplianceLoadingPopup);
        end), 
        [v3.KISAPopUpAgreements] = if not require(l_Modules_0.LuaApp.Flags.FFlagEnableKoreaKISACompliance) then nil else l_createLazyComponent_0(function()
            return require(l_CorePackages_0.Workspace.Packages.AuthCompliance).KISAPopUpAgreements;
        end), 
        [v3.ItemsReceivedAlert] = if not require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagItemsReceivedAlert() then nil else l_createLazyComponent_0(function()
            return require(l_CorePackages_0.Workspace.Packages.ItemsReceivedAlert).ItemsReceivedAlert;
        end), 
        [v3.VngAppUpsell] = if not require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppHomeVngAppUpsell then nil else l_createLazyComponent_0(function()
            return require(l_Modules_0.Personalization.Home.VngAppUpsell.VngAppUpsellOverlay);
        end)
    }
};
