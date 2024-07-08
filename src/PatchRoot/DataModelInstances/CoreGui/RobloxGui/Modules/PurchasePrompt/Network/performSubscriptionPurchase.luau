local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Promise);
local v2 = require(l_Parent_0.Utils.parseSubscriptionError);
local v3 = require(l_Parent_0.Flags.GetFFlagEnableRobloxCreditPurchase);
return function(v4, v5, v6)
    if not v3() then
        return v4.DEPRECATED_performSubscriptionPurchase(v5):catch(function(v7)
            return v1.reject(v2(v7));
        end);
    else
        return v4.performSubscriptionPurchase(v5, v6):catch(function(v8)
            return v1.reject(v2(v8));
        end);
    end;
end;
