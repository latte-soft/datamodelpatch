local v0 = require(script.Parent.GetFFlagHideOffscreenToasts);
game:DefineFastFlag("LuaAppsNotificationTimerChangesEnabled", false);
return function()
    return (game:GetFastFlag("LuaAppsNotificationTimerChangesEnabled") and game:GetEngineFeature("ToastNotificationTimerChangesEnabled")) and v0();
end;
