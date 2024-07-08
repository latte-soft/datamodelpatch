local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperienceVoice");
local l_ExperienceService_0 = game:GetService("ExperienceService");
local v2 = require(l_script_FirstAncestor_0.Common.Constants);
local v3 = {};
v3.__index = v3;
v3.new = function()
    local v4 = {
        connections = {}
    };
    setmetatable(v4, v3);
    return v4;
end;
v3.initialize = function(v5)
    table.insert(v5.connections, l_ExperienceService_0.OnCrossExperienceStarted:Connect(function(_, _)
    end));
    table.insert(v5.connections, l_ExperienceService_0.OnCrossExperienceStopped:Connect(function(_, _)
    end));
    v5.isInitialized = true;
end;
v3.join = function(v10, v11)
    if not v10.isInitialized then
        v10:initialize();
    end;
    local l_status_0, l_result_0 = pcall(function()
        l_ExperienceService_0:StartCrossExperience(v2.EXPERIENCE_TYPE_VOICE, {
            placeId = v11.placeId
        });
    end);
    if not l_status_0 then
        warn("Failed to join cross experience voice: ", l_result_0);
    end;
end;
v3.disconnect = function(v14)
    for _, v16 in ipairs(v14.connections) do
        v16:Disconnect();
    end;
    v14.connections = {};
    v14.initialized = false;
end;
v3.default = v3.new();
return v3;
