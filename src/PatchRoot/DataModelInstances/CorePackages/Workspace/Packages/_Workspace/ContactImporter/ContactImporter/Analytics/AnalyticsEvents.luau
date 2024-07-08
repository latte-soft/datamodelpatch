local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.dependencies);
local v3 = require(script.Parent.Enums.EventNames);
local v4 = require(l_Parent_1.SocialLuaAnalytics);
local l_Dash_0 = v2.Dash;
local l_Enums_0 = v4.Analytics.Enums;
local l_Contexts_0 = l_Enums_0.Contexts;
local l_EventTypes_0 = l_Enums_0.EventTypes;
local v9 = require(script.Parent.Enums.BtnValues);
local v10 = require(script.Parent.FieldNames);
local v11 = require(l_Parent_0.Flags.getFIntContactImporterUploadContactsMax);
local v12 = require(l_Parent_0.Flags.getFIntContactImporterUploadContactsMin);
return {
    [v3.ContactImportModalPageLoad] = {
        context = l_Contexts_0.ContactImport, 
        eventType = l_EventTypes_0.ContactImportModalPageLoad
    }, 
    [v3.ContactImportModalContinue] = {
        context = l_Contexts_0.ContactImport, 
        eventType = l_EventTypes_0.ContactImportModalClick, 
        additionalInfo = {
            btn = v9.ContactImporter
        }
    }, 
    [v3.ContactImportModalAddFriends] = {
        context = l_Contexts_0.ContactImport, 
        eventType = l_EventTypes_0.ContactImportModalClick, 
        additionalInfo = {
            btn = v9.AddFriends
        }, 
        formatRulesForAdditionalInfo = {
            isLoaded = l_Dash_0.identity, 
            loadingTime = l_Dash_0.identity
        }
    }, 
    [v3.ContactImportModalClose] = {
        context = l_Contexts_0.ContactImport, 
        eventType = l_EventTypes_0.ContactImportModalClick, 
        additionalInfo = {
            btn = v9.Close
        }, 
        formatRulesForAdditionalInfo = {
            isLoaded = l_Dash_0.identity, 
            loadingTime = l_Dash_0.identity
        }
    }, 
    [v3.ContactsListLoaded] = {
        context = l_Contexts_0.ContactImport, 
        eventType = l_EventTypes_0.ContactsListLoaded, 
        formatRulesForAdditionalInfo = {
            [v10.NumTotalContactsImported] = l_Dash_0.identity, 
            [v10.NumMatchedContacts] = l_Dash_0.identity, 
            didBypassFetchContacts = l_Dash_0.identity, 
            [v10.NumTotalContactsOnDevice] = l_Dash_0.identity, 
            [v10.NumMaxContacts] = v11, 
            [v10.NumMinContacts] = v12
        }
    }, 
    [v3.RequestFriendship] = {
        context = l_Contexts_0.ContactImport, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v9.RequestFriendship
        }, 
        formatRulesForAdditionalInfo = {
            requestedId = l_Dash_0.identity
        }
    }, 
    [v3.InviteContact] = {
        context = l_Contexts_0.ContactImport, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v9.InviteContact, 
            isShortUrlEnabled = true
        }, 
        formatRulesForAdditionalInfo = {
            offNetworkFriendRequestLinkId = l_Dash_0.identity
        }
    }, 
    [v3.CloseContactListButton] = {
        context = l_Contexts_0.ContactImport, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v9.CloseContactListButton
        }, 
        formatRulesForAdditionalInfo = {
            isLoading = l_Dash_0.identity, 
            loadingTime = l_Dash_0.identity
        }
    }, 
    [v3.CloseContactListCross] = {
        context = l_Contexts_0.ContactImport, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v9.CloseContactListCross
        }, 
        formatRulesForAdditionalInfo = {
            isLoading = l_Dash_0.identity, 
            loadingTime = l_Dash_0.identity
        }
    }, 
    [v3.ContactImportingTime] = {
        context = l_Contexts_0.ContactImport, 
        eventType = l_EventTypes_0.ContactImportingTime, 
        formatRulesForAdditionalInfo = {
            isSuccessfulUpload = l_Dash_0.identity, 
            failedStep = l_Dash_0.identity, 
            [v10.NumTotalContactsImported] = l_Dash_0.identity, 
            [v10.NumMatchedContacts] = l_Dash_0.identity, 
            loadingTime = l_Dash_0.identity, 
            didBypassFetchContacts = l_Dash_0.identity, 
            [v10.NumTotalContactsOnDevice] = l_Dash_0.identity, 
            [v10.NumMaxContacts] = v11, 
            [v10.NumMinContacts] = v12
        }
    }, 
    [v3.PhoneVerificationWebview] = {
        context = l_Contexts_0.ContactImport, 
        eventType = l_EventTypes_0.NavigateToPhoneVerification
    }, 
    [v3.PhoneVerificationClose] = {
        context = l_Contexts_0.ContactImport, 
        eventType = l_EventTypes_0.PhoneVerificationClose, 
        formatRulesForAdditionalInfo = {
            isPhoneVerified = l_Dash_0.identity
        }
    }, 
    [v3.FindFriendsButtonClicked] = {
        context = l_Contexts_0.ContactImport, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v9.FindFriendsButton
        }
    }
};
