local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Cryo);
return require(l_CorePackages_0.Rodux).createReducer({
    MSDKLoginErrMessageKey = nil, 
    tokenAuthErrMessageKey = nil, 
    loginInProgress = false, 
    openId = ""
}, {
    [require(l_Modules_0.Luobu.Actions.SetMSDKLoginErrMessageKey).name] = function(v3, v4)
        return v2.Dictionary.join(v3, {
            MSDKLoginErrMessageKey = v4.errMessageKey
        });
    end, 
    [require(l_Modules_0.Luobu.Actions.SetTokenAuthErrMessageKey).name] = function(v5, v6)
        return v2.Dictionary.join(v5, {
            tokenAuthErrMessageKey = v6.errMessageKey
        });
    end, 
    [require(l_Modules_0.Luobu.Actions.SetMSDKLoginInProgress).name] = function(v7, v8)
        return v2.Dictionary.join(v7, {
            loginInProgress = v8.loginInProgress
        });
    end, 
    [require(l_Modules_0.Luobu.Actions.SetMSDKLoginOpenId).name] = function(v9, v10)
        return v2.Dictionary.join(v9, {
            openId = v10.openId
        });
    end
});
