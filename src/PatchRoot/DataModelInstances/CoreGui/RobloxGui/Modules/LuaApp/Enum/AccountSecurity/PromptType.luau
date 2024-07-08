local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.addRawValueMethodToEnum);
local v3 = require(l_CorePackages_0.enumerate);
local v4 = {
    ChangePasswordSuspectedCompromise = "PROMPT_TYPE_CHANGE_PASSWORD__SUSPECTED_COMPROMISE", 
    ChangePasswordBreachedCredential = "PROMPT_TYPE_CHANGE_PASSWORD__BREACHED_CREDENTIAL", 
    AccountRestoresPolicyUpdate = "PROMPT_TYPE_ACCOUNT_RESTORES_POLICY_UPDATE", 
    AccountRestoresPolicyUpdateV2 = "PROMPT_TYPE_ACCOUNT_RESTORES_POLICY_UPDATE_V2", 
    AccountRestoresPolicyUpsell = if not require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppAccountRestoresPolicyUpsellPopUpEnabled)() then nil else "PROMPT_TYPE_ACCOUNT_RESTORES_POLICY_UPSELL", 
    AccountRestoresPolicyUpdateV3 = "PROMPT_TYPE_ACCOUNT_RESTORES_POLICY_UPDATE_V3", 
    AuthenticatorUpsell = if not require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppAuthenticatorUpsellPopUpEnabled)() then nil else "PROMPT_TYPE_AUTHENTICATOR_UPSELL", 
    BroaderAuthenticatorUpsell = if not require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppBroaderAuthenticatorUpsellPopUpEnabled)() then nil else "PROMPT_TYPE_BROADER_AUTHENTICATOR_UPSELL", 
    Email2SVUpsell = "PROMPT_TYPE_EMAIL_2SV_UPSELL"
};
local v5 = v3(script.Name, v4);
v2(v5, v4);
return v5;
