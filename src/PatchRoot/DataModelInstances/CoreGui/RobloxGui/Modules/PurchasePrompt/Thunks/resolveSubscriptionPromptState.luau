local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Actions.SetPromptState);
local v2 = require(l_Parent_0.Actions.ErrorOccurred);
local v3 = require(l_Parent_0.Actions.SubscriptionPurchaseInfoReceived);
local v4 = require(l_Parent_0.Enums.PromptState);
local v5 = require(l_Parent_0.Enums.PurchaseError);
local v6 = require(l_Parent_0.Thunk);
return function(v7)
    return v6.new(script.Name, nil, function(v8, _)
        v8:dispatch(v3(v7));
        if v7.CanPurchase == false then
            return v8:dispatch(v2(v5.AlreadySubscribed));
        else
            return v8:dispatch(v1(v4.PromptSubscriptionPurchase));
        end;
    end);
end;
