local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetCollectibleMarketplaceResaleParameters);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local v8 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXResalePriceFloor);
local function _(v9)
    return v6.GetCollectibleMarketplaceResaleParametersKey .. tostring(v9);
end;
return function(v11, v12, v13)
    return l_PerformFetch_0.Single(v6.GetCollectibleMarketplaceResaleParametersKey .. tostring(v12), function(v14)
        return v7.GetCollectibleMarketplaceResaleParameters(v11, v12):andThen(function(v15)
            local v16 = v15 and v15.responseBody;
            if not v16 then
                return v2.reject();
            else
                v14:dispatch(v5(v12, v16, if not v8() then nil else v13));
                return v2.resolve();
            end;
        end);
    end);
end;
