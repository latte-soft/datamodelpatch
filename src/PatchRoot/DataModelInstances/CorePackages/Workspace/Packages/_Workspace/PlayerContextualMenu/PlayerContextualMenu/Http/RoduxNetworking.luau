return require(script:FindFirstAncestor("PlayerContextualMenu").Parent.LuaSocialLibrariesDeps).RoduxNetworking.config({
    keyPath = "EventReceievers" .. ".NetworkStatus", 
    networkImpl = require(script.Parent.httpRequest)
});
