local l_ActionTypeEnum_0 = require(script.Parent.Enums).ActionTypeEnum;
return {
    accountSettingsUpsellStrings = {
        [l_ActionTypeEnum_0.GovernmentId] = {
            title = "Feature.AgeVerificationUpsell.Modal.Title", 
            message = "Feature.AgeVerificationUpsell.Modal.ContentText", 
            buttonCancel = "Feature.AgeVerificationUpsell.Button.Cancel", 
            buttonSettings = "Feature.AgeVerificationUpsell.Button.Settings"
        }, 
        [l_ActionTypeEnum_0.Phone] = {
            title = "Amp.AccountSettingsUpsell.Phone.Modal.Title", 
            message = "Amp.AccountSettingsUpsell.Phone.Modal.ContentText", 
            buttonCancel = "Amp.AccountSettingsUpsell.Phone.Button.Cancel", 
            buttonSettings = "Amp.AccountSettingsUpsell.Phone.Button.Settings"
        }, 
        [l_ActionTypeEnum_0.Email] = {
            title = "Amp.AccountSettingsUpsell.Email.Modal.Title", 
            message = "Amp.AccountSettingsUpsell.Email.Modal.ContentText", 
            buttonCancel = "Amp.AccountSettingsUpsell.Email.Button.Cancel", 
            buttonSettings = "Amp.AccountSettingsUpsell.Email.Button.Settings"
        }, 
        [l_ActionTypeEnum_0.AddedEmail] = {
            title = "Amp.AccountSettingsUpsell.Email.Modal.Title", 
            message = "Amp.AccountSettingsUpsell.Email.Modal.ContentText", 
            buttonCancel = "Amp.AccountSettingsUpsell.Email.Button.Cancel", 
            buttonSettings = "Amp.AccountSettingsUpsell.Email.Button.Settings"
        }
    }, 
    idvWithQRCodeUpsellStrings = {
        title = "Amp.IDVUpsell.Modal.Title", 
        beginText = "Amp.IDVUpsell.Modal.QRHeaderText", 
        disclaimer = "Amp.IDVUpsell.Modal.Disclaimer", 
        privacyLinkText = "Amp.IDVUpsell.Modal.PrivacyLinkText", 
        idDirectionsHeader = "Amp.IDVUpsell.Directions.IDHeader", 
        idDirectionsBody = "Amp.IDVUpsell.Directions.IDBody", 
        phoneDirectionsHeader = "Amp.IDVUpsell.Directions.PhoneHeader", 
        phoneDirectionsBody = "Amp.IDVUpsell.Directions.PhoneBody", 
        privacyPageHeader = "Amp.IDVUpsell.PrivacyPageHeader", 
        ageVerifyPrompt = "Verification.Identity.Label.AgeVerifyPrompt", 
        verifyInBrowser = "Verification.Identity.Label.VerifyInBrowser", 
        dontCloseWindowDisclaimer = "Verification.Identity.Label.PleaseDoNotClose", 
        havingTroubleInfoText = "Verification.Identity.Label.HavingTroubleScanCode", 
        startVerification = "Amp.IDVUpsell.Button.StartVerification", 
        cancel = "Amp.IDVUpsell.Button.Cancel"
    }, 
    idvErrorScreenStrings = {
        timeout = "Amp.IDVErrorScreen.Timeout", 
        declined = "Amp.IDVErrorScreen.Declined", 
        retry = "Amp.IDVErrorScreen.Retry", 
        close = "Amp.IDVErrorScreen.Close", 
        title = "Amp.IDVErrorScreen.Title"
    }
};
