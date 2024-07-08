local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v4 = require(l_CorePackages_0.Packages.Dash);
local v5 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetAssetInfoFromSortResults);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetBundleInfoFromSortResults);
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetSponsoredItems);
return function(v11, v12, v13)
    return l_PerformFetch_0.Single(v7.GetSponsoredItemsKey(v12, v13), function(v14)
        return v6.FetchSponsoredItems(v11, v12, v13):andThen(function(v15)
            local v16 = v15.responseBody.data or {};
            v14:dispatch(v10(v12, v16));
            return (v6.FetchItemDetails(v11, (v4.map(v16, function(v17)
                return {
                    id = v17.id, 
                    itemType = v17.itemType
                };
            end))));
        end):andThen(function(v18)
            local l_responseBody_0 = v18.responseBody;
            l_responseBody_0.data = l_responseBody_0.data or {};
            local v20 = {};
            local v21 = {};
            for _, v23 in l_responseBody_0.data, nil, nil do
                if v23.itemType == v5.ItemType.Asset then
                    table.insert(v20, v23);
                elseif v23.itemType == v5.ItemType.Bundle then
                    table.insert(v21, v23);
                end;
            end;
            if #v20 > 0 then
                v14:dispatch(v8(v20));
            end;
            if #v21 > 0 then
                v14:dispatch(v9(v21));
            end;
            return v2.resolve();
        end);
    end);
end;
