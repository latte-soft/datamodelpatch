local v0 = require(script:FindFirstAncestor("VirtualEvents").Parent.Dev.JestConfigs);
return {
    displayName = "VirtualEvents", 
    testMatch = {
        "**/*.test"
    }, 
    setupFilesAfterEnv = {
        v0.setupFiles.LogHandler, 
        v0.setupFiles.UIBloxInitializer, 
        v0.setupFiles.createPromiseRejectionHandler()
    }
};
