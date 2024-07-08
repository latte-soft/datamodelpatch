local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
local l_getCurrentRouteState_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).getCurrentRouteState;
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local v5 = require(l_Modules_0.LuaApp.AppPageProperties);
return function()
    local v6 = l_getCurrentRouteState_0((l_useNavigation_0()));
    local l_routeName_0 = v6.routeName;
    local v8 = v5[l_routeName_0] or {};
    return {
        routeName = l_routeName_0, 
        titleLocalizationKey = v8.nameLocalizationKey, 
        headerBarDisplayOption = v8.headerBarDisplayOption, 
        searchUuid = if l_routeName_0 == l_AppPage_0.SearchPage and v6.params then v6.params.detail else nil
    };
end;
