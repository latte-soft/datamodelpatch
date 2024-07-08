local l_Parent_0 = script.Parent.Parent;
local l_enumerate_0 = require(game:GetService("CorePackages").PurchasePromptDeps).enumerate;
local v2 = require(l_Parent_0.Utils.addRawValueMethodToEnum);
local v3 = {};
local v4 = {
    None = "None", 
    ConfirmedU13PaymentModal = "ConfirmedU13PaymentModal", 
    ConfirmedU13MonthlyThreshold1Modal = "ConfirmedU13MonthlyThreshold1Modal", 
    ConfirmedU13MonthlyThreshold2Modal = "ConfirmedU13MonthlyThreshold2Modal", 
    ConfirmedParentalConsentWarningPaymentModal13To17 = "ConfirmedParentalConsentWarningPaymentModal13To17"
};
v3.UserActionType = l_enumerate_0(script.Name, v4);
v2(v3.UserActionType, v4);
v3.Post = function(v5, v6)
    return v5.postPurchaseWarningAcknowledge((v3.UserActionType.toRawValue(v6)));
end;
return v3;
