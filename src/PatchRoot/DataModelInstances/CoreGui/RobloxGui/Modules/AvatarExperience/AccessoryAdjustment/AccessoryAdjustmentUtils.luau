local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Cryo);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v5 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v10 = {
    getEquippedAccessoriesMemoized = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize(function(v6)
        local v7 = {};
        for _, v9 in v4.AccessoryAssetTypes, nil, nil do
            v7 = v2.List.join(v7, v5.getEquippedAssetIdsForType(v6, v9));
        end;
        return v7;
    end)
};
v10.getEquippedAccessories = function(v11)
    return v10.getEquippedAccessoriesMemoized(v11.AvatarExperience.AvatarEditor.Character.EquippedAssets);
end;
return v10;
