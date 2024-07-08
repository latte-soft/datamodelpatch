local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local v2 = require(l_Parent_0.Common.TextKeys);
local v3 = require(l_Parent_0.Utils.contactImporterModalInfoUpdater);
local l_updateOptedInUsers_0 = v1.SocialModalsCommon.Utils.updateOptedInUsers;
local l_EnumScreens_0 = v1.SocialModalsCommon.EnumScreens;
local v6 = require(l_Parent_0.Common.Constants);
local v7 = require(l_Parent_0.Analytics);
local l_Roact_0 = v1.Roact;
local l_RoactRodux_0 = v1.RoactRodux;
local l_PermissionsProtocol_0 = v1.PermissionsProtocol;
local l_Promise_0 = v1.Promise;
local l_SelfViewProfileDiscoverabilityUpsellIXP_0 = v1.SelfViewProfileDiscoverabilityUpsellIXP;
local v13 = require(script.Parent.ContactsImporterOverlay);
local v14 = require(script.Parent.mapDispatchToProps);
local l_Selectors_0 = v1.RoduxContacts.Selectors;
local l_AppStorageService_0 = v1.AppStorageService;
local l_compose_0 = v1.SocialLibraries.RoduxTools.compose;
local _ = require(l_Parent_0.ContactsList.Components.ContactImporterContext);
local l_DiscoverabilityAnalytics_0 = v1.DiscoverabilityAnalytics;
local l_getFFlagDiscoverabilityOverlayAmpUpsellFixEnabled_0 = v1.getFFlagDiscoverabilityOverlayAmpUpsellFixEnabled;
local l_FFlagContactImporterPhoneAndContactsAfterSignupFixes_0 = v1.FFlagContactImporterPhoneAndContactsAfterSignupFixes;
local v22 = game:DefineFastFlag("ContactImporterFixRedirectsFromSocialOnboardingBtns", false);
local v23 = l_Roact_0.PureComponent:extend("ContactsImporterOverlayContainer");
v23.defaultProps = {
    checkOrRequestPermissions = function(v24)
        return l_PermissionsProtocol_0.default:checkOrRequestPermissions(v24);
    end, 
    localUserId = "", 
    handleShowToastForTests = nil
};
v23.init = function(v25)
    local v26 = v25.props.navigation.getParam(v6.OPEN_AMP_UPSELL);
    v25.checkOrRequestContactsPermissions = function()
        return v25.props.checkOrRequestPermissions({
            l_PermissionsProtocol_0.Permissions.CONTACTS_ACCESS
        });
    end;
    v25.failedToUpload = function(_)
        v25.props.navigation.getParam(v6.SHOW_TOAST)(v2.CI_FAILED);
    end;
    v25.closeModal = function()
        v25.props.navigation.pop();
    end;
    v25.permissionsFlowToContactImporter = function()
        local l_props_0 = v25.props;
        local l_navigation_0 = l_props_0.navigation;
        local v30 = l_navigation_0.getParam(v6.IS_FROM_SIGNUP);
        local v31 = if not l_getFFlagDiscoverabilityOverlayAmpUpsellFixEnabled_0() then nil else l_props_0.handleShowToastForTests or l_navigation_0.getParam(v6.SHOW_TOAST);
        v25.checkOrRequestContactsPermissions():andThen(function(v32)
            if v32 == l_PermissionsProtocol_0.Status.AUTHORIZED then
                l_updateOptedInUsers_0:addUserToLocalStorage(l_AppStorageService_0, l_props_0.localUserId);
                if not l_FFlagContactImporterPhoneAndContactsAfterSignupFixes_0 or not v30 then
                    l_props_0.hideContactImporterModal();
                    l_navigation_0.navigate(l_EnumScreens_0.ContactsList, {
                        [v6.SHOULD_UPDATE_USER_SETTINGS] = true, 
                        [v6.IS_PHONE_VERIFIED] = l_navigation_0.getParam(v6.IS_PHONE_VERIFIED), 
                        [v6.OPEN_LEARN_MORE_LINK] = l_navigation_0.getParam(v6.OPEN_LEARN_MORE_LINK), 
                        [v6.SHOW_TOAST] = v31, 
                        openAmpUpsell = v26
                    });
                else
                    l_props_0.updateUserSettings();
                    l_props_0.navigation.pop();
                end;
                return l_Promise_0.resolve();
            elseif v32 == l_PermissionsProtocol_0.Status.DENIED then
                l_navigation_0.navigate(l_EnumScreens_0.ContactsRevokedAccessDialog, {
                    screenSize = l_props_0.screenSize, 
                    closeModal = v25.closeModal
                });
                return l_Promise_0.resolve();
            else
                return l_Promise_0.reject();
            end;
        end):catch(v25.failedToUpload);
    end;
    v25.checkDiscoverability = function(v33)
        return v33 and v25.props.navigation.getParam(v6.IS_PHONE_VERIFIED);
    end;
    v25.onConnectContacts = function()
        local l_props_1 = v25.props;
        local v35 = l_props_1.navigation.getParam("isDiscoverabilityUnset");
        l_props_1.fireAnalyticsEvent(v7.EventNames.ContactImportModalContinue);
        if not v25.checkDiscoverability(v35) then
            v25.permissionsFlowToContactImporter();
            return ;
        else
            v25.navigateToDiscoverabilityModal();
            return ;
        end;
    end;
    v25.navigateToDiscoverabilityModal = function()
        local l_props_2 = v25.props;
        local l_navigation_1 = l_props_2.navigation;
        local v38 = l_navigation_1.getParam(v6.SHOW_TOAST);
        local v39 = l_navigation_1.getParam(v6.OPEN_LEARN_MORE_LINK);
        local v40 = l_navigation_1.getParam(v6.IS_FROM_ADD_FRIENDS_PAGE, false);
        local l_eventIngestService_0 = l_props_2.eventIngestService;
        local l_diagService_0 = l_props_2.diagService;
        l_props_2.getUserSettingsMetadata():andThen(function()
            l_navigation_1.navigate(l_EnumScreens_0.DiscoverabilityOverlay, {
                showToast = v38, 
                openLearnMoreLink = v39, 
                entryPoint = if not v40 then l_DiscoverabilityAnalytics_0.EntryPoints.HomePage else l_DiscoverabilityAnalytics_0.EntryPoints.AddFriends, 
                [v6.DIAG_SERVICE] = if l_SelfViewProfileDiscoverabilityUpsellIXP_0.SetupEnabled() then nil else l_diagService_0, 
                [v6.EVENT_INGEST_SERVICE] = if l_SelfViewProfileDiscoverabilityUpsellIXP_0.SetupEnabled() then nil else l_eventIngestService_0
            });
        end);
    end;
    v25.onAddFriendsActivated = function()
        local l_props_3 = v25.props;
        l_props_3.fireAnalyticsEvent(v7.EventNames.ContactImportModalAddFriends);
        l_props_3.navigation.replace(l_EnumScreens_0.AddFriendsPage);
    end;
    v25.onCloseClicked = function()
        local l_props_4 = v25.props;
        l_props_4.fireAnalyticsEvent(v7.EventNames.ContactImportModalClose);
        l_props_4.navigation.pop();
    end;
    v25.onLearnMoreClick = function()
        v25.props.navigation.getParam(v6.OPEN_LEARN_MORE_LINK)();
    end;
end;
v23.didMount = function(v45)
    v45.props.fireAnalyticsEvent(v7.EventNames.ContactImportModalPageLoad);
    v3:addSeenCount(l_AppStorageService_0, v45.props.localUserId);
    v3:updateTimestamp(l_AppStorageService_0, v45.props.localUserId, DateTime.now().UnixTimestampMillis);
end;
v23.render = function(v46)
    local l_props_5 = v46.props;
    local l_navigation_2 = l_props_5.navigation;
    return l_Roact_0.createElement(v13, {
        screenSize = l_props_5.screenSize, 
        onCloseClicked = v46.onCloseClicked, 
        onAddFriendsActivated = v46.onAddFriendsActivated, 
        onConnectContacts = v46.onConnectContacts, 
        onLearnMoreClick = v46.onLearnMoreClick, 
        isFromAddFriendsPage = l_navigation_2.getParam(v6.IS_FROM_ADD_FRIENDS_PAGE, false), 
        isFromSignup = (not not v22 and l_navigation_2.getParam(v6.IS_FROM_SOCIAL_ONBOARDING_BUTTONS)) and true or if l_FFlagContactImporterPhoneAndContactsAfterSignupFixes_0 then v46.props.navigation.getParam(v6.IS_FROM_SIGNUP) else nil
    });
end;
return l_compose_0(v7.connect(function(v49)
    return {
        fireAnalyticsEvent = v49.fireAnalyticsEvent, 
        diagService = v49.diagService, 
        eventIngestService = v49.eventIngestService
    };
end), l_RoactRodux_0.connect(function(v50)
    return {
        contacts = l_Selectors_0.sortContacts(v50), 
        localUserId = v50.LocalUserId, 
        screenSize = v50.ScreenSize
    };
end, v14))(v23);
