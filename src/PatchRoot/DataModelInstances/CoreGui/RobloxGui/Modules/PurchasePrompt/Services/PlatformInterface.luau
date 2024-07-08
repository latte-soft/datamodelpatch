local l_Parent_0 = script.Parent.Parent;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_GuiService_0 = game:GetService("GuiService");
local v4 = require(l_Parent_0.Utils.Base64);
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local v6 = nil;
pcall(function()
    v6 = game:GetService("PlatformService");
end);
local l_UrlBuilder_0 = require(l_CorePackages_0.PurchasePromptDeps).UrlBuilder.UrlBuilder;
local v8 = string.gsub(l_ContentProvider_0.BaseUrl:lower(), "/m.", "/www.");
return {
    new = function()
        local v9 = {};
        setmetatable(v9, {
            __tostring = function()
                return "Service(PlatformInterface)";
            end
        });
        v9.signalMockPurchasePremium = function()
            l_MarketplaceService_0:SignalMockPurchasePremium();
        end;
        v9.startPremiumUpsell = function(v10)
            l_GuiService_0:OpenBrowserWindow((("%supgrades/paymentmethods?ap=%d"):format(v8, v10)));
        end;
        v9.startRobuxUpsellWeb = function(v11)
            if not v11 then
                l_GuiService_0:OpenBrowserWindow(("%sUpgrades/Robux.aspx"):format(v8));
                return ;
            else
                l_GuiService_0:OpenBrowserWindow(("%supgrades/paymentmethods?ap=%s"):format(v8, v11));
                return ;
            end;
        end;
        v9.openSecuritySettings = function(v12)
            if not v12 then
                l_GuiService_0:OpenBrowserWindow((("%smy/account#format(v8)));
                return ;
            else
                l_GuiService_0:OpenBrowserWindow((("%smy/account?challenge=%s#format(v8, (v4.Encode(v12)))));
                return ;
            end;
        end;
        v9.openTermsOfUse = function()
            l_GuiService_0:OpenBrowserWindow((l_UrlBuilder_0.static.about.terms()));
        end;
        v9.openRobuxStore = function()
            l_GuiService_0:OpenBrowserWindow(("%sUpgrades/Robux.aspx"):format(v8));
        end;
        v9.promptNativePurchaseWithLocalPlayer = function(v13)
            return l_MarketplaceService_0:PromptNativePurchaseWithLocalPlayer(v13);
        end;
        v9.promptNativePurchase = function(v14, v15)
            return l_MarketplaceService_0:PromptNativePurchase(v14, v15);
        end;
        v9.beginPlatformStorePurchase = function(v16)
            return v6:BeginPlatformStorePurchase(v16);
        end;
        return v9;
    end
};
