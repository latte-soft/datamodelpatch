local l_Parent_0 = script.Parent.Parent;
return require(game:GetService("CorePackages").PurchasePromptDeps).Rodux.createReducer(require(l_Parent_0.Enums.ButtonState).Enabled, {
    [require(l_Parent_0.Actions.SetButtonState).name] = function(_, v2)
        return v2.state;
    end
});
