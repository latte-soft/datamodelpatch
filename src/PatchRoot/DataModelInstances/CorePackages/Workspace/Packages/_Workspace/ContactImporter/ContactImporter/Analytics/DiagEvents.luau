local v0 = require(script.Parent.Enums.EventNames);
return {
    [v0.ContactImportModalPageLoad] = {
        name = game:DefineFastString("ContactImportModalPageLoadCounter", "ContactImportModalPageLoad")
    }, 
    [v0.ContactImportModalClose] = {
        name = game:DefineFastString("ContactImportModalCloseCounter", "ContactImportModalClose")
    }, 
    [v0.ContactImportModalContinue] = {
        name = game:DefineFastString("ContactImportModalContinueCounter", "ContactImportModalContinue")
    }, 
    [v0.ContactImportModalAddFriends] = {
        name = game:DefineFastString("ContactImportModalAddFriendsCounter", "ContactImportModalAddFriends")
    }, 
    [v0.ContactsListLoaded] = {
        name = game:DefineFastString("ContactsListLoadedCounter", "ContactsListLoaded")
    }, 
    [v0.RequestFriendship] = {
        name = game:DefineFastString("ContactImporterRequestFriendshipCounter", "ContactImporterFriendshipRequest")
    }, 
    [v0.InviteContact] = {
        name = game:DefineFastString("ContactImporterInviteContactCounter", "ContactImporterInviteContact")
    }, 
    [v0.ContactImportingTime] = {
        name = game:DefineFastString("ContactImportingTimeStat", "ContactImportingTime")
    }, 
    [v0.CloseContactListButton] = {
        name = game:DefineFastString("CloseContactListButtonCounter", "CloseContactListButton")
    }, 
    [v0.CloseContactListCross] = {
        name = game:DefineFastString("CloseContactListCrossCounter", "CloseContactListCross")
    }, 
    [v0.PhoneVerificationWebview] = {
        name = game:DefineFastString("PhoneVerificationWebviewCounter", "PhoneVerificationWebview")
    }, 
    [v0.PhoneVerificationClose] = {
        name = game:DefineFastString("PhoneVerificationCloseCounter", "PhoneVerificationCloseWebview")
    }, 
    [v0.FailedGetContactsFromDevice] = {
        name = game:DefineFastString("FailedGetContactsFromDeviceCounter", "FailedGetContactsFromDevice")
    }, 
    [v0.FailedFormatContactsFromDevice] = {
        name = game:DefineFastString("FailedFormatContactsFromDeviceCounter", "FailedFormatContactsFromDevice")
    }, 
    [v0.FailedUploadContactsFromDevice] = {
        name = game:DefineFastString("FailedUploadContactsFromDeviceCounter", "FailedUploadContactsFromDevice")
    }, 
    [v0.FailedFindContacts] = {
        name = game:DefineFastString("FailedFindContactsCounter", "FailedFindContacts")
    }, 
    [v0.FailedGetContactEntities] = {
        name = game:DefineFastString("FailedGetContactEntitiesCounter", "FailedGetContactEntities")
    }, 
    [v0.FindFriendsButtonClicked] = {
        name = game:DefineFastString("FindFriendsButtonClickedCounter", "FindFriendsButtonClicked")
    }
};
