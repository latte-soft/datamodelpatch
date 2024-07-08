local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Reducers.Authentication.SignUpUsername);
local v2 = require(l_Modules_0.LuaApp.Reducers.Authentication.SignUpPassword);
local v3 = require(l_Modules_0.LuaApp.Reducers.Authentication.SignUpBundles);
local v4 = require(l_Modules_0.LuaApp.Reducers.Authentication.SignUpBirthday);
local v5 = require(l_Modules_0.LuaApp.Reducers.Authentication.SignUpSelectedBundleId);
local v6 = require(l_Modules_0.LuaApp.Actions.Authentication.ClearSignUpInfo);
local v7 = require(l_Modules_0.LuaApp.Reducers.Authentication.HumanoidDescriptionProperties);
return function(v8, v9)
    v8 = v8 or {};
    if v9.type == v6.name then
        v8 = {};
    end;
    return {
        SignUpBirthday = v4(v8.SignUpBirthday, v9), 
        SignUpUsername = v1(v8.SignUpUsername, v9), 
        SignUpPassword = v2(v8.SignUpPassword, v9), 
        SignUpSelectedBundleId = v5(v8.SignUpSelectedBundleId, v9), 
        SignUpBundles = v3(v8.SignUpBundles, v9), 
        HumanoidDescriptionProperties = v7(v8.HumanoidDescriptionProperties, v9)
    };
end;
