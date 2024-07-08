local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_Events_0 = l_Modules_0.LuaApp.Analytics.Events;
local v2 = require(l_Events_0.pageHeartbeat);
local v3 = require(l_Events_0.userInteractions);
local v4 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
return {
    get = function(v5)
        local v6 = v4.get(v5);
        return {
            reportPageHeartbeat = function(v7, v8)
                v2(v6.EventStream, v7, v8);
            end, 
            reportPageChanged = function()
                v3(v6.EventStream, "luaPage");
            end
        };
    end
};
