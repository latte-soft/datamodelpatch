return (require(game:GetService("CorePackages").Rodux).combineReducers({
    promptInfo = require(script.PromptInfo), 
    screenSize = require(script.ScreenSize), 
    gameName = require(script.GameName), 
    analyticsInfo = require(script.AnalyticsInfo)
}));
