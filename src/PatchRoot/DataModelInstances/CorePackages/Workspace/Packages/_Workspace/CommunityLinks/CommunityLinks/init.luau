return {
    ["jest.config"] = script["jest.config"], 
    Components = require(script.Components), 
    Enums = require(script.Enums), 
    Models = require(script.Models), 
    Thunks = require(script.Thunks), 
    Utils = require(script.Utils), 
    Constants = require(script.constants), 
    Analytics = require(script.Analytics), 
    installReducer = require(script.Reducers.installReducer)
};
