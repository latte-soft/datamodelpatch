local l_Parent_0 = script.Parent.Parent;
return (require(game:GetService("CorePackages").PurchasePromptDeps).Rodux.createReducer({}, {
    [require(l_Parent_0.Actions.SetProduct).name] = function(_, v2)
        return {
            id = v2.id, 
            infoType = v2.infoType, 
            equipIfPurchased = v2.equipIfPurchased
        };
    end, 
    [require(l_Parent_0.Actions.CompleteRequest).name] = function(_, _)
        return {};
    end
}));
