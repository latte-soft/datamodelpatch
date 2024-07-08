local l_Parent_0 = script.Parent.Parent;
local l_Rodux_0 = require(game:GetService("CorePackages").PurchasePromptDeps).Rodux;
local v2 = require(l_Parent_0.Actions.SetPromptState);
local v3 = require(l_Parent_0.Actions.CompleteRequest);
local v4 = require(l_Parent_0.Actions.ErrorOccurred);
local v5 = require(l_Parent_0.Actions.StartPurchase);
local v6 = require(l_Parent_0.Actions.PromptNativeUpsell);
local v7 = require(l_Parent_0.Enums.PromptState);
return (l_Rodux_0.createReducer(v7.None, {
    [v2.name] = function(_, v9)
        return v9.promptState;
    end, 
    [v3.name] = function(_, _)
        return v7.None;
    end, 
    [v4.name] = function(_, _)
        return v7.Error;
    end, 
    [v5.name] = function(_, _)
        return v7.PurchaseInProgress;
    end, 
    [v6.name] = function(_, _)
        return v7.RobuxUpsell;
    end
}));
