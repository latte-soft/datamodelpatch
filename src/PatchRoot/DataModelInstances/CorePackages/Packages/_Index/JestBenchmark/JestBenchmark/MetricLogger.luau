local l_console_0 = require(script:FindFirstAncestor("JestBenchmark").Parent.LuauPolyfill).console;
local function v3(v1, v2)
    l_console_0.log((("%*, %*"):format(v1, v2)));
end;
local v4 = {
    log = v3
};
v4.useCustomMetricLogger = function(v5)
    v4.log = v5;
end;
v4.useDefaultMetricLogger = function()
    v4.log = v3;
end;
return v4;
