local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.React);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v5 = require(l_Modules_0.LuaApp.Hooks.usePageNavigationOptions);
local v6 = require(l_Modules_0.LuaApp.Hooks.useAppHeaderBarProps);
return v2.memo(function()
    local v7 = v6((v5()));
    if next(v7) ~= nil then
        return v2.createElement(v4.Container, v7);
    else
        return nil;
    end;
end);
