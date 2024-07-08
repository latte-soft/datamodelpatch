local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
return require(l_script_FirstAncestor_0.Parent.Rodux).createReducer(false, {
    [require(l_script_FirstAncestor_0.Actions.SetAppLoaded).name] = function(_, v2)
        return v2.value;
    end
});
