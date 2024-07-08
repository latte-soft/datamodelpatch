local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.flags.getFIntUGCValidationMaxMsPerFrame);
local v3 = require(l_Parent_0.flags.getFFlagUGCValidationShouldYield);
local v4 = v2() / 1000;
return function(v5, v6)
    if not (not v3() or not v6.shouldYield) and v4 <= tick() - v6.lastTickSeconds then
        task.wait();
        v6.lastTickSeconds = tick();
    end;
    return pcall(v5);
end;
