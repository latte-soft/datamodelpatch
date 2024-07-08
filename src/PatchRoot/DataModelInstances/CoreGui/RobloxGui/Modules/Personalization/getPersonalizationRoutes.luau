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
            [l_AppPage_0.Home] = l_createLazyComponent_0(function()
                return require(l_Modules_0.Personalization.Home.HomePage);
            end)
        }, 
        {
            [l_AppPage_0.Games] = l_createLazyComponent_0(function()
                return require(l_Modules_0.Personalization.Games.GamesPage);
            end)
        }, 
        {
            [l_AppPage_0.GamesList] = {
                screen = l_createLazyComponent_0(function()
                    return require(l_Modules_0.LuaApp.Components.Games.GamesList);
                end), 
                navigationOptions = {
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.OptionGroupOnly, 
                    enableFocusRestoration = false
                }
            }
        }, 
        {
            [l_AppPage_0.ExperienceDetail] = {
                screen = l_createLazyComponent_0(function()
                    return require(l_Modules_0.LuaApp.Components.ExperienceDetails.Navigation.ExperienceDetailsSelector);
                end), 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.FullScreen, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
                }
            }
        }, 
        {
            [l_AppPage_0.SearchPage] = {
                screen = l_createLazyComponent_0(function()
                    return require(l_Modules_0.LuaApp.Components.Search.AdaptiveSearchPage);
                end), 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.FullScreen, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll, 
                    enableFocusRestoration = false
                }
            }
        }
    };
end;
