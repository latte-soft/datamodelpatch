local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Workspace.Packages.Navigation);
local v2 = require(l_CorePackages_0.Workspace.Packages.TenFootUiCommon);
local l_ScreenKind_0 = v2.TenFootUiRNTypes.ScreenKind;
local l_GlobalNavDisplayOption_0 = v2.TenFootUiRNTypes.GlobalNavDisplayOption;
local l_createLazyComponent_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Components.createLazyComponent;
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
return function()
    return {
        {
            [l_AppPage_0.More] = {
                screen = l_createLazyComponent_0(function()
                    return require(l_Modules_0.LuaApp.Components.More.MorePage);
                end), 
                navigationOptions = {
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.OptionGroupOnly
                }
            }
        }, 
        {
            [l_AppPage_0.Settings] = {
                screen = l_createLazyComponent_0(function()
                    return require(l_Modules_0.LuaApp.Components.More.SettingsPage);
                end), 
                navigationOptions = {
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.OptionGroupOnly
                }
            }
        }, 
        {
            [l_AppPage_0.AdjustScreen] = {
                screen = l_createLazyComponent_0(function()
                    return require(l_Modules_0.Shell.Components.Overscan10ft.Overscan);
                end), 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.FullScreen, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
                }
            }
        }, 
        {
            [l_AppPage_0.About] = {
                screen = l_createLazyComponent_0(function()
                    return require(l_Modules_0.LuaApp.Components.More.AboutPage);
                end), 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.FullScreen, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.OptionGroupOnly
                }
            }
        }
    };
end;
