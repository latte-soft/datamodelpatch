local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local _ = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useLocalUserId;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v6 = require(l_Modules_0.LuaApp.Flags.FFlagDebugShowSiteMessageBanner);
return function()
    return not not v3(function(v7)
        return v7.getSiteMessageBanner();
    end) and l_useSelector_0((v2.useCallback(function(v8)
        return v8.SiteMessage and v8.SiteMessage.Text;
    end, {}))) ~= nil or v6;
end;
