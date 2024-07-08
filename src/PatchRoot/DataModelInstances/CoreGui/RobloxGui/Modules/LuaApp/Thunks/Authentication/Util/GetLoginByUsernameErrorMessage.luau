local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_getAppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies;
local v4 = require(l_Modules_0.LuaApp.Enum.LoginErrorCodes);
local v5 = require(l_Modules_0.LuaApp.Enum.LoginErrorCodeSSO);
local v6 = l_getAppFeaturePolicies_0().getPlatformAccountName();
local v7 = {
    [v5.AuthError] = "Authentication.Login.Response.SomethingWentWrong", 
    [v5.ExternalIdentityAlreadyConnected] = {
        "Authentication.Login.Response.AlreadyLinked"; 
        platform = v6
    }, 
    [v5.IncorrectCValueOrPassword] = "Authentication.Login.Response.IncorrectUsernamePassword", 
    [v5.FloodedPS] = "Authentication.TwoStepVerification.Response.TooManyAttempts", 
    [v5.Require2FA] = "Authentication.Login.Response.Require2FAGeneric", 
    [v5.RelinkingCooldown] = {
        "Authentication.Login.Response.RelinkingFreeze"; 
        platform = v6
    }, 
    [v4.IncorrectCValueOrPassword] = "Authentication.Login.Response.IncorrectUsernamePassword", 
    [v5.FloodedXbox] = "Authentication.TwoStepVerification.Response.TooManyAttempts", 
    [v5.RobloxAccountAlreadyConnectedXbox] = {
        "Authentication.Login.Response.AlreadyLinked"; 
        platform = v6
    }, 
    [v5.ExternalIdentityAlreadyConnectedXbox] = {
        "Authentication.Login.Response.AlreadyLinked"; 
        platform = v6
    }
};
return function(v8)
    if not v7[v8] then
        return "Authentication.Login.Response.SomethingWentWrong";
    else
        return v7[v8];
    end;
end;
