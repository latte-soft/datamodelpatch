local l_Parent_0 = script.Parent.Parent;
return require(l_Parent_0.Parent.Rodux).createReducer(true, {
    [require(l_Parent_0.Actions.CapturesCoreGuiDisabled).name] = function(_, _)
        return false;
    end, 
    [require(l_Parent_0.Actions.CapturesCoreGuiEnabled).name] = function(_, _)
        return true;
    end
});
