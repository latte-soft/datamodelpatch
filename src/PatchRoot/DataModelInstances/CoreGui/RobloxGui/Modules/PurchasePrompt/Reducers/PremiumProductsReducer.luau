local l_Parent_0 = script.Parent.Parent;
return (require(game:GetService("CorePackages").PurchasePromptDeps).Rodux.createReducer({}, {
    [require(l_Parent_0.Actions.PremiumInfoRecieved).name] = function(_, v2)
        return v2.premiumInfo;
    end, 
    [require(l_Parent_0.Actions.CompleteRequest).name] = function(_, _)
        return {};
    end
}));
