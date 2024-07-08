return {
    DEFAULT_CODE_LENGTH = 6, 
    DEFAULT_TIMER_COOLDOWN = 30, 
    otpServiceOrigin = "login", 
    otpServiceOriginSignup = "signup", 
    otpServiceContactType = "email", 
    translationKeys = {
        parentEmailTitleKey = "Feature.Parents.Title.EnterParentEmail", 
        signUpEmailDescriptionKey = "Authentication.SignUp.Description.EnterParentEmail", 
        oneTimeCodeTitleKey = "Authentication.Login.Label.EnterOneTimeCode", 
        oneTimeCodeHelpDescriptionKey = "Authentication.Login.Description.EnterOneTimeCodeHelpV2", 
        parentalConsentModalDescriptionKey = "Authentication.SignUp.Description.VerifiedParentalConsentModal.EnterContinue", 
        sendParentVerificationCodeKey = "Authentication.OneTimePasscode.Description.SendVerificationCode"
    }, 
    errorMessageKeys = {
        IncorrectOtp = "Authentication.Login.Response.IncorrectOtpCode", 
        TryLater = "Authentication.Login.Response.SomethingWentWrong", 
        ServiceUnavailable = "Authentication.Login.Response.ServiceUnavailable", 
        Throttled = "Authentication.Login.Response.TooManyAttemptsPleaseWait", 
        VpnRequired = "Authentication.Login.Response.ErrorUseCorporateNetwork", 
        Unknown = "Authentication.Login.Response.UnknownError", 
        InvalidEmail = "Authentication.Login.Response.InvalidEmail"
    }, 
    statusCodeMap = {
        [1] = "Unknown", 
        [3] = "InvalidSessionToken", 
        [6] = "Throttled", 
        [7] = "InvalidEmail", 
        [8] = "VpnRequired", 
        [10] = "ServiceUnavaliable", 
        [429] = "Throttled", 
        [403] = "IncorrectOtp"
    }
};
