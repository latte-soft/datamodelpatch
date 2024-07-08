return (require(game:GetService("CorePackages").Rodux).createReducer({
    preferredTransparency = 1, 
    reducedMotion = false
}, {
    [require(script.Parent.Parent.Actions.SetSettings).name] = function(_, v1)
        return {
            preferredTransparency = v1.preferredTransparency, 
            reducedMotion = v1.reducedMotion
        };
    end
}));
