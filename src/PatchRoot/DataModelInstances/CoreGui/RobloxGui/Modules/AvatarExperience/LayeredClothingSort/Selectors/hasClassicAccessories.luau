local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CoreGui_0.RobloxGui.Modules.AvatarExperience.Common.Constants);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v5 = {
    [v3.AssetTypeIdStrings.TShirt] = true, 
    [v3.AssetTypeIdStrings.Pants] = true, 
    [v3.AssetTypeIdStrings.Shirt] = true
};
local v9 = l_memoize_0(function(v6)
    for v7, v8 in v6, nil, nil do
        if not (v2.isEmpty(v8) or not v5[v7]) then
            return true;
        end;
    end;
    return false;
end);
return function(v10)
    local l_EquippedAssets_0 = v10.AvatarExperience.AvatarEditor.Character.EquippedAssets;
    if l_EquippedAssets_0 then
        return v9(l_EquippedAssets_0);
    else
        return false;
    end;
end;
