local l_Parent_0 = script.Parent.Parent;
local v1 = {};
local _ = require(l_Parent_0.JestTypes);
v1.default = {
    automock = false, 
    bail = 0, 
    changedFilesWithAncestor = false, 
    ci = false, 
    clearMocks = false, 
    coveragePathIgnorePatterns = {}, 
    expand = false, 
    globals = {}, 
    injectGlobals = true, 
    listTests = false, 
    maxConcurrency = 5, 
    maxWorkers = "50%", 
    noStackTrace = false, 
    notify = false, 
    passWithNoTests = false, 
    resetMocks = false, 
    resetModules = false, 
    restoreMocks = false, 
    roots = {
        "<rootDir>"
    }, 
    runTestsByPath = false, 
    runner = "jest-runner", 
    setupFiles = {}, 
    setupFilesAfterEnv = {}, 
    skipFilter = false, 
    slowTestThreshold = 5, 
    snapshotSerializers = {}, 
    testEnvironment = l_Parent_0.JestEnvironmentLuau, 
    testEnvironmentOptions = {}, 
    testFailureExitCode = 1, 
    testLocationInResults = false, 
    testMatch = {
        "**/__tests__/**/*", 
        "**/?(*.)+(spec|test)"
    }, 
    testPathIgnorePatterns = {}, 
    testRegex = {}, 
    timers = "real", 
    useStderr = false, 
    watch = false, 
    watchPathIgnorePatterns = {}, 
    watchman = true
};
return v1;
