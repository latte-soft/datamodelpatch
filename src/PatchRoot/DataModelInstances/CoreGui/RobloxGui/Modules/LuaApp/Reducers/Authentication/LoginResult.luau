local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Actions.Authentication.SetLoginResult);
local v3 = require(l_Modules_0.LuaApp.Models.Authentication.LoginResult);
return require(l_CorePackages_0.Rodux).createReducer(v3.new(), {
    [v2.name] = function(_, v5)
        assert(v3.is(v5.loginResult), "LoginResult must be a LoginResult model");
        return v5.loginResult;
    end
});
