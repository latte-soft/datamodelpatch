local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Parent.Dev.JestConfigs);
return {
    displayName = "FriendsLanding", 
    testMatch = {
        "**/*.test"
    }, 
    setupFilesAfterEnv = {
        v1.setupFiles.LogHandler, 
        v1.setupFiles.UIBloxInitializer, 
        v1.setupFiles.createPromiseRejectionHandler(), 
        l_Parent_0.TestHelpers.CollisionMatchersSetup, 
        l_Parent_0.TestHelpers.NetworkImplHandler
    }
};
