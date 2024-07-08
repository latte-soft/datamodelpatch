return require(script:FindFirstAncestor("BulkPurchaseApp").Parent.Rodux).makeActionCreator("BulkPurchaseStarted", function(v0)
    return {
        balance = v0
    };
end);
