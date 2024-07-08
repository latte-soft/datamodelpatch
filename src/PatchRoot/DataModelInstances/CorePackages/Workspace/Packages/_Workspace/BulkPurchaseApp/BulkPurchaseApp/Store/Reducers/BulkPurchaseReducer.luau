local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local v1 = require(l_script_FirstAncestor_0.Parent.Rodux);
local v2 = require(l_script_FirstAncestor_0.Enums.BulkPurchasePromptStateEnum);
local v3 = require(l_script_FirstAncestor_0.Store.Actions.BulkPurchaseEnded);
local v4 = require(l_script_FirstAncestor_0.Store.Actions.BulkPurchaseSucceeded);
local v5 = require(l_script_FirstAncestor_0.Store.Actions.BulkPurchaseFailed);
local v6 = require(l_script_FirstAncestor_0.Store.Actions.BulkPurchaseStarted);
local v7 = require(l_script_FirstAncestor_0.Store.Actions.BulkPurchaseRequested);
local _ = require(l_script_FirstAncestor_0.Store.Types);
local function _()
    return {
        promptState = v2.None
    };
end;
return (v1.createReducer({
    promptState = v2.None
}, {
    [v3.name] = function(_, _)
        return {
            promptState = v2.None
        };
    end, 
    [v4.name] = function(v12, v13)
        local v14 = table.clone(v12);
        v14.itemStatuses = v13.itemStatuses;
        v14.promptState = v13.promptState;
        return v14;
    end, 
    [v5.name] = function(v15, v16)
        local v17 = table.clone(v15);
        v17.errorCode = v16.errorCode;
        v17.promptState = v2.Error;
        return v17;
    end, 
    [v7.name] = function(v18, v19)
        local v20 = table.clone(v18);
        v20.itemData = v19.itemData;
        v20.options = v19.options;
        v20.orderRequest = v19.orderRequest;
        v20.balance = v19.balance;
        v20.totalCost = v19.totalCost;
        return v20;
    end, 
    [v6.name] = function(v21, v22)
        local v23 = table.clone(v21);
        v23.promptState = v2.Request;
        v23.balance = v22.balance;
        return v23;
    end
}));
