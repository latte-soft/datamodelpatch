local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AppStorageService_0 = game:GetService("AppStorageService");
local _ = require(l_Parent_0.React);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_withLocalization_0 = v1.withLocalization;
local v8 = require(l_Parent_0.Cryo);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useUiModeInfo_0 = require(l_Parent_0.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_Parent_0.RobloxAppEnums).UiMode;
local l_FocusNavigationEventNameEnum_0 = require(l_Parent_0.FocusNavigationUtils).FocusNavigationEventNameEnum;
local v13 = require(l_Parent_0.ReactFocusNavigation);
local v14 = require(l_Parent_0.InputHandlers);
local _ = require(l_Parent_0.PlayerContextualMenu);
local l_convertUserPresenceTypeToString_0 = require(l_Parent_0.SocialCommon).Utils.convertUserPresenceTypeToString;
local l_useFocusGuiObject_0 = v1.useFocusGuiObject;
local l_RefreshScrollingFrame_0 = v1.SocialLibraries.Components.RefreshScrollingFrame;
local l_memoize_0 = v1.memoize;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_DefaultMetricsGridView_0 = l_UIBlox_0.App.Grid.DefaultMetricsGridView;
local l_GridMetrics_0 = l_UIBlox_0.App.Grid.GridMetrics;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_VerticalScrollViewWithMargin_0 = l_UIBlox_0.App.Container.VerticalScrollViewWithMargin;
local l_StyledTextLabel_0 = l_UIBlox_0.App.Text.StyledTextLabel;
local v26 = require(l_script_FirstAncestor_0.EnumScreens);
local v27 = require(l_script_FirstAncestor_0.Friends.filterStates);
local v28 = require(l_script_FirstAncestor_0.Friends.filterFriends);
local v29 = require(l_script_FirstAncestor_0.Friends.getCorrectUserPresence);
local v30 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics.ButtonClickEvents);
local v31 = require(l_script_FirstAncestor_0.Common.Constants);
local l_useAnimatedScrollToSelection_0 = require(l_Parent_0.RobloxAppHooks).useAnimatedScrollToSelection;
local v33 = require(l_script_FirstAncestor_0.Components.FilterByButton);
local v34 = require(l_script_FirstAncestor_0.Components.FriendTile);
local v35 = require(l_script_FirstAncestor_0.Components.EmptyResultsView);
local v36 = require(l_script_FirstAncestor_0.Components.NoFriendsView);
local v37 = require(script.FriendsListHeader);
local v38 = require(l_script_FirstAncestor_0.Flags.getFIntFriendsLandingFriendPruningUpsellMinFriends);
local v39 = require(l_script_FirstAncestor_0.Flags.getFIntFriendsLandingFriendPruningUpsellMinInactiveFriends);
local v40 = require(l_script_FirstAncestor_0.Flags.getFFlagFriendsLandingNewEmptyPage);
local l_FFlagEnableFriendsLandingControllerBar_0 = require(l_Parent_0.SharedFlags).FFlagEnableFriendsLandingControllerBar;
local l_FFlagCalculateFriendsTileSize_0 = require(l_Parent_0.SharedFlags).FFlagCalculateFriendsTileSize;
local l_FFlagFriendsLandingSafeAreaPadding_0 = require(l_Parent_0.SharedFlags).FFlagFriendsLandingSafeAreaPadding;
local l_FFlagLuaAppConsolidateProfileLogging_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppConsolidateProfileLogging;
local v45 = require(l_script_FirstAncestor_0.Flags.FFlagFriendsLandingContextualMenuErrorHandling);
local function v46()
end;
local v47 = l_Roact_0.PureComponent:extend("FriendsLandingPage");
local v48 = l_Images_0["icons/actions/friends/friendRemove"];
v47.defaultProps = {
    friends = {}, 
    totalFilteredFriends = 0, 
    totalFriendCount = 0, 
    isLocalUserSoothsayer = false, 
    isLuobu = false, 
    renderShowMore = v46, 
    analytics = nil, 
    navigateToLuaAppPages = nil, 
    refreshPage = v46, 
    filter = v27.All, 
    unfriendTargetUser = v46, 
    devForceFriendPruningUpsellOn = false, 
    getItemMetrics = l_GridMetrics_0.getMediumMetrics, 
    gridHorizontalSpacing = 12, 
    gridVerticalSpacing = 12
};
v47.init = function(v49)
    local v50 = not not game:GetEngineFeature("UniversalAppPruningAlertStorageKey") and l_AppStorageService_0:GetItem("FriendPruningAlertSeen") == "true";
    local l_devForceFriendPruningUpsellOn_0 = v49.props.devForceFriendPruningUpsellOn;
    if not l_devForceFriendPruningUpsellOn_0 then
        l_devForceFriendPruningUpsellOn_0 = not v50;
        if l_devForceFriendPruningUpsellOn_0 then
            if v38() <= v49.props.totalFriendCount then
                l_devForceFriendPruningUpsellOn_0 = true;
                if not (v39() > v49.props.totalInactiveFriends) then
                    goto label0;
                end;
            end;
            l_devForceFriendPruningUpsellOn_0 = v49.props.isLocalUserSoothsayer;
        end;
    end;
    ::label0::;
    v49.state = {
        showFriendPruningAlert = l_devForceFriendPruningUpsellOn_0, 
        showFriendPruningTooltip = l_devForceFriendPruningUpsellOn_0
    };
    v49.openPlayerContextualMenu = l_memoize_0(function(v52)
        return function()
            v49.props.openPlayerContextualMenu({
                subjectUserId = v52.id, 
                robloxFriendshipStatus = Enum.FriendStatus.Friend, 
                subjectPresence = {
                    locationString = v52.lastLocation, 
                    locationPlaceId = v52.placeId, 
                    locationRootPlaceId = v52.rootPlaceId, 
                    locationUniverseId = v52.universeId, 
                    status = l_convertUserPresenceTypeToString_0(v52.userPresenceType)
                }, 
                friendshipOriginSourceType = nil
            });
        end;
    end);
    v49.openPlayerProfile = l_memoize_0(function(v53, v54, v55, v56, v57)
        return function()
            v49.props.analytics:navigate(v26.ViewUserProfile);
            v49.props.analytics:buttonClick(v30.PlayerTile, {
                friendId = v53, 
                position = v54 - 1, 
                subpage = "peekView", 
                page = "playerProfile"
            });
            v49.props.navigateToLuaAppPages[v26.ViewUserProfile](v53, {
                openJoinable = true, 
                contextualMenuProps = {
                    user = v55, 
                    positionIndex = v54 or 0, 
                    absolutePosition = (v54 or 0) + 1, 
                    onOpen = function()
                    end, 
                    onClose = function()
                    end, 
                    anchorSpaceSize = v56, 
                    anchorSpacePosition = v57, 
                    source = if not l_FFlagLuaAppConsolidateProfileLogging_0 then v31.FriendsLandingPageSourceName else nil
                }, 
                source = if not l_FFlagLuaAppConsolidateProfileLogging_0 then nil else v31.FriendsLandingPageSourceName
            });
        end;
    end);
    v49.pageLoadingTimeReport = function()
        v49.props.analytics:pageLoadingTimeReport();
    end;
    v49.filterFriends = l_memoize_0(v28);
    v49.onFewestInteractionsSelection = function()
        v49:setState({
            showFriendPruningAlert = false, 
            showFriendPruningTooltip = false
        });
        if game:GetEngineFeature("UniversalAppPruningAlertStorageKey") then
            pcall(function()
                l_AppStorageService_0:SetItem("FriendPruningAlertSeen", "true");
                l_AppStorageService_0:Flush();
            end);
        end;
    end;
    v49.onTooltipDismissal = function()
        v49:setState({
            showFriendPruningTooltip = false
        });
    end;
    v49.onUnfriend = l_memoize_0(function(v58, v59)
        v49.props.navigation.navigate(v26.GenericToast, {
            toastProps = {
                toastContent = {
                    toastTitle = v58, 
                    iconImage = v59
                }
            }
        });
    end);
    v49.onUnfriendButtonActivated = function(v60, v61, v62)
        return function()
            if v62.id ~= nil then
                v49.props.analytics:buttonClick(v30.FriendTileUnfriendButton, {
                    friendCount = tostring(v49.props.totalFriendCount), 
                    inactiveFriendCount = tostring(v49.props.totalFilteredFriends), 
                    presence = tostring(v29(v62)), 
                    unfriendUserId = v62.id
                });
                v49.props.unfriendTargetUser({
                    targetUserId = v62.id, 
                    currentUserId = v49.props.localUserId
                }):andThen(function()
                    v49.onUnfriend(v60, v48);
                end):catch(function()
                    v49.onUnfriend(v61);
                end);
            end;
            if v49.props.navigation then
                v49.props.navigation.goBack();
            end;
        end;
    end;
    v49.renderItem = function(v63, v64)
        return l_withLocalization_0({
            successText = "Feature.Friends.Action.FriendRemoved", 
            errorText = "Feature.Toast.NetworkingError.SomethingIsWrong"
        })(function(v65)
            return l_Roact_0.createElement(v34, {
                user = v63, 
                index = v64, 
                openPlayerProfile = if not v49.props.isPlayerContextualMenuEnabled then v49.openPlayerProfile else if v45 and v49.props.openPlayerContextualMenu == nil then function()
                    return function()
                        v49.props.navigation.navigate(v26.GenericToast, {
                            toastProps = {
                                toastContent = {
                                    toastTitle = v65.errorText
                                }
                            }
                        });
                    end;
                end else v49.openPlayerContextualMenu, 
                isPlayerContextualMenuEnabled = v49.props.isPlayerContextualMenuEnabled, 
                isLuobu = v49.props.isLuobu, 
                pageLoadingTimeReport = v49.pageLoadingTimeReport, 
                buttons = if v49.props.filter == v27.Inactive then {
                    {
                        icon = v48, 
                        isSecondary = false, 
                        onActivated = v49.onUnfriendButtonActivated(v65.successText, v65.errorText, v63)
                    }
                } else nil, 
                selected = v64 == v49.props.selectedItemIndex, 
                focusGuiObject = v49.props.focusGuiObject
            });
        end);
    end;
    v49.getItemHeight = function(v66)
        if not l_FFlagCalculateFriendsTileSize_0 then
            return v66 + 80;
        else
            return v66 + v49.props.tileHeightOffset;
        end;
    end;
    v49.filterButtonOnActivated = function(v67)
        return function()
            v49.props.analytics:buttonClick(v30.FriendFilterPill);
            if v49.props.navigation then
                v49.props.navigation.navigate(v26.FilterByModal, {
                    showFriendPruningAlert = v67 and v49.state.showFriendPruningAlert, 
                    onFewestInteractionsSelection = if not v67 then v46 else v49.onFewestInteractionsSelection, 
                    friendCount = v49.props.totalFilteredFriends, 
                    inactiveFriendCount = #v49.filterFriends(v49.props.friends, v27.Inactive), 
                    showInactiveFilterOption = v67
                });
            end;
        end;
    end;
    v49.refreshPage = function()
        return v49.props.refreshPage({
            errorMessage = v49.props.localizedStrings.pageError
        });
    end;
    v49.generateScrollingElementProps = l_memoize_0(function()
        return {
            size = UDim2.new(1, 0, 1, -v31.TOP_BAR_HEIGHT), 
            useAutomaticCanvasSize = true, 
            canvasSizeY = UDim.new(1, 1), 
            Selectable = false, 
            CanvasPosition = v49.props.canvasPositionBinding, 
            onSelectionChanged = v49.props.onSelectionChanged, 
            ScrollingEnabled = v49.props.ScrollingEnabled, 
            paddingHorizontal = if not not l_FFlagFriendsLandingSafeAreaPadding_0 and v49.props.safeAreaMargin.X > 0 then v49.props.safeAreaMargin.X else nil
        };
    end);
    v49.openAddFriendsPage = function()
        v49.props.analytics:buttonClick(v30.AddFriendsNoFriendsEmptyView);
        v49.props.analytics:navigate(v26.AddFriends);
        v49.props.navigation.navigate(v26.AddFriends);
    end;
end;
v47.didMount = function(v68)
    v68.props.analytics:pageMountingTimeReport();
end;
v47.didUpdate = function(v69)
    local v70 = not not game:GetEngineFeature("UniversalAppPruningAlertStorageKey") and l_AppStorageService_0:GetItem("FriendPruningAlertSeen") == "true";
    local l_devForceFriendPruningUpsellOn_1 = v69.props.devForceFriendPruningUpsellOn;
    if not l_devForceFriendPruningUpsellOn_1 then
        l_devForceFriendPruningUpsellOn_1 = not v70;
        if l_devForceFriendPruningUpsellOn_1 then
            if v38() <= v69.props.totalFriendCount then
                l_devForceFriendPruningUpsellOn_1 = true;
                if not (v39() > v69.props.totalInactiveFriends) then
                    goto label1;
                end;
            end;
            l_devForceFriendPruningUpsellOn_1 = v69.props.isLocalUserSoothsayer;
        end;
    end;
    ::label1::;
    v69:setState({
        showFriendPruningAlert = l_devForceFriendPruningUpsellOn_1, 
        showFriendPruningTooltip = l_devForceFriendPruningUpsellOn_1
    });
end;
v47.render = function(v72)
    local l_props_0 = v72.props;
    local v74 = v72.props.totalFilteredFriends == 0;
    local l_getItemMetrics_0 = v72.props.getItemMetrics;
    local l_gridHorizontalSpacing_0 = v72.props.gridHorizontalSpacing;
    local l_gridVerticalSpacing_0 = v72.props.gridVerticalSpacing;
    local v78 = nil;
    local v79 = not v74;
    if not (not v40() or not l_props_0.newEmptyPageEnabled) then
        v78 = l_props_0.totalFriendCount == 0;
        local v80 = false;
        if l_props_0.totalFilteredFriends == 0 then
            v80 = l_props_0.totalFriendCount > 0;
        end;
        v74 = v80;
        v79 = not v78 and not v74;
    end;
    return l_withStyle_0(function(v81)
        return l_withLocalization_0({
            inactiveFilterExplanation = "Feature.Friends.Label.FewestInteractionsExplanation"
        })(function(v82)
            return l_Roact_0.createFragment({
                page = l_Roact_0.createElement("Frame", {
                    [l_Roact_0.Ref] = if not l_FFlagEnableFriendsLandingControllerBar_0 then nil else v72.props.eventHandlerRef, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundColor3 = v72.props.BackgroundColor, 
                    BackgroundTransparency = v72.props.BackgroundTransparency
                }, {
                    gridFrame = l_Roact_0.createElement("Frame", {
                        Size = UDim2.fromScale(1, 1), 
                        LayoutOrder = 2, 
                        BackgroundTransparency = 1
                    }, {
                        ScrollView = l_Roact_0.createElement(l_RefreshScrollingFrame_0, {
                            ScrollingElement = l_VerticalScrollViewWithMargin_0, 
                            scrollingElementProps = v72.generateScrollingElementProps(), 
                            refresh = v72.refreshPage
                        }, {
                            layout = l_Roact_0.createElement("UIListLayout", {
                                SortOrder = Enum.SortOrder.LayoutOrder, 
                                FillDirection = Enum.FillDirection.Vertical
                            }), 
                            pulldownSpacing = l_Roact_0.createElement("Frame", {
                                Size = UDim2.new(1, 0, 0, 1), 
                                LayoutOrder = 0, 
                                BackgroundTransparency = 1
                            }) or nil, 
                            friendsListHeader = if not v72.props.isScrollViewHeaderEnabled then nil else l_Roact_0.createElement(v37, {
                                friendCount = v72.props.totalFilteredFriends, 
                                LayoutOrder = 1
                            }), 
                            filterByButton = if not v72.props.isFilterByButtonDisabled then l_Roact_0.createElement(v33, {
                                analytics = v72.props.analytics, 
                                filter = v72.props.filter, 
                                friendCount = v72.props.totalFilteredFriends, 
                                inactiveFriendCount = #v72.filterFriends(v72.props.friends, v27.Inactive), 
                                isDisabled = v72.props.totalFriendCount == 0, 
                                layoutOrder = 2, 
                                onActivated = v72.filterButtonOnActivated(v72.props.friendPruningEnabled), 
                                showFriendPruningAlert = v72.props.friendPruningEnabled and v72.state.showFriendPruningAlert, 
                                initialShowFriendPruningTooltip = v72.props.friendPruningEnabled and v72.state.showFriendPruningTooltip, 
                                onTooltipDismissal = if not v72.props.friendPruningEnabled then v46 else v72.onTooltipDismissal
                            }) else nil, 
                            inactiveFilterExplanationTopPadding = if not not v72.props.friendPruningEnabled and v72.props.filter == v27.Inactive then l_Roact_0.createElement("Frame", {
                                Size = UDim2.new(1, 0, 0, 4), 
                                LayoutOrder = 3, 
                                BackgroundTransparency = 1
                            }) else nil, 
                            inactiveFilterExplanation = if not not v72.props.friendPruningEnabled and v72.props.filter == v27.Inactive then l_Roact_0.createElement(l_StyledTextLabel_0, {
                                automaticSize = Enum.AutomaticSize.Y, 
                                size = UDim2.fromScale(1, 0), 
                                text = v82.inactiveFilterExplanation, 
                                fontStyle = v81.Font.CaptionBody, 
                                colorStyle = v81.Theme.TextDefault, 
                                textXAlignment = Enum.TextXAlignment.Left, 
                                textYAlignment = Enum.TextYAlignment.Top, 
                                lineHeight = 1, 
                                layoutOrder = 4
                            }) else nil, 
                            inactiveFilterExplanationBottomPadding = if not not v72.props.friendPruningEnabled and v72.props.filter == v27.Inactive then l_Roact_0.createElement("Frame", {
                                Size = UDim2.new(1, 0, 0, 12), 
                                LayoutOrder = 5, 
                                BackgroundTransparency = 1
                            }) else nil, 
                            NoResultsView = if not v74 then nil else l_Roact_0.createElement(v35, {
                                layoutOrder = 6, 
                                pageLoadingTimeReport = if not not v40() and l_props_0.newEmptyPageEnabled then nil else v72.pageLoadingTimeReport
                            }), 
                            FriendsGridView = if not v79 then nil else l_Roact_0.createElement(l_DefaultMetricsGridView_0, {
                                getItemHeight = v72.getItemHeight, 
                                items = v72.props.friends, 
                                getItemMetrics = l_getItemMetrics_0, 
                                renderItem = v72.renderItem, 
                                itemPadding = Vector2.new(l_gridHorizontalSpacing_0, l_gridVerticalSpacing_0), 
                                maxHeight = math.huge, 
                                defaultChildIndex = 1, 
                                LayoutOrder = 6
                            }), 
                            NoFriendsView = if (not not v40() and l_props_0.newEmptyPageEnabled) and v78 then l_Roact_0.createElement(v36, {
                                layoutOrder = 6, 
                                pageLoadingTimeReport = v72.pageLoadingTimeReport, 
                                openAddFriendsPage = v72.openAddFriendsPage
                            }) else nil, 
                            showMoreContainer = v72.props.renderShowMore(7), 
                            BottomWhitespace = if not l_props_0.hasBottomWhitespace then nil else l_Roact_0.createElement("Frame", {
                                Size = UDim2.new(1, 0, 0, 3000), 
                                BackgroundTransparency = 1, 
                                LayoutOrder = 1000
                            })
                        })
                    })
                })
            });
        end);
    end);
end;
return function(v83)
    local v84 = l_useDesignTokens_0();
    local v85 = l_useUiModeInfo_0();
    local v86 = l_useFocusGuiObject_0();
    local v87 = v85.uiMode == l_UiMode_0.TenFoot;
    if not v87 then
        v86 = nil;
    end;
    local v88 = nil;
    if l_FFlagEnableFriendsLandingControllerBar_0 then
        v88 = v13.useEventHandler(l_FocusNavigationEventNameEnum_0.Search, (v14.onRelease(function(v89)
            v89:cancel();
            v83.navigateToLuaAppPages[v26.SearchPage]();
        end)));
    end;
    local v90 = nil;
    if l_FFlagCalculateFriendsTileSize_0 then
        v90 = if not v87 then v84.Global.Space_1000 else v84.Global.Space_800;
    end;
    local v91, v92 = l_useAnimatedScrollToSelection_0(Enum.ScrollingDirection.Y, 0, v84.Global.Space_1000, v84.LuaApps.App.Page.ScrollAnimationConfig);
    return l_Roact_0.createElement(v47, v8.Dictionary.join({
        BackgroundColor = v84.LuaApps.App.Page.BackgroundColor, 
        BackgroundTransparency = v84.LuaApps.App.Page.BackgroundTransparency, 
        isFilterByButtonDisabled = v87, 
        isScrollViewHeaderEnabled = v87, 
        eventHandlerRef = v88, 
        isPlayerContextualMenuEnabled = v87, 
        focusGuiObject = v86, 
        tileHeightOffset = v90, 
        canvasPositionBinding = v91, 
        onSelectionChanged = v92, 
        ScrollingEnabled = not v87, 
        hasBottomWhitespace = v87, 
        safeAreaMargin = if not l_FFlagFriendsLandingSafeAreaPadding_0 then nil else v84.LuaApps.App.Page.SafeAreaMargin
    }, v83));
end;
