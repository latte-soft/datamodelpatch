local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_Modules_0.LuaApp.AppPage);
local v5 = require(l_CorePackages_0.Workspace.Packages.TenFootUiCommon);
local l_ScreenKind_0 = v5.TenFootUiRNTypes.ScreenKind;
local l_GlobalNavDisplayOption_0 = v5.TenFootUiRNTypes.GlobalNavDisplayOption;
local v8 = require(l_Modules_0.Personalization.Home.HomePage);
local v9 = require(l_Modules_0.LuaApp.Components.More.MorePage);
local v10 = require(l_Modules_0.LuaApp.Components.More.SettingsPage);
local v11 = require(l_Modules_0.LuaApp.Components.More.AboutPage);
local v12 = require(l_Modules_0.LuaApp.Components.Games.GamesList);
local _ = require(l_Modules_0.LuaApp.Components.ExperienceDetails.ExperienceDetailsContainer);
local v14 = require(l_Modules_0.LuaApp.Components.ExperienceDetails.Navigation.ExperienceDetailsSelector);
local l_EngagementScreenContainer_0 = require(l_CorePackages_0.Workspace.Packages.TenFootUiEngagementScreen).EngagementScreenContainer;
local l_SwitchTab_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).SwitchTab;
local v17 = require(l_Modules_0.LuaApp.Components.Authentication.LoginView);
local v18 = require(l_Modules_0.LuaApp.Components.Authentication.StartupPage);
local v19 = require(l_Modules_0.LuaApp.Components.Authentication.SinglePageSignUp);
local v20 = require(l_Modules_0.LuaApp.Components.Authentication.LandingPage);
local v21 = require(l_Modules_0.LuaApp.Components.Authentication.SingleSignOnContainer);
local v22 = require(l_Modules_0.LuaApp.Components.Authentication.CrossDeviceLogin.CrossDeviceLoginPage);
local v23 = require(l_Modules_0.LuaApp.Components.Profile.ProfileUniversalAppWrapper.Container);
local v24 = require(l_Modules_0.LuaApp.Components.BuyRobux.BuyRobuxContainer);
local v25 = require(l_Modules_0.LuaApp.Constants);
local v26 = require(l_Modules_0.LuaApp.Components.Search.TenFootUi.TenFootUiSearch);
local v27 = require(l_Modules_0.LuaApp.Components.SocialTab.SocialTabUniversalAppWrapper.Container);
local v28 = require(l_Modules_0.LuaApp.Components.FriendsLanding.AddFriendsUniversalAppWrapper);
local v29 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarExperienceRootContainer);
local l_PlatformAccountRouter_0 = require(l_CorePackages_0.Workspace.Packages.AppStartup).PlatformAccountRouter;
local v31 = require(script.Parent.screenWrapper);
local v32 = require(script.Parent.PlaceholderSettingsPage);
local v33 = require(script.Parent.PlaceholderAboutPage);
local l_ReportScreen_0 = require(l_CorePackages_0.Workspace.Packages.AbuseReporting).ReportScreen;
local v35 = require(l_Modules_0.Shell.Components.Overscan10ft.Overscan);
local _ = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies;
local v37 = require(l_Modules_0.LuaApp.Components.Challenge.NativeWrapper);
local _ = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableFriendsLandingControllerBar;
local l_GetFFlagTenFootMoreSettingsAndAboutRefactor_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagTenFootMoreSettingsAndAboutRefactor;
return {
    switchRoutes = {}, 
    stackRoutes = {
        {
            [v4.Landing] = {
                navigatorConfig = {
                    initialRouteKey = v4.PlatformAccountRouter
                }, 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.FullScreen
                }, 
                screenStack = {
                    {
                        [v4.PlatformAccountRouter] = {
                            screen = l_PlatformAccountRouter_0, 
                            navigationOptions = {
                                screenKind = l_ScreenKind_0.FullScreen, 
                                globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
                            }
                        }
                    }, 
                    {
                        [v4.EngagementScreenContainer] = {
                            screen = l_EngagementScreenContainer_0, 
                            navigationOptions = {
                                screenKind = l_ScreenKind_0.FullScreen, 
                                globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
                            }
                        }
                    }, 
                    {
                        [v4.Startup] = {
                            screen = v18, 
                            navigationOptions = {
                                screenKind = l_ScreenKind_0.FullScreen, 
                                globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
                            }
                        }
                    }, 
                    {
                        [v4.Authentication] = {
                            screen = v20, 
                            navigationOptions = {
                                screenKind = l_ScreenKind_0.FullScreen, 
                                globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
                            }
                        }
                    }, 
                    {
                        [v4.SinglePageSignUp] = {
                            screen = v19, 
                            navigationOptions = {
                                screenKind = l_ScreenKind_0.FullScreen, 
                                globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
                            }
                        }
                    }, 
                    {
                        [v4.SingleSignOnContainer] = {
                            screen = v21, 
                            navigationOptions = {
                                screenKind = l_ScreenKind_0.FullScreen, 
                                globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
                            }
                        }
                    }, 
                    {
                        [v4.Login] = {
                            screen = v17, 
                            navigationOptions = {
                                screenKind = l_ScreenKind_0.FullScreen, 
                                globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
                            }
                        }
                    }, 
                    {
                        [v4.CrossDeviceLogin] = {
                            screen = v22, 
                            navigationOptions = {
                                screenKind = l_ScreenKind_0.FullScreen, 
                                globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
                            }
                        }
                    }
                }
            }
        }, 
        {
            [l_SwitchTab_0.HomeTab] = {
                navigatorConfig = {
                    initialRouteKey = v4.Home
                }, 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.Default, 
                    tabIndex = 1
                }, 
                screenStack = {
                    {
                        [v4.Home] = {
                            screen = v8, 
                            navigationOptions = {
                                screenKind = l_ScreenKind_0.Default
                            }
                        }
                    }, 
                    {
                        [v4.ProfilePeekView] = {
                            screen = v23, 
                            navigationOptions = {
                                screenKind = l_ScreenKind_0.Default
                            }
                        }
                    }
                }
            }
        }, 
        {
            [l_SwitchTab_0.AvatarExperienceTab] = {
                navigatorConfig = {
                    initialRouteKey = v4.AvatarExperienceRoot
                }, 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.Default, 
                    tabIndex = 2
                }, 
                screenStack = {
                    {
                        [v4.AvatarExperienceRoot] = {
                            screen = v29, 
                            navigationOptions = {
                                screenKind = l_ScreenKind_0.Default, 
                                hasSubNavigation = true
                            }
                        }
                    }
                }
            }
        }, 
        {
            [l_SwitchTab_0.ChatTab] = {
                navigatorConfig = {
                    initialRouteKey = v4.Chat
                }, 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.Default, 
                    tabIndex = 3
                }, 
                screenStack = {
                    {
                        [v4.Chat] = {
                            screen = v27, 
                            navigationOptions = {
                                screenKind = l_ScreenKind_0.Default
                            }
                        }
                    }
                }
            }
        }
    }, 
    commonStackRoutes = {
        {
            [v25.TempRnSwitchNavigatorName] = {
                screen = function(_)
                    return v3.createElement(v3.Fragment);
                end, 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.Default
                }
            }
        }, 
        {
            [v4.PurchaseRobux] = {
                screen = v24, 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.FullScreen, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
                }
            }
        }, 
        {
            [v4.SearchPage] = {
                screen = v26, 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.FullScreen, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll, 
                    enableFocusRestoration = false
                }
            }
        }, 
        {
            [v4.GamesList] = {
                screen = v12, 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.Default, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.OptionGroupOnly, 
                    enableFocusRestoration = false
                }
            }
        }, 
        {
            [v4.More] = {
                screen = v9, 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.Default, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.OptionGroupOnly
                }
            }
        }, 
        {
            [v4.ExperienceDetail] = {
                screen = v14, 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.FullScreen, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
                }
            }
        }, 
        {
            [v4.ReportScreen] = {
                screen = l_ReportScreen_0, 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.FullScreen, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
                }
            }
        }, 
        {
            [v4.AddFriendsPage] = {
                screen = v28, 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.Default, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.OptionGroupOnly
                }
            }
        }, 
        {
            [v4.Settings] = {
                screen = if not l_GetFFlagTenFootMoreSettingsAndAboutRefactor_0() then v31(v32) else v10, 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.Default, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.OptionGroupOnly
                }
            }
        }, 
        {
            [v4.AdjustScreen] = {
                screen = v35, 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.FullScreen, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
                }
            }
        }, 
        {
            [v4.About] = {
                screen = if not l_GetFFlagTenFootMoreSettingsAndAboutRefactor_0() then v31(v33) else v11, 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.FullScreen, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.OptionGroupOnly
                }
            }
        }, 
        {
            [v4.CrossDeviceLogin] = {
                screen = v22, 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.Default, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.OptionGroupOnly
                }
            }
        }, 
        {
            [v4.ChallengeNativeWrapper] = {
                screen = v31(v37, function(v41)
                    return v41.navigation.state.params.extraProps or {};
                end), 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.Default, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.OptionGroupOnly
                }
            }
        }
    }
};
