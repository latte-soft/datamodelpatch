local l_Object_0 = require(script:FindFirstAncestor("JestBenchmark").Parent.LuauPolyfill).Object;
local _ = require(script.Parent.reporters.Reporter);
local v2 = {
    customReporters = {}
};
v2.useCustomReporters = function(v3)
    l_Object_0.assign(v2.customReporters, v3);
end;
v2.useDefaultReporters = function()
    table.clear(v2.customReporters);
end;
return v2;
