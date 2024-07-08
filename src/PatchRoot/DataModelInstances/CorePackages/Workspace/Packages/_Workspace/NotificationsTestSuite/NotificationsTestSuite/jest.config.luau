local l_Parent_0 = script.Parent.Parent;
return {
    projects = {
        require(l_Parent_0.GameInvite)["jest.config"], 
        require(l_Parent_0.NotificationsCommon)["jest.config"], 
        require(l_Parent_0.ToastNotification)["jest.config"], 
        require(l_Parent_0.StreamNotifications)["jest.config"], 
        require(l_Parent_0.NotificationModalsManager)["jest.config"], 
        require(l_Parent_0.NotificationsUpsell)["jest.config"]
    }
};
