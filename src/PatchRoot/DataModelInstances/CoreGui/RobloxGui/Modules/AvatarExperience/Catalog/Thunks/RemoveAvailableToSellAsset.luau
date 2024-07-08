local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Promise);
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Actions.UpdateUserAssetPrice);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Actions.AddCurrentlySellingAsset);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Actions.RemoveAvailableToSellAsset);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v11 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v12 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local v13 = require(l_Modules_0.LuaApp.Enum.ToastType);
local function _(v14)
    return v8.RemoveAvailableToSellAssetKey .. tostring(v14);
end;
local v16 = {
    toastMessage = "Feature.Catalog.Label.SellSuccess", 
    isLocalized = false, 
    toastType = v13.SuccessConfirmation
};
return function(v17, v18, v19, v20)
    return function(v21)
        v3.isType(v18, "string", "RemoveAvailableToSellAsset thunk expects assetId to be a string");
        v3.isType(v19, "string", "RemoveAvailableToSellAsset thunk expects userAssetId to be a string");
        v3.isType(v20, "number", "RemoveAvailableToSellAsset thunk expects priceInRobux to be a number");
        return l_PerformFetch_0.Single(v8.RemoveAvailableToSellAssetKey .. tostring(v19), function(v22)
            return v9.RemoveAvailableToSell(v17, v18, v19, v20):andThen(function(_)
                v22:dispatch(v5(v19, v20));
                v22:dispatch(v7(v18, v19));
                v22:dispatch(v6(v18, v19));
                v22:dispatch(v11(v16));
                return v2.resolve();
            end, function(v24)
                v22:dispatch(v12(v24));
                return v2.reject(v24);
            end);
        end)(v21);
    end;
end;
