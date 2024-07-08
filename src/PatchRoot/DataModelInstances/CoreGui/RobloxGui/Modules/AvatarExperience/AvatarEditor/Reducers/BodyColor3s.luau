local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Rodux);
local v3 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetBodyColor3s);
local v4 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.ReceivedAvatarData);
local v5 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v6 = require(l_CorePackages_0.Cryo);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
return v2.createReducer({
    headColor3 = v5.DefaultBodyColor3, 
    leftArmColor3 = v5.DefaultBodyColor3, 
    leftLegColor3 = v5.DefaultBodyColor3, 
    rightArmColor3 = v5.DefaultBodyColor3, 
    rightLegColor3 = v5.DefaultBodyColor3, 
    torsoColor3 = v5.DefaultBodyColor3
}, {
    [v3.name] = function(v8, v9)
        return (v6.Dictionary.join(v8, v9.bodyColor3s));
    end, 
    [v4.name] = function(_, v11)
        return v11.avatarData.bodyColor3s;
    end
});
