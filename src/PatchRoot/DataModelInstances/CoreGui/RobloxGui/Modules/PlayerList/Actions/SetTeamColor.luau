return require(script.Parent.Parent.ActionCreator)("SetTeamColor", function(v0, v1)
    return {
        isTeamAction = true, 
        team = v0, 
        teamColor = v1
    };
end);
