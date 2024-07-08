local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Promise);
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v5 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetCollectibleResaleData);
local function _(v8)
    return v5.FetchCollectibleResaleDataKey .. tostring(v8);
end;
return function(v10, v11)
    v3.isType(v11, "string", "FetchCollectibleResaleData thunk expects collectibleItemId");
    return l_PerformFetch_0.Single(v5.FetchCollectibleResaleDataKey .. tostring(v11), function(v12)
        return v6.FetchCollectibleResaleData(v10, v11):andThen(function(v13)
            local v14 = v13 and v13.responseBody;
            if not v14 then
                return v2.reject();
            else
                v12:dispatch(v7(v11, v14));
                return v2.resolve();
            end;
        end);
    end);
end;
