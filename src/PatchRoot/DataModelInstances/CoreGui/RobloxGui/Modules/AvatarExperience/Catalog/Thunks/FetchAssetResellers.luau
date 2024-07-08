local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Promise);
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v5 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetAssetResellersList);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetAssetLowestPrice);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetUserAssetsFromSellPageAndResellers);
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Actions.AppendAssetResellersList);
local v11 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetResellerCursor);
local v12 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local function _(v13)
    return v5.GetResellersKey .. tostring(v13);
end;
return function(v15, v16, v17, v18, v19)
    v3.isType(v16, "string", "GetResellers thunk expects assetId to be a string");
    return l_PerformFetch_0.Single(v5.GetResellersKey .. tostring(v16), function(v20)
        return v6.FetchAssetResellers(v15, v16, v17, v18):andThen(function(v21)
            local v22 = (v21 and v21.responseBody) and v21.responseBody.data;
            if not v22 then
                v20:dispatch(v12());
                return v2.reject();
            elseif #v22 > 0 then
                v20:dispatch(v11(v21.responseBody.nextPageCursor));
                local v23 = {};
                for _, v25 in v22, nil, nil do
                    table.insert(v23, (tostring(v25.userAssetId)));
                end;
                v20:dispatch(v9(v22));
                if not v17 then
                    v20:dispatch(v7(v16, v23));
                else
                    v20:dispatch(v10(v16, v23));
                end;
                if v19 then
                    v20:dispatch(v8(v16, v22[1].price));
                end;
                return v2.resolve();
            else
                return v2.resolve();
            end;
        end);
    end);
end;
