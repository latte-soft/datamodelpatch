local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Promise);
local v2 = require(l_Parent_0.Thunk);
local v3 = require(l_Parent_0.Enums.PurchaseError);
local v4 = require(l_Parent_0.Actions.RequestSubscriptionPurchase);
local v5 = require(l_Parent_0.Actions.ErrorOccurred);
local _ = require(l_Parent_0.Network.getPremiumUpsellPrecheck);
local v7 = require(l_Parent_0.Network.getSubscriptionPurchaseInfo);
local v8 = require(l_Parent_0.Services.Network);
local v9 = require(l_Parent_0.Services.ExternalSettings);
local v10 = require(l_Parent_0.Thunks.resolveSubscriptionPromptState);
local v11 = require(l_Parent_0.Utils.hasPendingRequest);
local v12 = {
    v8, 
    v9
};
return function(v13)
    return v2.new(script.Name, v12, function(v14, v15)
        local v16 = v15[v8];
        local v17 = v15[v9];
        if not v11(v14:getState()) then
            v14:dispatch(v4(v13));
            if not v17.getFlagOrder66() then
                return v7(v16, v13):andThen(function(v18)
                    v14:dispatch(v10(v18));
                end):catch(function(v19)
                    v14:dispatch(v5(v19));
                end);
            else
                v14:dispatch(v5(v3.PurchaseDisabled));
                return nil;
            end;
        else
            return nil;
        end;
    end);
end;
