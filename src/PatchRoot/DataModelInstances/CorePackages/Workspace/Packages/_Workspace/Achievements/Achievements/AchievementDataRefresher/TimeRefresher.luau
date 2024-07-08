local l_script_FirstAncestor_0 = script:FindFirstAncestor("Achievements");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.LuauPolyfill);
local l_clearInterval_0 = v2.clearInterval;
local l_setInterval_0 = v2.setInterval;
local v5 = require(l_script_FirstAncestor_0.Logger);
local _ = require(l_Parent_0.Signal);
return {
    init = function(v7, v8, v9)
        v7.fireDataChanged = v8;
        v7.intervalInSec = v9;
    end, 
    start = function(v10)
        v10.timerId = l_setInterval_0(v10.check, v10.intervalInSec * 1000, v10);
        v10.startTime = os.time();
    end, 
    check = function(v11)
        if not v11.startTime then
            v5:error("No recorded start time");
            return ;
        else
            v11.fireDataChanged(os.time() - v11.startTime);
            return ;
        end;
    end, 
    stop = function(v12)
        if v12.timerId then
            l_clearInterval_0(v12.timerId);
            v12.startTime = nil;
        end;
    end
};
