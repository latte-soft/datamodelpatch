local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local v2 = require(l_script_FirstAncestor_0.Logger);
local v3 = require(l_script_FirstAncestor_0.Analytics);
local l_UIBlox_0 = v1.UIBlox;
local l_Roact_0 = v1.Roact;
local l_RoactRodux_0 = v1.RoactRodux;
local l_RoactNavigation_0 = v1.RoactNavigation;
local l_memoize_0 = v1.memoize;
local l_RetrievalStatus_0 = v1.RetrievalStatus;
local v10 = require(l_script_FirstAncestor_0.SocialTabContext);
local v11 = require(l_script_FirstAncestor_0.Navigators.getSocialTabNavigator);
local v12 = require(l_script_FirstAncestor_0.EnumScreens);
local l_LoadingStateContainer_0 = l_UIBlox_0.App.Container.LoadingStateContainer;
local l_RetrievalStatus_1 = l_UIBlox_0.App.Loading.Enum.RetrievalStatus;
local v15 = require(l_script_FirstAncestor_0.Components.SocialTabEntryPoint.mapStateToProps);
local v16 = require(l_script_FirstAncestor_0.Components.SocialTabEntryPoint.mapDispatchToProps);
local l_getFFlagEnableNewChatTabExperimentAndroidBackButtonFix_0 = v1.AppChat.Flags.getFFlagEnableNewChatTabExperimentAndroidBackButtonFix;
local v18 = l_Roact_0.PureComponent:extend("SocialTabEntryPoint");
v18.defaultProps = {
    logger = nil
};
v18.getDerivedStateFromProps = function(v19, _)
    local v21 = nil;
    if v19.retrievalStatus == l_RetrievalStatus_0.Done then
        v21 = true;
    end;
    return {
        wasEverDoneRetrieving = v21
    };
end;
v18.init = function(v22)
    if v22.props.logger then
        v2:setParent(v22.props.logger);
    end;
    v22.connectSocTabExternalDispatch = function(v23)
        if not v22.props.updateExternalNavigationForScreen then
            return function()
            end;
        else
            local l_RoactChat_0 = v12.RoactChat;
            v22.props.updateExternalNavigationForScreen(function(v25)
                v23(l_RoactNavigation_0.Actions.navigate({
                    routeName = v12.RoactChat
                }));
                v22.props.navigateIntoChat({
                    screen = "ChatConversation", 
                    params = v25
                });
            end, l_RoactChat_0);
            return function()
                v22.props.updateExternalNavigationForScreen(nil, l_RoactChat_0);
            end;
        end;
    end;
    v22._performanceTesting = v22.props.performanceTesting;
    v22.androidBackButtonSignal = {
        [v12.SocialTab] = v22.props.signal.new(), 
        [v12.RoactChat] = v22.props.signal.new()
    };
    v22.getAppContainer = l_memoize_0(function(v26, v27)
        return l_RoactNavigation_0.createAppContainer((v11({
            [v12.RoactChat] = v26, 
            [v12.FriendsLanding] = v27
        }, {
            setTabBarVisible = v22.props.setTabBarVisible, 
            androidBackButtonSignal = v22.androidBackButtonSignal, 
            connectToAndroidBackButton = v22.props.androidBackButtonConnection.connect, 
            disconnectFromAndroidBackButton = v22.props.androidBackButtonConnection.disconnect, 
            androidBackButtonConnection = if not l_getFFlagEnableNewChatTabExperimentAndroidBackButtonFix_0() then nil else v22.props.androidBackButtonConnection, 
            initialRouteName = v22.props.initialRouteName
        })));
    end);
    v22.getAnalytics = l_memoize_0(function(v28)
        return v3.Class.new(v1.AnalyticsService, v28.localUserId);
    end);
    v22.fetchChatSettings = function(v29)
        return v22.props.fetchChatSettings(v29);
    end;
    v22.renderRoactChat = function()
        if not v22.props.debug_mockRenderRoactChat then
            return v10.with(function(v30)
                return not not v30.wasEverVisible and l_Roact_0.createElement(v22.props.roactChatEntryPoint, v30) or nil;
            end);
        else
            return v22.props.debug_mockRenderRoactChat();
        end;
    end;
    v22.renderAppContainer = function(v31, v32)
        if not v22.props.debug_mockRenderAppContainer then
            return l_Roact_0.createElement(v31, {
                externalDispatchConnector = v22.connectSocTabExternalDispatch, 
                androidBackButtonHandlerDisabled = v32.androidBackButtonHandlerDisabled
            });
        else
            return v22.props.debug_mockRenderAppContainer();
        end;
    end;
    v22.getLoadingState = function()
        local v33 = l_RetrievalStatus_1.fromRawValue(v22.props.retrievalStatus);
        if v22.state.wasEverDoneRetrieving then
            v33 = l_RetrievalStatus_1.fromRawValue(l_RetrievalStatus_0.Done);
        end;
        return l_Roact_0.createElement(l_LoadingStateContainer_0, {
            dataStatus = v33, 
            onRetry = v22.fetchChatSettings, 
            renderOnLoaded = v22.renderOnLoaded
        });
    end;
    v22.renderOnLoaded = function()
        return v10.with(function(v34)
            return l_Roact_0.createElement(v3.Context.Provider, {
                value = v22.getAnalytics(v34)
            }, {
                appContainer = v22.renderAppContainer(v22.getAppContainer(v34.roactChatEntryPoint, v34.getFriendsLandingEntryPoint), v34)
            });
        end);
    end;
end;
v18.didMount = function(v35)
    spawn(function()
        v35.props.fetchUnreadConversationCount();
    end);
    if v35.props.retrievalStatus == l_RetrievalStatus_0.NotStarted then
        v35.fetchChatSettings(v35.props.setAppLoaded);
    end;
    if v35.props.isVisible and v35.props.toggleChatPaused ~= nil then
        v35.props.toggleChatPaused(false);
    end;
    if v35.androidBackButtonSignal then
        v35.androidBackButtonSignal[v12.SocialTab]:connect(function()
            if v35.props.isVisible then
                v35.props.androidBackButtonConnection.showExitDialog();
            end;
        end);
    end;
end;
v18.didUpdate = function(v36, v37, _)
    if not (v37.chatLoaded or not v36.props.chatLoaded) then
        v36.props.notificationService:ActionEnabled(Enum.AppShellActionType.TapConversationEntry);
    end;
    if v36.props.retrievalStatus == l_RetrievalStatus_0.NotStarted then
        v36.fetchChatSettings(v36.props.setAppLoaded);
    end;
end;
v18.render = function(v39)
    return v10.with(function(v40)
        return l_Roact_0.createElement(v3.Context.Provider, {
            value = v39.getAnalytics(v40)
        }, {
            LoadingState = v39.getLoadingState()
        });
    end);
end;
return (v10.connect(function(v41)
    return {
        fetchUnreadConversationCount = v41.fetchUnreadConversationCount, 
        setAppLoaded = v41.setAppLoaded, 
        roactChatEntryPoint = v41.roactChatEntryPoint, 
        notificationService = v41.notificationService, 
        config = v41.config, 
        toggleChatPaused = v41.toggleChatPaused, 
        performanceTesting = v41.performanceTesting, 
        notificationType = v41.notificationType, 
        updateExternalNavigationForScreen = v41.updateExternalNavigationForScreen
    };
end)((l_RoactRodux_0.connect(v15, v16)(v18))));
