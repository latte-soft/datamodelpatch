return {
    ["jest.config"] = script["jest.config"], 
    Actions = {
        SetAuthenticationStatus = require(script.Actions.SetAuthenticationStatus)
    }, 
    Reducers = {
        AuthenticationStatusReducer = require(script.Reducers.AuthenticationStatusReducer)
    }
};
