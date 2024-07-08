local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Logging);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetTryOnManagerPeekViewState);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v9 = require(l_Modules_0.AvatarExperience.Common.Actions.AddLookDetails);
local v10 = require(l_Modules_0.AvatarExperience.Common.Actions.TryOnLooksOutfit);
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v13 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateWithLock);
local v14 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v15 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v16 = require(l_Modules_0.LuaApp.Promise);
local function _(v17)
    return v6.FetchLookDetailInfoKey .. v17;
end;
return function(v19, v20, v21, v22)
    return function(v23)
        return l_PerformFetch_0.Single(v6.FetchLookDetailInfoKey .. v22, function(v24)
            return v7.GetLookDetails(v19, v22):andThen(function(v25)
                local l_look_0 = v25.responseBody.look;
                if l_look_0 == nil then
                    v2.warn("Unepectedly received an empty response from Look Details");
                    v24:dispatch(v14({
                        isLocalized = false, 
                        toastType = v15.NetworkingError, 
                        toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong"
                    }));
                    return ;
                else
                    v24:dispatch(v9(v22, l_look_0.totalPrice, l_look_0.totalPremiumPrice, l_look_0.items));
                    local v27 = {};
                    for _, v29 in l_look_0.items, nil, nil do
                        table.insert(v27, {
                            itemType = "Asset", 
                            itemSubType = tostring(v29.assetType), 
                            itemId = tostring(v29.id)
                        });
                    end;
                    v24:dispatch(v5(l_PeekViewState_0.SuperBrief));
                    v24:dispatch(v10({
                        assetItemIdTypeAndSubtype = v27, 
                        lookId = v22, 
                        analyticsInfo = v21
                    }));
                    if v20 ~= nil then
                        v24:dispatch(v13(function()
                            v12.closeFiltersAndItemDetails(v20);
                            v20.navigate(v11.TryOnManager);
                        end));
                    end;
                    return v16.resolve();
                end;
            end, function(_)
                v2.warn("Error in TryOnLook thunk");
                v24:dispatch(v14({
                    isLocalized = false, 
                    toastType = v15.NetworkingError, 
                    toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong"
                }));
            end);
        end)(v23);
    end;
end;
