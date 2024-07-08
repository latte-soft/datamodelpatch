return {
    AppStartupSequence = require(script.AppStartupSequence), 
    PlatformAccountRouter = require(script.Components.PlatformAccountRouter), 
    StartupMessageContainer = require(script.Components.StartupMessage.StartupMessageContainer), 
    navigateWithPlatformAccount = require(script.navigateWithPlatformAccount), 
    Reducers = require(script.Reducers), 
    Actions = require(script.Actions), 
    Hooks = require(script.Hooks), 
    Enums = require(script.Enums), 
    ["jest.config"] = script["jest.config"]
};
