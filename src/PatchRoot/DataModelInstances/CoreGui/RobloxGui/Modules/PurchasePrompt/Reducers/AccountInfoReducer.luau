local l_Parent_0 = script.Parent.Parent;
return (require(game:GetService("CorePackages").PurchasePromptDeps).Rodux.createReducer({}, {
    [require(l_Parent_0.Actions.AccountInfoReceived).name] = function(v1, v2)
        return {
            balance = v1.balance, 
            membershipType = not v2.accountInfo.isPremium and 0 or 4
        };
    end, 
    [require(l_Parent_0.Actions.BalanceInfoRecieved).name] = function(v3, v4)
        return {
            balance = v4.balanceInfo.robux, 
            membershipType = v3.membershipType
        };
    end
}));
