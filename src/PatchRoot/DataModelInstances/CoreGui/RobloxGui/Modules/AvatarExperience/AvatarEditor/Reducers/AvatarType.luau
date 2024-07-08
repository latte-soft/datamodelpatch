local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(game:GetService("CorePackages").Rodux);
local v2 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.ReceivedAvatarData);
local v3 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetAvatarType);
local v4 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
return v1.createReducer(v4.AvatarType.R15, {
    [v2.name] = function(v5, v6)
        local l_playerAvatarType_0 = v6.avatarData.playerAvatarType;
        if l_playerAvatarType_0 and v4.AvatarType[l_playerAvatarType_0] == l_playerAvatarType_0 then
            return l_playerAvatarType_0;
        else
            return v5;
        end;
    end, 
    [v3.name] = function(_, v9)
        return v9.avatarType;
    end
});
