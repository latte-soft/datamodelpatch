local v0 = require(script.Parent.Parent.Dev.JestConfigs);
return {
    displayName = "ContentFeed", 
    setupFilesAfterEnv = {
        v0.setupFiles.LogHandler, 
        v0.setupFiles.UIBloxInitializer, 
        v0.setupFiles.createPromiseRejectionHandler()
    }
};
