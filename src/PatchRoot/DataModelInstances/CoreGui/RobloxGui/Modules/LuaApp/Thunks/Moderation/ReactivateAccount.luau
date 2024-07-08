local l_GuiService_0 = game:GetService("GuiService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local v3 = require(l_Modules_0.LuaApp.Promise);
local v4 = require(l_Modules_0.LuaApp.Http.Requests.ModerationAPI.PostReactivate);
local v5 = require(l_Modules_0.LuaApp.Actions.Moderation.SetModerationStatus);
return function(v6, v7)
    return function(v8)
        return v4(v6, v7):andThen(function(_)
            v8:dispatch(v5(false));
            l_GuiService_0:BroadcastNotification("", v2.RESTART_LUA_APP);
            return v3.resolve();
        end, function(v10)
            return v3.reject({
                error = v10
            });
        end);
    end;
end;
