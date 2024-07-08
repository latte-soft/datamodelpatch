local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v2 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
return function(v3, v4, v5, v6, v7, v8, v9)
    return function(v10)
        v10:dispatch(v2(v1.AccountSwitchingErrorOverlay, {
            titleTextKey = v3, 
            bodyTextKey = v4, 
            primaryButtonTextKey = v5, 
            secondaryButtonTextKey = v6, 
            primaryButtonCallback = v7, 
            secondaryButtonCallback = v8, 
            errorType = v9
        }));
    end;
end;
