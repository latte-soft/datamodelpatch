local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Promise);
local v3 = require(l_Modules_0.LuaApp.Http.Requests.PurchaseWarningApi.GetPurchaseWarning);
local v4 = require(l_Modules_0.LuaApp.Util.getPaymentPlatform);
local v5 = require(l_Modules_0.LuaApp.Enum.PaymentPlatform);
local v6 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.addRawValueMethodToEnum);
local v7 = require(l_CorePackages_0.enumerate);
local _ = require(l_CorePackages_0.Workspace.Packages.Http);
local v9 = require(l_Modules_0.LuaApp.Flags.GetFFlagUADesktopPurchaseWarnings);
local v10 = {};
local v11 = {
    None = "None", 
    U13PaymentModal = "U13PaymentModal", 
    U13MonthlyThreshold1Modal = "U13MonthlyThreshold1Modal", 
    U13MonthlyThreshold2Modal = "U13MonthlyThreshold2Modal", 
    ParentalConsentWarningPaymentModal13To17 = "ParentalConsentWarningPaymentModal13To17"
};
v10.ResponseType = v7(script.Name, v11);
v6(v10.ResponseType, v11);
v10.Fetch = function(v12, v13, v14, v15)
    return function(_)
        local v17 = v4();
        if not v9() then
            if v17 == v5.Web then
                return v2.resolve(v10.ResponseType.None);
            end;
        elseif v17 == v5.Web then
            v13 = nil;
        else
            v14 = nil;
        end;
        return v3(v12, v13, v14, v15):andThen(function(v18)
            if not (v18 ~= nil) or v18[1] == nil then
                return v2.resolve(v10.ResponseType.None);
            else
                local v19 = v18[1];
                local l_None_0 = v10.ResponseType.None;
                if v19 then
                    if v19.action == "U13PaymentModal" then
                        l_None_0 = v10.ResponseType.U13PaymentModal;
                    elseif v19.action == "U13MonthlyThreshold1Modal" then
                        l_None_0 = v10.ResponseType.U13MonthlyThreshold1Modal;
                    elseif v19.action == "U13MonthlyThreshold2Modal" then
                        l_None_0 = v10.ResponseType.U13MonthlyThreshold2Modal;
                    elseif v19.action == "ParentalConsentWarningPaymentModal13To17" then
                        l_None_0 = v10.ResponseType.ParentalConsentWarningPaymentModal13To17;
                    end;
                end;
                return v2.resolve(l_None_0);
            end;
        end, function()
            return v2.resolve(v10.ResponseType.None);
        end);
    end;
end;
return v10;
