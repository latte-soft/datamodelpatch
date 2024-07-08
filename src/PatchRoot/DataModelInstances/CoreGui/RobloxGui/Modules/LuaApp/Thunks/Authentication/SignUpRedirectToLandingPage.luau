local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.AppPage);
local v2 = require(l_Modules_0.LuaApp.Actions.Authentication.ClearSignUpInfo);
local v3 = require(l_Modules_0.LuaApp.Thunks.ResetNavigationHistory);
return function(_)
    return function(v5)
        v5:dispatch(v2());
        v5:dispatch(v3({
            {
                name = v1.Landing
            }
        }));
    end;
end;
