local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v3 = require(l_Modules_0.AvatarExperience.Common.Constants);
return function(v4, v5, v6, v7, v8)
    v2.isType(v5, "string", "equippedEmote event expects userId to be a string");
    v2.isType(v6, "string", "equippedEmote event expects browserTrackerId to be a string");
    v2.isType(v7, "string", "equippedEmote event expects assetId to be a string");
    v2.isType(v8, "number", "equippedEmote event expects slot to be a string");
    v4:setRBXEventStream("avatarEditor", "equippedEmote", {
        feature = v3.AnalyticsTag, 
        uid = v5, 
        btid = v6, 
        slot = v8, 
        assetID = v7
    });
end;
