return (require(game:GetService("CorePackages").Rodux).combineReducers({
    common = require(script.common), 
    displayOptions = require(script.displayOptions), 
    placeInfo = require(script.placeInfo), 
    report = require(script.report)
}));
