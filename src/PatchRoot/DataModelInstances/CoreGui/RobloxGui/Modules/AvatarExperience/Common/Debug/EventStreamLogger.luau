local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v4 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local l_NavigationEvents_0 = require(l_CorePackages_0.RoactNavigation).NavigationEvents;
return function(v6)
    local v7 = v3(v4);
    local function v8()
        v7.EventStream:sendEventDeferred(v6.eventContext, v6.eventName, v6.additionalArgs);
    end;
    v2.useEffect(function()
        if v6.when == "OnMount" then
            v7.EventStream:sendEventDeferred(v6.eventContext, v6.eventName, v6.additionalArgs);
        end;
    end, {});
    if v6.when == "OnFocus" then
        return v2.createElement(l_NavigationEvents_0, {
            onDidFocus = v8
        });
    else
        return nil;
    end;
end;
