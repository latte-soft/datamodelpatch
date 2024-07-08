local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v3 = require(l_Modules_0.AvatarExperience.Common.Constants);
return function(v4, v5, v6)
    v2.isType(v5, "string", "openedEmotesPage event expects userId to be a string");
    v2.isType(v6, "string", "openedEmotesPage event expects browserTrackerId to be a string");
    v4:setRBXEventStream("avatarEditor", "openedEmotesPage", {
        feature = v3.AnalyticsTag, 
        uid = v5, 
        btid = v6
    });
end;
