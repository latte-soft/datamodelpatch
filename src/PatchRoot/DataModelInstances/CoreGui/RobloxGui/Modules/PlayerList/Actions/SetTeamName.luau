return require(script.Parent.Parent.ActionCreator)("SetTeamName", function(v0, v1)
    return {
        isTeamAction = true, 
        team = v0, 
        teamName = v1
    };
end);
