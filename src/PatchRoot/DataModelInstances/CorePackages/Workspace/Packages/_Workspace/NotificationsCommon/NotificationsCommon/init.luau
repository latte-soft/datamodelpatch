local _ = require(script.type);
return {
    dependencies = require(script.dependencies), 
    ["jest.config"] = script["jest.config"], 
    ReducerDependencies = require(script.utils.ReducerDependencies), 
    LocalizationHelper = require(script.utils.StringLocalizationHelper), 
    DeeplinkConfirmationModal = require(script.components.DeeplinkConfirmationModal), 
    JoinExperience = require(script.JoinExperience), 
    Debounce = require(script.utils.debounce), 
    Throttle = require(script.utils.throttle), 
    DeviceInfo = require(script.utils.deviceInfo), 
    NotificationCardProvider = require(script.context.NotificationCardProvider), 
    NotificationCard = require(script.components.NotificationCard), 
    NotificationHelper = require(script.utils.NotificationHelper), 
    type = require(script.type), 
    constants = require(script.constants), 
    ixpHelper = require(script.utils.ixpHelper), 
    sendEventDeferred = require(script.analytics.sendEventDeferred)
};
