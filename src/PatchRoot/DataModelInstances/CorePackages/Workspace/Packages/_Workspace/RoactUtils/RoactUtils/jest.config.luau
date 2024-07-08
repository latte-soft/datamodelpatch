local v0 = require(script.Parent.Parent.Dev.JestConfigs);
return {
    displayName = "RoactUtils", 
    setupFilesAfterEnv = {
        v0.setupFiles.LogHandler, 
        v0.setupFiles.createPromiseRejectionHandler()
    }
};
