return {
    ["jest.config"] = script["jest.config"], 
    Actions = {
        SetCentralOverlay = require(script.Actions.SetCentralOverlay)
    }, 
    Reducers = {
        CentralOverlayReducer = require(script.Reducers.CentralOverlayReducer)
    }, 
    Thunks = {
        CloseCentralOverlay = require(script.Thunks.CloseCentralOverlay)
    }
};
