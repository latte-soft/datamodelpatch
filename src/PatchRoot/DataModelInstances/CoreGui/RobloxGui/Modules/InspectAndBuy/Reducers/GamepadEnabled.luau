return (require(game:GetService("CorePackages").Rodux).createReducer(false, {
    [require(script.Parent.Parent.Actions.SetGamepadEnabled).name] = function(_, v1)
        return v1.gamepadEnabled;
    end
}));
