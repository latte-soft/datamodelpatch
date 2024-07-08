local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
return require(l_script_FirstAncestor_0.Parent.Rodux).createReducer(false, {
    [require(l_script_FirstAncestor_0.Actions.VoiceEnabledChanged).name] = function(_, v2)
        return v2.enabled;
    end
});
