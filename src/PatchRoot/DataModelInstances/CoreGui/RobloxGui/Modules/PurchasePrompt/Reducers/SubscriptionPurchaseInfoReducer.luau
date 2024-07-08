local l_Parent_0 = script.Parent.Parent;
local l_Rodux_0 = require(game:GetService("CorePackages").PurchasePromptDeps).Rodux;
local v2 = require(l_Parent_0.Actions.CompleteRequest);
local v3 = require(l_Parent_0.Actions.SubscriptionPurchaseInfoReceived);
local v4 = require(l_Parent_0.getPreviewImageUrl);
return (l_Rodux_0.createReducer({}, {
    [v3.name] = function(_, v6)
        v6.subscriptionPurchaseInfo.ImageUrl = v4(v6.subscriptionPurchaseInfo);
        return v6.subscriptionPurchaseInfo;
    end, 
    [v2.name] = function(_, _)
        return {};
    end
}));
