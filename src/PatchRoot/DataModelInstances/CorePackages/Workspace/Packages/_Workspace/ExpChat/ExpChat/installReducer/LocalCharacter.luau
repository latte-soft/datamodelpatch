local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
return require(l_script_FirstAncestor_0.Parent.Rodux).createReducer(nil, {
    [require(l_script_FirstAncestor_0.Actions.LocalCharacterLoaded).name] = function(_, v2)
        return v2.character;
    end
});
