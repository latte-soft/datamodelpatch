local v0 = require(game:GetService("CorePackages").Workspace.Packages.JestConfigs);
return {
    displayName = "Common", 
    testMatch = {
        "**/*.test"
    }, 
    setupFilesAfterEnv = {
        v0.setupFiles.LogHandler, 
        v0.setupFiles.UIBloxInitializer, 
        v0.setupFiles.createPromiseRejectionHandler()
    }
};
