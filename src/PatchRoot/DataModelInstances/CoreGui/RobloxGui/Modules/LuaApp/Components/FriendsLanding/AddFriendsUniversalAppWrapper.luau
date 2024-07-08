local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.Cryo);
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local v4 = require(script:FindFirstAncestor("Modules").LuaApp.Components.FriendsLanding.FriendsLandingUniversalAppWrapper.Container);
return function(v5)
    return v1.createElement(v4, v2.Dictionary.join(v5, {
        entryPage = l_AppPage_0.AddFriendsPage
    }));
end;
