local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v6 = nil;
pcall(function()
    v6 = game:GetService("PlatformService");
end);
local v7 = require(l_Modules_0.LuaApp.AppPage);
local v8 = require(l_Modules_0.LuaApp.Enum.PaymentPlatform);
local v9 = require(l_Modules_0.LuaApp.Enum.NativePurchaseStatus);
local v10 = require(l_Modules_0.LuaApp.Actions.SetNativePurchaseResult);
local _ = require(l_Modules_0.LuaApp.Thunks.NativePurchaseCompleteDEP);
local v12 = require(l_Modules_0.LuaApp.Thunks.NativePurchaseComplete);
local v13 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v14 = require(l_Modules_0.LuaApp.Util.getPaymentPlatform);
local l_getAppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies;
local v16 = require(l_Modules_0.LuaApp.Thunks.OpenPurchaseRobuxPage);
local l_GetFFlagOpenVngShopForVngRobuxPurchase_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagOpenVngShopForVngRobuxPurchase;
return function(v18, v19, v20)
    return function(v21)
        v21:dispatch(v10(v19, v9.Pending));
        if not l_RunService_0:IsStudio() then
            local v22 = v14();
            if v22 == v8.Web then
                if not l_GetFFlagOpenVngShopForVngRobuxPurchase_0() or not l_getAppFeaturePolicies_0().getShowVNGAge12Badge() then
                    return v21:dispatch(v13({
                        name = v7.Payment, 
                        detail = v20
                    }));
                else
                    return v21:dispatch(v16(function()
                        return v21:dispatch(v12(v18, v19, v9.Polling));
                    end));
                end;
            elseif v22 == v8.Xbox then
                local v23 = nil;
                local v24 = nil;
                local v25 = nil;
                local l_status_0, l_result_0 = pcall(function()
                    v23 = v6:BeginPlatformStorePurchase(v19);
                end);
                v24 = l_status_0;
                v25 = l_result_0;
                l_status_0 = v9.Failed;
                if v24 and v23 == 0 then
                    l_status_0 = v9.Success;
                end;
                return v21:dispatch(v12(v18, v19, l_status_0));
            elseif not game:GetEngineFeature("NativePurchaseWithLocalPlayer") then
                return l_MarketplaceService_0:PromptNativePurchase(l_Players_0.LocalPlayer, v19);
            else
                return l_MarketplaceService_0:PromptNativePurchaseWithLocalPlayer(v19);
            end;
        else
            delay(3, function()
                v21:dispatch(v12(v18, v19, v9.Success));
            end);
            return ;
        end;
    end;
end;
