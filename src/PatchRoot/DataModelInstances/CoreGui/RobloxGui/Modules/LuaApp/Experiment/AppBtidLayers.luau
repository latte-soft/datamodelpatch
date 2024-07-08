game:DefineFastString("LuaAppSignupLayer", "PlayerApp.Signup");
game:DefineFastString("ConsoleSignUpLayer", "Consoles.Signup");
game:DefineFastString("AccountSwitcherLayer", "Accounts.AccountSwitcher");
game:DefineFastString("LuaAppLandingLayer", "PlayerApp.Landing");
return {
    SignupLayer = game:GetFastString("LuaAppSignupLayer"), 
    LoginLayer = "PlayerApp.Login", 
    LandingLayer = game:GetFastString("LuaAppLandingLayer"), 
    AccountSwitcherLayer = game:GetFastString("AccountSwitcherLayer"), 
    ConsoleSignUpLayer = game:GetFastString("ConsoleSignUpLayer")
};
