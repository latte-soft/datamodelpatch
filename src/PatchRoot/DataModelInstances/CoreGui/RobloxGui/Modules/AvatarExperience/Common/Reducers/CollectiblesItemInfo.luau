local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v3 = require(l_CorePackages_0.Rodux);
local v4 = require(l_CorePackages_0.Cryo);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetCollectibleItemInfo);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetCollectibleResellersInstances);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetCollectibleResaleData);
local v8 = require(l_Modules_0.AvatarExperience.Common.Models.CollectibleInfo);
return v3.createReducer({}, {
    [v5.name] = function(v9, v10)
        v2.isType(v10.collectibleItemId, "string", "collectibleItemId must be a string.");
        v2.isType(v10.collectibleItemData, "table", "collectibleItemData must be a table.");
        local l_collectibleItemId_0 = v10.collectibleItemId;
        local v12 = v8.fromGetCollectibleItemData(v10.collectibleItemData);
        local v13 = v9[l_collectibleItemId_0];
        if not v13 then
            return v4.Dictionary.join(v9, {
                [l_collectibleItemId_0] = v12
            });
        else
            return v4.Dictionary.join(v9, {
                [l_collectibleItemId_0] = v4.Dictionary.join(v13, v12)
            });
        end;
    end, 
    [v6.name] = function(v14, v15)
        v2.isType(v15.collectibleItemId, "string", "collectibleItemId must be a string.");
        v2.isType(v15.collectibleItemInstances, "table", "collectibleItemData must be a table.");
        local l_collectibleItemId_1 = v15.collectibleItemId;
        local v17 = v8.fromGetResellers(v15.collectibleItemInstances);
        local v18 = v14[l_collectibleItemId_1];
        if not v18 then
            return v4.Dictionary.join(v14, {
                [l_collectibleItemId_1] = v17
            });
        else
            return v4.Dictionary.join(v14, {
                [l_collectibleItemId_1] = v4.Dictionary.join(v18, v17)
            });
        end;
    end, 
    [v7.name] = function(v19, v20)
        v2.isType(v20.collectibleItemId, "string", "collectibleItemId must be a string.");
        v2.isType(v20.resaleData, "table", "resaleData must be a table.");
        local l_collectibleItemId_2 = v20.collectibleItemId;
        local v22 = v8.fromGetResaleData(v20.resaleData);
        local v23 = v19[l_collectibleItemId_2];
        if not v23 then
            return v4.Dictionary.join(v19, {
                [l_collectibleItemId_2] = v22
            });
        else
            return v4.Dictionary.join(v19, {
                [l_collectibleItemId_2] = v4.Dictionary.join(v23, v22)
            });
        end;
    end
});
