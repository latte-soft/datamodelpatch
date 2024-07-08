return {
    Events = require(script.Events), 
    mountClientApp = require(script.mountClientApp), 
    mountServerApp = require(script.mountServerApp), 
    listenToDispatch = require(script.listenToDispatch)((require(script.ActionBindableEvent))), 
    GlobalFlags = require(script.GlobalFlags)
};
