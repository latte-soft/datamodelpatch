local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Promise);
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v5 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetAvailableToSellAssetsFromFetchSellData);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetCurrentlySellingAssetsFromFetchSellData);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetUserAssetsFromSellPageAndResellers);
local function _(v10)
    return v5.GetSellPageDataKey .. tostring(v10);
end;
return function(v12, v13, v14)
    v3.isType(v13, "string", "FetchSellPageData thunk expects itemId to be a string");
    v3.isType(v14, "string", "FetchSellPageData thunk expects userId to be a string");
    return l_PerformFetch_0.Single(v5.GetSellPageDataKey .. tostring(v13), function(v15)
        return v6.FetchSellPageData(v12, v13, v14):andThen(function(v16)
            local v17 = (v16 and v16.responseBody) and v16.responseBody.data;
            if not v17 then
                return v2.reject();
            else
                local v18 = {};
                local v19 = {};
                for _, v21 in v17, nil, nil do
                    local v22 = tostring(v21.userAssetId);
                    if not v21.price then
                        table.insert(v18, v22);
                    else
                        table.insert(v19, v22);
                    end;
                end;
                v15:dispatch(v9(v17));
                v15:dispatch(v7(v13, v18));
                v15:dispatch(v8(v13, v19));
                return v2.resolve();
            end;
        end);
    end);
end;
