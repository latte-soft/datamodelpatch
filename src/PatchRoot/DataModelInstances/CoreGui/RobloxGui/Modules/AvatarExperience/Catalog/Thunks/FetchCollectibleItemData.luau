local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v3 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local v4 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetCollectibleItemInfo);
return function(v5, v6)
    return l_PerformFetch_0.Single(v6, function(v7)
        return v3.FetchCollectibleItemDetails(v5, {
            v6
        }):andThen(function(v8)
            local v9 = if not v8 then nil else v8.responseBody;
            local v10 = if not v9 then nil else v9[1];
            if v10 == nil then
                return ;
            else
                v7:dispatch(v4(v6, v10));
                return ;
            end;
        end);
    end);
end;
