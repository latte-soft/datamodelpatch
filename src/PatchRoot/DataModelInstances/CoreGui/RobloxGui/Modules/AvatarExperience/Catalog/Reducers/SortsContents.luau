local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Rodux);
local v4 = require(l_CorePackages_0.Cryo);
return v3.createReducer({
    DataStatus = {}
}, {
    [require(l_Modules_0.AvatarExperience.Catalog.Actions.CatalogDataReceived).name] = function(v5, v6)
        local v7 = v5[v6.categoryIndex] or {};
        local v8 = {};
        for _, v10 in v6.sortResults.items, nil, nil do
            table.insert(v8, v10);
        end;
        return v4.Dictionary.join(v5, {
            [v6.categoryIndex] = v4.Dictionary.join(v7, {
                [v6.subcategoryIndex] = {
                    entries = v8, 
                    nextPageCursor = v6.sortResults.nextPageCursor, 
                    hasMoreRows = v6.sortResults.nextPageCursor ~= nil
                }
            })
        });
    end, 
    [require(l_Modules_0.AvatarExperience.Catalog.Actions.CatalogAppendSortData).name] = function(v11, v12)
        local v13 = v11[v12.categoryIndex] or {};
        local v14 = (v13[v12.subcategoryIndex] or {}).entries or {};
        local v15 = {};
        for _, v17 in v12.sortResults.items, nil, nil do
            table.insert(v15, v17);
        end;
        return v4.Dictionary.join(v11, {
            [v12.categoryIndex] = v4.Dictionary.join(v13, {
                [v12.subcategoryIndex] = {
                    entries = v4.List.join(v14, v15), 
                    nextPageCursor = v12.sortResults.nextPageCursor, 
                    hasMoreRows = v12.sortResults.nextPageCursor ~= nil
                }
            })
        });
    end, 
    [require(l_Modules_0.AvatarExperience.Catalog.Actions.SetCatalogSortDataStatus).name] = function(v18, v19)
        return v4.Dictionary.join(v18, {
            DataStatus = v4.Dictionary.join(v18.DataStatus, {
                [v19.categoryIndex] = v4.Dictionary.join(v18.DataStatus[v19.categoryIndex] or {}, {
                    [v19.subcategoryIndex] = v19.status
                })
            })
        });
    end
});
