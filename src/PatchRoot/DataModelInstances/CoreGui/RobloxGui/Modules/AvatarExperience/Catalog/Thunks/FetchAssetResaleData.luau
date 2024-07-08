local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Promise);
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v5 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetAssetResaleData);
local function _(v8)
    return v5.GetAssetResalesDataKey .. tostring(v8);
end;
return function(v10, v11)
    return function(v12)
        v3.isType(v11, "string", "FetchAssetResaleData thunk expects assetId to be a string");
        local v13 = v12:getState().AvatarExperience.Common.AssetInfos[v11];
        if not v13 or not v13.receivedFromResaleData then
            return l_PerformFetch_0.Single(v5.GetAssetResalesDataKey .. tostring(v11), function(v14)
                return v6.FetchAssetResaleData(v10, v11):andThen(function(v15)
                    local v16 = v15 and v15.responseBody;
                    if not v16 then
                        return v2.reject();
                    else
                        v14:dispatch(v7(v11, v16));
                        return v2.resolve();
                    end;
                end);
            end)(v12);
        else
            return v2.resolve("We already have the asset resale data");
        end;
    end;
end;
