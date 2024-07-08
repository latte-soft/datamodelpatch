local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v2 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
return function()
    return function(v3)
        v3:dispatch(v2(v1.PurchasePassInsufficientRobux));
    end;
end;
