local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Promise);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_Modules_0.AvatarExperience.Catalog.Actions.UpdateCollectibleResellableInstance);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local _ = require(l_Modules_0.AvatarExperience.Common.Models.CollectibleInstance);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v9 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v10 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local v11 = require(l_Modules_0.LuaApp.Enum.ToastType);
local function _(v12)
    return v5.UpdateCollectibleInstanceResaleStateKey .. tostring(v12);
end;
local v14 = {
    toastMessage = "Feature.Catalog.Response.PlacedOnSaleSuccess", 
    isLocalized = false, 
    toastType = v11.SuccessConfirmation
};
local v15 = {
    toastMessage = "Feature.Catalog.Response.TakenOffSaleSuccess", 
    isLocalized = false, 
    toastType = v11.SuccessConfirmation
};
local function _(v16, v17, v18)
    local l_CollectiblesResellableInstances_0 = v16.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances;
    if not l_CollectiblesResellableInstances_0[v17] then
        return nil;
    else
        return l_CollectiblesResellableInstances_0[v17][v18];
    end;
end;
return function(v21, v22, v23, v24, v25)
    return function(v26)
        return l_PerformFetch_0.Single(v5.UpdateCollectibleInstanceResaleStateKey .. tostring(v23), function(v27)
            local v28 = v27:getState();
            local l_LocalUserId_0 = v28.LocalUserId;
            local l_v22_0 = v22;
            local l_v23_0 = v23;
            local l_CollectiblesResellableInstances_1 = v28.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances;
            local v33 = if not l_CollectiblesResellableInstances_1[l_v22_0] then nil else l_CollectiblesResellableInstances_1[l_v22_0][l_v23_0];
            if v33 == nil then
                return v2.reject("Unable to find collectible instance");
            else
                return v7.UpdateCollectibleInstanceResaleState(v21, v22, v23, v33.collectibleProductId, v25, v24, l_LocalUserId_0):andThen(function(_)
                    local v35 = v27:getState();
                    local l_v22_1 = v22;
                    local l_v23_1 = v23;
                    local l_CollectiblesResellableInstances_2 = v35.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances;
                    local v39 = if not l_CollectiblesResellableInstances_2[l_v22_1] then nil else l_CollectiblesResellableInstances_2[l_v22_1][l_v23_1];
                    if v39 then
                        v39.price = v25 or v39.price;
                        v39.saleState = not v24 and "OffSale" or "OnSale";
                        v27:dispatch(v4(v22, v23, v39));
                    end;
                    v27:dispatch(v9(if not v24 then v15 else v14));
                    return v2.resolve();
                end, function(v40)
                    v27:dispatch(v10(v40));
                    return v2.reject(v40);
                end);
            end;
        end)(v26);
    end;
end;
