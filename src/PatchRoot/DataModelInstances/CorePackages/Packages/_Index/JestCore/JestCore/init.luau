return {
    SearchSource = require(script.SearchSource).default, 
    createTestScheduler = require(script.TestScheduler).createTestScheduler, 
    TestWatcher = require(script.TestWatcher).default, 
    runCLI = require(script.cli).runCLI
};
