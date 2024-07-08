local v0 = require(script:FindFirstAncestor("UserProfiles").Parent.Dev.JestConfigs);
return {
    displayName = "UserProfiles", 
    testMatch = {
        "**/*.test"
    }, 
    setupFilesAfterEnv = {
        v0.setupFiles.LogHandler, 
        v0.setupFiles.UIBloxInitializer, 
        v0.setupFiles.createPromiseRejectionHandler()
    }
};
