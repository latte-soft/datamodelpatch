local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Rodux);
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetCollectibleResellersInstances);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Actions.AppendCollectibleResellersInstances);
local v6 = require(l_Modules_0.AvatarExperience.Common.Models.CollectibleInstance);
return v2.createReducer({}, {
    [v4.name] = function(v7, v8)
        local l_collectibleItemId_0 = v8.collectibleItemId;
        local v10 = {};
        local v11 = {};
        for _, v13 in v8.collectibleItemInstances, nil, nil do
            local v14 = v6.fromGetCollectibleResellers(v13, l_collectibleItemId_0);
            v10[v14.collectibleInstanceId] = v14;
            table.insert(v11, v14.collectibleInstanceId);
        end;
        return v3.Dictionary.join(v7, {
            [l_collectibleItemId_0] = {
                Instances = v10, 
                InstanceIdsList = v11
            }
        });
    end, 
    [v5.name] = function(v15, v16)
        local l_collectibleItemId_1 = v16.collectibleItemId;
        local l_collectibleItemInstances_0 = v16.collectibleItemInstances;
        local v19 = {};
        local v20 = {};
        for _, v22 in l_collectibleItemInstances_0, nil, nil do
            local v23 = v6.fromGetCollectibleResellers(v22, l_collectibleItemId_1);
            v19[v23.collectibleInstanceId] = v23;
            table.insert(v20, v23.collectibleInstanceId);
        end;
        local v24 = v15[l_collectibleItemId_1];
        if not v24 then
            return v3.Dictionary.join(v15, {
                [l_collectibleItemId_1] = {
                    Instances = v19, 
                    InstanceIdsList = v20
                }
            });
        else
            return v3.Dictionary.join(v15, {
                [l_collectibleItemId_1] = {
                    Instances = v3.Dictionary.join(v24.Instances, v19), 
                    InstanceIdsList = v3.List.join(v24.InstanceIdsList, v20)
                }
            });
        end;
    end
});
