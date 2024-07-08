local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Actions.Authentication.SetSignUpUsername);
return function(v1, v2)
    v1 = v1 or "";
    if v2.type == v0.name then
        return v2.signupUsername;
    else
        return v1;
    end;
end;
