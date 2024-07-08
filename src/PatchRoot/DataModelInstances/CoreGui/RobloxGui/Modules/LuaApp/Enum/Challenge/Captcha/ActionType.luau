local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Enum.AccountSecurity.addRawValueMethodToEnum);
local v2 = require(l_CorePackages_0.enumerate);
local v3 = {
    Login = "Login", 
    AppLogin = "AppLogin", 
    Signup = "Signup", 
    AppSignup = "AppSignup", 
    GroupJoin = "GroupJoin", 
    GroupWallPost = "GroupWallPost", 
    ResetPassword = "ResetPassword", 
    ToyCodeRedeem = "ToyCodeRedeem", 
    GameCardRedeem = "GameCardRedeem", 
    FollowUser = "FollowUser"
};
local v4 = v2(script.Name, v3);
v1(v4, v3);
return v4;
