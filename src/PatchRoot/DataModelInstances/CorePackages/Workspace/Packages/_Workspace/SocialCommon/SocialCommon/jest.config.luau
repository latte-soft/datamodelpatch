local v0 = require(script:FindFirstAncestor("SocialCommon").Parent.Dev.JestConfigs);
return {
    displayName = "SocialCommon", 
    testMatch = {
        "**/*.test"
    }, 
    setupFilesAfterEnv = {
        v0.setupFiles.LogHandler, 
        v0.setupFiles.UIBloxInitializer, 
        v0.setupFiles.createPromiseRejectionHandler(), 
        script.Parent.TestHelpers.collisionMatcherSetup
    }
};
