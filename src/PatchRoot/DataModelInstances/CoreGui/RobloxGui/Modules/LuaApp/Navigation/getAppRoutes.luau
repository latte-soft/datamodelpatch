local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local _ = require(l_CorePackages_0.Workspace.Packages.Navigation);
local l_getAppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local function v10(v5)
    local v6 = {};
    for _, v8 in v5, nil, nil do
        local v9 = next(v8);
        if v6[v9] then
            error((("Duplicate route name found: %*"):format(v9)));
        end;
        v6[v9] = true;
    end;
end;
return function()
    local v11 = v1.List.join(require(l_Modules_0.LuaApp.Navigation.getLegacyRoutes)(l_getAppFeaturePolicies_0()), require(l_Modules_0.LuaApp.Components.Authentication.getAuthenticationRoutes)(), require(l_Modules_0.Personalization.getPersonalizationRoutes)(), require(l_Modules_0.LuaApp.Components.More.getMoreRoutes)(), {});
    v10(v11);
    return v11;
end;
