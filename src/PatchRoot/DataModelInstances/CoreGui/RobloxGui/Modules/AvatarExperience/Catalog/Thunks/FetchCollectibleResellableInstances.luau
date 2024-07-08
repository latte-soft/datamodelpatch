local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Promise);
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v5 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetCollectibleResellableInstances);
local function _(v8)
    return v5.FetchCollectibleResellableInstancesKey .. tostring(v8);
end;
return function(v10, v11, v12)
    v3.isType(v11, "string", "FetchCollectibleResellableInstances thunk expects collectibleItemId");
    v3.isType(v12, "string", "FetchCollectibleResellableInstances thunk expects userId");
    return l_PerformFetch_0.Single(v5.FetchCollectibleResellableInstancesKey .. tostring(v11), function(v13)
        return v6.FetchCollectibleResellableInstances(v10, v11, v12):andThen(function(v14)
            local v15 = (v14 and v14.responseBody) and v14.responseBody.itemInstances;
            if not v15 then
                return v2.reject();
            else
                v13:dispatch(v7(v11, v15));
                return v2.resolve();
            end;
        end);
    end);
end;
