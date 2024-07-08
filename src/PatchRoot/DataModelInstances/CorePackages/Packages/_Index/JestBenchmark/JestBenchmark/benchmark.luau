local l_Parent_0 = script:FindFirstAncestor("JestBenchmark").Parent;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local v2 = require(script.Parent.testModule);
local l_initializeProfiler_0 = require(script.Parent.Profiler).initializeProfiler;
local _ = require(script.Parent.reporters.Reporter);
local l_initializeSectionTimeReporter_0 = require(script.Parent.reporters.SectionTimeReporter).initializeSectionTimeReporter;
local l_initializeFpsReporter_0 = require(script.Parent.reporters.FpsReporter).initializeFpsReporter;
local v7 = require(script.Parent.MetricLogger);
local v8 = require(script.Parent.CustomReporters);
local v9 = {};
local _ = require(l_Parent_0.JestTypes);
local _ = function(v11, v12)
    local v13 = l_initializeSectionTimeReporter_0();
    local v14 = l_initializeFpsReporter_0();
    return function()
        local v15 = l_Object_0.assign({
            SectionTime = v13, 
            FPS = v14
        }, v8.customReporters);
        local v16 = {};
        for _, v18 in v15, nil, nil do
            table.insert(v16, v18);
        end;
        local v19 = l_initializeProfiler_0(v16, v7.log, v11);
        v19.start("total");
        v12(v19, v15);
        v19.stop();
        v19.finish();
        task.wait();
    end;
end;
local v32 = setmetatable({}, {
    __call = function(_, v22, v23, v24)
        local v25 = l_initializeSectionTimeReporter_0();
        local v26 = l_initializeFpsReporter_0();
        return v2(v22, function()
            local v27 = l_Object_0.assign({
                SectionTime = v25, 
                FPS = v26
            }, v8.customReporters);
            local v28 = {};
            for _, v30 in v27, nil, nil do
                table.insert(v28, v30);
            end;
            local v31 = l_initializeProfiler_0(v28, v7.log, v22);
            v31.start("total");
            v23(v31, v27);
            v31.stop();
            v31.finish();
            task.wait();
        end, v24);
    end
});
v32.only = function(v33, v34, v35)
    local v36 = l_initializeSectionTimeReporter_0();
    local v37 = l_initializeFpsReporter_0();
    return v2.only(v33, function()
        local v38 = l_Object_0.assign({
            SectionTime = v36, 
            FPS = v37
        }, v8.customReporters);
        local v39 = {};
        for _, v41 in v38, nil, nil do
            table.insert(v39, v41);
        end;
        local v42 = l_initializeProfiler_0(v39, v7.log, v33);
        v42.start("total");
        v34(v42, v38);
        v42.stop();
        v42.finish();
        task.wait();
    end, v35);
end;
v32.skip = function(v43, v44, v45)
    local v46 = l_initializeSectionTimeReporter_0();
    local v47 = l_initializeFpsReporter_0();
    return v2.skip(v43, function()
        local v48 = l_Object_0.assign({
            SectionTime = v46, 
            FPS = v47
        }, v8.customReporters);
        local v49 = {};
        for _, v51 in v48, nil, nil do
            table.insert(v49, v51);
        end;
        local v52 = l_initializeProfiler_0(v49, v7.log, v43);
        v52.start("total");
        v44(v52, v48);
        v52.stop();
        v52.finish();
        task.wait();
    end, v45);
end;
v9.benchmark = v32;
return v9;
