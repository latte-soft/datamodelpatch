local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Rodux);
local v3 = require(l_CorePackages_0.Cryo);
return v2.createReducer({
    height = 1, 
    width = 1, 
    depth = 1, 
    head = 1, 
    bodyType = 0, 
    proportion = 0
}, {
    [require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetAvatarScales).name] = function(v4, v5)
        return v3.Dictionary.join(v4, v5.scales);
    end, 
    [require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.ReceivedAvatarData).name] = function(v6, v7)
        if v7.avatarData then
            return v7.avatarData.scales;
        else
            return v6;
        end;
    end
});
