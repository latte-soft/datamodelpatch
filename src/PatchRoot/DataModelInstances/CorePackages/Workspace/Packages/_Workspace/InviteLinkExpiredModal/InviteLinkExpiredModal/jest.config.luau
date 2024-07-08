local v0 = require(script:FindFirstAncestor("InviteLinkExpiredModal").Parent.Dev.JestConfigs);
return {
    displayName = "InviteLinkExpiredModal", 
    testMatch = {
        "**/*.test"
    }, 
    setupFilesAfterEnv = {
        v0.setupFiles.LogHandler, 
        v0.setupFiles.UIBloxInitializer, 
        v0.setupFiles.createPromiseRejectionHandler(), 
        script.Parent.NetworkImplHandler
    }
};
