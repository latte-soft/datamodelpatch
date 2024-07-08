local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Rodux);
local v2 = require(l_CorePackages_0.Cryo);
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Actions.SetCollectibleResellableInstances);
local v5 = require(l_Parent_0.Models.CollectibleInstance);
return v1.createReducer({}, {
    [v4.name] = function(v6, v7)
        local l_collectibleItemId_0 = v7.collectibleItemId;
        local v9 = {};
        for _, v11 in v7.collectibleItemInstances, nil, nil do
            local v12 = v5.fromGetCollectibleItemInstances(v11);
            v9[v12.collectibleInstanceId] = v12;
        end;
        return v2.Dictionary.join(v6, {
            [l_collectibleItemId_0] = v9
        });
    end
});
