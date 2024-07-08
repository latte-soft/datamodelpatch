return (require(game:GetService("CorePackages").Rodux).createReducer(Vector2.new(0, 0), {
    [require(script.Parent.Parent.Actions.ScreenSizeUpdated).name] = function(_, v1)
        return v1.screenSize;
    end
}));
