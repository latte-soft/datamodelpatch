return {
    benchmark = require(script.benchmark).benchmark, 
    Profiler = require(script.Profiler), 
    Reporter = require(script.reporters.Reporter), 
    HeartbeatReporter = require(script.reporters.HeartbeatReporter), 
    MetricLogger = require(script.MetricLogger), 
    CustomReporters = require(script.CustomReporters)
};
