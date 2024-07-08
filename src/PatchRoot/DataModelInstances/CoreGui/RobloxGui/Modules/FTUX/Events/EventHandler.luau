local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Enums.PlatformEnum);
local v2 = require(l_Parent_0.Events.VR.VRFTUXEventHandler);
local v3 = require(l_Parent_0.Events.Events);
local v4 = {
    [v1.QuestVR] = v2
};
return {
    StartEvents = function(v5, v6, v7)
        local v8 = v4[v5];
        local v9 = v3[v5][v6];
        if v9 then
            for _, v11 in pairs(v9) do
                v8.StartEvent(v11, v7);
            end;
        end;
    end, 
    StopEvents = function(v12, v13)
        local v14 = v4[v12];
        local v15 = v3[v12][v13];
        if v15 then
            for _, v17 in pairs(v15) do
                v14.StopEvent(v17);
            end;
        end;
    end
};
