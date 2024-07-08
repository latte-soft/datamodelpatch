local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Rodux);
local v3 = require(l_CorePackages_0.Cryo);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
return v2.createReducer({}, {
    [require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetOutfitOrAsset).name] = function(v5, v6)
        local v7 = v5 or {};
        local l_itemType_0 = v6.itemType;
        local v9 = {};
        for _, v11 in v6.ids, nil, nil do
            v9[v11] = l_itemType_0;
        end;
        return v3.Dictionary.join(v7, v9);
    end
});
