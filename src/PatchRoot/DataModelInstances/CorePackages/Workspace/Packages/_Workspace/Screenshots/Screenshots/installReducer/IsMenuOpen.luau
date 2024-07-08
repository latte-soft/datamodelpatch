local l_Parent_0 = script.Parent.Parent;
return require(l_Parent_0.Parent.Rodux).createReducer(false, {
    [require(l_Parent_0.Actions.MenuClosed).name] = function(_, _)
        return false;
    end, 
    [require(l_Parent_0.Actions.MenuOpened).name] = function(_, _)
        return true;
    end
});
