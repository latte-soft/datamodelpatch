local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Thunks.CheckHttpErrorStatus);
local v2 = require(l_Modules_0.LuaApp.Thunks.AccountSecurity.CheckChallengeHeaders);
return function(v3, v4, v5)
    return function(v6, v7, v8)
        local v9, v10 = v3(v6, v7, v8);
        return v9:andThen(nil, function(v11)
            return v4:dispatch(v1(v3, v6, v11, v5));
        end):andThen(nil, function(v12)
            return v4:dispatch(v2(v3, v6, v7, v8, v12));
        end), v10;
    end;
end;
