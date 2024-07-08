local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.AppPage);
local v3 = require(l_Modules_0.LuaApp.Actions.ClearNativePurchaseResult);
local v4 = require(l_Modules_0.LuaApp.Thunks.ApiFetchRobuxProduct);
local v5 = require(l_Modules_0.LuaApp.Thunks.ApiFetchIAPPurchaseWarning);
local v6 = require(l_Modules_0.LuaApp.Thunks.ApiPostAckPurchaseWarning);
local v7 = require(l_Modules_0.LuaApp.Thunks.OpenNativePurchase);
local v8 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v9 = require(l_Modules_0.LuaApp.Thunks.NavigateDownToSecuritySettings);
local v10 = require(l_Modules_0.LuaApp.Thunks.Challenge.RenderChallenge);
local v11 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v12 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local l_GetFFlagOpenVngShopForVngRobuxPurchase_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagOpenVngShopForVngRobuxPurchase;
local v14 = require(l_Modules_0.LuaApp.Thunks.OpenPurchaseRobuxPage);
return function(v15)
    return {
        dispatchFetchRobuxProduct = function(v16, v17, v18)
            return v15(v4(v16, v17, v18));
        end, 
        dispatchFetchIAPPurchaseWarning = function(v19, v20, v21, v22)
            return v15(v5.Fetch(v19, v20, v21, v22));
        end, 
        dispatchPostAckPurchaseWarning = function(v23, v24)
            return v15(v6.Post(v23, v24));
        end, 
        dispatchCentralOverlay = function(v25, v26)
            return v15(v12(v25, v26));
        end, 
        endPurchase = function()
            v15(v3());
        end, 
        promptRobux = function(v27, v28, v29)
            v15(v7(v27, v28, v29));
        end, 
        openTermsOfUse = function()
            v15(v8({
                name = v2.GenericWebPage, 
                detail = v11.static.about.terms(), 
                extraProps = {
                    title = ""
                }
            }));
        end, 
        openSecuritySettings = function()
            v15(v9());
        end, 
        openBuyRobux = function()
            if not l_GetFFlagOpenVngShopForVngRobuxPurchase_0() then
                return v15(v8({
                    name = v2.PurchaseRobux
                }));
            else
                return v15(v14());
            end;
        end, 
        renderChallenge = function(v30, v31)
            return v15(v10(v30, v31));
        end
    };
end;
