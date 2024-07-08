local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
return require(l_script_FirstAncestor_0.Parent.Rodux).createReducer(nil, {
    [require(l_script_FirstAncestor_0.Actions.LocalTeamChanged).name] = function(_, v2)
        return v2.team;
    end, 
    [require(l_script_FirstAncestor_0.Actions.ClientAppLoaded).name] = function(_, v4)
        return v4.team;
    end
});
