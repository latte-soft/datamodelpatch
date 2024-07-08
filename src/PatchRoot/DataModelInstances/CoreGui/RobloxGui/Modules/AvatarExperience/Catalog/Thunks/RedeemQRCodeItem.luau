local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Logging);
local v3 = require(l_CorePackages_0.Promise);
local v4 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo);
local v7 = require(l_Modules_0.AvatarExperience.Common.Actions.SetAssetOwned);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v9 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local v10 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v11 = require(l_Modules_0.AvatarExperience.Common.Selectors.DEPRECATED_ItemData);
local v12 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v13 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectItemInfo);
local v14 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixItemTypeHandling);
local v15 = {
    HttpError = Enum.HttpError.OK
};
local v16 = {
    toastMessage = "Feature.Catalog.Label.Redeemed", 
    isLocalized = false, 
    toastType = v12.SuccessConfirmation
};
local v17 = {
    toastMessage = "Feature.Catalog.Label.NotAvailable", 
    isLocalized = false, 
    toastType = v12.InformationMessage
};
local v18 = {
    toastMessage = "Feature.Catalog.Label.AlreadyOwned", 
    isLocalized = false, 
    toastType = v12.InformationMessage
};
local function _(v19)
    return v8.RedeemQRCodeItemKey .. tostring(v19);
end;
return function(v21, v22, v23, v24)
    return l_PerformFetch_0.Single(v8.RedeemQRCodeItemKey .. tostring(v23), function(v25)
        return v25:dispatch(v6(v21, v22, v23, v24)):andThen(function()
            local v26 = nil;
            if not v14 then
                local v27 = v11(v25:getState().AvatarExperience.Common, v23, v24);
                v26 = v27 and v27.isOwned;
            else
                local v28 = v13(v25:getState().AvatarExperience, v23, v24);
                v26 = v28 and v28.isOwned;
            end;
            if not v26 then
                return v4.RedeemQRCodeItem(v21, v23):andThen(function(v29)
                    local l_responseBody_0 = v29.responseBody;
                    if type(l_responseBody_0) == "table" and l_responseBody_0.success == true then
                        v25:dispatch(v7(v23, true));
                        v25:dispatch(v10(v16));
                        return v3.resolve();
                    else
                        local l_v15_0 = v15;
                        v2.warn("Response from RedeemQRCodeItem is malformed");
                        v25:dispatch(v9(l_v15_0));
                        return v3.reject(l_v15_0);
                    end;
                end, function(v32)
                    if not (type(v32) == "table") or v32.HttpError == nil then
                        v32 = v15;
                    end;
                    v25:dispatch(v10(v17));
                    return v3.reject(v32);
                end);
            else
                v25:dispatch(v10(v18));
                return v3.resolve();
            end;
        end);
    end);
end;
