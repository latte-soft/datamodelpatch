local l_Parent_0 = script.Parent.Parent;
local l_Rodux_0 = require(game:GetService("CorePackages").PurchasePromptDeps).Rodux;
local v2 = require(l_Parent_0.Actions.SetPurchaseFlow);
local v3 = require(l_Parent_0.Actions.CompleteRequest);
local v4 = require(l_Parent_0.Enums.PurchaseFlow);
return l_Rodux_0.createReducer(false, {
    [v3.name] = function(_, _)
        return v4.None;
    end, 
    [v2.name] = function(_, v8)
        return v8.purchaseFlow;
    end
});
