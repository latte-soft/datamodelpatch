local v0 = require(script:FindFirstAncestor("GraphQLServer").Parent.Dev.JestConfigs);
return {
    displayName = "GraphQlServer", 
    testMatch = {
        "**/*.test"
    }, 
    setupFilesAfterEnv = {
        v0.setupFiles.LogHandler, 
        v0.setupFiles.UIBloxInitializer, 
        v0.setupFiles.createPromiseRejectionHandler()
    }
};
