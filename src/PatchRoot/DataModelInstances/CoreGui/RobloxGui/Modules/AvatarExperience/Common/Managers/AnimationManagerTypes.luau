local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.CategoryTypes);
local _ = require(l_CorePackages_0.Thumbnailing);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
return {
    AnimationTrackWithConnectionsTypes = {
        ToolHold = "ToolHold", 
        LookAround = "LookAround", 
        Mood = "Mood", 
        MainBody = "MainBody", 
        CameraStream = "CameraStream"
    }
};
