local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Enum.ToastType);
local l_GetFFlagLuaAppNewStreamNotificationsEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppNewStreamNotificationsEnabled;
return {
    PROFILE_THUMBNAIL_DATA = {
        Size = 420, 
        Type = "AvatarHeadShot"
    }, 
    EXP_THUMBNAIL_DATA = {
        Size = 512, 
        Type = "GameIcon"
    }, 
    ITEM_THUMBNAIL_DATA = {
        Size = 420, 
        Type = "Asset"
    }, 
    SUCCESS_TOAST_DATA = {
        toastMessage = "Feature.ReportAbuse.Label.Confirmation.Title", 
        toastSubMessage = "Feature.ReportAbuse.Label.Confirmation.Subheading", 
        isLocalized = false, 
        toastType = v1.SuccessConfirmation
    }, 
    BEDUI_FETCH_FAILURE = "Feature.ReportAbuse.Message.ErrorBEDUIFetchFailed", 
    REPORT_SUBMIT_LOADING = "Feature.ReportAbuse.Message.Loading", 
    REPORT_SUBMIT_FAILURE = "Feature.ReportAbuse.Message.ErrorSubmitFailure", 
    BEDUI_FETCH_FAILURE_PRIMARY = "Trouble Loading Report", 
    BEDUI_FETCH_FAILURE_SECONDARY = "Something went wrong. Please try again.", 
    BEDUI_BASE_URL = "abuse-reporting/v1/dynamic-dialog", 
    BEDUI_SURFACES = {
        VR = "vr"
    }, 
    REPORT_ENTRYPOINT = {
        Profile = "Profile", 
        Chat = "Chat", 
        Item = "Item", 
        ExperienceDetails = "ExperienceDetails", 
        Notification = if not l_GetFFlagLuaAppNewStreamNotificationsEnabled_0() then nil else "Notification"
    }, 
    BEDUI_FETCH_CONTEXT = {
        Profile = "profile", 
        Experience = "experience", 
        Item = "item", 
        Notification = if not l_GetFFlagLuaAppNewStreamNotificationsEnabled_0() then nil else "notification"
    }, 
    ABUSE_VECTOR = {
        UserProfile = "user_profile", 
        Place = "place", 
        Notification = if not l_GetFFlagLuaAppNewStreamNotificationsEnabled_0() then nil else "notifications"
    }, 
    SAFETY_EVENT_SUBMISSION_ENTRY_POINT = {
        VR = "vr", 
        Phone = if not l_GetFFlagLuaAppNewStreamNotificationsEnabled_0() then nil else "phone", 
        Tablet = if not l_GetFFlagLuaAppNewStreamNotificationsEnabled_0() then nil else "tablet", 
        Desktop = if not l_GetFFlagLuaAppNewStreamNotificationsEnabled_0() then nil else "desktop"
    }, 
    ANALYTICS_EVENT_NAMES = {
        SUBMITTED = "TreeBasedAbuseReportSubmitted", 
        ABANDONED = "TreeBasedAbuseReportAbandoned"
    }, 
    COMMON_FORMAT_ENTRY_POINT = {
        Profile = "profile", 
        Experience = "experience", 
        Item = "item", 
        Chat = "chat"
    }, 
    BEDUI_VERSIONS = {
        V1 = "v1", 
        DEV = "v_dev"
    }
};
