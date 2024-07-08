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
    ci = false, 
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
    clearMocks = false, 
    coveragePathIgnorePatterns = {}, 
    cwd = "/test_root_dir/", 
    detectLeaks = false, 
    detectOpenHandles = false, 
    displayName = nil, 
    errorOnDeprecated = false, 
    extensionsToTreatAsEsm = {}, 
    fakeTimers = {
        enableGlobally = false
    }, 
    filter = nil, 
    forceCoverageMatch = {}, 
    globalSetup = nil, 
    globalTeardown = nil, 
    globals = {}, 
    haste = {}, 
    id = "test_name", 
    injectGlobals = true, 
    moduleDirectories = {}, 
    moduleFileExtensions = {
        "js"
    }, 
    moduleNameMapper = {}, 
    modulePathIgnorePatterns = {}, 
    modulePaths = {}, 
    prettierPath = "prettier", 
    resetMocks = false, 
    resetModules = false, 
    resolver = nil, 
    restoreMocks = false, 
    rootDir = "/test_root_dir/", 
    roots = {}, 
    runner = "jest-runner", 
    runtime = "/test_module_loader_path", 
    sandboxInjectedGlobals = {}, 
    setupFiles = {}, 
    setupFilesAfterEnv = {}, 
    skipFilter = false, 
    skipNodeResolution = false, 
    slowTestThreshold = 5, 
    snapshotFormat = {}, 
    snapshotResolver = nil, 
    snapshotSerializers = {}, 
    testEnvironment = l_Parent_0.JestEnvironmentLuau, 
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
    local v10 = v9 or {};
    local v13 = l_Array_0.reduce(l_Object_0.keys(v10), function(v11, v12)
        v11[v12] = v12;
        return v11;
    end, {});
    l_Array_0.forEach(l_Object_0.keys(v7), function(v14)
        v13[v14] = nil;
    end);
    if #v13 > 0 then
        error("Properties that are not part of GlobalConfig type were passed:" .. l_inspect_0(v13));
    end;
    return l_Object_0.assign({}, v7, v10);
end;
v6.makeProjectConfig = function(v15)
    v15 = v15 or {};
    local v18 = l_Array_0.reduce(l_Object_0.keys(v15), function(v16, v17)
        v16[v17] = v17;
        return v16;
    end, {});
    l_Array_0.forEach(l_Object_0.keys(v8), function(v19)
        v18[v19] = nil;
    end);
    if #v18 > 0 then
        error("Properties that are not part of ProjectConfig type were passed:" .. l_inspect_0(v18));
    end;
    return l_Object_0.assign({}, v8, v15);
end;
return v6;
