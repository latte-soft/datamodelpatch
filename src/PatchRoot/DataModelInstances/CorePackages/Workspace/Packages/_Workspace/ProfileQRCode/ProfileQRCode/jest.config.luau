local v0 = require(script.Parent.Parent.Dev.JestConfigs);
return {
    displayName = "ProfileQRCode", 
    testMatch = {
        "**/*.test"
    }, 
    setupFilesAfterEnv = {
        v0.setupFiles.LogHandler, 
        v0.setupFiles.UIBloxInitializer, 
        v0.setupFiles.createPromiseRejectionHandler(), 
        script.Parent.TestHelpers.collisionMatcherSetup, 
        script.Parent.TestHelpers.NetworkImplHandler
    }
};
