local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Rodux);
local v3 = require(l_CorePackages_0.Cryo);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_Modules_0.AvatarExperience.Common.Actions.SetFullView);
local _ = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
return v2.createReducer(require(l_Modules_0.AvatarExperience.Common.Constants).FullViewPageDefaults, {
    [v5.name] = function(v7, v8)
        return v3.Dictionary.join(v7, {
            [v8.avatarScreen] = v8.fullViewStatus
        });
    end
});
