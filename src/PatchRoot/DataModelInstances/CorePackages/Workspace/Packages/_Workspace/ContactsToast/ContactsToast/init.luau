return {
    ContactsToast = require(script.Components.ContactsToastContainer), 
    ["jest.config"] = script["jest.config"], 
    RoduxKey = require(script.Common.Constants).RODUX_KEY, 
    installReducer = require(script.Rodux).installReducer, 
    ContactsToastIXP = require(script.Experiments.ContactsToastIXP)
};
