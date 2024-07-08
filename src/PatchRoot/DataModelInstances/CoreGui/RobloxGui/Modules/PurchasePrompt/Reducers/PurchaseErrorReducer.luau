local l_Parent_0 = script.Parent.Parent;
return require(game:GetService("CorePackages").PurchasePromptDeps).Rodux.createReducer({}, {
    [require(l_Parent_0.Actions.ErrorOccurred).name] = function(_, v2)
        return v2.purchaseError;
    end, 
    [require(l_Parent_0.Actions.CompleteRequest).name] = function(_, _)
        return {};
    end
});
