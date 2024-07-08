local v0 = require(script.Parent.Parent.Dev.JestConfigs);
return {
    displayName = "GraphQlSharedJest3", 
    testMatch = {
        "**/*.test"
    }, 
    setupFilesAfterEnv = {
        v0.setupFiles.UIBloxInitializer, 
        v0.setupFiles.createPromiseRejectionHandler()
    }
};
