local v0 = {};
local _ = require(script.Parent.reporters.Reporter);
local _ = require(script.Parent.MetricLogger);
v0.initializeProfiler = function(v3, v4, v5)
    if #v3 == 0 then
        error("Profiler must be initialized with at least one Reporter");
    end;
    local v6 = 0;
    return {
        start = function(v7)
            for _, v9 in v3, nil, nil do
                v9.start(v7);
            end;
            v6 = v6 + 1;
        end, 
        stop = function()
            if v6 == 0 then
                error("Profiler.stop() called without a corresponding Profiler.start()");
            end;
            for _, v11 in v3, nil, nil do
                v11.stop();
            end;
            v6 = v6 - 1;
        end, 
        finish = function()
            if v6 > 0 then
                error("Profiling finished without closing all Profiler.start() sections with a Profiler.stop() call");
            end;
            for _, v13 in v3, nil, nil do
                local v14, v15 = v13.finish();
                for v16, v17 in v15, nil, nil do
                    v4(if not v5 then v14[v16] else ("%*_%*"):format(v5, v14[v16]), v17);
                end;
            end;
        end
    };
end;
return v0;
