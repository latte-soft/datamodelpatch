local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_Logger_0 = v1.Logger;
local l_RoactRodux_0 = v1.RoactRodux;
local l_RoactAppExperiment_0 = v1.RoactAppExperiment;
local l_llama_0 = v1.llama;
local v7 = require(l_script_FirstAncestor_0.FriendsLandingContext);
local v8 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics);
local v9 = require(l_script_FirstAncestor_0.Navigator);
local v10 = require(l_script_FirstAncestor_0.EnumScreens);
local v11 = require(l_script_FirstAncestor_0.Friends.filterStates);
local l_memoize_0 = v1.memoize;
local l_SocialLibraries_0 = v1.SocialLibraries;
local l_BottomInsetBackground_0 = v1.SocialCommon.Components.BottomInsetBackground;
local l_compose_0 = l_SocialLibraries_0.RoduxTools.compose;
local v16 = require(script.mapStateToProps);
local v17 = require(script.mapDispatchToProps);
local l_withLocalization_0 = v1.withLocalization;
local v19 = require(l_script_FirstAncestor_0.Components.FriendsLandingEventListener);
local v20 = l_Roact_0.PureComponent:extend("FriendsLandingEntryPoint");
local function v21()
end;
local l_getFStringSocialAddFriendsPageLayer_0 = v1.getFStringSocialAddFriendsPageLayer;
v20.defaultProps = {
    renderAndroidBackButtonNavigationHandler = nil, 
    luaAppPages = {}, 
    isLuobu = false, 
    logger = nil, 
    debug_willUnmount = nil
};
v20.init = function(v23)
    if v23.props.logger then
        l_Logger_0:setParent(v23.props.logger);
    end;
    v23.state = {
        filter = v11.All, 
        topBar = {
            [v10.FriendsLanding] = {
                shouldRenderCenter = false
            }
        }
    };
    v23.localization = {
        pageError = "CommonUI.Messages.Response.PageError"
    };
    v23.setFilterKeys = function(v24)
        assert(type(v24) == "string", "Expected value to be a string");
        v23:setState({
            filter = v24
        });
    end;
    v23.getScreenTopBar = function(v25)
        return v23.state.topBar[v25] or {};
    end;
    v23.setScreenTopBar = function(v26, v27)
        v23:setState(function(v28)
            return {
                topBar = l_llama_0.Dictionary.join(v23.state.topBar, {
                    [v26] = l_llama_0.Dictionary.join(v28.topBar[v26] or {}, v27)
                })
            };
        end);
    end;
    v23.showErrorToast = function(v29)
        v23.props.navigation.navigate(v10.GenericToast, {
            toastProps = {
                toastContent = {
                    toastTitle = v29
                }
            }
        });
    end;
    v23.refreshPage = function(v30)
        return v23.props.refreshPageData({
            localUserId = v23.props.localUserId, 
            inactiveFriendsNetworkRequestStatus = v23.props.inactiveFriendsNetworkRequestStatus, 
            onError = function()
                v23.showErrorToast(v30.errorMessage);
                l_Logger_0:info("Refreshing FriendsLanding data failed");
            end, 
            onResolve = v30.onResolve or v21
        });
    end;
    v23.getAnalytics = l_memoize_0(function(v31)
        return v8.Class.new({
            Diag = v23.props.diagService, 
            EventStream = v23.props.eventIngestService
        }, v31, v23.props.getLoadingTimeInfo);
    end);
end;
v20.render = function(v32)
    local v33 = not not v32.props.renderAndroidBackButtonNavigationHandler and v32.props.renderAndroidBackButtonNavigationHandler(v32.props.navigation) or nil;
    return l_withLocalization_0(v32.localization)(function(v34)
        return l_Roact_0.createElement(v8.Context.Provider, {
            value = v32.getAnalytics(v32.props.localUserId)
        }, {
            l_Roact_0.createElement(v7.Provider, {
                value = {
                    exitFriendsLanding = v32.props.exitFriendsLanding or nil, 
                    navigateToLuaAppPages = v32.props.navigateToLuaAppPages, 
                    filter = v32.state.filter, 
                    setFilterKeys = v32.setFilterKeys, 
                    screenSize = v32.props.screenSize, 
                    friendRequestCount = v32.props.friendRequestCount, 
                    totalFriendCount = v32.props.totalFriendCount, 
                    wideMode = v32.props.wideMode, 
                    playerSearchPage = v32.props.luaAppPages.playerSearchPage, 
                    diagService = v32.props.diagService, 
                    eventIngestService = v32.props.eventIngestService, 
                    isLuobu = v32.props.isLuobu, 
                    entryPage = v32.props.entryPage, 
                    luaAddFriendsPageEnabled = v32.props.luaAddFriendsPageEnabled, 
                    getScreenTopBar = v32.getScreenTopBar, 
                    setScreenTopBar = v32.setScreenTopBar, 
                    refreshPage = v32.refreshPage, 
                    friendsRequestEventListener = v32.props.friendsRequestEventListener, 
                    robloxEventReceiver = v32.props.robloxEventReceiver, 
                    contactImporterAndPYMKEnabled = v32.props.contactImporterAndPYMKEnabled, 
                    contactImporterExperimentVariant = v32.props.contactImporterExperimentVariant, 
                    addFriendsPageSearchbarEnabled = v32.props.addFriendsPageSearchbarEnabled, 
                    openProfilePeekView = v32.props.openProfilePeekView, 
                    openPlayerContextualMenu = v32.props.openPlayerContextualMenu, 
                    openAmpUpsell = v32.props.openAmpUpsell, 
                    passedNavParams = v32.props.passedNavParams
                }
            }, {
                navigation = l_Roact_0.createElement(v9, {
                    navigation = v32.props.navigation
                }), 
                friendsLandingEventListener = l_Roact_0.createElement(v19, {
                    pageError = v34.pageError, 
                    navigation = v32.props.navigation, 
                    getFriendRequestsCount = v32.props.getFriendRequestsCount
                }), 
                androidBackButtonNavigationHandler = v33, 
                BottomInsetBackground = l_Roact_0.createElement(l_BottomInsetBackground_0)
            })
        });
    end);
end;
v20.didMount = function(_)
    l_Logger_0:info("FriendsLandingEntryPoint mounted");
end;
v20.willUnmount = function(v36)
    l_Logger_0:info("FriendsLandingEntryPoint unmounted");
    if v36.props.debug_willUnmount then
        v36.props.debug_willUnmount();
    end;
end;
v20 = l_compose_0(l_RoactRodux_0.connect(v16, v17), l_RoactAppExperiment_0.connectUserLayer({
    l_getFStringSocialAddFriendsPageLayer_0()
}, function(v37, _)
    return {
        addFriendsPageSearchbarEnabled = (v37[l_getFStringSocialAddFriendsPageLayer_0()] or {}).show_add_friends_page_search_bar
    };
end, false))(v20);
v20.router = v9.router;
return v20;
