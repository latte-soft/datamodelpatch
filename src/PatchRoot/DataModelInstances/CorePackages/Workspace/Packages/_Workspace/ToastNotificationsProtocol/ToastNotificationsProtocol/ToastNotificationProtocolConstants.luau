local l_MessageBusService_0 = game:GetService("MessageBusService");
return {
    PROTOCOL_NAME = "ToastNotifications", 
    MESSAGE_INIT_TOAST_NOTIF = l_MessageBusService_0:GetMessageId("ToastNotifications", "initializeToastNotifications"), 
    MESSAGE_GET_TOAST_NOTIF = l_MessageBusService_0:GetMessageId("ToastNotifications", "getToastNotification"), 
    MESSAGE_UPDATE_TOAST_NOTIF = l_MessageBusService_0:GetMessageId("ToastNotifications", "updateToastNotificationState"), 
    MESSAGE_DISMISS_TOAST_NOTIF = l_MessageBusService_0:GetMessageId("ToastNotifications", "dismissToastNotification"), 
    MESSAGE_DISPLAY_TOAST_NOTIF = l_MessageBusService_0:GetMessageId("ToastNotifications", "displayToastNotification")
};
