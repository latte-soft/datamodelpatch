local l_Parent_0 = script:FindFirstAncestor("TenFootUiTesting").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Style);
local v4 = require(l_Parent_0.UIBlox);
local l_AppNotificationService_0 = require(l_Parent_0.RoactServiceTags).AppNotificationService;
local l_AppLogging_0 = require(l_Parent_0.RoactServiceTags).AppLogging;
local v7 = require(l_Parent_0.AppCommonLib);
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local v9 = require(l_Parent_0.RoactServices);
local v10 = require(l_Parent_0.Dev.JestGlobals);
local v11 = require(script.Parent.mockProviders);
local l_TenFootUiContext_0 = require(l_Parent_0.TenFootUiCommon).TenFootUiContext;
local v13 = require(l_Parent_0.TenFootUiCommon);
local l_LoginStatus_0 = require(l_Parent_0.RobloxAppEnums).LoginStatus;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_SwitchTab_0 = require(l_Parent_0.RobloxAppEnums).SwitchTab;
local l_ScreenKind_0 = v13.TenFootUiRNTypes.ScreenKind;
local l_Constants_0 = v4.App.Style.Constants;
local v19 = require(l_Parent_0.RoactNavigation);
local v20 = require(l_Parent_0.NavigationRodux);
local l_jest_0 = v10.jest;
local l_Signal_0 = v7.Signal;
local l_DesignTokenProvider_0 = v3.DesignTokenProvider;
local v24 = {
    AuthenticationStatus = {
        status = l_LoginStatus_0.LOGGED_IN
    }, 
    Startup = {
        Preloading = false
    }, 
    CrossPlaySettings = {
        Status = {
            isEnabled = true, 
            isSystemPrivilegeEnabled = true
        }, 
        SystemPrivileges = {}, 
        NetworkStatus = {}, 
        LuaError = nil, 
        HttpError = nil, 
        SystemError = nil
    }
};
local v25 = {
    tabs = {
        {
            titleLocalizationKey = "CommonUI.Features.Label.Home", 
            page = l_SwitchTab_0.HomeTab, 
            icon = "icons/menu/home_on", 
            actionType = nil
        }, 
        {
            titleLocalizationKey = "CommonUI.Features.Label.Discover", 
            page = l_SwitchTab_0.GamesTab, 
            icon = "icons/menu/games_on", 
            actionType = Enum.AppShellActionType.TapGamePageTab
        }, 
        {
            titleLocalizationKey = "CommonUI.Features.Label.Avatar", 
            page = l_SwitchTab_0.AvatarExperienceTab, 
            iconComponent = function()
                return v2.createElement("Frame");
            end, 
            actionType = Enum.AppShellActionType.TapAvatarTab
        }
    }, 
    options = {
        {
            titleLocalizationKey = "Feature.Catalog.Label.Search", 
            page = l_AppPage_0.SearchPage, 
            icon = "icons/common/search", 
            actionType = nil
        }, 
        {
            titleLocalizationKey = "Feature.Home.Robux", 
            page = l_AppPage_0.PurchaseRobux, 
            icon = "icons/common/goldrobux", 
            actionType = nil
        }
    }
};
local function _(v26)
    return v19.createNavigator(v19.RobloxSwitchView, v19.StackRouter(v26), {});
end;
local function v29(_)
    return v2.createElement("Frame", {});
end;
local v30 = {
    switchRoutes = {
        {
            [l_AppPage_0.Landing] = {
                screen = v29, 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.Default, 
                    animationStyle = "None"
                }
            }
        }, 
        {
            [l_AppPage_0.Startup] = {
                screen = v29, 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.Default, 
                    animationStyle = "None"
                }
            }
        }, 
        {
            [l_SwitchTab_0.HomeTab] = {
                screen = v29, 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.Default, 
                    animationStyle = "None"
                }
            }
        }, 
        {
            [l_SwitchTab_0.AvatarExperienceTab] = {
                screen = v29, 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.Default, 
                    animationStyle = "None"
                }
            }
        }
    }, 
    stackRoutes = {
        {
            [l_SwitchTab_0.GamesTab] = {
                navigatorConfig = {
                    initialRouteKey = l_AppPage_0.Games
                }, 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.Default, 
                    animationStyle = "None"
                }, 
                screenStack = {
                    {
                        [l_AppPage_0.Games] = {
                            screen = v29, 
                            navigationOptions = {
                                screenKind = l_ScreenKind_0.Default, 
                                animationStyle = "None"
                            }
                        }
                    }
                }
            }
        }
    }, 
    commonStackRoutes = {
        {
            [l_AppPage_0.SearchPage] = {
                screen = v29, 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.Default, 
                    animationStyle = "None"
                }
            }
        }, 
        {
            [l_AppPage_0.PurchaseRobux] = {
                screen = v29, 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.Default, 
                    animationStyle = "None"
                }
            }
        }
    }
};
local function v37(v31, v32)
    local v33 = {
        ReloadPage = l_Signal_0.new(), 
        ReportMutedError = l_Signal_0.new()
    };
    v33.ReloadPage.fire = l_jest_0.fn();
    v33.ReportMutedError.fire = l_jest_0.fn();
    local v34 = newproxy(true);
    local v35 = {
        [l_AppNotificationService_0] = v32, 
        [v34] = {
            EventStream = {}
        }
    };
    return {
        LuaAppEvents = v33, 
        RoactAnalytics = v34, 
        buttonClick = l_jest_0.fn(), 
        globalNavConfig = v31, 
        useRoactService = l_jest_0.fn().mockImplementation(function(v36)
            return v35[v36];
        end), 
        routerConfig = v30, 
        ApplyRoactNavigationHistory = l_jest_0.fn().mockImplementation(function()
            return {
                type = "ApplyRoactNavigationHistory"
            };
        end), 
        RootNavigator = v19.createNavigator(v19.RobloxSwitchView, v19.StackRouter({
            {
                Foo = function()
                    return nil;
                end
            }
        }), {})
    };
end;
local function _()
    return {
        ActionTaken = l_jest_0.fn()
    };
end;
local function v39()
    return {
        logEventWithTimestamp = l_jest_0.fn(), 
        logEvent = l_jest_0.fn(), 
        logEventOnce = l_jest_0.fn(), 
        getTimestamp = l_jest_0.fn(), 
        logRobloxTelemetryEvent = l_jest_0.fn(), 
        logEphemeralCounterEvent = l_jest_0.fn(), 
        logEphemeralStatEvent = l_jest_0.fn()
    };
end;
local function v41(v40)
    return v40 or v25;
end;
local function v47(v42)
    local v43 = {
        state = v1.Dictionary.join({
            index = 1, 
            routes = {
                {
                    key = "Landing", 
                    routeName = l_AppPage_0.Landing
                }, 
                {
                    key = "Startup", 
                    routeName = l_AppPage_0.Startup
                }, 
                {
                    key = "Home", 
                    routeName = l_SwitchTab_0.HomeTab
                }, 
                {
                    key = "Games", 
                    routeName = l_SwitchTab_0.GamesTab
                }, 
                {
                    key = "AvatarExperienceRoot", 
                    routeName = l_SwitchTab_0.AvatarExperienceTab
                }, 
                {
                    key = "SearchPage", 
                    routeName = l_AppPage_0.SearchPage
                }, 
                {
                    key = "PurchaseRobux", 
                    routeName = l_AppPage_0.PurchaseRobux
                }
            }, 
            routeName = v20.Constants.TempRnSwitchNavigatorName
        }, v42 or {}), 
        isFocused = l_jest_0.fn().mockReturnValue(false), 
        addListener = l_jest_0.fn().mockImplementation(function()
            return {
                remove = l_jest_0.fn()
            };
        end), 
        dispatch = l_jest_0.fn(), 
        getParam = l_jest_0.fn()
    };
    v43.navigate = l_jest_0.fn().mockImplementation(function(v44)
        local v46 = v1.List.findWhere(v43.state.routes, function(v45)
            return v45.routeName == v44;
        end);
        if v46 ~= nil then
            v43.state = v1.Dictionary.join(v43.state, {
                index = v46
            });
            return ;
        else
            error("No navigated route [" .. v44 .. "] has been mocked");
            return ;
        end;
    end);
    v43.getChildNavigation = l_jest_0.fn();
    v43.router = {
        getScreenOptions = l_jest_0.fn()
    };
    return v43;
end;
local v48 = {};
v48.__index = v48;
v48.new = function(v49)
    local v50 = {
        locale = v49, 
        changed = l_Signal_0.new()
    };
    setmetatable(v50, v48);
    return v50;
end;
v48.SetLocale = function(v51, v52)
    if v51.locale ~= v52 then
        v51.locale = v52;
        v51.changed:fire();
    end;
end;
v48.GetLocale = function(v53)
    return v53.locale;
end;
v48.Format = function(_, v55, _)
    return "Localized:" .. v55;
end;
makeMockLocalization = function()
    return v48.new("en-us");
end;
local function v69(v57)
    v57 = v57 or {};
    assert(v57, "Config must not be nil");
    local v58 = makeMockLocalization();
    local v59 = v57.globalNavConfig or v25;
    local v60 = {
        ActionTaken = l_jest_0.fn()
    };
    local v61 = v39();
    local v62 = v47(v57.navigationState);
    local v63 = v37(v59, v60);
    return {
        function(v64)
            return v11(v64.children, {
                includeStoreProvider = true, 
                includeStyleProvider = true, 
                includeNavigationProvider = true, 
                includeAppPolicyProvider = true, 
                store = v57.store, 
                initialStoreState = v57.initialStoreState or {}, 
                navigation = v62, 
                appStyle = {
                    themeName = l_Constants_0.ThemeName.Dark, 
                    fontName = l_Constants_0.FontName.Gotham, 
                    deviceType = "Console"
                }, 
                policyFactory = v57.policyFactory, 
                appPolicy = v57.appPolicy
            });
        end, 
        function(v65)
            return v2.createElement(l_DesignTokenProvider_0, {
                tokenMappers = v57.tokenMappers or {}, 
                uiModeInfo = {
                    deviceType = "Console", 
                    uiMode = "TenFoot"
                }
            }, v65.children);
        end, 
        function(v66)
            return v2.createElement(l_LocalizationProvider_0, {
                localization = v58
            }, v66.children);
        end, 
        function(v67)
            return v2.createElement(l_TenFootUiContext_0.Provider, {
                value = v57.tenFootUiContext or v63
            }, v67.children);
        end, 
        function(v68)
            return v2.createElement(v9.RoactServices.ServiceProvider, {
                services = {
                    [l_AppLogging_0] = v61
                }
            }, v68.children);
        end
    }, {
        globalNavConfig = v59, 
        mockNavigation = v62, 
        mockTenFootUiContext = v63, 
        mockNotificationService = v60, 
        mockLogging = v61
    };
end;
local function v78(v70)
    return {
        state = v70, 
        dispatch = function()
        end, 
        getParam = function(...)
        end, 
        addListener = function(_, _)
            return {
                remove = function()
                end
            };
        end, 
        getChildNavigation = function(_)
            return nil;
        end, 
        router = {
            getScreenOptions = function(_, _)
                return {};
            end, 
            getStateForAction = function(_, v77)
                return v77;
            end
        }, 
        _dangerouslyGetParent = function()
            return nil;
        end
    };
end;
return {
    makeMockGlobalNavConfig = v41, 
    makeMockProviders = v69, 
    makeMockDescriptor = function(v79, v80, v81, _, _, _, _, _)
        local v87 = nil;
        local v88 = nil;
        local v89 = v2.Component:extend("TestComponent");
        v89.render = function(v90)
            v87 = v90.props.navigation;
            v88 = v90.props.screenProps;
            return nil;
        end;
        return {
            getComponent = function()
                return v89;
            end, 
            key = v79, 
            options = {
                screenKind = v81
            }, 
            navigation = v78(v80), 
            state = v80
        }, v87, v88;
    end, 
    makeMockLocalization = makeMockLocalization, 
    makeTenFootUiContextMocks = v37, 
    mockCrossPlayState = v24
};
