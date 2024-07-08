local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Promise);
local v4 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v5 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetUserInventoryRecommendationsFetchStatus);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Selectors.selectUserInventoryRecommendationsFetchStatus);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.AppendUserInventoryRecommendations);
local v8 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetAssetInfoFromAvatarEditorRecommendedItemsV2);
local v9 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetBundleInfoFromAvatarEditorRecommendedItemsV2);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v11 = require(l_Modules_0.AvatarExperience.Catalog.Models.SortResults);
local v12 = require(l_Modules_0.AvatarExperience.AvatarEditor.Http.WebApi);
return function(v13, v14, v15, v16)
    return function(v17)
        if v6(v17:getState(), v14) == v4.Fetching then
            return v3.resolve("Debounced fetching user-inventory recommendations.");
        else
            v17:dispatch(v5(v14, v4.Fetching));
            return v12.GetRecommendedUserInventoryItems(v13, v16):andThen(function(v18)
                local l_responseBody_0 = v18.responseBody;
                local v20 = if not l_responseBody_0 then {} else l_responseBody_0.data;
                if next(v20) ~= nil then
                    v17:dispatch(v7(v14, v11.fromSearchItemsDetails(l_responseBody_0), v15));
                    if not v16.assetTypeId then
                        v17:dispatch(v9(v20));
                    else
                        v17:dispatch(v8(v20, (tostring(v16.assetTypeId))));
                    end;
                end;
                v17:dispatch(v5(v14, v4.Done));
                return v3.resolve();
            end, function(v21)
                v17:dispatch(v5(v14, v4.Failed));
                return v3.reject(v21);
            end);
        end;
    end;
end;
