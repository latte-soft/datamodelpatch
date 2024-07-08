local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Promise);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetMarketplaceFee);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local function _()
    return v5.GetMarketplaceFeeKey;
end;
return function(v9)
    return l_PerformFetch_0.Single(v5.GetMarketplaceFeeKey, function(v10)
        return v6.GetMarketplaceFee(v9):andThen(function(v11)
            local v12 = v11 and v11.responseBody;
            if not v12 then
                return v2.reject();
            else
                v10:dispatch(v4(v12));
                return v2.resolve();
            end;
        end);
    end);
end;
