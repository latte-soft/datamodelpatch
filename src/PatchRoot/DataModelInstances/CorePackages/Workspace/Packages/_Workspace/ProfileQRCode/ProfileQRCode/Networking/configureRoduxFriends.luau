return require(script:FindFirstAncestor("ProfileQRCode").Parent.NetworkingFriends).config({
    roduxNetworking = require(script.Parent.configuredRoduxNetworking)
});
