return require(script:FindFirstAncestor("ContactsToast").Parent.NetworkingUsers).config({
    roduxNetworking = require(script.Parent.configuredRoduxNetworking)
});
