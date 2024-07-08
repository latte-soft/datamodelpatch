local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Analytics.Events.appStageLoaded);
local v2 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
return {
    get = function(v3)
        local v4 = v2.get(v3);
        return {
            reportAppReady = function(v5)
                v1(v4.EventStream, v5, "appReady");
            end
        };
    end
};
