return {
    ["jest.config"] = script["jest.config"], 
    useUserAgreements = require(script.useUserAgreements), 
    FetchUpdatedUserAgreements = require(script.FetchUpdatedUserAgreements), 
    UserAgreementsCounterNames = require(script.UserAgreementsCounterNames), 
    UserAgreementErrorCodes = require(script.UserAgreementErrorCodes), 
    UserAgreementUtils = require(script.UserAgreementUtils), 
    UserAgreementsList = require(script.Components.UserAgreementsList)
};
