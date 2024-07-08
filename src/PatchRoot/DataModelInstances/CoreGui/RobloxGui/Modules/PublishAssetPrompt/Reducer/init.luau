return (require(game:GetService("CorePackages").Rodux).combineReducers({
    promptRequest = require(script.PromptRequestReducer)
}));
