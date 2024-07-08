local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Parent.Dev.JestConfigs);
return {
    displayName = "ExperienceLoadingScript", 
    setupFilesAfterEnv = {
        l_Parent_0.LogHandler, 
        v1.setupFiles.UIBloxInitializer, 
        v1.setupFiles.createPromiseRejectionHandler()
    }
};
