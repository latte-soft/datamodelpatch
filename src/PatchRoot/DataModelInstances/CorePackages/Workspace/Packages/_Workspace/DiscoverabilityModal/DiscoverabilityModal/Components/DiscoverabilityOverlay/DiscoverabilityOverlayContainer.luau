local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_EnumScreens_0 = v1.SocialModalsCommon.EnumScreens;
local v3 = require(l_Parent_0.Common.TextKeys);
local v4 = require(l_Parent_0.Common.Constants);
local l_Analytics_0 = l_Parent_0.Analytics;
local v6 = require(l_Analytics_0.useAnalytics);
local v7 = require(l_Analytics_0.Enums.EventNames);
local l_updateOptedInUsers_0 = v1.SocialModalsCommon.Utils.updateOptedInUsers;
local l_UpdateContactImporterModalLogic_0 = v1.SocialModalsCommon.Actions.UpdateContactImporterModalLogic;
local l_UpdateIsDiscoverabilityUnset_0 = v1.SocialModalsCommon.Actions.UpdateIsDiscoverabilityUnset;
local l_NetworkingUserSettings_0 = v1.NetworkingUserSettings;
local l_PermissionsProtocol_0 = v1.PermissionsProtocol;
local l_Promise_0 = v1.Promise;
local l_Dash_0 = v1.Dash;
local l_AppStorageService_0 = v1.AppStorageService;
local l_SocialLibraries_0 = v1.SocialLibraries;
local l_React_0 = v1.React;
local l_useSelector_0 = v1.Hooks.useSelector;
local l_useDispatch_0 = v1.Hooks.useDispatch;
local v20 = require(l_Parent_0.Flags.SelfViewProfileDiscoverabilityUpsellIXP);
local l_getDeepValue_0 = l_SocialLibraries_0.Dictionary.getDeepValue;
local v22 = require(script.Parent.DiscoverabilityOverlay);
local v24 = {
    checkOrRequestPermissions = function(v23)
        return l_PermissionsProtocol_0.default:checkOrRequestPermissions(v23);
    end
};
return function(v25)
    local v26 = l_Dash_0.join(v24, v25 or {});
    local function _(v27)
        if not v26.navigation then
            return l_getDeepValue_0(v26, v27);
        else
            return v26.navigation.getParam(v27);
        end;
    end;
    local v29;
    if not v20.SetupEnabled() then
        v29 = v26.navigation.getParam(v4.IS_STANDALONE_DISCOVERABILITY_MODAL);
    else
        local l_IS_STANDALONE_DISCOVERABILITY_MODAL_0 = v4.IS_STANDALONE_DISCOVERABILITY_MODAL;
        v29 = if not v26.navigation then l_getDeepValue_0(v26, l_IS_STANDALONE_DISCOVERABILITY_MODAL_0) else v26.navigation.getParam(l_IS_STANDALONE_DISCOVERABILITY_MODAL_0);
    end;
    local v31 = l_useDispatch_0();
    local v32 = v6();
    local v34 = l_useSelector_0(function(v33)
        return v33.ScreenSize;
    end);
    local v36 = l_useSelector_0(function(v35)
        return v35.LocalUserId;
    end);
    local v37 = l_React_0.useCallback(function()
        if not v26.navigation then
            if v26.onClose then
                v26.onClose();
            end;
            return ;
        else
            v26.navigation.pop();
            return ;
        end;
    end, {
        v26
    });
    local v39 = l_useSelector_0(function(v38)
        return l_getDeepValue_0(v38, "DiscoverabilityModal.UserPermissions.userSettingsMetadata");
    end);
    l_React_0.useEffect(function()
        local _ = nil;
        v32.fireAnalyticsEvent(v7.DiscoverabilityModalLoad, {
            version = if not v39.prefillDiscoverabilitySetting then v4.GDPR_VERSION else v4.NON_GDPR_VERSION_CHECKBOX, 
            wordingVersion = v4.WORDING_VERSION_1
        });
    end, {});
    local function v42(v41)
        v32.fireAnalyticsEvent(v7.DiscoverabilityModalClose, {
            selected = v41
        });
        if not v20.SetupEnabled() then
            v26.navigation.pop();
            return ;
        else
            v37();
            return ;
        end;
    end;
    local function v45()
        local v43;
        if not v20.SetupEnabled() then
            v43 = v26.navigation.getParam(v4.OPEN_LEARN_MORE_LINK);
        else
            local l_OPEN_LEARN_MORE_LINK_0 = v4.OPEN_LEARN_MORE_LINK;
            v43 = if not v26.navigation then l_getDeepValue_0(v26, l_OPEN_LEARN_MORE_LINK_0) else v26.navigation.getParam(l_OPEN_LEARN_MORE_LINK_0);
        end;
        v43();
    end;
    local function v49(_)
        local v47;
        if not v20.SetupEnabled() then
            v47 = v26.navigation.getParam(v4.SHOW_TOAST);
        else
            local l_SHOW_TOAST_0 = v4.SHOW_TOAST;
            v47 = if not v26.navigation then l_getDeepValue_0(v26, l_SHOW_TOAST_0) else v26.navigation.getParam(l_SHOW_TOAST_0);
        end;
        v47(v3.CI_FAILED);
    end;
    local function _()
        return v31(l_UpdateContactImporterModalLogic_0({
            hasOSPermissions = true, 
            shouldShowContactImporterUpsellModal = false
        }));
    end;
    local function _()
        return v31(l_UpdateIsDiscoverabilityUnset_0({
            isDiscoverabilityUnset = false
        }));
    end;
    local function _(v52, v53)
        return v31(l_NetworkingUserSettings_0.UpdateUserSettings.API({
            canUploadContacts = v52, 
            phoneNumberDiscoverability = v53
        }));
    end;
    return l_React_0.createElement(v22, {
        screenSize = v34, 
        onCloseClicked = v42, 
        onLearnMoreClick = v45, 
        onActivated = function(v55)
            v32.fireAnalyticsEvent(v7.DiscoverabilityModalContinue, {
                selected = v55
            });
            if not v29 then
                v26.checkOrRequestPermissions({
                    l_PermissionsProtocol_0.Permissions.CONTACTS_ACCESS
                }):andThen(function(v56)
                    if v56 == l_PermissionsProtocol_0.Status.AUTHORIZED then
                        l_updateOptedInUsers_0:addUserToLocalStorage(l_AppStorageService_0, v36);
                        local _ = v31(l_UpdateContactImporterModalLogic_0({
                            hasOSPermissions = true, 
                            shouldShowContactImporterUpsellModal = false
                        }));
                        v31(l_NetworkingUserSettings_0.UpdateUserSettings.API({
                            canUploadContacts = true, 
                            phoneNumberDiscoverability = v55
                        })):andThen(function()
                            local _ = v31(l_UpdateIsDiscoverabilityUnset_0({
                                isDiscoverabilityUnset = false
                            }));
                            v26.navigation.pop();
                            v26.navigation.navigate(l_EnumScreens_0.ContactsList, {
                                [v4.IS_PHONE_VERIFIED] = true
                            });
                        end);
                        return ;
                    elseif v56 == l_PermissionsProtocol_0.Status.DENIED then
                        v31(l_NetworkingUserSettings_0.UpdateUserSettings.API({
                            canUploadContacts = false, 
                            phoneNumberDiscoverability = v55
                        })):andThen(function()
                            v26.navigation.navigate(l_EnumScreens_0.ContactsRevokedAccessDialog, {
                                screenSize = v34, 
                                closeModal = function()
                                    v26.navigation.pop();
                                end
                            });
                        end);
                        return ;
                    else
                        return l_Promise_0.reject();
                    end;
                end):catch(v49);
                return ;
            else
                v31(l_NetworkingUserSettings_0.UpdateUserSettings.API({
                    canUploadContacts = nil, 
                    phoneNumberDiscoverability = v55
                })):andThen(function()
                    if not v20.SetupEnabled() then
                        local v59 = v26.navigation.getParam(v4.SHOW_TOAST);
                        v26.navigation.pop();
                        v26.navigation.navigate(l_EnumScreens_0.AddFriendsPage);
                        v59(v3.SETTING_SAVED);
                        return ;
                    else
                        local v60 = v31(l_UpdateIsDiscoverabilityUnset_0({
                            isDiscoverabilityUnset = false
                        }));
                        local l_NAVIGATE_ON_ACTIVATED_0 = v4.NAVIGATE_ON_ACTIVATED;
                        v60 = if not v26.navigation then l_getDeepValue_0(v26, l_NAVIGATE_ON_ACTIVATED_0) else v26.navigation.getParam(l_NAVIGATE_ON_ACTIVATED_0);
                        local l_SHOW_TOAST_1 = v4.SHOW_TOAST;
                        l_NAVIGATE_ON_ACTIVATED_0 = if not v26.navigation then l_getDeepValue_0(v26, l_SHOW_TOAST_1) else v26.navigation.getParam(l_SHOW_TOAST_1);
                        v37();
                        v60();
                        l_NAVIGATE_ON_ACTIVATED_0(v3.SETTING_SAVED);
                        return ;
                    end;
                end);
                return ;
            end;
        end, 
        prefillDiscoverabilitySetting = v39.prefillDiscoverabilitySetting, 
        analytics = v32
    });
end;
