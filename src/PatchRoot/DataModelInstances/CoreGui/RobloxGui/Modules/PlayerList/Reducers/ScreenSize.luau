return (require(game:GetService("CorePackages").Rodux).createReducer({
    X = 1000, 
    Y = 1000
}, {
    [require(script.Parent.Parent.Actions.SetScreenSize).name] = function(_, v1)
        return {
            X = v1.sizeX, 
            Y = v1.sizeY
        };
    end
}));
