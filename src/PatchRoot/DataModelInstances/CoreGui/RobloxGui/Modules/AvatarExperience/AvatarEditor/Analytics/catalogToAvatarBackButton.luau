local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Constants);
return function(v1, v2)
    v1:setRBXEventStream(v2, "catalogToAvatarBackButton", {
        feature = v0.AnalyticsTag
    });
end;
