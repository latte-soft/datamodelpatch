local v0 = require(game:GetService("CorePackages").Workspace.Packages.JestConfigs);
return {
    displayName = "DeepLinkJest3", 
    testMatch = {
        "**/*.test", 
        "**/ShareLinks/**"
    }, 
    setupFilesAfterEnv = {
        v0.setupFiles.UIBloxInitializer, 
        v0.setupFiles.createPromiseRejectionHandler()
    }
};
