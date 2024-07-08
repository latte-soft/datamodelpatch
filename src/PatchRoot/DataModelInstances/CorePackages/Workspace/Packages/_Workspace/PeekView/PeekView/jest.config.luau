local v0 = require(script.Parent.Parent.Dev.JestConfigs);
return {
    displayName = "PeekView", 
    setupFilesAfterEnv = {
        v0.setupFiles.UIBloxInitializer, 
        v0.setupFiles.createPromiseRejectionHandler()
    }
};
