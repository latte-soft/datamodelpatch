return require(script:FindFirstAncestor("ProfileQRCode").Parent.NetworkingUsers).config({
    roduxNetworking = require(script.Parent.configuredRoduxNetworking)
});
