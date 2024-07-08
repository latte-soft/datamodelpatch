local v0 = require(script.Parent.Parent.Parent.Parent.Parent.LuauPolyfill);
local l_Array_0 = v0.Array;
local l_Map_0 = v0.Map;
local v3 = {};
local _ = require(script.Parent.Parent.Parent.types);
local _ = require(script.Parent.types);
local v6 = l_Map_0.new();
v3.getChartData = function(v7)
    local l_profilerStore_0 = v7.profilerStore;
    local l_rootID_0 = v7.rootID;
    if not v6:has(l_rootID_0) then
        local v10 = l_profilerStore_0:getDataForRoot(l_rootID_0);
        if v10 == nil then
            error(string.format("Could not find profiling data for root \"%s\"", (tostring(l_rootID_0))));
        end;
        local l_commitData_0 = v10.commitData;
        local l_interactions_0 = v10.interactions;
        local v13 = if #l_commitData_0 > 0 then l_commitData_0[#l_commitData_0].timestamp else 0;
        local v14 = 0;
        l_Array_0.forEach(l_commitData_0, function(v15)
            v14 = math.max(v14, v15.duration);
        end);
        local v16 = {
            interactions = l_Array_0.from(l_interactions_0:values()), 
            lastInteractionTime = v13, 
            maxCommitDuration = v14
        };
        v6:set(l_rootID_0, v16);
        return v16;
    else
        return (v6:get(l_rootID_0));
    end;
end;
v3.invalidateChartData = function()
    return v6:clear();
end;
return v3;
