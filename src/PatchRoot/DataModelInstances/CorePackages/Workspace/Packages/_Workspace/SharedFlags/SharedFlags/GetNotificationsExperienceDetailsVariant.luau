game:DefineFastFlag("NotificationsExperienceDetailsUpdate3", false);
game:DefineFastString("ExperienceDetailsLayer", "PlayerApp.GameDetailsPage");
game:DefineFastString("NotificationsOptInImprovementsFieldName", "enable_edp_notifications_opt_in");
return {
    enableNotificationsEDPChanges = game:GetFastFlag("NotificationsExperienceDetailsUpdate3"), 
    getNotificationsVariantFieldName = game:GetFastString("NotificationsOptInImprovementsFieldName")
};
