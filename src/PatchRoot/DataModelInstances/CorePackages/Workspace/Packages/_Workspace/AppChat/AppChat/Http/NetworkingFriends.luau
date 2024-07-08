return require(script:FindFirstAncestor("AppChat").Parent.LuaSocialLibrariesDeps).NetworkingFriends.config({
    roduxNetworking = require(script.Parent.RoduxNetworking)
});
