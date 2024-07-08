local l_AppStorageService_0 = game:GetService("AppStorageService");
local v1 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Enum.LocalStorageKey);
local v2 = {};
v2.__index = v2;
v2.getWebLogin = function()
    return tonumber(l_AppStorageService_0:GetItem(v1.WebLogin)) or 0;
end;
return v2;
