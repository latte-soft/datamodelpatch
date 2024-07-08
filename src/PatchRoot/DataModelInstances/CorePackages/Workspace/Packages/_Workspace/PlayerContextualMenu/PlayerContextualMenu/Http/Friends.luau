return require(script:FindFirstAncestor("PlayerContextualMenu").Parent.LuaSocialLibrariesDeps).NetworkingFriends.config({
    roduxNetworking = require(script.Parent.RoduxNetworking)
});
