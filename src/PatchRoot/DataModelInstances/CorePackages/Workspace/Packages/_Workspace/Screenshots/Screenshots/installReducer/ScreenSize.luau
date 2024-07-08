local l_Parent_0 = script.Parent.Parent;
return require(l_Parent_0.Parent.Rodux).createReducer(Vector2.new(0, 0), {
    [require(l_Parent_0.Actions.ScreenSizeChanged).name] = function(_, v2)
        return v2.screenSize;
    end
});
