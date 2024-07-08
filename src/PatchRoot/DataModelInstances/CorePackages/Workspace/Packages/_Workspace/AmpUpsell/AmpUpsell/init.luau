return {
    AccountSettingsUpsell = require(script.Components.Upsells.AccountSettingsUpsell), 
    WizardContainer = require(script.Components.WizardContainer), 
    AmpEnums = require(script.Common.Enums), 
    AmpApiProvider = require(script.Common.AmpApiProvider), 
    IDVUpsellContainer = require(script.Components.Upsells.IdentityVerification.IDVUpsellContainer), 
    GetFFlagEnableAmpEmailUpsellSupport = require(script.Flags.GetFFlagEnableAmpEmailUpsellSupport), 
    GetFFlagEnableAmpIDVUpsellSupport = require(script.Flags.GetFFlagEnableAmpIDVUpsellSupport), 
    ["jest.config"] = script["jest.config"]
};
