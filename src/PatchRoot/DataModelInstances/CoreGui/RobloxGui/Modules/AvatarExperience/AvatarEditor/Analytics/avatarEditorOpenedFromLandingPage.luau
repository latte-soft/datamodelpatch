local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Constants);
return function(v1, v2)
    v1:setRBXEventStream(v2, "avatarEditorOpenedFromLandingPage", {
        feature = v0.AnalyticsTag
    });
end;
