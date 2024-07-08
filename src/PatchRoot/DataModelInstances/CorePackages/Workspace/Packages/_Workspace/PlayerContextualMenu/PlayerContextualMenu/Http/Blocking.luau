return require(script:FindFirstAncestor("PlayerContextualMenu").Parent.LuaSocialLibrariesDeps).NetworkingBlocking.config({
    roduxNetworking = require(script.Parent.RoduxNetworking)
});
