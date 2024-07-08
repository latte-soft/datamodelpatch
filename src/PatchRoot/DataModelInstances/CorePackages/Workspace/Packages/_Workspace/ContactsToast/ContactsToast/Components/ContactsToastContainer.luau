local l_script_FirstAncestor_0 = script:FindFirstAncestor("ContactsToast");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.ExperienceService);
local v5 = require(l_Parent_0.Promise);
local v6 = require(l_Parent_0.React);
local v7 = require(l_Parent_0.Cryo);
local l_getDeepValue_0 = require(l_Parent_0.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue;
local v9 = require(l_Parent_0.RobloxAppHooks);
local l_useLocalUserId_0 = v9.useLocalUserId;
local l_useScreenSize_0 = v9.useScreenSize;
local l_SetCurrentToastMessage_0 = require(l_Parent_0.ToastRodux).Actions.SetCurrentToastMessage;
local l_PermissionsProtocol_0 = require(l_Parent_0.PermissionsProtocol).PermissionsProtocol;
local v14 = require(l_Parent_0.SocialModalsCommon);
local l_EnumScreens_0 = v14.EnumScreens;
local l_updateOptedInUsers_0 = v14.Utils.updateOptedInUsers;
local l_UpdateContactImporterModalLogic_0 = v14.Actions.UpdateContactImporterModalLogic;
local l_setTimeout_0 = require(l_Parent_0.LuauPolyfill).setTimeout;
local v19 = require(l_Parent_0.UIBlox);
local l_Toast_0 = v19.App.Dialog.Toast;
local l_Images_0 = v19.App.ImageSet.Images;
local l_IconSize_0 = v19.App.Constant.IconSize;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_GetFFlagContactsToastEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagContactsToastEnabled;
local l_getFFlagDiscoverabilityOverlayAmpUpsellFixEnabled_0 = require(l_Parent_0.SharedFlags).getFFlagDiscoverabilityOverlayAmpUpsellFixEnabled;
local l_UseExperienceService_0 = v4.Flags.UseExperienceService;
local l_ExperienceService_0 = v4.ExperienceService;
local v30 = require(l_script_FirstAncestor_0.Common.Constants);
local v31 = require(l_script_FirstAncestor_0.Utils.localStorageContactsToast);
local v32 = require(l_script_FirstAncestor_0.Networking.configureRoduxUsers);
local v33 = require(l_script_FirstAncestor_0.Experiments.ContactsToastIXP);
local l_Analytics_0 = require(l_script_FirstAncestor_0.Analytics).Analytics;
local v35 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
local v37 = game:DefineFastInt("ContactsToastAccountAgeThresholdInDays", 7);
local v38 = l_Images_0["icons/graphic/connectcontacts_large"];
local v39 = Vector2.new(l_IconSize_0.Large, l_IconSize_0.Large);
return function(v40)
    local v41, v42 = v6.useState(false);
    local v43 = l_useDispatch_0();
    local v44 = l_Analytics_0();
    local v45 = l_useLocalization_0({
        title = v30.Translations.title, 
        subtitle = v30.Translations.subtitle, 
        button = v30.Translations.button, 
        buttonV2 = v30.Translations.buttonV2
    });
    local v46 = v33.useContactsToastVariant();
    local v47 = l_useSelector_0(v40.getContactImporterParams);
    local l_isDiscoverabilityUnset_0 = v47.isDiscoverabilityUnset;
    local l_isPhoneVerified_0 = v47.isPhoneVerified;
    local v50 = l_useScreenSize_0();
    local v51 = l_useLocalUserId_0();
    local v53 = l_useSelector_0(function(v52)
        return v52.IsLocalUserUnder13;
    end);
    local v55 = l_useSelector_0(function(v54)
        if not l_GetFFlagContactsToastEnabled_0() and not v46 then
            return {};
        else
            return (l_getDeepValue_0(v54, (("%*.Users.byUserId.%*"):format(v30.RODUX_KEY, v51))));
        end;
    end);
    local l_default_0 = l_PermissionsProtocol_0.default;
    local function v58(v57)
        v43(l_SetCurrentToastMessage_0({
            toastMessage = v57
        }));
    end;
    local function v59()
        v43(v40.openContactImporterLearnMoreLink());
    end;
    local function v62(v60, v61)
        v43(v40.openProfilePeekView(v60, v61));
    end;
    local function v65(v63, v64)
        v43(v40.openAmpWizardContainer(v63, v64));
    end;
    local function v68(v66, v67)
        v43(v40.navigateToRoute({
            v7.Dictionary.join({
                name = v66
            }, v67)
        }));
    end;
    local function _()
        return l_default_0:checkOrRequestPermissions({
            l_PermissionsProtocol_0.Permissions.CONTACTS_ACCESS
        });
    end;
    local function _()
        if not v40.hasPermissions then
            return (l_default_0:hasPermissions({
                l_PermissionsProtocol_0.Permissions.CONTACTS_ACCESS
            }));
        else
            return (v40.hasPermissions());
        end;
    end;
    local function v71()
        v42(false);
        v44.fireAnalyticsEvent(v35.ContactsToastDismissed, {
            variant = v46
        });
    end;
    local function _()
        v43(l_UpdateContactImporterModalLogic_0({
            hasOSPermissions = true, 
            shouldShowContactImporterUpsellModal = false
        }));
    end;
    local v74 = v6.createElement(l_Toast_0, {
        duration = 4, 
        toastContent = {
            iconImage = v38, 
            toastTitle = v45.title, 
            toastSubtitle = v45.subtitle, 
            iconSize = v39, 
            onActivated = function()
                if l_l_UserInputService_0_Platform_0 == Enum.Platform.IOS then
                    l_default_0:checkOrRequestPermissions({
                        l_PermissionsProtocol_0.Permissions.CONTACTS_ACCESS
                    }):andThen(function(v73)
                        if v73 == l_PermissionsProtocol_0.Status.AUTHORIZED then
                            l_updateOptedInUsers_0:addUserToLocalStorage(l_AppStorageService_0, v51);
                            v43(l_UpdateContactImporterModalLogic_0({
                                hasOSPermissions = true, 
                                shouldShowContactImporterUpsellModal = false
                            }));
                            v68(l_EnumScreens_0.ContactsList, {
                                showToast = if not l_getFFlagDiscoverabilityOverlayAmpUpsellFixEnabled_0() then nil else v58, 
                                shouldUpdateUserSettings = true, 
                                isPhoneVerified = l_isPhoneVerified_0, 
                                openLearnMoreLink = v59, 
                                openAmpUpsell = v65
                            });
                            return v5.resolve();
                        elseif v73 == l_PermissionsProtocol_0.Status.DENIED then
                            v68(l_EnumScreens_0.ContactsRevokedAccessDialog, {
                                screenSize = v50
                            });
                            return v5.resolve();
                        else
                            return v5.reject();
                        end;
                    end);
                else
                    v68(l_EnumScreens_0.ContactImporter, {
                        showToast = v58, 
                        openLearnMoreLink = v59, 
                        isFromAddFriendsPage = false, 
                        isDiscoverabilityUnset = l_isDiscoverabilityUnset_0, 
                        isPhoneVerified = l_isPhoneVerified_0, 
                        openProfilePeekView = v62, 
                        openAmpUpsell = v65
                    });
                end;
                v42(false);
                v44.fireAnalyticsEvent(v35.ContactsToastButtonPressed, {
                    variant = v46
                });
            end, 
            onDismissed = v71, 
            buttonText = if v46 == v30.Experiment.FIND_FRIENDS then v45.button else v45.buttonV2, 
            swipeUpDismiss = true
        }
    });
    local function _()
        if (v51 and string.len(v51) > 0) and v51 ~= "0" then
            v43(v32.GetUserV2FromUserId.API(v51));
        end;
    end;
    v6.useEffect(function()
        if (v51 and string.len(v51) > 0) and v51 ~= "0" then
            v43(v32.GetUserV2FromUserId.API(v51));
        end;
    end, {
        v51
    });
    v6.useEffect(function()
        if not ((not (v51 and string.len(v51) > 0) or not v55) or not v55.created) then
            local v76, v77, v78 = v55.created:match("(%d+)-(%d+)-(%d+)");
            local v79 = math.floor((os.time() - os.time({
                year = v76, 
                month = v77, 
                day = v78
            })) / 86400);
            if not (((not (l_UseExperienceService_0() and v79 <= v37) or not v40.isContactsToastPolicyEnabled) or v53) or not v31:CheckUserHasNotSeen(v51)) then
                (if not v40.hasPermissions then l_default_0:hasPermissions({
                    l_PermissionsProtocol_0.Permissions.CONTACTS_ACCESS
                }) else v40.hasPermissions()):andThen(function(v80)
                    if not ((not (v80.status == l_PermissionsProtocol_0.Status.DENIED) or v80.missingPermissions[1] ~= l_PermissionsProtocol_0.Permissions.CONTACTS_ACCESS) and (not (v80.status ~= l_PermissionsProtocol_0.Status.DENIED) or not v31:CheckUserHasNotOptedIn(v51))) then
                        l_ExperienceService_0:RegisterForExperienceLeave(function()
                            if v31:CheckUserHasNotSeen(v51) then
                                l_setTimeout_0(function()
                                    v42(true);
                                    v31:AddUser(v51);
                                    v44.fireAnalyticsEvent(v35.ContactsToastSeen, {
                                        variant = v46
                                    });
                                end, 1000);
                            end;
                        end);
                    end;
                end);
            end;
        end;
    end, {
        v51, 
        v40.isContactsToastPolicyEnabled, 
        v53, 
        v55
    });
    if not (not (not v40.isContactsToastPolicyEnabled or v53) and v41) and not v40.testOverride then
        return nil;
    else
        return (v6.createElement("ScreenGui", {
            DisplayOrder = 13
        }, {
            v6.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, -20), 
                Position = UDim2.new(0, 0, 0, 20)
            }, v74)
        }));
    end;
end;
