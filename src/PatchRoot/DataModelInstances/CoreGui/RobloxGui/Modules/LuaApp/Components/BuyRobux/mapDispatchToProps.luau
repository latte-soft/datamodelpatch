local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local v2 = require(l_Modules_0.LuaApp.Thunks.ApiFetchIAPProducts);
local v3 = require(l_Modules_0.LuaApp.Actions.ClearNativePurchaseResult);
local v4 = require(l_Modules_0.LuaApp.Thunks.ApiFetchIAPPurchaseWarning);
local v5 = require(l_Modules_0.LuaApp.Thunks.FetchNativeIAPProducts);
local v6 = require(l_Modules_0.LuaApp.Thunks.ApiPostAckPurchaseWarning);
local v7 = require(l_Modules_0.LuaApp.Thunks.OpenNativePurchase);
local v8 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local _ = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v10 = require(l_Modules_0.LuaApp.Thunks.ApiFetchEconomyCurrency);
return function(v11)
    return {
        dispatchClearNativePurchaseResult = function()
            v11(v3());
        end, 
        dispatchFetchIAPProducts = function(v12)
            v11(v2.Fetch(v12));
        end, 
        dispatchFetchNativeIAPProducts = function()
            v11(v5.Fetch());
        end, 
        dispatchFetchIAPPurchaseWarning = function(v13, v14, v15, v16)
            return v11(v4.Fetch(v13, v14, v15, v16));
        end, 
        dispatchPostAckPurchaseWarning = function(v17, v18)
            return v11(v6.Post(v17, v18));
        end, 
        dispatchFetchUserBalance = function(v19, v20)
            v11(v10(v19, v20, true));
        end, 
        promptRobux = function(v21, v22, v23)
            v11(v7(v21, v22, v23));
        end, 
        dispatchNavigateBack = function()
            v11(v1());
        end, 
        dispatchCentralOverlay = function(v24, v25)
            return v11(v8(v24, v25));
        end
    };
end;
