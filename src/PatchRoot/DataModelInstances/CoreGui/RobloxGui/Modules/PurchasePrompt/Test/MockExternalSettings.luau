local _ = script.Parent.Parent;
local l_Cryo_0 = require(game:GetService("CorePackages").PurchasePromptDeps).Cryo;
local v2 = {
    RestrictSales2 = false, 
    Order66 = false
};
return {
    new = function(v3, v4, v5, v6)
        local v7 = {};
        v5 = l_Cryo_0.Dictionary.join(v2, v5 or {});
        local function _(v8, v9)
            if v8 ~= nil then
                return v8;
            else
                return v9;
            end;
        end;
        v7.getPlatform = function()
            return v6 or Enum.Platform.Windows;
        end;
        v7.isStudio = function()
            return v3 or false;
        end;
        v7.isThirdPartyPurchaseAllowed = function()
            return v5.PermissionsServiceIsThirdPartyPurchaseAllowed;
        end;
        v7.getLuaUseThirdPartyPermissions = function()
            local l_LuaUseThirdPartyPermissions_0 = v5.LuaUseThirdPartyPermissions;
            if l_LuaUseThirdPartyPermissions_0 ~= nil then
                return l_LuaUseThirdPartyPermissions_0;
            else
                return true;
            end;
        end;
        v7.getFlagBypassThirdPartySettingForRobloxPurchase = function()
            return v5.BypassThirdPartySettingForRobloxPurchase;
        end;
        v7.getFlagRestrictSales2 = function()
            return v5.RestrictSales2;
        end;
        v7.getFlagOrder66 = function()
            return v5.Order66;
        end;
        v7.isTenFootInterface = function()
            return v4;
        end;
        v7.getFFlagDisableRobuxUpsell = function()
            return v5.DisableRobuxUpsell;
        end;
        v7.GetFFlagEnableRestrictedAssetSaleLocationPurchasePrompt = function()
            return v5.EnableRestrictedAssetSaleLocationPurchasePrompt;
        end;
        return v7;
    end
};
