local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local _ = require(l_Modules_0.AvatarExperience.Catalog.SearchTypes);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
return function()
    local v6 = l_useNavigation_0();
    local v7 = if not (v6.state.routeName == v2.CatalogSearch) then nil else v6.getParam("detail");
    return (l_useSelector_0(function(v8)
        if not v7 then
            return nil;
        else
            return v8.SearchesParameters[v7];
        end;
    end));
end;
