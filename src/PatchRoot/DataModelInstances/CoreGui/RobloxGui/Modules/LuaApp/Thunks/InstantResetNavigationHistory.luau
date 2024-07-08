local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Thunks.ResetNavigationHistory);
return function(v1, v2)
    return function(v3)
        v3:dispatch(v0(v1, v2));
        v3:flush();
    end;
end;
