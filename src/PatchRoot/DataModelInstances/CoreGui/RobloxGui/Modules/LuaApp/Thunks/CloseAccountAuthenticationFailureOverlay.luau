local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v2 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
return function()
    return function(v3)
        if v3:getState().CentralOverlay.OverlayType == v1.AccountAuthenticationFailureOverlay then
            v3:dispatch(v2());
        end;
    end;
end;
