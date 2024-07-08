local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_llama_0 = v1.llama;
local l_RoactNavigation_0 = v1.RoactNavigation;
local l_BackBehavior_0 = v1.RoactNavigation.BackBehavior;
local v6 = require(l_script_FirstAncestor_0.SocialTabContext);
local v7 = require(l_script_FirstAncestor_0.SocialTabEventReceiver);
local v8 = require(l_script_FirstAncestor_0.SocialTabNavigationEventReceiver);
local v9 = require(l_script_FirstAncestor_0.Components.SocialTabContainer);
local v10 = require(l_script_FirstAncestor_0.EnumScreens);
local l_getFFlagEnableNewChatTabExperimentAndroidBackButtonFix_0 = v1.AppChat.Flags.getFFlagEnableNewChatTabExperimentAndroidBackButtonFix;
local l_default_0 = v1.SocialCommon.Experiments.NewChatTabExperimentation.default;
local function v13(v14)
    local l_state_0 = v14.state;
    local v16 = l_state_0.routes and l_state_0.routes[l_state_0.index];
    if not v16 or not v16.routes then
        return l_RoactNavigation_0.getActiveChildNavigationOptions(v14);
    else
        return v13((v14.getChildNavigation(v16.key)));
    end;
end;
local function v17(v18)
    local v19 = v18.routes and v18.routes[v18.index];
    if not v19 then
        return v18.routeName;
    else
        return v17(v19);
    end;
end;
return function(v20, v21)
    local v22 = l_default_0.isEnabled() and l_default_0:getConnectTabLeadsToChatTab();
    local v26 = {
        {
            [v10.SocialTab] = {
                screen = function(v23)
                    return l_Roact_0.createFragment({
                        screen = l_Roact_0.createElement(v9, {
                            navigation = v23.navigation
                        }), 
                        navigationEvents = l_Roact_0.createElement(v8, {
                            navigationEventReceiver = l_RoactNavigation_0.NavigationEvents
                        })
                    });
                end, 
                navigationOptions = {
                    tabBarVisible = true
                }
            }
        }, 
        {
            [v10.RoactChat] = {
                screen = function(v24)
                    return v6.with(function(v25)
                        return l_Roact_0.createElement(v20[v10.RoactChat], (l_llama_0.Dictionary.join(v24, v21, {
                            logger = v25.Logger, 
                            isLuaProfilePageEnabled = v25.isLuaProfilePageEnabled, 
                            parameters = v25.parameters, 
                            wideMode = v25.wideMode, 
                            isVisible = v25.isVisible, 
                            notificationCount = v25.notificationCount, 
                            navigateToLuaAppPages = v25.navigateToLuaAppPages, 
                            rnBypassActionSignal = v25.rnBypassActionSignal, 
                            setActiveConversationId = v25.setActiveConversationId, 
                            setBackButtonEnabled = v25.setBackButtonEnabled, 
                            setTabBarVisible = v25.setTabBarVisible, 
                            androidBackButtonSignal = v21.androidBackButtonSignal[v10.RoactChat], 
                            androidBackButtonConnection = if not l_getFFlagEnableNewChatTabExperimentAndroidBackButtonFix_0() then nil else v21.androidBackButtonConnection, 
                            updateExternalNavigationForScreen = v25.updateExternalNavigationForScreen
                        }, {
                            navigateToRootStack = function()
                                v24.navigation.navigate(v10.SocialTab);
                            end, 
                            navigateToAddFriends = if not l_default_0.isEnabled() then nil else function()
                                v24.navigation.navigate(v10.FriendsLanding, {
                                    EntryPage = "AddFriendsPage"
                                });
                            end
                        })));
                    end);
                end, 
                navigationOptions = {
                    tabBarVisible = not not v22 or false
                }
            }
        }, 
        v20[v10.FriendsLanding] and {
            [v10.FriendsLanding] = v20[v10.FriendsLanding](v6)
        }
    };
    if v22 then
        v26 = l_llama_0.List.removeIndex(v26, 1);
    end;
    local v27 = l_RoactNavigation_0.createRobloxSwitchNavigator(v26, {
        initialRouteName = v21.initialRouteName, 
        keepVisitedScreensMounted = false, 
        backBehavior = if not l_default_0.isEnabled() then l_BackBehavior_0.InitialRoute else l_BackBehavior_0.History
    });
    local v28 = l_Roact_0.PureComponent:extend("SocialTabSwitchNavigator");
    v28.init = function(v29)
        v29.onBackButtonPressed = function()
            local l_state_1 = v29.props.navigation.state;
            local v31 = l_state_1.routes and l_state_1.routes[l_state_1.index];
            local v32 = if not v31 then l_state_1.routeName else v17(v31);
            if not v29.props.androidBackButtonHandlerDisabled then
                if not (v32 ~= v10.RoactChat) or v32 == v10.SocialTab then
                    v21.androidBackButtonSignal[v32]:fire();
                    return ;
                else
                    v29.props.navigation.goBack();
                    return ;
                end;
            else
                return ;
            end;
        end;
        v29.isTabViewVisible = function()
            local l_state_2 = v29.props.navigation.state;
            local v34 = l_state_2.routes and l_state_2.routes[l_state_2.index];
            return if not v34 then l_state_2.routeName else v17(v34) == v10.SocialTab;
        end;
    end;
    v28.didMount = function(v35)
        v21.connectToAndroidBackButton(v35.onBackButtonPressed);
    end;
    v28.willUnmount = function(_)
        v21.disconnectFromAndroidBackButton();
    end;
    v28.willUpdate = function(_, v38)
        local l_navigation_0 = v38.navigation;
        local l_state_3 = l_navigation_0.state;
        local v41 = l_state_3.routes and l_state_3.routes[l_state_3.index];
        local v42 = if not not v41 and v41.routes then v13((l_navigation_0.getChildNavigation(v41.key))) else l_RoactNavigation_0.getActiveChildNavigationOptions(l_navigation_0);
        if v42 and v42.tabBarVisible ~= nil then
            v21.setTabBarVisible(v42.tabBarVisible);
        end;
    end;
    v28.render = function(v43)
        return v6.with(function(v44)
            if v44.isLuaProfilePageEnabled then
                v44.setIsTabBarEnabled(v43.isTabViewVisible);
            end;
            return l_Roact_0.createFragment({
                eventReceiver = l_Roact_0.createElement(v7, {
                    robloxEventReceiver = v44.robloxEventReceiver, 
                    getActiveConversationId = v44.getActiveConversationId, 
                    showTabBar = function()
                        local l_state_4 = v43.props.navigation.state;
                        local v46 = l_state_4.routes and l_state_4.routes[l_state_4.index];
                        v21.setTabBarVisible(if not v46 then l_state_4.routeName else v17(v46) == if not v22 then v10.SocialTab else v10.RoactChat);
                    end, 
                    goToChat = function()
                        v43.props.navigation.navigate(v10.RoactChat);
                    end
                }), 
                switchNavigator = l_Roact_0.createElement(v27, {
                    navigation = v43.props.navigation
                })
            });
        end);
    end;
    v28.router = v27.router;
    return v28;
end;
