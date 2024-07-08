local l_Images_0 = require(script:FindFirstAncestor("StreamNotifications").Parent.UIBlox).App.ImageSet.Images;
return {
    DefaultPadding = 8, 
    DefaultMaxRows = 20, 
    Modal = {
        Width = 540, 
        Height = 600, 
        Padding = 8, 
        CornerRadius = 12, 
        WidthLimit = 640, 
        CloseIcon = l_Images_0["icons/navigation/close"], 
        BackIcon = l_Images_0["icons/navigation/pushBack"], 
        SettingsIcon = l_Images_0["icons/common/settings"], 
        HeaderHeight = 56
    }, 
    InitializingNotifications = {
        Size = 48
    }, 
    LoadingMoreNotifications = {
        Size = 24, 
        TriggerDistance = 400
    }, 
    EmptyNotifications = {
        Size = 96, 
        Graphic = l_Images_0["icons/graphic/success_xlarge"], 
        LabelHeight = 24
    }, 
    MetaActions = {
        CloseButtonFrameSize = 36, 
        CloseButtonSize = 30, 
        CloseIcon = l_Images_0["icons/navigation/close"], 
        CloseIconSize = 24, 
        ActionIcons = {
            turnOnNotifications = l_Images_0["icons/common/notificationOn"], 
            turnOffNotifications = l_Images_0["icons/common/notificationOff"], 
            report = l_Images_0["icons/actions/feedback"], 
            default = l_Images_0["icons/placeholder/placeholderOff"]
        }
    }, 
    Text = {
        HeaderKey = "Notifications.NotificationStream.Label.Notifications", 
        EmptyKey = "Notifications.NotificationStream.Label.AllCaughtUp", 
        ShowMoreKey = "Notifications.NotificationStream.Bundle.ShowMoreV2", 
        ShowLessKey = "Notifications.NotificationStream.Bundle.ShowLess"
    }, 
    DeliveryChannel = "Stream", 
    StreamSessionStructuralIdentifier = {
        Level1 = "level1", 
        StreamNotification = "streamNotification", 
        DeleteOnGameLeave = "_deleteOnGameLeave"
    }, 
    SENDRVersion = 0
};
