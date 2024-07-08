local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(script.Parent.RoactAnalytics);
local v2 = require(l_Modules_0.LuaApp.ArgCheck);
local v3 = require(l_Modules_0.LuaApp.Analytics.Events.buttonClick);
return {
    get = function(v4)
        local l_EventStream_0 = v1.get(v4).EventStream;
        return {
            ButtonActivated = function(v6, v7)
                v2.isType(v6, "string", "associatedPageType");
                v2.isType(v7, "string", "currentPage");
                v3(l_EventStream_0, "BottomBarButton", v6, v7);
            end
        };
    end
};
