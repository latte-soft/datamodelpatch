local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_RoactRodux_0 = v1.RoactRodux;
local _ = require(l_Parent_0.Common.LocalTypes);
local v5 = require(l_Parent_0.Common.Constants);
local l_Promise_0 = v1.Promise;
local v7 = require(l_Parent_0.Analytics);
local l_FieldNames_0 = v7.FieldNames;
local l_EventNames_0 = v7.EventNames;
local v10 = require(l_Parent_0.Utils.formatContacts);
local l_ContactsProtocol_0 = v1.ContactsProtocol;
local l_Dash_0 = v1.Dash;
local l_EnumScreens_0 = v1.SocialModalsCommon.EnumScreens;
local l_AmpApiProvider_0 = v1.AmpUpsell.AmpApiProvider;
local l_AccessResponseEnum_0 = v1.AmpUpsell.AmpEnums.AccessResponseEnum;
local v16 = require(l_Parent_0.Flags.getFFlagCIAmpUpsellEnabledForAll);
local v17 = require(l_Parent_0.Flags.getFFlagFindFriendsClickedEventEnabled);
local v18 = require(l_Parent_0.Flags.getFFlagPassNavigationIntoContactsList);
local v19 = require(script.Parent.ContactsList);
local v20 = require(script.Parent.ContactsListMapDispatchToProps);
local v21 = require(script.Parent.ContactsListMapStateToProps);
local l_getDeepValue_0 = v1.SocialLibraries.Dictionary.getDeepValue;
local v23 = require(l_Parent_0.Flags.getFIntContactImporterUploadContactsMin);
local v24 = require(l_Parent_0.Common.IXPVariants);
local v25 = require(l_Parent_0.Flags.FFlagDisablePhoneVerificationForCI);
local v26 = require(l_Parent_0.Flags.FFlagContactImporterUIRefactor);
local l_compose_0 = v1.SocialLibraries.RoduxTools.compose;
local _ = require(l_Parent_0.ContactsList.Components.ContactImporterContext);
local l_DiscoverabilityAnalytics_0 = v1.DiscoverabilityAnalytics;
local l_getFFlagDiscoverabilityOverlayAmpUpsellFixEnabled_0 = v1.getFFlagDiscoverabilityOverlayAmpUpsellFixEnabled;
local v31 = l_Roact_0.PureComponent:extend("ContactsListContainer");
v31.defaultProps = {
    contactsProtocol = l_ContactsProtocol_0.default
};
v31.init = function(v32)
    v32.state = {
        hasUploadError = false, 
        isFetching = true, 
        showMatchedContacts = false
    };
    v32.getPropOrParam = function(v33)
        if not (not (not v32.props.navigation or not v18()) and v32.props.navigation.getParam(v33)) and not v32.props.navigation then
            return l_getDeepValue_0(v32.props, v33);
        else
            return v32.props.navigation.getParam(v33);
        end;
    end;
    v32.contactsCount = nil;
    v32.numTotalNumbersOnDevice = nil;
    v32.numTotalContactsOnDevice = nil;
    v32.numContactsWithMultipleNumbers = nil;
    v32.startTime = os.clock();
    v32.ampApiProvider = if v32.props.ampApiProvider ~= nil then v32.props.ampApiProvider else l_AmpApiProvider_0;
    v32.enableAmpUpsell = v16() or v32.props.showFindFriendsBannerVariant;
    local function _(v34)
        return function(v35)
            if not (type(v35) == "table") or not v35.hasAlreadyErrored then
                v32:setState({
                    hasUploadError = true, 
                    isFetching = false
                });
                v32.props.fireAnalyticsEvent(v34, {
                    failedStep = v34
                });
                v32.fireContactImportingTimeEvent({
                    isSuccessfulUpload = false, 
                    failedStep = v34
                });
                return l_Promise_0.reject({
                    hasAlreadyErrored = true
                });
            else
                return l_Promise_0.reject({
                    hasAlreadyErrored = true
                });
            end;
        end;
    end;
    local function _(v37)
        local v38 = l_getDeepValue_0(v37 or {}, "responseBody.userContactsEntities");
        if not v38 then
            return 0;
        else
            return #v38;
        end;
    end;
    local function _()
        if not v32.props.navigation then
            if v32.props.onClose then
                v32.props.onClose();
            end;
            return ;
        else
            v32.props.navigation.pop();
            return ;
        end;
    end;
    v32.requestFriendship = function(v41)
        local l_props_0 = v32.props;
        l_props_0.fireAnalyticsEvent(l_EventNames_0.RequestFriendship, {
            requestedId = v41
        });
        l_props_0.requestFriendship({
            currentUserId = l_props_0.localUserId, 
            contactId = v41
        }):andThen(function()
            l_props_0.requestSent(v41);
        end);
    end;
    v32.fireContactImportingTimeEvent = function(v43)
        v32.props.fireAnalyticsEvent(l_EventNames_0.ContactImportingTime, {
            [l_FieldNames_0.NumTotalContactsImported] = v32.contactsCount, 
            [l_FieldNames_0.NumMatchedContacts] = v43.numMatchedContacts, 
            [l_FieldNames_0.NumTotalContactsOnDevice] = v32.numTotalContactsOnDevice, 
            [l_FieldNames_0.NumMaxContacts] = true, 
            [l_FieldNames_0.NumMinContacts] = true, 
            [l_FieldNames_0.NumTotalNumbersOnDevice] = v32.numTotalNumbersOnDevice, 
            [l_FieldNames_0.NumContactsWithMultipleNumbers] = v32.numContactsWithMultipleNumbers, 
            loadingTime = os.clock() - v32.startTime, 
            isSuccessfulUpload = v43.isSuccessfulUpload
        });
    end;
    v32.getContactsFromDevice = function()
        local l_props_1 = v32.props;
        return l_props_1.contactsProtocol:supportsContacts():andThen(function(v45)
            if v45 then
                return l_props_1.contactsProtocol:getContacts();
            else
                return l_Promise_0.reject();
            end;
        end):catch(function()
            return l_Promise_0.reject();
        end);
    end;
    v32.formatContactsFromDevice = function(v46)
        local l_props_2 = v32.props;
        if #(v46.contacts or {}) == 0 then
            return {
                contacts = {}, 
                contactsCount = 0, 
                countryCode = nil
            };
        else
            l_props_2.deviceContactsReceived(v46.contacts);
            local v48 = v10(v46);
            v32.contactsCount = #v48.contacts;
            v32.numTotalContactsOnDevice = v48.contactsCount;
            local v49 = 0;
            local v50 = 0;
            for _, v52 in ipairs(v46.contacts) do
                local v53 = #v52.phonenumber;
                if v53 > 1 then
                    v50 = v50 + 1;
                end;
                v49 = v49 + v53;
            end;
            v32.numTotalNumbersOnDevice = v49;
            v32.numContactsWithMultipleNumbers = v50;
            return v48;
        end;
    end;
    v32.uploadDeviceContacts = function(v54)
        local l_props_3 = v32.props;
        if not (#v54.contacts ~= 0 and l_props_3.variant ~= v24.INVITES_ONLY) or #v54.contacts < v23() then
            return l_Promise_0.resolve({
                shouldFindContacts = false
            });
        else
            return l_props_3.uploadContacts(v54):andThen(function()
                return l_Promise_0.resolve({
                    shouldFindContacts = true
                });
            end, function()
                return l_Promise_0.reject();
            end);
        end;
    end;
    v32.findContacts = function(v56)
        local l_props_4 = v32.props;
        if not v56.shouldFindContacts then
            return l_Promise_0.resolve();
        else
            return l_props_4.findContacts();
        end;
    end;
    v32.getContactEntities = function(v58)
        local l_props_5 = v32.props;
        if not v58 then
            return l_Promise_0.resolve();
        else
            return l_props_5.getContactEntities(v58);
        end;
    end;
    v32.fireHasLoaded = function(v60)
        local l_props_6 = v32.props;
        local v62 = l_getDeepValue_0(v60 or {}, "responseBody.userContactsEntities");
        local v63 = not v62 and 0 or #v62;
        l_props_6.fireAnalyticsEvent(l_EventNames_0.ContactsListLoaded, {
            [l_FieldNames_0.NumTotalContactsImported] = v32.contactsCount, 
            [l_FieldNames_0.NumMatchedContacts] = v63, 
            [l_FieldNames_0.NumMaxContacts] = true, 
            [l_FieldNames_0.NumMinContacts] = true, 
            [l_FieldNames_0.NumTotalContactsOnDevice] = v32.numTotalContactsOnDevice
        });
        v32:setState({
            isFetching = false
        });
        v32.fireContactImportingTimeEvent({
            isSuccessfulUpload = true, 
            nummatchedContacts = v63
        });
        return l_Promise_0.resolve();
    end;
    v32.failedToUpload = function(_)
        v32:setState({
            hasUploadError = true, 
            isFetching = false
        });
        v32.fireContactImportingTimeEvent({
            isSuccessfulUpload = false
        });
    end;
    v32.getContacts = function()
        local v65 = nil;
        if not v32.enableAmpUpsell then
            v65 = v32.getPropOrParam(v5.IS_PHONE_VERIFIED);
        else
            v32:setState({
                isFetching = true
            });
            local v66 = v32.ampApiProvider.getFeatureAccess({
                v5.SHOW_MATCHED_CONTACTS
            });
            v65 = if #v66.featureAccessList > 0 then v66.featureAccessList[1].access else l_AccessResponseEnum_0.Actionable == l_AccessResponseEnum_0.Granted;
            v32:setState({
                showMatchedContacts = v65
            });
        end;
        if not v25 then
            if v65 then
                local v67 = v32.getContactsFromDevice();
                local l_formatContactsFromDevice_0 = v32.formatContactsFromDevice;
                local l_FailedGetContactsFromDevice_0 = l_EventNames_0.FailedGetContactsFromDevice;
                local l_l_FailedGetContactsFromDevice_0_0 = l_FailedGetContactsFromDevice_0 --[[ copy: 5 -> 12 ]];
                v67 = v67:andThen(l_formatContactsFromDevice_0, function(v71)
                    if not (type(v71) == "table") or not v71.hasAlreadyErrored then
                        v32:setState({
                            hasUploadError = true, 
                            isFetching = false
                        });
                        v32.props.fireAnalyticsEvent(l_l_FailedGetContactsFromDevice_0_0, {
                            failedStep = l_l_FailedGetContactsFromDevice_0_0
                        });
                        v32.fireContactImportingTimeEvent({
                            isSuccessfulUpload = false, 
                            failedStep = l_l_FailedGetContactsFromDevice_0_0
                        });
                        return l_Promise_0.reject({
                            hasAlreadyErrored = true
                        });
                    else
                        return l_Promise_0.reject({
                            hasAlreadyErrored = true
                        });
                    end;
                end);
                l_formatContactsFromDevice_0 = v32.uploadDeviceContacts;
                l_FailedGetContactsFromDevice_0 = l_EventNames_0.FailedFormatContactsFromDevice;
                local l_l_FailedGetContactsFromDevice_0_1 = l_FailedGetContactsFromDevice_0 --[[ copy: 5 -> 13 ]];
                v67 = v67:andThen(l_formatContactsFromDevice_0, function(v73)
                    if not (type(v73) == "table") or not v73.hasAlreadyErrored then
                        v32:setState({
                            hasUploadError = true, 
                            isFetching = false
                        });
                        v32.props.fireAnalyticsEvent(l_l_FailedGetContactsFromDevice_0_1, {
                            failedStep = l_l_FailedGetContactsFromDevice_0_1
                        });
                        v32.fireContactImportingTimeEvent({
                            isSuccessfulUpload = false, 
                            failedStep = l_l_FailedGetContactsFromDevice_0_1
                        });
                        return l_Promise_0.reject({
                            hasAlreadyErrored = true
                        });
                    else
                        return l_Promise_0.reject({
                            hasAlreadyErrored = true
                        });
                    end;
                end);
                l_formatContactsFromDevice_0 = v32.findContacts;
                l_FailedGetContactsFromDevice_0 = l_EventNames_0.FailedUploadContactsFromDevice;
                local l_l_FailedGetContactsFromDevice_0_2 = l_FailedGetContactsFromDevice_0 --[[ copy: 5 -> 14 ]];
                v67 = v67:andThen(l_formatContactsFromDevice_0, function(v75)
                    if not (type(v75) == "table") or not v75.hasAlreadyErrored then
                        v32:setState({
                            hasUploadError = true, 
                            isFetching = false
                        });
                        v32.props.fireAnalyticsEvent(l_l_FailedGetContactsFromDevice_0_2, {
                            failedStep = l_l_FailedGetContactsFromDevice_0_2
                        });
                        v32.fireContactImportingTimeEvent({
                            isSuccessfulUpload = false, 
                            failedStep = l_l_FailedGetContactsFromDevice_0_2
                        });
                        return l_Promise_0.reject({
                            hasAlreadyErrored = true
                        });
                    else
                        return l_Promise_0.reject({
                            hasAlreadyErrored = true
                        });
                    end;
                end);
                l_formatContactsFromDevice_0 = v32.getContactEntities;
                l_FailedGetContactsFromDevice_0 = l_EventNames_0.FailedFindContacts;
                local l_l_FailedGetContactsFromDevice_0_3 = l_FailedGetContactsFromDevice_0 --[[ copy: 5 -> 15 ]];
                v67 = v67:andThen(l_formatContactsFromDevice_0, function(v77)
                    if not (type(v77) == "table") or not v77.hasAlreadyErrored then
                        v32:setState({
                            hasUploadError = true, 
                            isFetching = false
                        });
                        v32.props.fireAnalyticsEvent(l_l_FailedGetContactsFromDevice_0_3, {
                            failedStep = l_l_FailedGetContactsFromDevice_0_3
                        });
                        v32.fireContactImportingTimeEvent({
                            isSuccessfulUpload = false, 
                            failedStep = l_l_FailedGetContactsFromDevice_0_3
                        });
                        return l_Promise_0.reject({
                            hasAlreadyErrored = true
                        });
                    else
                        return l_Promise_0.reject({
                            hasAlreadyErrored = true
                        });
                    end;
                end);
                l_formatContactsFromDevice_0 = v32.fireHasLoaded;
                l_FailedGetContactsFromDevice_0 = l_EventNames_0.FailedGetContactEntities;
                v67:andThen(l_formatContactsFromDevice_0, function(v78)
                    if not (type(v78) == "table") or not v78.hasAlreadyErrored then
                        v32:setState({
                            hasUploadError = true, 
                            isFetching = false
                        });
                        v32.props.fireAnalyticsEvent(l_FailedGetContactsFromDevice_0, {
                            failedStep = l_FailedGetContactsFromDevice_0
                        });
                        v32.fireContactImportingTimeEvent({
                            isSuccessfulUpload = false, 
                            failedStep = l_FailedGetContactsFromDevice_0
                        });
                        return l_Promise_0.reject({
                            hasAlreadyErrored = true
                        });
                    else
                        return l_Promise_0.reject({
                            hasAlreadyErrored = true
                        });
                    end;
                end):catch(v32.failedToUpload);
                return ;
            else
                local v79 = v32.getContactsFromDevice();
                local l_formatContactsFromDevice_1 = v32.formatContactsFromDevice;
                local l_FailedGetContactsFromDevice_1 = l_EventNames_0.FailedGetContactsFromDevice;
                local l_l_FailedGetContactsFromDevice_1_0 = l_FailedGetContactsFromDevice_1 --[[ copy: 5 -> 11 ]];
                v79 = v79:andThen(l_formatContactsFromDevice_1, function(v83)
                    if not (type(v83) == "table") or not v83.hasAlreadyErrored then
                        v32:setState({
                            hasUploadError = true, 
                            isFetching = false
                        });
                        v32.props.fireAnalyticsEvent(l_l_FailedGetContactsFromDevice_1_0, {
                            failedStep = l_l_FailedGetContactsFromDevice_1_0
                        });
                        v32.fireContactImportingTimeEvent({
                            isSuccessfulUpload = false, 
                            failedStep = l_l_FailedGetContactsFromDevice_1_0
                        });
                        return l_Promise_0.reject({
                            hasAlreadyErrored = true
                        });
                    else
                        return l_Promise_0.reject({
                            hasAlreadyErrored = true
                        });
                    end;
                end);
                l_formatContactsFromDevice_1 = v32.fireHasLoaded;
                l_FailedGetContactsFromDevice_1 = l_EventNames_0.FailedFormatContactsFromDevice;
                v79:andThen(l_formatContactsFromDevice_1, function(v84)
                    if not (type(v84) == "table") or not v84.hasAlreadyErrored then
                        v32:setState({
                            hasUploadError = true, 
                            isFetching = false
                        });
                        v32.props.fireAnalyticsEvent(l_FailedGetContactsFromDevice_1, {
                            failedStep = l_FailedGetContactsFromDevice_1
                        });
                        v32.fireContactImportingTimeEvent({
                            isSuccessfulUpload = false, 
                            failedStep = l_FailedGetContactsFromDevice_1
                        });
                        return l_Promise_0.reject({
                            hasAlreadyErrored = true
                        });
                    else
                        return l_Promise_0.reject({
                            hasAlreadyErrored = true
                        });
                    end;
                end):catch(v32.failedToUpload);
                return ;
            end;
        elseif not v32.props.isPVRequired or v65 then
            local v85 = v32.getContactsFromDevice();
            local l_formatContactsFromDevice_2 = v32.formatContactsFromDevice;
            local l_FailedGetContactsFromDevice_2 = l_EventNames_0.FailedGetContactsFromDevice;
            local l_l_FailedGetContactsFromDevice_2_0 = l_FailedGetContactsFromDevice_2 --[[ copy: 5 -> 7 ]];
            v85 = v85:andThen(l_formatContactsFromDevice_2, function(v89)
                if not (type(v89) == "table") or not v89.hasAlreadyErrored then
                    v32:setState({
                        hasUploadError = true, 
                        isFetching = false
                    });
                    v32.props.fireAnalyticsEvent(l_l_FailedGetContactsFromDevice_2_0, {
                        failedStep = l_l_FailedGetContactsFromDevice_2_0
                    });
                    v32.fireContactImportingTimeEvent({
                        isSuccessfulUpload = false, 
                        failedStep = l_l_FailedGetContactsFromDevice_2_0
                    });
                    return l_Promise_0.reject({
                        hasAlreadyErrored = true
                    });
                else
                    return l_Promise_0.reject({
                        hasAlreadyErrored = true
                    });
                end;
            end);
            l_formatContactsFromDevice_2 = v32.uploadDeviceContacts;
            l_FailedGetContactsFromDevice_2 = l_EventNames_0.FailedFormatContactsFromDevice;
            local l_l_FailedGetContactsFromDevice_2_1 = l_FailedGetContactsFromDevice_2 --[[ copy: 5 -> 8 ]];
            v85 = v85:andThen(l_formatContactsFromDevice_2, function(v91)
                if not (type(v91) == "table") or not v91.hasAlreadyErrored then
                    v32:setState({
                        hasUploadError = true, 
                        isFetching = false
                    });
                    v32.props.fireAnalyticsEvent(l_l_FailedGetContactsFromDevice_2_1, {
                        failedStep = l_l_FailedGetContactsFromDevice_2_1
                    });
                    v32.fireContactImportingTimeEvent({
                        isSuccessfulUpload = false, 
                        failedStep = l_l_FailedGetContactsFromDevice_2_1
                    });
                    return l_Promise_0.reject({
                        hasAlreadyErrored = true
                    });
                else
                    return l_Promise_0.reject({
                        hasAlreadyErrored = true
                    });
                end;
            end);
            l_formatContactsFromDevice_2 = v32.findContacts;
            l_FailedGetContactsFromDevice_2 = l_EventNames_0.FailedUploadContactsFromDevice;
            local l_l_FailedGetContactsFromDevice_2_2 = l_FailedGetContactsFromDevice_2 --[[ copy: 5 -> 9 ]];
            v85 = v85:andThen(l_formatContactsFromDevice_2, function(v93)
                if not (type(v93) == "table") or not v93.hasAlreadyErrored then
                    v32:setState({
                        hasUploadError = true, 
                        isFetching = false
                    });
                    v32.props.fireAnalyticsEvent(l_l_FailedGetContactsFromDevice_2_2, {
                        failedStep = l_l_FailedGetContactsFromDevice_2_2
                    });
                    v32.fireContactImportingTimeEvent({
                        isSuccessfulUpload = false, 
                        failedStep = l_l_FailedGetContactsFromDevice_2_2
                    });
                    return l_Promise_0.reject({
                        hasAlreadyErrored = true
                    });
                else
                    return l_Promise_0.reject({
                        hasAlreadyErrored = true
                    });
                end;
            end);
            l_formatContactsFromDevice_2 = v32.getContactEntities;
            l_FailedGetContactsFromDevice_2 = l_EventNames_0.FailedFindContacts;
            local l_l_FailedGetContactsFromDevice_2_3 = l_FailedGetContactsFromDevice_2 --[[ copy: 5 -> 10 ]];
            v85 = v85:andThen(l_formatContactsFromDevice_2, function(v95)
                if not (type(v95) == "table") or not v95.hasAlreadyErrored then
                    v32:setState({
                        hasUploadError = true, 
                        isFetching = false
                    });
                    v32.props.fireAnalyticsEvent(l_l_FailedGetContactsFromDevice_2_3, {
                        failedStep = l_l_FailedGetContactsFromDevice_2_3
                    });
                    v32.fireContactImportingTimeEvent({
                        isSuccessfulUpload = false, 
                        failedStep = l_l_FailedGetContactsFromDevice_2_3
                    });
                    return l_Promise_0.reject({
                        hasAlreadyErrored = true
                    });
                else
                    return l_Promise_0.reject({
                        hasAlreadyErrored = true
                    });
                end;
            end);
            l_formatContactsFromDevice_2 = v32.fireHasLoaded;
            l_FailedGetContactsFromDevice_2 = l_EventNames_0.FailedGetContactEntities;
            v85:andThen(l_formatContactsFromDevice_2, function(v96)
                if not (type(v96) == "table") or not v96.hasAlreadyErrored then
                    v32:setState({
                        hasUploadError = true, 
                        isFetching = false
                    });
                    v32.props.fireAnalyticsEvent(l_FailedGetContactsFromDevice_2, {
                        failedStep = l_FailedGetContactsFromDevice_2
                    });
                    v32.fireContactImportingTimeEvent({
                        isSuccessfulUpload = false, 
                        failedStep = l_FailedGetContactsFromDevice_2
                    });
                    return l_Promise_0.reject({
                        hasAlreadyErrored = true
                    });
                else
                    return l_Promise_0.reject({
                        hasAlreadyErrored = true
                    });
                end;
            end):catch(v32.failedToUpload);
            return ;
        else
            local v97 = v32.getContactsFromDevice();
            local l_formatContactsFromDevice_3 = v32.formatContactsFromDevice;
            local l_FailedGetContactsFromDevice_3 = l_EventNames_0.FailedGetContactsFromDevice;
            local l_l_FailedGetContactsFromDevice_3_0 = l_FailedGetContactsFromDevice_3 --[[ copy: 5 -> 6 ]];
            v97 = v97:andThen(l_formatContactsFromDevice_3, function(v101)
                if not (type(v101) == "table") or not v101.hasAlreadyErrored then
                    v32:setState({
                        hasUploadError = true, 
                        isFetching = false
                    });
                    v32.props.fireAnalyticsEvent(l_l_FailedGetContactsFromDevice_3_0, {
                        failedStep = l_l_FailedGetContactsFromDevice_3_0
                    });
                    v32.fireContactImportingTimeEvent({
                        isSuccessfulUpload = false, 
                        failedStep = l_l_FailedGetContactsFromDevice_3_0
                    });
                    return l_Promise_0.reject({
                        hasAlreadyErrored = true
                    });
                else
                    return l_Promise_0.reject({
                        hasAlreadyErrored = true
                    });
                end;
            end);
            l_formatContactsFromDevice_3 = v32.fireHasLoaded;
            l_FailedGetContactsFromDevice_3 = l_EventNames_0.FailedFormatContactsFromDevice;
            v97:andThen(l_formatContactsFromDevice_3, function(v102)
                if not (type(v102) == "table") or not v102.hasAlreadyErrored then
                    v32:setState({
                        hasUploadError = true, 
                        isFetching = false
                    });
                    v32.props.fireAnalyticsEvent(l_FailedGetContactsFromDevice_3, {
                        failedStep = l_FailedGetContactsFromDevice_3
                    });
                    v32.fireContactImportingTimeEvent({
                        isSuccessfulUpload = false, 
                        failedStep = l_FailedGetContactsFromDevice_3
                    });
                    return l_Promise_0.reject({
                        hasAlreadyErrored = true
                    });
                else
                    return l_Promise_0.reject({
                        hasAlreadyErrored = true
                    });
                end;
            end):catch(v32.failedToUpload);
            return ;
        end;
    end;
    v32.closeModal = function(v103)
        local l_props_7 = v32.props;
        l_props_7.fireAnalyticsEvent(v103, {
            isLoading = v32.isFetching(l_props_7.variant, v24), 
            loadingTime = if not v32.state.isFetching then nil else os.clock() - v32.startTime
        });
        if not v32.props.navigation then
            if v32.props.onClose then
                v32.props.onClose();
            end;
            return ;
        else
            v32.props.navigation.pop();
            return ;
        end;
    end;
    v32.onAddFriendsActivated = function()
        v32.props.navigation.replace(l_EnumScreens_0.AddFriendsPage);
    end;
    v32.isFetching = function(v105, v106)
        local l_state_0 = v32.state;
        if v105 == v106.BLENDED then
            return l_state_0.isFetching;
        else
            return false;
        end;
    end;
    if v32.enableAmpUpsell then
        v32.openDiscoverabilityModal = function()
            local l_navigation_0 = v32.props.navigation;
            local v109 = v32.getPropOrParam(v5.OPEN_LEARN_MORE_LINK);
            if not l_getFFlagDiscoverabilityOverlayAmpUpsellFixEnabled_0() then
                l_navigation_0.push(l_EnumScreens_0.DiscoverabilityOverlay, {
                    showToast = false, 
                    openLearnMoreLink = v109, 
                    isStandaloneDiscoverabilityModal = true, 
                    entryPoint = l_DiscoverabilityAnalytics_0.EntryPoints.ContactsList
                });
                return ;
            else
                l_navigation_0.navigate(l_EnumScreens_0.DiscoverabilityOverlay, {
                    showToast = v32.getPropOrParam(v5.SHOW_TOAST), 
                    openLearnMoreLink = v109, 
                    isStandaloneDiscoverabilityModal = true, 
                    entryPoint = l_DiscoverabilityAnalytics_0.EntryPoints.ContactsList, 
                    navigateOnActivated = function()
                        l_navigation_0.navigate(l_EnumScreens_0.ContactsList, {
                            [v5.SHOULD_UPDATE_USER_SETTINGS] = true, 
                            [v5.IS_PHONE_VERIFIED] = v32.getPropOrParam(v5.IS_PHONE_VERIFIED), 
                            [v5.OPEN_LEARN_MORE_LINK] = v109, 
                            openAmpUpsell = v32.getPropOrParam(v5.OPEN_AMP_UPSELL)
                        });
                    end
                });
                return ;
            end;
        end;
        local v110 = v32.getPropOrParam(v5.OPEN_AMP_UPSELL);
        v32.openAmpUpsell = if not v110 then l_Dash_0.noop else function()
            local function v113(v111, _)
                if v111 == l_AccessResponseEnum_0.Granted then
                    v32.getContacts();
                    v32.openDiscoverabilityModal();
                end;
            end;
            if v17() then
                v32.props.fireAnalyticsEvent(l_EventNames_0.FindFriendsButtonClicked);
            end;
            v110(v5.SHOW_MATCHED_CONTACTS, v113);
        end;
    end;
end;
v31.didMount = function(v114)
    local l_props_8 = v114.props;
    if not v114.getPropOrParam(v5.SHOULD_UPDATE_USER_SETTINGS) then
        v114.getContacts();
        return ;
    else
        l_props_8.updateUserSettings():andThen(v114.getContacts):catch(function()
            v114.failedToUpload();
        end);
        return ;
    end;
end;
v31.render = function(v116)
    local l_props_9 = v116.props;
    return l_Roact_0.createElement(v19, {
        deviceContacts = l_props_9.deviceContacts, 
        matchedContacts = l_props_9.matchedContacts, 
        isFetching = v116.isFetching(l_props_9.variant, v24), 
        requestFriendship = v116.requestFriendship, 
        screenSize = l_props_9.screenSize, 
        hasUploadError = v116.state.hasUploadError, 
        onAddFriendsActivated = v116.onAddFriendsActivated, 
        closeModal = v116.closeModal, 
        showAddFriendsButton = l_props_9.entryPoint == v7.EntryPoints.HomePage, 
        variant = l_props_9.variant, 
        showFindFriendsBannerVariant = l_props_9.showFindFriendsBannerVariant, 
        openProfilePeekView = v116.props.openProfilePeekView, 
        showMatchedContacts = if not v116.enableAmpUpsell then v116.getPropOrParam(v5.IS_PHONE_VERIFIED) else v116.state.showMatchedContacts, 
        openAmpUpsell = v116.openAmpUpsell, 
        showNewUI = if not v26 then nil else l_props_9.showNewUI
    });
end;
return l_compose_0(v7.connect(function(v118)
    return {
        fireAnalyticsEvent = v118.fireAnalyticsEvent, 
        entryPoint = v118.entryPoint, 
        openProfilePeekView = v118.openProfilePeekView
    };
end), l_RoactRodux_0.connect(v21, v20))(v31);
