local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Enums.PurchaseError);
local v2 = require(l_Parent_0.Misc.Constants);
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_Parent_0.Utils.isGenericChallengeResponse);
return function(v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
    return v5.performPurchase(v6, v7, v8, v9, v10, v11, v12, v13, v14):andThen(function(v15)
        if v15.purchased or v15.reason == "AlreadyOwned" then
            return v3.resolve(v15);
        elseif v15.reason == v2.PurchaseFailureReason.EconomyDisabled then
            return v3.reject(v1.PurchaseDisabled);
        elseif v15.reason == v2.PurchaseFailureReason.TwoStepVerificationRequired then
            return v3.reject(v1.TwoFactorNeeded);
        elseif v15.transactionStatus == 24 then
            return v3.reject(v1.TwoFactorNeeded);
        elseif not v4(v15) then
            return v3.reject(v1.UnknownFailure);
        else
            return v3.reject(v15);
        end;
    end, function(_)
        return v3.reject(v1.UnknownFailure);
    end);
end;
