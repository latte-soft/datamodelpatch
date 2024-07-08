return require(script:FindFirstAncestor("AppChat").Parent.LuaSocialLibrariesDeps).NetworkingChat.config({
    roduxNetworking = require(script.Parent.RoduxNetworking)
});
