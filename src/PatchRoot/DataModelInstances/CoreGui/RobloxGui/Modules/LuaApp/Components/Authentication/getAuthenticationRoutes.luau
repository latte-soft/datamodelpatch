local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Packages.RoactNavigation);
local _ = require(l_CorePackages_0.Workspace.Packages.Navigation);
local v3 = require(l_CorePackages_0.Workspace.Packages.TenFootUiCommon);
local l_ScreenKind_0 = v3.TenFootUiRNTypes.ScreenKind;
local l_GlobalNavDisplayOption_0 = v3.TenFootUiRNTypes.GlobalNavDisplayOption;
local l_createLazyComponent_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Components.createLazyComponent;
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
return function()
    return {
        {
            [l_AppPage_0.PlatformAccountRouter] = {
                screen = l_createLazyComponent_0(function()
                    return require(l_CorePackages_0.Workspace.Packages.AppStartup).PlatformAccountRouter;
                end), 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.FullScreen, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
                }
            }
        }, 
        {
            [l_AppPage_0.EngagementScreenContainer] = {
                screen = l_createLazyComponent_0(function()
                    return require(l_CorePackages_0.Workspace.Packages.TenFootUiEngagementScreen).EngagementScreenContainer;
                end), 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.FullScreen, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
                }
            }
        }, 
        {
            [l_AppPage_0.Startup] = {
                screen = l_createLazyComponent_0(function()
                    return require(l_Modules_0.LuaApp.Components.Authentication.StartupPage);
                end), 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.FullScreen, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
                }
            }
        }, 
        {
            [l_AppPage_0.Authentication] = {
                screen = l_createLazyComponent_0(function()
                    return require(l_Modules_0.LuaApp.Components.Authentication.LandingPage);
                end), 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.FullScreen, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
                }
            }
        }, 
        {
            [l_AppPage_0.SinglePageSignUp] = {
                screen = l_createLazyComponent_0(function()
                    return require(l_Modules_0.LuaApp.Components.Authentication.SinglePageSignUp);
                end), 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.FullScreen, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
                }
            }
        }, 
        {
            [l_AppPage_0.SingleSignOnContainer] = {
                screen = l_createLazyComponent_0(function()
                    return require(l_Modules_0.LuaApp.Components.Authentication.SingleSignOnContainer);
                end), 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.FullScreen, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
                }
            }
        }, 
        {
            [l_AppPage_0.Login] = {
                screen = l_createLazyComponent_0(function()
                    return require(l_Modules_0.LuaApp.Components.Authentication.LoginView);
                end), 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.FullScreen, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
                }
            }
        }, 
        {
            [l_AppPage_0.CrossDeviceLogin] = {
                screen = l_createLazyComponent_0(function()
                    return require(l_Modules_0.LuaApp.Components.Authentication.CrossDeviceLogin.CrossDeviceLoginPage);
                end), 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.FullScreen, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
                }
            }
        }
    };
end;
