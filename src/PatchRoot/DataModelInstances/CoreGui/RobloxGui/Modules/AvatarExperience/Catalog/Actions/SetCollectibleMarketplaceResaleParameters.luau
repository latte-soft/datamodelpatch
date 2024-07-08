local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v3 = require(l_CorePackages_0.Rodux);
local v4 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXResalePriceFloor);
return v3.makeActionCreator(script.Name, function(v5, v6, v7)
    v2.isType(v5, "string", "SetCollectibleMarketplaceResaleParameters action expects collectibleItemId to be a string");
    v2.isType(v6, "table", "SetCollectibleMarketplaceResaleParameters action expects resaleParametersInfo to be a table");
    return {
        collectibleItemId = v5, 
        resaleParametersInfo = v6, 
        itemSubTypeNameString = if not v4() then nil else v7
    };
end);
