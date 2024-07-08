local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
return function(v3, v4)
    if v4 then
        assert(v4, "searchUuid is non-nil. Silence type checker.");
        local v5 = v3.AvatarExperience.AvatarEditor.UserInventoryRecommendationsFetchStatus[v4];
        if v5 == nil then
            v5 = v1.NotStarted;
        end;
        return v5;
    else
        return v1.NotStarted;
    end;
end;
