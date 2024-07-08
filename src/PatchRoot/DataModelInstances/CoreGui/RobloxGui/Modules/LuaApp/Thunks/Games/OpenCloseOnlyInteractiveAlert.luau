local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v2 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
return function(v3, v4, v5, v6)
    return function(v7)
        v7:dispatch(v2(v1.CloseOnlyInteractiveAlert, {
            title = v3, 
            body = v4, 
            closeAlert = v5, 
            buttonText = v6
        }));
    end;
end;
