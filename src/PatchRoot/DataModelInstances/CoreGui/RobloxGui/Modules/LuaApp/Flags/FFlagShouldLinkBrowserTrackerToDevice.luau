local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Enum.LocalStorageKey);
local l_AppStorageService_0 = game:GetService("AppStorageService");
game:DefineFastInt("LinkBrowserTrackerToDeviceRollout", 0);
return function()
    return ((not not l_AppStorageService_0 and v0) and tonumber(l_AppStorageService_0:GetItem(v0.BrowserTrackerId)) or 99) % 100 < game:GetFastInt("LinkBrowserTrackerToDeviceRollout");
end;
