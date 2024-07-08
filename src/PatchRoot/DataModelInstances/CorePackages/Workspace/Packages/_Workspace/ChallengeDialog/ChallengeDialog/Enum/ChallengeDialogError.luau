return (require(script:FindFirstAncestor("ChallengeDialog").Parent.enumerate)(script.Name, {
    Unknown = 1, 
    TokenUnavailable = 2, 
    StateNotUpdated = 3, 
    InconsistentStateTransition = 4, 
    BadRequest = 5
}));
