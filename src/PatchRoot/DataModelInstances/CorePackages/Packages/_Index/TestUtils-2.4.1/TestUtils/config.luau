local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.JestTypes);
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Object_0 = v2.Object;
local l_inspect_0 = v2.util.inspect;
local v6 = {};
local v7 = {
    bail = 0, 
    changedFilesWithAncestor = false, 
    changedSince = "", 
    collectCoverage = false, 
    collectCoverageFrom = {}, 
    collectCoverageOnlyFrom = nil, 
    coverageDirectory = "coverage", 
    coverageProvider = "babel", 
    coverageReporters = {}, 
    coverageThreshold = {
        global = {}
    }, 
    detectLeaks = false, 
    detectOpenHandles = false, 
    errorOnDeprecated = false, 
    expand = false, 
    filter = nil, 
    findRelatedTests = false, 
    forceExit = false, 
    globalSetup = nil, 
    globalTeardown = nil, 
    json = false, 
    lastCommit = false, 
    listTests = false, 
    logHeapUsage = false, 
    maxConcurrency = 5, 
    maxWorkers = 2, 
    noSCM = nil, 
    noStackTrace = false, 
    nonFlagArgs = {}, 
    notify = false, 
    notifyMode = "failure-change", 
    onlyChanged = false, 
    onlyFailures = false, 
    outputFile = nil, 
    passWithNoTests = false, 
    projects = {}, 
    replname = nil, 
    reporters = {}, 
    rootDir = "/test_root_dir/", 
    runTestsByPath = false, 
    silent = false, 
    skipFilter = false, 
    snapshotFormat = {}, 
    testFailureExitCode = 1, 
    testNamePattern = "", 
    testPathPattern = "", 
    testResultsProcessor = nil, 
    testSequencer = "@jest/test-sequencer", 
    testTimeout = 5000, 
    updateSnapshot = "none", 
    useStderr = false, 
    verbose = false, 
    watch = false, 
    watchAll = false, 
    watchPlugins = {}, 
    watchman = false
};
local v8 = {
    automock = false, 
    cache = false, 
    cacheDirectory = "/test_cache_dir/", 
    clearMocks = false, 
    coveragePathIgnorePatterns = {}, 
    cwd = "/test_root_dir/", 
    detectLeaks = false, 
    detectOpenHandles = false, 
    displayName = nil, 
    errorOnDeprecated = false, 
    extensionsToTreatAsEsm = {}, 
    extraGlobals = {}, 
    filter = nil, 
    forceCoverageMatch = {}, 
    globalSetup = nil, 
    globalTeardown = nil, 
    globals = {}, 
    haste = {}, 
    injectGlobals = true, 
    moduleDirectories = {}, 
    moduleFileExtensions = {
        "js"
    }, 
    moduleLoader = "/test_module_loader_path", 
    moduleNameMapper = {}, 
    modulePathIgnorePatterns = {}, 
    modulePaths = {}, 
    name = "test_name", 
    prettierPath = "prettier", 
    resetMocks = false, 
    resetModules = false, 
    resolver = nil, 
    restoreMocks = false, 
    rootDir = "/test_root_dir/", 
    roots = {}, 
    runner = "jest-runner", 
    setupFiles = {}, 
    setupFilesAfterEnv = {}, 
    skipFilter = false, 
    skipNodeResolution = false, 
    slowTestThreshold = 5, 
    snapshotFormat = {}, 
    snapshotResolver = nil, 
    snapshotSerializers = {}, 
    testEnvironment = "node", 
    testEnvironmentOptions = {}, 
    testLocationInResults = false, 
    testMatch = {}, 
    testPathIgnorePatterns = {}, 
    testRegex = {
        "\\.test\\.js$"
    }, 
    testRunner = "jest-circus/runner", 
    testURL = "http =//localhost", 
    timers = "real", 
    transform = {}, 
    transformIgnorePatterns = {}, 
    unmockedModulePathPatterns = nil, 
    watchPathIgnorePatterns = {}
};
v6.makeGlobalConfig = function(v9)
    v9 = v9 or {};
    local v12 = l_Array_0.reduce(l_Object_0.keys(v9), function(v10, v11)
        v10[v11] = v11;
        return v10;
    end, {});
    l_Array_0.forEach(l_Object_0.keys(v7), function(v13)
        v12[v13] = nil;
    end);
    if #v12 > 0 then
        error("Properties that are not part of GlobalConfig type were passed:" .. l_inspect_0(v12));
    end;
    return l_Object_0.assign(v7, v9);
end;
v6.makeProjectConfig = function(v14)
    v14 = v14 or {};
    local v17 = l_Array_0.reduce(l_Object_0.keys(v14), function(v15, v16)
        v15[v16] = v16;
        return v15;
    end, {});
    l_Array_0.forEach(l_Object_0.keys(v8), function(v18)
        v17[v18] = nil;
    end);
    if #v17 > 0 then
        error("Properties that are not part of ProjectConfig type were passed:" .. l_inspect_0(v17));
    end;
    return l_Object_0.assign(v8, v14);
end;
return v6;
