return (require(script:FindFirstAncestor("ChallengeDialog").Parent.enumerate)(script.Name, {
    ChallengeDialogApproval = "CHALLENGE_DIALOG_APPROVAL", 
    ChallengeDialogDenied = "CHALLENGE_DIALOG_DENIED", 
    ChallengeDialogExpired = "CHALLENGE_DIALOG_EXPIRED", 
    ChallengeDialogAlreadyCompleted = "CHALLENGE_DIALOG_ALREADY_COMPLETED"
}));
