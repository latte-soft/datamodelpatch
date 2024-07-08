local l_Parent_0 = script.Parent.Parent;
return require(l_Parent_0.Parent.Rodux).createReducer(false, {
    [require(l_Parent_0.Actions.OverlayActivated).name] = function(_, _)
        return true;
    end, 
    [require(l_Parent_0.Actions.OverlayDeactivated).name] = function(_, _)
        return false;
    end
});
