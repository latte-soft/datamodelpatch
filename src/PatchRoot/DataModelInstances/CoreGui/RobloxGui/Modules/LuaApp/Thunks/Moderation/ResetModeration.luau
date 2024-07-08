local l_GuiService_0 = game:GetService("GuiService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local v3 = require(l_Modules_0.LuaApp.Actions.Moderation.SetModerationStatus);
return function()
    return function(v4)
        v4:dispatch(v3(false));
        l_GuiService_0:BroadcastNotification("", v2.RESTART_LUA_APP);
    end;
end;
