local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v3 = require(l_Modules_0.LuaApp.Promise);
local v4 = require(l_Modules_0.LuaApp.Http.Requests.PurchaseWarningApi.PostAckPurchaseWarning);
local v5 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.addRawValueMethodToEnum);
local v6 = require(l_CorePackages_0.enumerate);
local v7 = {};
local v8 = {
    None = "None", 
    ConfirmedU13PaymentModal = "ConfirmedU13PaymentModal", 
    ConfirmedU13MonthlyThreshold1Modal = "ConfirmedU13MonthlyThreshold1Modal", 
    ConfirmedU13MonthlyThreshold2Modal = "ConfirmedU13MonthlyThreshold2Modal", 
    ConfirmParentalConsentWarningPaymentModal13To17 = "ConfirmParentalConsentWarningPaymentModal13To17"
};
v7.UserActionType = v6(script.Name, v8);
v5(v7.UserActionType, v8);
v7.Post = function(v9, v10)
    local v11 = v7.UserActionType.toRawValue(v10);
    return l_PerformFetch_0.Single("purchasewarning.acknowledge", function(_)
        return v4(v9, v11):andThen(function(_)
            return v3.resolve();
        end, function(_)
            return v3.resolve();
        end);
    end);
end;
return v7;
