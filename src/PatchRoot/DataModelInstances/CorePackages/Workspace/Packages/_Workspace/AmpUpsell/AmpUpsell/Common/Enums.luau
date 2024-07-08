return {
    ActionTypeEnum = {
        Phone = "Phone", 
        GovernmentId = "GovernmentId", 
        Email = "Email", 
        AddedEmail = "AddedEmail"
    }, 
    AccessResponseEnum = {
        Granted = "Granted", 
        Denied = "Denied", 
        Actionable = "Actionable", 
        Pending = "Pending", 
        Error = "Error"
    }, 
    ActionStatusEnum = {
        Success = "Success", 
        Failure = "Failure", 
        Cancelled = "Cancelled", 
        Unknown = "Unknown"
    }, 
    IDVSessionStatusEnum = {
        Unknown = 0, 
        Success = 1, 
        Failure = 2, 
        RequiresManualReview = 3, 
        RequiresRetry = 4, 
        Started = 5, 
        Submitted = 6, 
        Stored = 7, 
        Expired = 8
    }, 
    IDVSessionErrorEnum = {
        None = 0, 
        UnknownError = 1, 
        InvalidDocument = 2, 
        InvalidSelfie = 3, 
        BelowMinimumAge = 4, 
        LowQualityMedia = 5
    }, 
    IDVStep = {
        ConnectedMobile = 1, 
        Verified = 2, 
        GotResults = 3, 
        UpdatedRobloxProfile = 4
    }
};
