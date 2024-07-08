local _ = require(script.Parent.Parent.ToastNotificationsProtocol);
return {
    ChannelListEnum = {
        App = "toast-in-app-notifications", 
        Experience = "toast-in-experience-notifications", 
        Dual = "toast-in-app-and-experience-notifications", 
        Desktop = "toast-in-app-and-experience-desktop-notifications"
    }, 
    ActionTypeEnum = {
        Report = "reportNotification", 
        Deeplink = "deeplink", 
        NotificationApi = "notificationAPI", 
        Dismiss = "dismiss", 
        Reload = "reload", 
        None = "none", 
        VoltronBroadcast = "voltronBroadcast"
    }, 
    SENDERButtonStyleEnum = {
        Primary = "Primary", 
        Secondary = "Secondary", 
        Alert = "Alert", 
        Growth = "Growth"
    }, 
    SENDERThumbnailTypeEnum = {
        User = "userThumbnail", 
        Game = "gameThumbnail", 
        Group = "groupThumbnail", 
        Asset = "assetThumbnail", 
        Bundle = "bundleThumbnail", 
        Icon = "icon"
    }, 
    ToastNotificationActionsEnum = {
        ModalCancel = "modalCancel", 
        ModalConfirm = "modalConfirm", 
        Dismissed = "dismissed", 
        Display = "displayed", 
        Hover = "hoverOver", 
        Ignored = "ignored", 
        Update = "update", 
        DeeplinkFailed = "deeplinkFailed"
    }, 
    RenderLocationEnum = {
        UniversalApp = "universalApp", 
        CoreScript = "coreScript"
    }, 
    DeviceOrientationEnum = {
        Portrait = "Portrait", 
        Landscape = "Landscape", 
        Unknown = "Unknown"
    }, 
    VisualItemTypeEnum = {
        Button = "button", 
        TextBody = "textBody", 
        Thumbnail = "thumbnail", 
        MetaAction = "metaAction"
    }, 
    NotificationTypeEnum = {
        CallReceived = "CallReceived"
    }
};
