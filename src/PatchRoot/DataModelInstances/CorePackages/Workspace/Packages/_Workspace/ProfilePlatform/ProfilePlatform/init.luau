return {
    ["jest.config"] = script["jest.config"], 
    RoduxKey = require(script.Common.Constants).RODUX_KEY, 
    installReducer = require(script.Rodux.installReducer), 
    ProfilePlatformEntrypoint = require(script.Components.ProfilePlatformEntrypoint)
};
