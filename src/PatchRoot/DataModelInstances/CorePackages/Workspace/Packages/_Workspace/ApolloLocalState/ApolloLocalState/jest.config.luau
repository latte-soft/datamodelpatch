local v0 = require(script:FindFirstAncestor("ApolloLocalState").Parent.Dev.JestConfigs);
return {
    displayName = "ApolloLocalState", 
    testMatch = {
        "**/*.test"
    }, 
    setupFilesAfterEnv = {
        v0.setupFiles.LogHandler, 
        v0.setupFiles.UIBloxInitializer, 
        v0.setupFiles.createPromiseRejectionHandler()
    }
};
