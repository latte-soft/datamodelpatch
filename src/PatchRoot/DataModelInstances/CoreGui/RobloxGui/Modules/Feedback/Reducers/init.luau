local l_CorePackages_0 = game:GetService("CorePackages");
return (require(l_CorePackages_0.Rodux).combineReducers({
    common = require(script.common), 
    displayOptions = require(script.displayOptions), 
    feedbackFlowState = require(script.feedbackFlowState), 
    FetchingStatus = require(l_CorePackages_0.Workspace.Packages.Http).Reducers.FetchingStatus
}));
