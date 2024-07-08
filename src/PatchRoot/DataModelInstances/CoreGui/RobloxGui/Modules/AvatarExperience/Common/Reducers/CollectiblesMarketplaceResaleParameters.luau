local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Rodux);
local v4 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetCollectibleMarketplaceResaleParameters);
local v6 = require(l_Modules_0.AvatarExperience.Common.Models.CollectibleMarketplaceResaleParametersInfo);
local v7 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXResalePriceFloor);
return v3.createReducer({}, {
    [v5.name] = function(v8, v9)
        v4.isType(v9.collectibleItemId, "string", "collectibleItemId must be a string.");
        v4.isType(v9.resaleParametersInfo, "table", "resaleParametersInfo must be a table.");
        local l_collectibleItemId_0 = v9.collectibleItemId;
        local v11 = v6.fromGetCollectibleMarketplaceResaleParameters(v9.resaleParametersInfo, if not v7() then nil else v9.itemSubTypeNameString);
        local v12 = v8[l_collectibleItemId_0];
        if not v12 then
            return (v2.Dictionary.join(v8, {
                [l_collectibleItemId_0] = v11
            }));
        else
            return (v2.Dictionary.join(v8, {
                [l_collectibleItemId_0] = v2.Dictionary.join(v12, v11)
            }));
        end;
    end
});
