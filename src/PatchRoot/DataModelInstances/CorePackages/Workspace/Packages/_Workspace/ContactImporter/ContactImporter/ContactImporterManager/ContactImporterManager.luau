local l_Parent_0 = script.Parent.Parent;
local l_CoreGui_0 = game:GetService("CoreGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_Parent_1 = l_Parent_0.Parent;
local v5 = require(l_Parent_0.dependencies);
local v6 = require(l_Parent_1.React);
local v7 = require(l_Parent_1.Roact);
local v8 = require(l_Parent_1.Dash);
local v9 = require(l_Parent_1.Promise);
local v10 = require(l_Parent_1.Cryo);
local v11 = require(l_Parent_1.SocialModalsCommon);
local v12 = require(l_Parent_1.RobloxAppHooks);
local v13 = require(l_Parent_1.AppStartup);
local l_useQuery_0 = require(l_Parent_1.ApolloClient).useQuery;
local v15 = require(l_Parent_1.ApolloLocalState);
local v16 = require(l_Parent_1.ApolloFriends);
local l_queries_0 = v15.queries;
local l_ContactsToast_0 = require(l_Parent_1.ContactsToast).ContactsToast;
local l_ContactsToastIXP_0 = require(l_Parent_1.ContactsToast).ContactsToastIXP;
local l_PermissionsProtocol_0 = require(l_Parent_1.PermissionsProtocol).PermissionsProtocol;
local l_SetCurrentToastMessage_0 = require(l_Parent_1.ToastRodux).Actions.SetCurrentToastMessage;
local l_useDispatch_0 = require(l_Parent_1.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_Parent_1.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useFetchContactImporterInfoOnce_0 = require(l_Parent_0.Utils).useFetchContactImporterInfoOnce;
local l_useAutoSyncContacts_0 = require(l_Parent_0.Utils).useAutoSyncContacts;
local l_getContactImporterParams_0 = require(l_Parent_0.Utils).getContactImporterParams;
local l_EnumScreens_0 = v11.EnumScreens;
local l_updateOptedInUsers_0 = v11.Utils.updateOptedInUsers;
local l_UpdateContactImporterModalLogic_0 = v11.Actions.UpdateContactImporterModalLogic;
local l_useLaunchContext_0 = v13.Hooks.useLaunchContext;
local l_LaunchContext_0 = v13.Enums.LaunchContext;
local l_useLocalUserId_0 = v12.useLocalUserId;
local l_useScreenSize_0 = v12.useScreenSize;
local l_UniversalAppPolicy_0 = v5.UniversalAppPolicy;
local l_getAppFeaturePolicies_0 = require(l_Parent_1.UniversalAppPolicy).getAppFeaturePolicies;
local l_GetFFlagContactsToastEnabled_0 = require(l_Parent_1.SharedFlags).GetFFlagContactsToastEnabled;
local v37 = require(l_Parent_0.Flags.FFlagUpsellPhoneAndContactsAfterSignup);
local v38 = require(l_Parent_0.Experiments.AfterSignupIXP);
local v39 = require(l_Parent_0.Common.SignupIXPVariants);
local v40 = require(l_Parent_0.Experiments.PaginatedFriendsCarouselIXP);
local l_FFlagContactImporterPhoneAndContactsAfterSignupFixes_0 = require(l_Parent_1.SharedFlags).FFlagContactImporterPhoneAndContactsAfterSignupFixes;
local v42 = require(l_Parent_0.Flags.FFlagContactImporterManagerPolicyFix);
local v43 = require(l_Parent_0.Flags.FFlagAddPolicyForVoiceUpsellSignup);
local v44 = game:DefineFastFlag("EarlierFetchTimeForFriendsCarousel_v1", false);
local l_FIntFriendsCarouselInitialFetchSize_0 = require(l_Parent_1.SharedFlags).FIntFriendsCarouselInitialFetchSize;
local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
return l_UniversalAppPolicy_0.connect(function(v47)
    return {
        isContactImporterPolicyEnabled = v47.getContactImporterEnabled(), 
        isContactsToastPolicyEnabled = if l_GetFFlagContactsToastEnabled_0() or l_ContactsToastIXP_0.FFlagContactsToastExperimentEnabled then v47.getContactsToastEnabled() else false
    };
end)(function(v48)
    local v49 = l_useDispatch_0();
    local v50 = l_useLocalUserId_0();
    local v51 = l_useLaunchContext_0();
    local v52 = l_useScreenSize_0();
    local v53, v54 = v6.useState(false);
    local v55 = if not v38.FFlagPVandCIAfterSignupExperimentEnabled then nil else v38.usePVAndCIAfterSignupVariant({
        isExposureEnabled = true
    });
    local l_default_0 = l_PermissionsProtocol_0.default;
    local v57 = if not v42 then v48.isContactImporterPolicyEnabled else v48.isContactImporterPolicyEnabled or l_getAppFeaturePolicies_0().getContactImporterEnabled();
    local v58 = not v43 and true or l_getAppFeaturePolicies_0().getUpsellVoiceForPhoneVerification();
    l_useFetchContactImporterInfoOnce_0({
        policyIsEnabled = v57
    });
    local function v60(v59)
        v49(l_SetCurrentToastMessage_0({
            toastMessage = v59
        }));
    end;
    local function _()
        return l_default_0:checkOrRequestPermissions({
            l_PermissionsProtocol_0.Permissions.CONTACTS_ACCESS
        });
    end;
    local function _()
        v49(l_UpdateContactImporterModalLogic_0({
            hasOSPermissions = true, 
            shouldShowContactImporterUpsellModal = false
        }));
    end;
    local v63 = l_useSelector_0(l_getContactImporterParams_0);
    local l_isPhoneVerified_0 = v63.isPhoneVerified;
    local l_isDiscoverabilityUnset_0 = v63.isDiscoverabilityUnset;
    local function v67()
        if not l_FFlagContactImporterPhoneAndContactsAfterSignupFixes_0 then
            if l_l_UserInputService_0_Platform_0 == Enum.Platform.IOS then
                l_default_0:checkOrRequestPermissions({
                    l_PermissionsProtocol_0.Permissions.CONTACTS_ACCESS
                }):andThen(function(v66)
                    if v66 == l_PermissionsProtocol_0.Status.AUTHORIZED then
                        l_updateOptedInUsers_0:addUserToLocalStorage(l_AppStorageService_0, v50);
                        v49(l_UpdateContactImporterModalLogic_0({
                            hasOSPermissions = true, 
                            shouldShowContactImporterUpsellModal = false
                        }));
                        return v9.resolve();
                    elseif v66 == l_PermissionsProtocol_0.Status.DENIED then
                        v48.navigate(l_EnumScreens_0.ContactsRevokedAccessDialog, {
                            screenSize = v52
                        });
                        return v9.resolve();
                    else
                        return v9.reject();
                    end;
                end);
                return ;
            else
                v48.navigate(l_EnumScreens_0.ContactImporter, {
                    showToast = v60, 
                    openLearnMoreLink = v48.openContactImporterLearnMoreLink, 
                    isFromAddFriendsPage = false, 
                    isDiscoverabilityUnset = l_isDiscoverabilityUnset_0, 
                    isPhoneVerified = l_isPhoneVerified_0, 
                    openProfilePeekView = v48.openProfilePeekView, 
                    openAmpUpsell = v48.openAmpUpsell
                });
                return ;
            end;
        else
            v48.navigate(l_EnumScreens_0.ContactImporter, {
                showToast = v60, 
                openLearnMoreLink = v48.openContactImporterLearnMoreLink, 
                isFromAddFriendsPage = false, 
                isDiscoverabilityUnset = l_isDiscoverabilityUnset_0, 
                isPhoneVerified = l_isPhoneVerified_0, 
                openProfilePeekView = v48.openProfilePeekView, 
                openAmpUpsell = v48.openAmpUpsell, 
                isFromSignup = true
            });
            return ;
        end;
    end;
    local function v68()
        if not (not l_FFlagContactImporterPhoneAndContactsAfterSignupFixes_0 or not v48.hideUpsellCard) then
            v48.hideUpsellCard();
        end;
        v48.openDiscoverabilityModal({
            showToast = v60, 
            openLearnMoreLink = v48.openContactImporterLearnMoreLink, 
            isStandaloneDiscoverabilityModal = true, 
            entryPoint = "", 
            onClose = v48.onCloseDiscoverabilityModal, 
            navigateOnActivated = if v55 == v39.FULL then v67 else v48.onCloseDiscoverabilityModal
        });
    end;
    local function v69()
        v49(v48.closeCentralOverlay());
    end;
    local function v70()
        if not v58 then
            if v55 == v39.FULL then
                v67();
            end;
            return ;
        else
            v49(v48.openPhoneUpsellModal({
                onSuccess = v68, 
                eventContext = "verificationUpsell", 
                origin = "signup", 
                shouldAutofillAndroidPhoneNumberAtLaunch = true, 
                addPhoneTitleKey = "Feature.ContactUpsell.Header.UnlockVoiceChat", 
                extraButtonTextKey = "Feature.AccountSecurityPrompt.Action.RemindMeLater", 
                onExtraButtonClick = if not l_FFlagContactImporterPhoneAndContactsAfterSignupFixes_0 then v48.closeCentralOverlay else v69
            }, true));
            return ;
        end;
    end;
    v6.useEffect(function()
        if (v42 and v50 ~= "") and v50 ~= "0" then
            v48.waitUntilIXPUserInit(v50):andThen(function()
                v54(true);
            end);
        end;
    end, {
        v50
    });
    v6.useEffect(function()
        if not (not (((not (not v37 and not v55) and v50 ~= "") and v50 ~= "0") and v51 == l_LaunchContext_0.SignUp) or not v57) then
            if v38.FFlagPVandCIAfterSignupExperimentEnabled then
                v38.logExposure();
            end;
            if (v55 ~= v39.FULL and v55 ~= v39.PHONE_VERIFCATION) and not v37 then
                if v55 == v39.CONTACT_IMPORTER then
                    v67();
                end;
            else
                v70();
                return ;
            end;
        end;
    end, if not l_FFlagContactImporterPhoneAndContactsAfterSignupFixes_0 then {
        v50, 
        v51, 
        v55
    } else {
        v50, 
        v51, 
        v55, 
        v57, 
        v53
    });
    if v44 then
        local v71, v72 = v40.usePaginatedFriendsCarouselExperiment();
        local v73 = {
            userId = v50, 
            sort = not not v71 and v72 or v16.Enums.Sort.FriendshipScore
        };
        l_useQuery_0(l_queries_0.allFriendsByUserId, {
            errorPolicy = "all", 
            skip = not v71, 
            notifyOnNetworkStatusChange = true, 
            variables = v10.Dictionary.join(v73, {
                pageLimit = l_FIntFriendsCarouselInitialFetchSize_0, 
                pageCursor = ""
            })
        });
        l_useQuery_0(l_queries_0.onlineFriendsByUserId, {
            skip = not v71, 
            notifyOnNetworkStatusChange = true, 
            variables = v73
        });
    end;
    l_useAutoSyncContacts_0();
    if not l_GetFFlagContactsToastEnabled_0() and (not l_ContactsToastIXP_0.FFlagContactsToastExperimentEnabled or not l_ContactsToastIXP_0.useContactsToastVariant()) then
        return nil;
    else
        return (v6.createElement(v7.Portal, {
            target = l_CoreGui_0
        }, {
            v6.createElement(l_ContactsToast_0, v8.join(v48, {
                getContactImporterParams = l_getContactImporterParams_0, 
                isContactsToastPolicyEnabled = v48.isContactsToastPolicyEnabled
            }))
        }));
    end;
end);
