return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(v0, v1, v2)
    return {
        userId = tostring(v0), 
        character = v1, 
        humanoid = v2
    };
end);
