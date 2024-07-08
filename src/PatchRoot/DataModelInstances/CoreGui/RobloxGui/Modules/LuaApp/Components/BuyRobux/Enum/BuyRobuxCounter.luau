local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Enum.AccountSecurity.addRawValueMethodToEnum);
local v2 = require(l_CorePackages_0.enumerate);
local v3 = {
    ShowU13PaymentModal = "ShowU13PaymentModal", 
    ShowU13MonthlyThreshold1Modal = "ShowU13MonthlyThreshold1Modal", 
    ShowU13MonthlyThreshold2Modal = "ShowU13MonthlyThreshold2Modal", 
    ShowParentalConsentWarningPaymentModal13To17 = "ShowParentalConsentWarningPaymentModal13To17", 
    ConfirmU13PaymentModal = "ConfirmU13PaymentModal", 
    ConfirmU13MonthlyThreshold1Modal = "ConfirmU13MonthlyThreshold1Modal", 
    ConfirmU13MonthlyThreshold2Modal = "ConfirmU13MonthlyThreshold2Modal", 
    ConfirmParentalConsentWarningPaymentModal13To17 = "ConfirmParentalConsentWarningPaymentModal13To17", 
    InvalidProducts = "FailedInvalidProducts", 
    PurchaseFailed = "PurchaseFailed", 
    PurchaseCanceled = "PurchaseCanceled"
};
local v4 = v2(script.Name, v3);
v1(v4, v3);
return v4;
