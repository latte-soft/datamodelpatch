return {
    ["jest.config"] = script["jest.config"], 
    BacktraceReporter = require(script.Backtrace.BacktraceReporter), 
    ErrorQueue = require(script.ErrorQueue)
};
