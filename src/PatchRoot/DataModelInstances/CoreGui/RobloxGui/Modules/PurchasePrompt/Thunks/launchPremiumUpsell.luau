local l_Parent_0 = script.Parent.Parent;
local l_Players_0 = game:GetService("Players");
local v2 = require(l_Parent_0.Actions.ErrorOccurred);
local v3 = require(l_Parent_0.Actions.PurchaseCompleteRecieved);
local v4 = require(l_Parent_0.Actions.SetPromptState);
local v5 = require(l_Parent_0.Actions.SetWindowState);
local v6 = require(l_Parent_0.Enums.UpsellFlow);
local v7 = require(l_Parent_0.Enums.PromptState);
local v8 = require(l_Parent_0.Enums.PurchaseError);
local v9 = require(l_Parent_0.Enums.WindowState);
local v10 = require(l_Parent_0.NativeUpsell.getUpsellFlow);
local v11 = require(l_Parent_0.Services.Analytics);
local v12 = require(l_Parent_0.Services.PlatformInterface);
local v13 = require(l_Parent_0.Services.ExternalSettings);
local v14 = require(l_Parent_0.Thunks.hideWindow);
local v15 = require(l_Parent_0.Thunk);
local v16 = {
    v11, 
    v12, 
    v13
};
return function()
    return v15.new(script.Name, v16, function(v17, v18)
        local v19 = v18[v12];
        local v20 = v18[v13];
        local v21 = v18[v11];
        local l_premiumProductInfo_0 = v17:getState().premiumProductInfo;
        if not v20.isStudio() then
            local v23 = v10(v20.getPlatform());
            v21.signalPremiumUpsellConfirmed();
            if v23 == v6.Web then
                v19.startPremiumUpsell(l_premiumProductInfo_0.productId);
                v17:dispatch(v4(v7.UpsellInProgress));
                v17:dispatch(v14());
                return ;
            elseif v23 == v6.Mobile then
                local l_mobileProductId_0 = l_premiumProductInfo_0.mobileProductId;
                local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
                if not game:GetEngineFeature("NativePurchaseWithLocalPlayer") then
                    v19.promptNativePurchase(l_LocalPlayer_0, l_mobileProductId_0);
                else
                    v19.promptNativePurchaseWithLocalPlayer(l_mobileProductId_0);
                end;
                v17:dispatch(v4(v7.UpsellInProgress));
                v17:dispatch(v14());
                return ;
            else
                v17:dispatch(v2(v8.PremiumUnavailablePlatform));
                return ;
            end;
        else
            v19.signalMockPurchasePremium();
            v17:dispatch(v3());
            return v17:dispatch(v5(v9.Hidden));
        end;
    end);
end;
