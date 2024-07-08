local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Cryo);
return require(l_CorePackages_0.Rodux).createReducer({}, {
    [require(l_Modules_0.AvatarExperience.Catalog.Actions.AppendSearchInCatalog).name] = function(v4, v5)
        local v6 = v4[v5.searchUuid];
        if v6 then
            v5.searchInCatalog.items = v3.List.join(v6.items, v5.searchInCatalog.items);
            return v3.Dictionary.join(v4, {
                [v5.searchUuid] = v5.searchInCatalog
            });
        else
            return v3.Dictionary.join(v4, {
                [v5.searchUuid] = v5.searchInCatalog
            });
        end;
    end, 
    [require(l_Modules_0.AvatarExperience.Catalog.Actions.RemoveSearchInCatalog).name] = function(v7, v8)
        return v3.Dictionary.join(v7, {
            [v8.searchUuid] = v3.None
        });
    end, 
    [require(l_Modules_0.AvatarExperience.Catalog.Actions.SetSearchInCatalog).name] = function(v9, v10)
        return v3.Dictionary.join(v9, {
            [v10.searchUuid] = v10.searchInCatalog
        });
    end
});
