return (require(game:GetService("CorePackages").Rodux).createReducer(false, {
    [require(script.Parent.Parent.Actions.SetAssets).name] = function(_, _)
        return true;
    end
}));
