local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Workspace.Packages.TenFootUiCommon);
local l_FFlagUnifyNavigationGraph_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUnifyNavigationGraph;
return {
    LuaAppEvents = require(l_Modules_0.LuaApp.LuaAppEvents), 
    RoactAnalytics = require(l_Modules_0.LuaApp.Services.RoactAnalytics), 
    RoactNetworking = require(l_Modules_0.LuaApp.Services.RoactNetworking), 
    buttonClick = require(l_Modules_0.LuaApp.Analytics.Events.buttonClick), 
    globalNavConfig = require(script.Parent.globalNavConfig), 
    useRoactService = require(l_Modules_0.LuaApp.Hooks.useRoactService), 
    routerConfig = if not l_FFlagUnifyNavigationGraph_0 then require(script.Parent.routerConfig) else nil, 
    ApplyRoactNavigationHistory = if not l_FFlagUnifyNavigationGraph_0 then require(l_Modules_0.LuaApp.Actions.ApplyRoactNavigationHistory) else nil, 
    AppPage = require(l_Modules_0.LuaApp.AppPage), 
    SetTopBarHeight = require(l_Modules_0.LuaApp.Actions.SetTopBarHeight), 
    LoginStatus = require(l_Modules_0.LuaApp.Enum.LoginStatus), 
    RootNavigator = require(l_Modules_0.LuaApp.Navigation.RootNavigator)
};
