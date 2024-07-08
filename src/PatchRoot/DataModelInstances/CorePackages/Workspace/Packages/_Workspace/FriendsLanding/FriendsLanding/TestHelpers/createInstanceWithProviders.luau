local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_jest_0 = require(l_script_FirstAncestor_0.devDependencies).JestGlobals.jest;
local v4 = require(l_script_FirstAncestor_0.installReducer);
local l_t_0 = v2.t;
local v6 = require(l_script_FirstAncestor_0.Friends.filterStates);
local v7 = require(l_script_FirstAncestor_0.Utils.foldProviders);
local v8 = require(l_script_FirstAncestor_0.FriendsLandingContext);
local v9 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics);
local v10 = require(l_script_FirstAncestor_0.EnumScreens);
local l_llama_0 = v2.llama;
local l_UIBlox_0 = v2.UIBlox;
local l_Roact_0 = v2.Roact;
local l_Rodux_0 = v2.Rodux;
local l_RoactRodux_0 = v2.RoactRodux;
local l_RoactNavigation_0 = v2.RoactNavigation;
local v17 = require(l_Parent_0.ApolloClient);
local v18 = require(l_Parent_0.GraphQLServer);
local v19 = require(l_Parent_0.UserProfiles);
local l_mockApolloClient_0 = v18.ApolloClientTestUtils.mockApolloClient;
local v21 = require(l_Parent_0.ReactFocusNavigation);
local l_FocusNavigationService_0 = v21.FocusNavigationService;
local l_CoreGui_0 = v21.EngineInterface.CoreGui;
local l_DesignTokenProvider_0 = require(l_Parent_0.Style).DesignTokenProvider;
local v25 = l_t_0.strictInterface({
    context = l_t_0.optional(l_t_0.table), 
    initialState = l_t_0.optional(l_t_0.table), 
    props = l_t_0.optional(l_t_0.table), 
    store = l_t_0.optional(l_t_0.table), 
    policy = l_t_0.optional(l_t_0.table), 
    analytics = l_t_0.optional(l_t_0.table), 
    navigation = l_t_0.optional(l_t_0.table), 
    apolloClient = l_t_0.optional(l_t_0.table)
});
local v26 = {
    state = {
        params = {}, 
        routeName = "", 
        key = ""
    }, 
    dispatch = function()
    end, 
    goBack = function()
    end, 
    addListener = function()
    end, 
    isFocused = function()
    end, 
    setParams = function()
    end, 
    getParam = function()
    end, 
    navigate = function()
    end
};
return function(v27)
    return function(v28, v29)
        assert(v25(v29));
        local l_ScreenGui_0 = Instance.new("ScreenGui");
        l_ScreenGui_0.Parent = game:GetService("CoreGui");
        local v31 = {};
        local v33 = l_Rodux_0.Store.new(l_Rodux_0.combineReducers({
            FriendsLanding = v4(), 
            LocalUserId = function(v32)
                return v32;
            end
        }), l_llama_0.Dictionary.join({
            LocalUserId = "LocalUserId", 
            FriendsLanding = {
                NetworkStatus = {
                    ["https://friends.roblox.com//v1/users/test/friends"] = "Done"
                }
            }
        }, v29.initialState), {
            l_Rodux_0.thunkMiddleware
        });
        local v34 = {
            getShowDisplayName = function()
                return true;
            end, 
            getFriendFinder = function()
                return true;
            end, 
            getAccountProviderName = function()
                return "";
            end, 
            shouldInviteFromAccountProvider = function()
                return true;
            end, 
            getEnableProfileQrCode = function()
                return true;
            end
        };
        table.insert(v31, {
            v2.UniversalAppPolicy.Provider, 
            {
                policy = {
                    function()
                        return l_llama_0.Dictionary.join(v34, v29.policy);
                    end
                }
            }
        });
        local v35 = l_mockApolloClient_0({});
        v35:writeQuery({
            variables = {
                userIds = {
                    "0"
                }
            }, 
            query = v19.Queries.userProfilesCombinedNameAndUsernameByUserIds, 
            data = {
                userProfiles = {
                    {
                        __typename = "UserProfile", 
                        id = "0", 
                        names = {
                            __typename = "Names", 
                            combinedName = "test", 
                            username = "test"
                        }
                    }
                }
            }
        });
        v35:writeQuery({
            variables = {
                userIds = {
                    "40"
                }
            }, 
            query = v19.Queries.userProfilesCombinedNameAndUsernameByUserIds, 
            data = {
                userProfiles = {
                    {
                        __typename = "UserProfile", 
                        id = "40", 
                        names = {
                            __typename = "Names", 
                            combinedName = "offlineFriend1", 
                            username = "offlineFriend1"
                        }
                    }
                }
            }
        });
        v35:writeQuery({
            variables = {
                userIds = {
                    "39"
                }
            }, 
            query = v19.Queries.userProfilesCombinedNameAndUsernameByUserIds, 
            data = {
                userProfiles = {
                    {
                        __typename = "UserProfile", 
                        id = "39", 
                        names = {
                            __typename = "Names", 
                            combinedName = "offlineFriend2", 
                            username = "offlineFriend2"
                        }
                    }
                }
            }
        });
        v35:writeQuery({
            variables = {
                userIds = {
                    "38"
                }
            }, 
            query = v19.Queries.userProfilesCombinedNameAndUsernameByUserIds, 
            data = {
                userProfiles = {
                    {
                        __typename = "UserProfile", 
                        id = "38", 
                        names = {
                            __typename = "Names", 
                            combinedName = "onlineFriend", 
                            username = "onlineFriend"
                        }
                    }
                }
            }
        });
        v35:writeQuery({
            variables = {
                userIds = {
                    "37"
                }
            }, 
            query = v19.Queries.userProfilesCombinedNameAndUsernameByUserIds, 
            data = {
                userProfiles = {
                    {
                        __typename = "UserProfile", 
                        id = "37", 
                        names = {
                            __typename = "Names", 
                            combinedName = "inGameFriend", 
                            username = "inGameFriend"
                        }
                    }
                }
            }
        });
        v35:writeQuery({
            variables = {
                userIds = {
                    "36"
                }
            }, 
            query = v19.Queries.userProfilesCombinedNameAndUsernameByUserIds, 
            data = {
                userProfiles = {
                    {
                        __typename = "UserProfile", 
                        id = "36", 
                        names = {
                            __typename = "Names", 
                            combinedName = "inStudioFriend", 
                            username = "inStudioFriend"
                        }
                    }
                }
            }
        });
        v35:writeQuery({
            variables = {
                userIds = {
                    "123"
                }
            }, 
            query = v19.Queries.userProfilesCombinedNameAndUsernameByUserIds, 
            data = {
                userProfiles = {
                    {
                        __typename = "UserProfile", 
                        id = "123", 
                        names = {
                            __typename = "Names", 
                            combinedName = "rowan", 
                            username = "mance"
                        }
                    }
                }
            }
        });
        v35:writeQuery({
            variables = {
                userIds = {
                    "456"
                }
            }, 
            query = v19.Queries.userProfilesCombinedNameAndUsernameByUserIds, 
            data = {
                userProfiles = {
                    {
                        __typename = "UserProfile", 
                        id = "456", 
                        names = {
                            __typename = "Names", 
                            combinedName = "henry", 
                            username = "williams"
                        }
                    }
                }
            }
        });
        table.insert(v31, {
            v17.ApolloProvider, 
            {
                client = v35
            }
        });
        local v36 = {
            setFilterKeys = l_jest_0.fn(), 
            refreshPage = l_jest_0.fn(), 
            wideMode = true, 
            screenSize = Vector2.new(512, 512), 
            filter = v6.All, 
            navigateToLuaAppPages = {
                [v10.FriendFinder] = l_jest_0.fn()
            }, 
            getScreenTopBar = function()
                return {
                    shouldRenderCenter = false
                };
            end, 
            friendRequestCount = 0, 
            setScreenTopBar = l_jest_0.fn()
        };
        if v29.context then
            l_llama_0.Dictionary.map(v29.context, function(v37, v38)
                v36[v38] = v37;
            end);
        end;
        table.insert(v31, {
            v8.Provider, 
            {
                value = v36
            }
        });
        table.insert(v31, {
            v9.Context.Provider, 
            {
                value = v29.analytics or {
                    buttonClick = l_jest_0.fn(), 
                    pageLoaded = l_jest_0.fn(), 
                    navigate = l_jest_0.fn(), 
                    pageLoadingTimeReport = l_jest_0.fn(), 
                    pageLoadedWithArgs = l_jest_0.fn(), 
                    pageMountingTimeReport = l_jest_0.fn(), 
                    impressionEvent = l_jest_0.fn()
                }
            }
        });
        table.insert(v31, {
            l_UIBlox_0.App.Style.AppStyleProvider, 
            {
                style = {
                    themeName = "Dark", 
                    fontName = "Gotham"
                }
            }
        });
        table.insert(v31, {
            l_RoactNavigation_0.Provider, 
            {
                value = l_llama_0.Dictionary.join(v26, v29.navigation)
            }
        });
        table.insert(v31, {
            l_DesignTokenProvider_0, 
            {
                tokenMappers = {
                    App = function(_, v40)
                        return {
                            Page = {
                                BackgroundColor = v40.Semantic.Color.Background.Default.Color3, 
                                BackgroundTransparency = v40.Semantic.Color.Background.Default.Transparency, 
                                SafeAreaMargin = Vector2.new(v40.Global.Space_800, v40.Global.Space_300)
                            }
                        };
                    end, 
                    FriendsLanding = function(_, _)
                        return {
                            AddFriendsPage = {}, 
                            FriendsLandingPage = {
                                GridViewItemMetrics = {
                                    minimumItemsPerRow = 6, 
                                    minimumItemWidth = 258
                                }
                            }, 
                            ShowMore = {}
                        };
                    end
                }
            }
        });
        local v43 = l_FocusNavigationService_0.new(l_CoreGui_0);
        table.insert(v31, {
            v21.FocusNavigationContext.Provider, 
            {
                value = v43
            }
        });
        table.insert(v31, {
            l_RoactRodux_0.StoreProvider, 
            {
                store = v29.store or v33
            }
        });
        table.insert(v31, {
            l_UIBlox_0.App.Style.AppStyleProvider, 
            {
                style = {
                    themeName = "Dark", 
                    fontName = "Gotham"
                }
            }
        });
        local v44 = l_Roact_0.mount(v27((v7(l_Roact_0.createElement(v28, l_llama_0.Dictionary.join(v29.props)), v31))), l_ScreenGui_0);
        return l_ScreenGui_0, function()
            l_Roact_0.unmount(v44);
            l_ScreenGui_0:Destroy();
            v43:focusGuiObject(nil);
            v43:teardown();
        end;
    end;
end;
