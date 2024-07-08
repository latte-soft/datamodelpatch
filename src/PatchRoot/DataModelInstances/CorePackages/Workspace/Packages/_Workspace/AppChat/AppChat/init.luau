return {
    Actions = require(script.Actions), 
    Analytics = require(script.Analytics), 
    App = require(script.App), 
    Components = require(script.Components), 
    Constants = require(script.Constants), 
    Conversations = require(script.Conversations), 
    EntryPoint = require(script.AppChatEntryPoint), 
    EntryPointUA = require(script.AppChatEntryPointUA), 
    Flags = require(script.Flags), 
    Http = require(script.Http), 
    installReducer = require(script.installReducer), 
    Models = require(script.Models), 
    Screens = require(script.EnumScreens), 
    Users = require(script.Users), 
    Utils = require(script.Utils), 
    LegacyAnalytics = require(script.LegacyAnalytics), 
    ["jest.config"] = script["jest.config"]
};
