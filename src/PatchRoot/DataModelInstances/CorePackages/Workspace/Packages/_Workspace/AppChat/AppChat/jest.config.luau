local v0 = require(game:GetService("CorePackages").Workspace.Packages.JestConfigs);
return {
    displayName = "AppChat", 
    testMatch = {
        "**/*.test"
    }, 
    setupFilesAfterEnv = {
        v0.setupFiles.UIBloxInitializer, 
        v0.setupFiles.createPromiseRejectionHandler(), 
        script.Parent.setupJest, 
        script.Parent.setupLogger
    }
};
