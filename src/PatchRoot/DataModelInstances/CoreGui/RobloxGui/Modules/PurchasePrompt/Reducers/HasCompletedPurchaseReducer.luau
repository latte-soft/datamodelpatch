local l_Parent_0 = script.Parent.Parent;
return require(game:GetService("CorePackages").PurchasePromptDeps).Rodux.createReducer(false, {
    [require(l_Parent_0.Actions.PurchaseCompleteRecieved).name] = function(_, _)
        return true;
    end, 
    [require(l_Parent_0.Actions.CompleteRequest).name] = function(_, _)
        return false;
    end
});
