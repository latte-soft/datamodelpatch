local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local _ = require(l_Modules_0.LuaApp.Thunks.CloseAccountAuthenticationFailureOverlay);
local v3 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local v4 = require(l_Modules_0.LuaApp.AppPage);
local v5 = require(l_Modules_0.LuaApp.Thunks.ResetNavigationHistory);
return function(v6, v7)
    v6:dispatch(v5({
        {
            name = v4.Landing
        }
    }));
    v6:dispatch(v3(v1.AccountAuthenticationFailureOverlay, {
        onActivated = v7
    }, {
        DisableBackButtonClose = true
    }));
end;
