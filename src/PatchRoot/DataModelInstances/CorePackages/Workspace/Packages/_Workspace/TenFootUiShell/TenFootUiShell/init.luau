return {
    ["jest.config"] = script["jest.config"], 
    TenFootUiContainer = require(script.Components.TenFootUiContainer), 
    TenFootUiOverflowScreen = require(script.Components.TenFootUiOverflowScreen), 
    createTenFootUiStackNavigator = require(script.ReactNavigationExtend.createTenFootUiStackNavigator), 
    createTenFootUiSwitchNavigator = require(script.ReactNavigationExtend.createTenFootUiSwitchNavigator), 
    Constants = require(script.Constants), 
    useCrossPlaySettings = require(script.Hooks.CrossPlay.useCrossPlaySettings), 
    Reducers = {
        CrossPlaySettings = require(script.Reducers.CrossPlaySettings)
    }, 
    PlatformServiceOrStub = require(script.ServiceWrappers.PlatformServiceOrStub), 
    Views = require(script.ReactNavigationExtend.Views), 
    RnBypassAdapter = require(script.ReactNavigationExtend.RnBypassAdapter)
};
