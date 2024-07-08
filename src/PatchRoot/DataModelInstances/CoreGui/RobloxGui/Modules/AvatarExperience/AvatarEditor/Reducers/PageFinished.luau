local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Rodux);
local v3 = require(l_CorePackages_0.Cryo);
return v2.createReducer({}, {
    [require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetPageFinished).name] = function(v4, v5)
        return v3.Dictionary.join(v4, {
            [v5.assetTypeId] = v5.isFinished
        });
    end
});
