local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Actions.SetPromptState);
local v2 = require(l_Parent_0.Enums.PromptState);
local v3 = require(l_Parent_0.Enums.PurchaseWarning);
local v4 = require(l_Parent_0.Thunks.launchRobuxUpsell);
local v5 = require(l_Parent_0.Thunk);
return function(v6)
    return v5.new(script.Name, {}, function(v7, _)
        if v6 == v3.U13PaymentModal then
            return v7:dispatch(v1(v2.U13PaymentModal));
        elseif v6 == v3.U13MonthlyThreshold1Modal then
            return v7:dispatch(v1(v2.U13MonthlyThreshold1Modal));
        elseif v6 == v3.RequireEmailVerification then
            return v7:dispatch(v1(v2.RequireEmailVerification));
        elseif v6 == v3.U13MonthlyThreshold2Modal then
            return v7:dispatch(v1(v2.U13MonthlyThreshold2Modal));
        elseif v6 == v3.ParentalConsentWarningPaymentModal13To17 then
            return v7:dispatch(v1(v2.ParentalConsentWarningPaymentModal13To17));
        else
            return v7:dispatch(v4());
        end;
    end);
end;
