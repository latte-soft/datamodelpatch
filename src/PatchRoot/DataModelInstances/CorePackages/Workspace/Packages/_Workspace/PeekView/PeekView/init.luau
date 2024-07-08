return {
    analytics = {
        peekViewDismissedEvent = require(script.analytics.peekViewDismissedEvent)
    }, 
    ["jest.config"] = script["jest.config"], 
    PeekViewState = require(script.PeekViewState), 
    PeekView = require(script.PeekView), 
    PeekViewWithTopBar = require(script.PeekViewWithTopBar)
};
