local v0 = {
    formatTestResults = require(script.formatTestResults).default
};
local v1 = require(script.helpers);
v0.addResult = v1.addResult;
v0.buildFailureTestResult = v1.buildFailureTestResult;
v0.createEmptyTestResult = v1.createEmptyTestResult;
v0.makeEmptyAggregatedTestResult = v1.makeEmptyAggregatedTestResult;
local _ = require(script.types);
return v0;
