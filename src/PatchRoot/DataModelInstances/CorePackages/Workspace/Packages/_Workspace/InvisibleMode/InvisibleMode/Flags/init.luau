local v0 = require(script.InvisibleModeIXP);
local l_FFlagInvisibleModeEnabledForAll_0 = v0.FFlagInvisibleModeEnabledForAll;
local l_FFlagInvisibleModeExperimentEnabled_0 = v0.FFlagInvisibleModeExperimentEnabled;
return {
    FFlagInvisibleModeEnabledForAll = l_FFlagInvisibleModeEnabledForAll_0, 
    FFlagInvisibleModeExperimentEnabled = l_FFlagInvisibleModeExperimentEnabled_0, 
    FFlagInvisibleModeSetupEnabled = l_FFlagInvisibleModeEnabledForAll_0 or l_FFlagInvisibleModeExperimentEnabled_0, 
    FIntInvisibleExpiryTimeHours = require(script.FIntInvisibleExpiryTimeHours), 
    InvisibleModeIXP = v0
};
