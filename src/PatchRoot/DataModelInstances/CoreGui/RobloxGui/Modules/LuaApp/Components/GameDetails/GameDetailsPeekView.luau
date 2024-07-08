local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = game:GetService("LocalizationService");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_Modules_0.LuaApp.Constants);
local v6 = require(l_Modules_0.LuaApp.AppPage);
local _ = require(l_CorePackages_0.Workspace.Packages.Navigation).getCurrentRouteState;
local l_PeekView_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekView;
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local l_PeekViewWithTopBar_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewWithTopBar;
local v11 = require(l_Modules_0.LuaApp.Actions.Games.SetGameDetailsPeekViewState);
local v12 = require(l_Modules_0.LuaApp.Components.GameDetails.GameDetailsTopBar);
local v13 = require(l_Modules_0.LuaApp.Components.GameDetails.ActionBar);
local v14 = require(l_Modules_0.LuaApp.Components.GameDetails.GameDetailsCard);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local l_SessionType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppSessionization).SessionType;
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local v18 = require(l_CorePackages_0.RoactNavigation);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v20 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local l_AppSessionService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppSessionService;
local v22 = require(l_Modules_0.LuaApp.Analytics.Events.Games.gameDetailsPeekViewEvents);
local l_peekViewDismissedEvent_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).analytics.peekViewDismissedEvent;
local v24 = require(l_Modules_0.Profile.Flags.ProfileIXPTest);
local v25 = require(l_Modules_0.LuaApp.Experiment.RoactAppExperiment);
local v26 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local l_GetFFlagPeekViewScrimEnabledIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagPeekViewScrimEnabledIXP;
local l_GetFFlagPeekViewScrimEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagPeekViewScrimEnabled;
local l_GetFFlagPeekViewScrimLogging_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagPeekViewScrimLogging;
local l_GetFFlagEDPContextRedesign_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEDPContextRedesign;
local l_ActionBarHeight_0 = v5.GameDetails.ActionBarHeight;
local function _(v32)
    if v32 < 600 then
        return 20;
    else
        return 40;
    end;
end;
local v34 = v3.PureComponent:extend("GameDetailsPeekView");
v34.init = function(v35)
    v35.state = {
        topBarOpacity = 0
    };
    if l_GetFFlagEDPContextRedesign_0() then
        v35.maxContentTopPadding = -(v35.props.screenSize.X * 0.5625) / 2;
        local v36, v37 = v3.createBinding(v35.maxContentTopPadding);
        v35.contentTopPadding = v36;
        v35.setContentTopPadding = v37;
        v36, v37 = v3.createBinding(0);
        v35.contentHeaderSizeY = v36;
        v35.setContentHeaderSizeY = v37;
    end;
    v35.briefToFullTransitionPercent = function(v38)
        if not l_GetFFlagEDPContextRedesign_0() then
            v35:setState({
                topBarOpacity = v38
            });
            return ;
        else
            v35.setContentTopPadding(v35.maxContentTopPadding * (1 - v38));
            return ;
        end;
    end;
    if l_GetFFlagEDPContextRedesign_0() then
        v35.onHeaderFrameSizeChanged = function(v39)
            v35.setContentHeaderSizeY(v39.AbsoluteSize.Y);
        end;
    end;
    if l_GetFFlagPeekViewScrimLogging_0() then
        v35.getPeekViewEventMeta = function()
            return {
                universeId = v35.props.universeId, 
                source = v35.props.source or "None", 
                index = v35.props.index or -1
            };
        end;
        v35.eventTopBarClosePeekView = function()
            local l_eventIngest_0 = v35.props.eventIngest;
            local l_routeName_0 = v35.props.navigation.state.routeName;
            local v42 = v35.getPeekViewEventMeta();
            l_peekViewDismissedEvent_0.logEvent(l_eventIngest_0, "ProfilePeekView", {
                dismissMethod = l_peekViewDismissedEvent_0.dismissMethodEnum.topBarTap, 
                page = l_routeName_0, 
                locale = v42.RobloxLocaleId, 
                universeId = v42.universeId, 
                source = v42.source or "None", 
                index = v42.index or -1
            });
        end;
    end;
    v35.closeGameDetailsPeekViewInNavigation = function(v43)
        v35.props.navigation.clearAppScreens({
            v6.GameDetail
        });
        if v35.props.onClose ~= nil then
            v35.props.onClose();
        end;
        if not (not v35.props.onPeekViewClosed or v43 and v43.backButtonNavigation) then
            v35.props.onPeekViewClosed();
        end;
        v35.props.sessionService:RemoveSession(l_SessionType_0.StructuralIdentifier.GameDetailSource);
    end;
    v35.viewStateChanged = function(v44, v45)
        if v44 == l_PeekViewState_0.Brief then
            local l_gameDetailsPeekViewState_0 = v35.props.gameDetailsPeekViewState;
            if l_gameDetailsPeekViewState_0 == l_PeekViewState_0.Brief then
                v35.eventSwitchGame();
            elseif l_gameDetailsPeekViewState_0 == l_PeekViewState_0.Closed then
                v35.eventOpenPeekView();
            end;
        end;
        v35.props.setGameDetailsPeekViewState(v44);
        if v44 == l_PeekViewState_0.Closed then
            v35.closeGameDetailsPeekViewInNavigation();
            return ;
        else
            if v45 == l_PeekViewState_0.Brief and v44 == l_PeekViewState_0.Full then
                v35.eventGoToFullView();
            end;
            return ;
        end;
    end;
    v35.eventOpenPeekView = function()
        v22(v35.props.eventIngest, "OpenPeekView", v35.props.universeId, v35.props.source or "None", v35.props.index or -1);
    end;
    v35.eventSwitchGame = function()
        v22(v35.props.eventIngest, "SwitchGame", v35.props.universeId, v35.props.source or "None", v35.props.index or -1);
    end;
    v35.eventGoToFullView = function()
        v22(v35.props.eventIngest, "GoToFullView", v35.props.universeId, v35.props.source or "None", v35.props.index or -1);
    end;
end;
v34.willUnmount = function(v47)
    if (function(_)
        local l_history_0 = v47.props.history;
        local v50 = l_history_0[#l_history_0];
        local v51 = 0;
        for v52 = 1, #v50 do
            if v50[v52].name == v6.GameDetail then
                v51 = v51 + 1;
                if v51 > 1 then
                    return false;
                end;
            end;
        end;
        return true;
    end)(v47.props.universeId) then
        v47.props.setGameDetailsPeekViewState(l_PeekViewState_0.Closed);
    end;
    if v47.props.onClose ~= nil then
        v47.props.onClose();
    end;
end;
v34.render = function(v53)
    local l_universeId_0 = v53.props.universeId;
    local v55 = v53.props.statusBarHeight + v5.NAV_BAR_SIZE;
    local l_gameDetailsPeekViewState_1 = v53.props.gameDetailsPeekViewState;
    local v57 = math.min(l_getSafeAreaSize_0(v53.props.screenSize, v53.props.globalGuiInset).X.Offset, 640);
    local v58 = v57 < 600 and 20 or 40;
    local l_topBarOpacity_0 = v53.state.topBarOpacity;
    local l_mountAsFullView_0 = v53.props.mountAsFullView;
    local v61 = UDim2.new(0, 0, 0, 0);
    local v62 = UDim2.new(1, 0, 1, 0);
    if l_mountAsFullView_0 == nil then
        local v63 = true;
        if l_gameDetailsPeekViewState_1 ~= l_PeekViewState_0.Full then
            v63 = l_gameDetailsPeekViewState_1 == l_PeekViewState_0.Extended;
        end;
        l_mountAsFullView_0 = v63;
    end;
    local l_mountAnimation_0 = v53.props.mountAnimation;
    if l_mountAnimation_0 == nil then
        l_mountAnimation_0 = l_gameDetailsPeekViewState_1 == l_PeekViewState_0.Closed;
    end;
    local v65 = l_topBarOpacity_0 > 0.95;
    local v66 = false;
    if l_topBarOpacity_0 > 0 then
        v66 = not v65;
    end;
    local v67 = nil;
    local l_luaProfileEnabled_0 = v53.props.luaProfileEnabled;
    if l_luaProfileEnabled_0 and v53.props.showBackButton ~= nil then
        v67 = not v53.props.showBackButton;
    end;
    if not l_GetFFlagPeekViewScrimEnabled_0() and not v53.props.scrimEnabled then
        return l_withStyle_0(function(v69)
            return v3.createElement("Frame", {
                Position = v61, 
                Size = v62, 
                BackgroundTransparency = 1
            }, {
                PeekViewTopBar = v65 and v3.createElement(v12, {
                    universeId = l_universeId_0, 
                    withNewThemeProvider = true, 
                    showCloseIcon = l_luaProfileEnabled_0 and v67, 
                    onCloseButtonActivated = function(v70)
                        if l_GetFFlagPeekViewScrimLogging_0() then
                            v53.eventTopBarClosePeekView();
                        end;
                        v53.closeGameDetailsPeekViewInNavigation(v70);
                    end, 
                    luaProfileEnabled = l_luaProfileEnabled_0, 
                    scrimEnabled = v53.props.scrimEnabled
                }), 
                PeekViewTopBarEffectHolder = v66 and v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v55), 
                    Position = UDim2.new(0, 0, 0, 0), 
                    BackgroundColor3 = v69.Theme.BackgroundDefault.Color, 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1 - l_topBarOpacity_0
                }), 
                PeekViewContainer = v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, -v55 + 6), 
                    Position = UDim2.new(0, 0, 0, v55 - 6), 
                    BackgroundTransparency = 1, 
                    ClipsDescendants = true
                }, {
                    PeekViewGameDetailsCard = v3.createElement(l_PeekView_0, {
                        briefViewContentHeight = UDim.new(0, v57 + l_ActionBarHeight_0), 
                        bottomDockedContainerHeight = l_ActionBarHeight_0 + 10, 
                        bottomDockedContainerContent = {
                            PeekViewBottomBar = v3.createElement(v13, {
                                leftPadding = v58, 
                                rightPadding = v58, 
                                bottomPadding = 10, 
                                containerWidth = v57, 
                                universeId = l_universeId_0, 
                                withNewThemeProvider = true, 
                                referralSource = v53.props.referralSource
                            })
                        }, 
                        mountAsFullView = l_mountAsFullView_0, 
                        mountAnimation = l_mountAnimation_0, 
                        viewStateChanged = v53.viewStateChanged, 
                        briefToFullTransitionPercent = v53.briefToFullTransitionPercent, 
                        withNewThemeProvider = true
                    }, {
                        UIListLayout = v3.createElement("UIListLayout", {
                            Padding = UDim.new(0, 0), 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                            VerticalAlignment = Enum.VerticalAlignment.Top
                        }), 
                        GameDetailsCard = v3.createElement(v14, {
                            universeId = l_universeId_0, 
                            source = v53.props.source, 
                            index = v53.props.index, 
                            onPeekViewClosed = v53.props.onPeekViewClosed
                        })
                    })
                })
            });
        end);
    else
        return v3.createElement(l_PeekViewWithTopBar_0, {
            topBarHeight = v55, 
            bottomDockedContainerHeight = l_ActionBarHeight_0 + 10, 
            fullViewContentHeight = if not l_GetFFlagEDPContextRedesign_0() then UDim.new(1, -v55) else UDim.new(1, 1), 
            briefViewContentHeight = UDim.new(0, v57 + l_ActionBarHeight_0), 
            onViewStateChanged = v53.viewStateChanged, 
            viewChangedEventMeta = if not l_GetFFlagPeekViewScrimLogging_0() then nil else v53.getPeekViewEventMeta(), 
            mountAsFullView = l_mountAsFullView_0, 
            mountAnimation = l_mountAnimation_0, 
            transitionPercentCallback = if not l_GetFFlagEDPContextRedesign_0() then nil else v53.briefToFullTransitionPercent, 
            solidifyTopBarOffset = if not l_GetFFlagEDPContextRedesign_0() then nil else v53.contentHeaderSizeY:map(function(v71)
                return v71 - v55;
            end), 
            overlayDragger = not not l_GetFFlagEDPContextRedesign_0() or nil, 
            bottomBarSlot = v3.createElement(v13, {
                leftPadding = v58, 
                rightPadding = v58, 
                bottomPadding = 10, 
                containerWidth = v57, 
                universeId = l_universeId_0, 
                withNewThemeProvider = true, 
                referralSource = v53.props.referralSource
            }), 
            contentSlot = v3.createElement(v14, {
                universeId = l_universeId_0, 
                source = v53.props.source, 
                index = v53.props.index, 
                onPeekViewClosed = v53.props.onPeekViewClosed, 
                topPaddingBinding = if not l_GetFFlagEDPContextRedesign_0() then nil else v53.contentTopPadding, 
                onHeaderFrameSizeChanged = if not l_GetFFlagEDPContextRedesign_0() then nil else v53.onHeaderFrameSizeChanged
            }), 
            topBarSlot = v3.createElement(v12, {
                universeId = l_universeId_0, 
                withNewThemeProvider = true, 
                showCloseIcon = l_luaProfileEnabled_0 and v67, 
                onCloseButtonActivated = function(v72)
                    if l_GetFFlagPeekViewScrimLogging_0() then
                        v53.eventTopBarClosePeekView();
                    end;
                    v53.closeGameDetailsPeekViewInNavigation(v72);
                end, 
                luaProfileEnabled = l_luaProfileEnabled_0, 
                scrimEnabled = v53.props.scrimEnabled
            })
        });
    end;
end;
v34.didUpdate = function(v73, v74)
    if not (not (v73.props.searchBarFocused ~= v74.searchBarFocused) or not v73.props.searchBarFocused) then
        v73.closeGameDetailsPeekViewInNavigation();
    end;
end;
return (v25.connectUserLayer({
    v26.SocialFriendsLayer, 
    not not l_GetFFlagPeekViewScrimEnabledIXP_0() and v26.PlatformExcellenceQualityImprovementApp or nil
}, function(v75, _)
    local v77 = v75[v26.PlatformExcellenceQualityImprovementApp];
    return {
        luaProfileEnabled = v24.experimentOrRolloutEnabled(v75), 
        scrimEnabled = v77 and v77.peekViewScrimEnabled
    };
end)((v18.withNavigation((l_RoactServices_0.connect({
    eventIngest = v20, 
    sessionService = l_AppSessionService_0
})((v4.connect(function(v78, _)
    return {
        history = v78.Navigation.history, 
        gameDetailsPeekViewState = v78.GameDetailsPeekView.viewState, 
        statusBarHeight = v78.TopBar.statusBarHeight, 
        screenSize = v78.ScreenSize, 
        globalGuiInset = v78.GlobalGuiInset, 
        searchBarFocused = v78.SearchBar.focused
    };
end, function(v80)
    return {
        setGameDetailsPeekViewState = function(v81)
            return v80(v11(v81));
        end
    };
end)(v34))))))));
