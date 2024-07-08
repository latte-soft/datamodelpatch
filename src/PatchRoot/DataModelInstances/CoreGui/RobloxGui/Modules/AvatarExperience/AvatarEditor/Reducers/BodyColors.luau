local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(game:GetService("CorePackages").Rodux);
local v2 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetBodyColors);
local v3 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.ReceivedAvatarData);
local v4 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
return v1.createReducer({
    headColorId = v4.DefaultBodyColorBrickId, 
    leftArmColorId = v4.DefaultBodyColorBrickId, 
    leftLegColorId = v4.DefaultBodyColorBrickId, 
    rightArmColorId = v4.DefaultBodyColorBrickId, 
    rightLegColorId = v4.DefaultBodyColorBrickId, 
    torsoColorId = v4.DefaultBodyColorBrickId
}, {
    [v2.name] = function(_, v7)
        return v7.bodyColors;
    end, 
    [v3.name] = function(_, v9)
        return v9.avatarData.bodyColors;
    end
});
