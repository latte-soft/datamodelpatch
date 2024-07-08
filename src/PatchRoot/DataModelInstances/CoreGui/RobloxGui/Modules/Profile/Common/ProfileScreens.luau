local v0 = {
    None = "None", 
    ProfilePeekView = "ProfilePeekView", 
    ContextualMenu = "ContextualMenu", 
    GenericToast = "GenericToast", 
    PurchaseExperienceModal = "PurchaseExperienceModal", 
    UnableToJoinExperienceModal = "UnableToJoinExperienceModal", 
    Chat = "Chat", 
    JoinGame = "JoinGame", 
    GameDetailsPeekView = "GameDetailsPeekView", 
    ItemDetails = "ItemDetails", 
    ViewUserProfile = "ViewUserProfile", 
    ViewUserFriends = "ViewUserFriends", 
    ViewUserFollowing = "ViewUserFollowing", 
    ViewUserFollowers = "ViewUserFollowers", 
    ReportUser = "ReportUser", 
    PurchaseErrorToast = "PurchaseErrorToast", 
    NetworkingErrorToast = "NetworkingErrorToast", 
    SetAliasModal = "SetAliasModal", 
    ProfileQRCodePage = "ProfileQRCodePage", 
    EditProfilePage = "EditProfilePage", 
    EditDescriptionModal = "EditDescriptionModal", 
    EditDisplayNameModal = "EditDisplayNameModal", 
    EditDisplayNameErrorModal = "EditDisplayNameErrorModal", 
    UsernameInsufficientFundsModal = "UsernameInsufficientFundsModal"
};
setmetatable(v0, {
    __index = function(_, v2)
        error(string.format("%q is not a valid member of ProfileScreens", (tostring(v2))), 2);
    end
});
return v0;
