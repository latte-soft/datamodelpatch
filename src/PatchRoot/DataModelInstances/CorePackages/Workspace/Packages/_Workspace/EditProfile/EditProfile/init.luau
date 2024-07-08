return {
    Analytics = require(script.Analytics), 
    EditProfilePage = require(script.Components.EditProfileEntryPoint), 
    EditDisplayNameModal = require(script.Components.EditDisplayNameModal), 
    EditDescriptionModal = require(script.Components.EditDescriptionModal), 
    EditDisplayNameErrorModal = require(script.Components.ErrorModals.EditDisplayNameErrorModal), 
    UsernameInsufficientFundsModal = require(script.Components.ErrorModals.UsernameInsufficientFundsModal), 
    Flags = require(script.Flags), 
    ["jest.config"] = script["jest.config"], 
    installReducer = require(script.installReducer), 
    RoduxKey = require(script.Common.Constants).RODUX_KEY, 
    EditUsernameWrapper = require(script.EditUsernameWrapper)
};
