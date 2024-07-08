local v0 = require(game:GetService("CorePackages").Workspace.Packages.JestConfigs);
return {
    displayName = "ExperienceDetails", 
    testMatch = {
        "**/*.test"
    }, 
    snapshotFormat = {
        printInstanceDefaults = false
    }, 
    setupFilesAfterEnv = {
        v0.setupFiles.UIBloxInitializer, 
        v0.setupFiles.createPromiseRejectionHandler()
    }
};
