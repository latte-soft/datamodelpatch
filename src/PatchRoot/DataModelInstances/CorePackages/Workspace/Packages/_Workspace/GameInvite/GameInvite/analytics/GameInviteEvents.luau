return {
    ModalOpened = {
        Type = "pageLoad", 
        Args = {}
    }, 
    SendInvite = {
        Type = "formInteraction", 
        Args = {
            btn = "inviteFriend", 
            aType = "click"
        }
    }, 
    CancelInvite = {
        Type = "formInteraction", 
        Args = {
            btn = "cancelInvite", 
            aType = "click"
        }
    }, 
    ErrorShown = {
        Type = "formInteraction", 
        Args = {
            field = "inviteFailed", 
            aType = "shown"
        }
    }, 
    CustomTextShown = {
        Type = "formInteraction", 
        Args = {
            field = "customText", 
            aType = "shown"
        }
    }
};
