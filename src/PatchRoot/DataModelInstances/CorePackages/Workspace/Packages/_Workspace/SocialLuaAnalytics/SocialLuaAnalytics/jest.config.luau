local v0 = require(script:FindFirstAncestor("SocialLuaAnalytics").Parent.Dev.JestConfigs);
return {
    displayName = "SocialLuaAnalytics", 
    testMatch = {
        "**/*.test"
    }, 
    setupFilesAfterEnv = {
        v0.setupFiles.LogHandler, 
        v0.setupFiles.UIBloxInitializer, 
        v0.setupFiles.createPromiseRejectionHandler()
    }
};
