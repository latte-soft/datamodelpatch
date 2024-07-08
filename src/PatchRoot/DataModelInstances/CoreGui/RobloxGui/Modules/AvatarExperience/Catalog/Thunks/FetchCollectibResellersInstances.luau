local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Promise);
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v5 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetCollectibleResellersInstances);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Actions.AppendCollectibleResellersInstances);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetResellerCursor);
local function _(v10)
    return v5.GetResellersKey .. tostring(v10);
end;
return function(v12, v13, v14, v15)
    v3.isType(v13, "string", "FetchCollectibResellersInstances thunk expects collectibleItemId");
    return l_PerformFetch_0.Single(v5.GetResellersKey .. tostring(v13), function(v16)
        return v6.GetCollectibleResellers(v12, v13, v14, v15):andThen(function(v17)
            local v18 = (v17 and v17.responseBody) and v17.responseBody.data;
            if not v18 then
                return v2.reject();
            else
                local v19;
                v19 = v17.responseBody.nextPageCursor and (v19 == "" and nil);
                v16:dispatch(v9(v19));
                if not v14 then
                    v16:dispatch(v7(v13, v18));
                else
                    v16:dispatch(v8(v13, v18));
                end;
                return v2.resolve();
            end;
        end);
    end);
end;
