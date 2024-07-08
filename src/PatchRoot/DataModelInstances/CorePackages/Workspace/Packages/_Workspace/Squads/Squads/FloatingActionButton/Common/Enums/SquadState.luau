return (require(script:FindFirstAncestor("Squads").dependencies).enumerate("SquadState", {
    Idle = "Idle", 
    GameInvite = "GameInvite", 
    GamePending = "GamePending", 
    UserJoin = "UserJoin"
}));
