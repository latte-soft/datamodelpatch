local l_GetNotificationsExperienceDetailsVariant_0 = require(script:FindFirstAncestor("ToastRodux").Parent.SharedFlags).GetNotificationsExperienceDetailsVariant;
return {
    NetworkingError = "NetworkingError", 
    QuickLaunchError = "QuickLaunchError", 
    PlayButtonError = "PlayButtonError", 
    PurchaseMessage = "PurchaseMessage", 
    GameFollowError = "GameFollowError", 
    SuccessConfirmation = "SuccessConfirmation", 
    InformationMessage = "InformationMessage", 
    NotificationsTurnedOn = if not l_GetNotificationsExperienceDetailsVariant_0.enableNotificationsEDPChanges then nil else "NotificationsTurnedOn", 
    NotificationsTurnedOff = if not l_GetNotificationsExperienceDetailsVariant_0.enableNotificationsEDPChanges then nil else "NotificationsTurnedOff"
};
