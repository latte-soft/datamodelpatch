local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Cryo);
return require(l_CorePackages_0.Rodux).createReducer({
    signUpInProgress = false, 
    prefilledDisplayName = "", 
    signUpVoucher = "", 
    authMethod = "", 
    channelId = -1, 
    agreedUserAgreements = {}
}, {
    [require(l_Modules_0.Luobu.Actions.SetSignUpInProgress).name] = function(v3, v4)
        return v2.Dictionary.join(v3, {
            signUpInProgress = v4.signUpInProgress
        });
    end, 
    [require(l_Modules_0.Luobu.Actions.SetSignUpInfo).name] = function(v5, v6)
        return v2.Dictionary.join(v5, {
            prefilledDisplayName = v6.prefilledDisplayName, 
            signUpVoucher = v6.signUpVoucher, 
            authMethod = v6.authMethod, 
            channelId = v6.channelId
        });
    end, 
    [require(l_Modules_0.Luobu.Actions.SetAgreedUserAgreements).name] = function(v7, v8)
        return v2.Dictionary.join(v7, {
            agreedUserAgreements = v8.agreedUserAgreements
        });
    end
});
