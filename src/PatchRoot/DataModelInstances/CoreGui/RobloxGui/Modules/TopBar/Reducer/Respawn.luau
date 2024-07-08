return require(game:GetService("CorePackages").Rodux).createReducer({
    enabled = true, 
    customCallback = nil
}, {
    [require(script.Parent.Parent.Actions.SetRespawnBehaviour).name] = function(_, v1)
        return {
            enabled = v1.respawnEnabled, 
            customCallback = v1.customCallback
        };
    end
});
