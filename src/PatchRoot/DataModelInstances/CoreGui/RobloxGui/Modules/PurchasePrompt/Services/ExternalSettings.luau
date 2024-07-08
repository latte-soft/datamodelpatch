local l_Parent_0 = script.Parent.Parent;
local l_RunService_0 = game:GetService("RunService");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_Parent_0.Flags.GetFFlagDisableRobuxUpsell);
local v5 = require(l_Parent_0.Flags.GetFFlagEnableRestrictedAssetSaleLocationPurchasePrompt);
return {
    new = function()
        local v6 = {};
        setmetatable(v6, {
            __tostring = function()
                return "Service(ExternalSettings)";
            end
        });
        v6.getPlatform = function()
            return l_UserInputService_0:GetPlatform();
        end;
        v6.isStudio = function()
            return l_RunService_0:IsStudio();
        end;
        v6.isThirdPartyPurchaseAllowed = function()
            local v7 = true;
            pcall(function()
                v7 = game:GetService("PermissionsService"):GetIsThirdPartyPurchaseAllowed();
            end);
            return v7;
        end;
        v6.getLuaUseThirdPartyPermissions = function()
            return true;
        end;
        v6.getFlagBypassThirdPartySettingForRobloxPurchase = function()
            return true;
        end;
        v6.getFlagRestrictSales2 = function()
            return settings():GetFFlag("RestrictSales2");
        end;
        v6.getFlagOrder66 = function()
            return settings():GetFFlag("Order66");
        end;
        v6.isTenFootInterface = function()
            return l_GuiService_0:IsTenFootInterface();
        end;
        v6.getFFlagDisableRobuxUpsell = function()
            return v4();
        end;
        v6.GetFFlagEnableRestrictedAssetSaleLocationPurchasePrompt = function()
            return v5();
        end;
        return v6;
    end
};
