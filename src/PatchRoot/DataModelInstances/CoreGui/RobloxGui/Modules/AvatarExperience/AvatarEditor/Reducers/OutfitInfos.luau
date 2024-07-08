local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Rodux);
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetOutfitInfo);
local v5 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.RevokeOutfit);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.UpdateOutfit);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.OutfitRenamed);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
return v2.createReducer({}, {
    [v4.name] = function(v9, v10)
        return v3.Dictionary.join(v9, {
            [tostring(v10.outfit.outfitId)] = v10.outfit
        });
    end, 
    [v5.name] = function(v11, v12)
        return v3.Dictionary.join(v11, {
            [tostring(v12.outfitId)] = v3.None
        });
    end, 
    [v6.name] = function(v13, v14)
        return v3.Dictionary.join(v13, {
            [tostring(v14.outfitId)] = v3.None
        });
    end, 
    [v7.name] = function(v15, v16)
        local v17 = v15[v16.outfitId];
        if v17 then
            return v3.Dictionary.join(v15, {
                [v16.outfitId] = v3.Dictionary.join(v17, {
                    name = v16.name
                })
            });
        else
            return v15;
        end;
    end
});
