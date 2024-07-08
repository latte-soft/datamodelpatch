local l_Parent_0 = script.Parent.Parent;
local _ = game:GetService("UserInputService");
local v2 = require(l_Parent_0.Actions.SetButtonState);
local v3 = require(l_Parent_0.Enums.PurchaseWarning);
local v4 = require(l_Parent_0.Enums.ButtonState);
local v5 = require(l_Parent_0.Enums.UpsellFlow);
local v6 = require(l_Parent_0.Services.Network);
local v7 = require(l_Parent_0.Network.getPurchaseWarning);
local v8 = require(l_Parent_0.NativeUpsell.getUpsellFlow);
local v9 = require(l_Parent_0.Services.Analytics);
local v10 = require(l_Parent_0.Services.ExternalSettings);
local v11 = require(l_Parent_0.Thunk);
local v12 = require(script.Parent.resolvePurchasePrecheck);
local v13 = {
    v9, 
    v6, 
    v10
};
return function()
    return v11.new(script.Name, v13, function(v14, v15)
        local v16 = v14:getState();
        local v17 = v15[v9];
        local v18 = v15[v6];
        local v19 = v15[v10];
        if not v19.isStudio() then
            local v20 = v8(v19.getPlatform());
            local l_productId_0 = v16.productInfo.productId;
            local l_robuxProductId_0 = v16.nativeUpsell.robuxProductId;
            local v23 = nil;
            local v24 = v16.accountInfo.membershipType == 4;
            if v20 == v5.Web then
                v23 = v16.nativeUpsell.productId;
                l_robuxProductId_0 = nil;
            else
                v23 = nil;
            end;
            v14:dispatch(v2(v4.Disabled));
            return v7(v18, l_robuxProductId_0, v23, v24):andThen(function(v25)
                v14:dispatch(v2(v4.Enabled));
                if v25 then
                    if v25.action == "U13PaymentModal" then
                        v17.signalScaryModalShown(l_productId_0, "U13PaymentModal", l_robuxProductId_0 or v23);
                        return v14:dispatch(v12(v3.U13PaymentModal));
                    elseif v25.action == "U13MonthlyThreshold1Modal" then
                        v17.signalScaryModalShown(l_productId_0, "U13MonthlyThreshold1Modal", l_robuxProductId_0 or v23);
                        return v14:dispatch(v12(v3.U13MonthlyThreshold1Modal));
                    elseif v25.action == "U13MonthlyThreshold2Modal" then
                        v17.signalScaryModalShown(l_productId_0, "U13MonthlyThreshold2Modal", l_robuxProductId_0 or v23);
                        return v14:dispatch(v12(v3.U13MonthlyThreshold2Modal));
                    elseif v25.action == "ParentalConsentWarningPaymentModal13To17" then
                        v17.signalScaryModalShown(l_productId_0, "ParentalConsentWarningPaymentModal13To17", l_robuxProductId_0 or v23);
                        return v14:dispatch(v12(v3.ParentalConsentWarningPaymentModal13To17));
                    end;
                end;
                v14:dispatch(v12(v3.NoAction));
            end):catch(function(_)
                v14:dispatch(v2(v4.Enabled));
                v14:dispatch(v12(v3.NoAction));
            end);
        else
            return v12(v3.NoAction);
        end;
    end);
end;
