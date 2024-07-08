return {
    dependencies = require(script.dependencies), 
    ["jest.config"] = script["jest.config"], 
    renderToastNotificationContainer = require(script.renderToastNotification), 
    ToastNotificationWrapper = require(script.ToastNotificationWrapper), 
    AppToastNotificationContainer = require(script.AppToastNotificationContainer), 
    ToastNotificationTypeModule = require(script.type), 
    LifecycleEvents = require(script.utils.LifecycleEvents)
};
