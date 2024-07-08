local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(script.Parent.Parent.MockId);
local l_PlayabilityStatusEnum_0 = require(l_CorePackages_0.Workspace.Packages.PlayabilityRodux).Enums.PlayabilityStatusEnum;
return {
    mock = function()
        return {
            universeId = v1(), 
            name = "", 
            rootPlaceId = v1(), 
            isPlayable = true, 
            playabilityStatus = l_PlayabilityStatusEnum_0.Playable
        };
    end, 
    fromGetPlayabilityStatus = function(v3)
        return {
            universeId = tostring(v3.universeId), 
            isPlayable = v3.isPlayable, 
            playabilityStatus = v3.playabilityStatus
        };
    end, 
    fromGetExperienceInfo = function(v4)
        return {
            universeId = tostring(v4.id), 
            rootPlaceId = tostring(v4.rootPlaceId), 
            name = v4.name
        };
    end
};
