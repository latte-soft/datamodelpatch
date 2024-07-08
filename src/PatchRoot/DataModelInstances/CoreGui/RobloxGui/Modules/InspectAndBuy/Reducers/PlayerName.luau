return require(game:GetService("CorePackages").Rodux).createReducer("", {
    [require(script.Parent.Parent.Actions.SetPlayerName).name] = function(_, v1)
        return v1.playerName;
    end
});
