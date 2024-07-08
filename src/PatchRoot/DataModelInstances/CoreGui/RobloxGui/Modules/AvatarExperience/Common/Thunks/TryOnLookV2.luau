local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Logging);
local v3 = require(l_Modules_0.LuaApp.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local v6 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v9 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
local v10 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v11 = require(l_Modules_0.AvatarExperience.Common.Actions.AddLookDetails);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetTryOnManagerPeekViewState);
local v13 = require(l_Modules_0.AvatarExperience.Common.Actions.TryOnLooksOutfit);
local v14 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v15 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateWithLock);
local v16 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local function _(v18)
    return v6.FetchLookDetailInfoKey .. v18;
end;
local function v22(v20)
    local v21 = false;
    if v20.id ~= nil then
        v21 = v20.assetType ~= nil;
    end;
    assert(v21, "Asset is missing required fields");
    return {
        itemId = tostring(v20.id), 
        itemType = v9.ContentType.Asset, 
        itemSubType = tostring(v20.assetType), 
        tryOnItemOrder = v20.tryOnItemOrder
    };
end;
local function v28(v23)
    local v24 = false;
    if v23.id ~= nil then
        v24 = v23.bundleType ~= nil;
    end;
    assert(v24, "Bundle is missing required fields");
    local v25 = 0;
    v24 = {};
    for v26, v27 in v23.assetsInBundle, nil, nil do
        if v27.isIncluded then
            v27.tryOnItemOrder = v26;
            v25 = v25 + 1;
            table.insert(v24, (v22(v27)));
        end;
    end;
    return {
        itemId = v23.id, 
        itemType = v9.ContentType.Bundle, 
        itemSubType = tostring(v23.bundleType), 
        items = v24, 
        numberOfAssetsIncluded = if v25 > 0 then v25 else nil, 
        tryOnItemOrder = v23.tryOnItemOrder
    };
end;
return function(v29, v30, v31, v32)
    return function(v33)
        return l_PerformFetch_0.Single(v6.FetchLookDetailInfoKey .. v32, function(v34)
            return v7.GetLookDetailsV2(v29, v32):andThen(function(v35)
                local l_look_0 = v35.responseBody.look;
                if not l_look_0 then
                    v2.warn("Unepectedly received an empty response from Look Details V2");
                    v34:dispatch(v14({
                        isLocalized = false, 
                        toastType = v10.NetworkingError, 
                        toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong"
                    }));
                    return ;
                else
                    local v37 = {};
                    local v38 = {};
                    for v39, v40 in l_look_0.items, nil, nil do
                        v40.id = tostring(v40.id);
                        v40.tryOnItemOrder = v39;
                        if v40.itemType == v9.ContentType.Asset then
                            table.insert(v37, v40);
                        elseif v40.itemType == v9.ContentType.Bundle then
                            table.insert(v38, v40);
                        else
                            warn("TryOnLookV2 - Unknown item type: " .. v40.itemType);
                        end;
                    end;
                    v34:dispatch(v11(v32, l_look_0.totalPrice, nil, v37, v38, l_look_0.lookType, l_look_0.totalValue));
                    local v41 = {};
                    for _, v43 in v37, nil, nil do
                        table.insert(v41, (v22(v43)));
                    end;
                    local v44 = {};
                    for _, v46 in v38, nil, nil do
                        table.insert(v44, (v28(v46)));
                    end;
                    v34:dispatch(v12(l_PeekViewState_0.SuperBrief));
                    v34:dispatch(v13({
                        assetItemIdTypeAndSubtype = v41, 
                        bundleItemIdTypeAndSubtype = v44, 
                        lookId = v32, 
                        analyticsInfo = v31, 
                        lookType = l_look_0.lookType
                    }));
                    if v30 ~= nil then
                        v34:dispatch(v15(function()
                            v17.closeFiltersAndItemDetails(v30);
                            v30.navigate(v16.TryOnManager);
                        end));
                    end;
                    return v3.resolve();
                end;
            end);
        end)(v33);
    end;
end;
