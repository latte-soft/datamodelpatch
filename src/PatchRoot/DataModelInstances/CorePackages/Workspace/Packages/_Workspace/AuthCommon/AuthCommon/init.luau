return {
    ["jest.config"] = script["jest.config"], 
    Components = require(script.Components), 
    Actions = require(script.Actions), 
    Http = require(script.Http), 
    Models = require(script.Models), 
    Thunks = require(script.Thunks), 
    Utils = require(script.Utils), 
    Reducers = require(script.Reducers), 
    installReducer = require(script.Reducers.installReducer), 
    RoduxKey = require(script.Common.Constants).RODUX_KEY
};
