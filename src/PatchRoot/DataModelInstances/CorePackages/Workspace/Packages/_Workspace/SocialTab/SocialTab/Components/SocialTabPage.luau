local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local v3 = require(l_script_FirstAncestor_0.Logger);
local l_t_0 = v2.t;
local l_Roact_0 = v2.Roact;
local l_UIBlox_0 = v2.UIBlox;
local l_memoize_0 = v2.memoize;
local l_RoactAppExperiment_0 = v2.RoactAppExperiment;
local l_FormFactor_0 = require(l_Parent_0.FormFactor).Enums.FormFactor;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_ChatEntryPointNames_0 = v2.SocialCommon.Enums.ChatEntryPointNames;
local l_DefaultMetricsGridView_0 = l_UIBlox_0.App.Grid.DefaultMetricsGridView;
local l_GridMetrics_0 = l_UIBlox_0.App.Grid.GridMetrics;
local l_HorizontalPageMargin_0 = l_UIBlox_0.App.Container.HorizontalPageMargin;
local l_Badge_0 = l_UIBlox_0.App.Indicator.Badge;
local l_HeaderBar_0 = l_UIBlox_0.App.Bar.HeaderBar;
local l_IconButton_0 = l_UIBlox_0.App.Button.IconButton;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_BadgeVariant_0 = l_UIBlox_0.App.Indicator.Enum.BadgeVariant;
local l_Promise_0 = v2.Promise;
local l_UserSearchBarButton_0 = require(l_Parent_0.SocialCommon).Components.UserSearchBar.UserSearchBarButton;
local l_Sources_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.Sources;
local l_script_FirstAncestor_1 = script:FindFirstAncestor("Components");
local v24 = require(l_script_FirstAncestor_1.ChatTile);
local v25 = require(l_script_FirstAncestor_1.GroupsTile);
local v26 = require(l_script_FirstAncestor_1.ProfileEntry);
local l_RefreshScrollingFrame_0 = v2.SocialLibraries.Components.RefreshScrollingFrame;
local l_EntryPoints_0 = v2.DiscoverabilityModal.Analytics.EntryPoints;
local l_GetFStringNotificationsStreamNotificationUXLayer_0 = v2.GetFStringNotificationsStreamNotificationUXLayer;
local l_getFStringSocialConnectTabLayer_0 = require(l_Parent_0.SharedFlags).getFStringSocialConnectTabLayer;
local l_FFlagLuaAppConsolidateProfileLogging_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppConsolidateProfileLogging;
local v32 = 24;
local v33 = 22;
local v34 = require(l_script_FirstAncestor_0.EnumScreens);
local v35 = require(l_script_FirstAncestor_0.User);
local l_GetFFlagLuaAppNewStreamNotificationsEnabled_0 = v2.GetFFlagLuaAppNewStreamNotificationsEnabled;
local l_StreamNotificationsBellIcon_0 = v2.StreamNotifications.StreamNotificationsBellIcon;
local v38 = l_Roact_0.PureComponent:extend("SocialTabPage");
v38.TileCellSize = {
    Wide = UDim2.fromOffset(176, 176), 
    Compact = UDim2.fromOffset(158, 158)
};
v38.TileHorizontalAlignment = {
    Wide = Enum.HorizontalAlignment.Left, 
    Compact = Enum.HorizontalAlignment.Center
};
v38.defaultProps = {
    topBarHeight = 56, 
    navigation = nil, 
    wideMode = false, 
    unreadConversationCount = 0, 
    numberOfNotifications = 0, 
    localUser = {}, 
    enableDisplayNamePolicy = false, 
    socialText = "[LOCALIZE] TITLE", 
    chatsText = "[LOCALIZE] CHATS", 
    groupsText = "[LOCALIZE] GROUPS", 
    renderUserCarousel = function(v39)
        return l_Roact_0.createElement("TextLabel", {
            Text = "User Carousel PlaceHolder", 
            Size = UDim2.new(1, 0, 0, 40), 
            LayoutOrder = v39.LayoutOrder
        });
    end, 
    refreshPageData = function()
        return l_Promise_0.resolve();
    end, 
    shouldShowGroupsTilePolicy = false, 
    enableNotificationsPolicy = false, 
    isProfileShareEnabled = false, 
    disableWebViewSupport = false, 
    newStreamNotificationsEnabled = false, 
    enteredChatFromEntryPoint = function()
    end
};
v38.validateProps = l_t_0.interface({
    topBarHeight = l_t_0.optional(l_t_0.number), 
    showTopBar = l_t_0.optional(l_t_0.boolean), 
    analytics = l_t_0.table, 
    wideMode = l_t_0.optional(l_t_0.boolean), 
    navigateToLuaAppPages = l_t_0.optional(l_t_0.table), 
    navigation = l_t_0.optional(l_t_0.table), 
    localUser = v35.validateUser, 
    enableDisplayNamePolicy = l_t_0.optional(l_t_0.boolean), 
    enableNotificationsPolicy = l_t_0.optional(l_t_0.boolean), 
    renderUserCarousel = l_t_0.callback, 
    socialText = l_t_0.optional(l_t_0.string), 
    chatsText = l_t_0.optional(l_t_0.string), 
    groupsText = l_t_0.optional(l_t_0.string), 
    numberOfNotifications = l_t_0.optional(l_t_0.number), 
    unreadConversationCount = l_t_0.optional(l_t_0.number), 
    refreshPageData = l_t_0.optional(l_t_0.callback), 
    shouldShowGroupsTilePolicy = l_t_0.optional(l_t_0.boolean), 
    isProfileShareEnabled = l_t_0.optional(l_t_0.boolean), 
    luaAddFriendsPageEnabled = l_t_0.optional(l_t_0.boolean), 
    isLuaProfilePageEnabled = l_t_0.optional(l_t_0.boolean), 
    replaceSearchEntry = l_t_0.optional(l_t_0.boolean), 
    newStreamNotificationsEnabled = l_t_0.optional(l_t_0.boolean), 
    enteredChatFromEntryPoint = l_t_0.optional(l_t_0.callback)
});
v38.init = function(v40)
    if v40.props.replaceSearchEntry then
        v32 = 16;
        v33 = 16;
    end;
    v40.gridButtons = v40:getGridItems();
    v40.goToChat = function()
        v3:info("Going to Chats");
        v40.props.analytics:buttonClick("Chats");
        v40.props.analytics:navigate("Chats");
        v40.props.enteredChatFromEntryPoint(l_ChatEntryPointNames_0.SocialTab);
        v40.props.navigation.navigate(v34.RoactChat);
    end;
    v40.goToGroups = function()
        v3:info("Going to Groups");
        v40.props.analytics:buttonClick("Groups");
        v40.props.analytics:navigate("Groups");
        v40.props.navigateToLuaAppPages[v34.Groups]();
    end;
    v40.goToUserProfile = function()
        v3:info("Going to User Profile");
        v40.props.analytics:buttonClick("LoggedInUserIdentity");
        v40.props.analytics:navigate("LoggedInUserIdentity");
        if (not v40.props.discoverabilityUpsellOnProfileSelfViewEnabled or not v40.props.isPhoneVerified) or not v40.props.isDiscoverabilityUnset then
            v40.props.navigateToLuaAppPages[v34.ViewUserProfile](v40.props.localUser.id, {
                profilePeekViewProps = if not l_FFlagLuaAppConsolidateProfileLogging_0 then nil else {
                    source = l_Sources_0.SocialTab
                }
            });
            return ;
        else
            v40.props.navigateToLuaAppPages[v34.DiscoverabilityModal]({
                isStandaloneDiscoverabilityModal = true, 
                showToast = v40.props.showToast, 
                openLearnMoreLink = v40.props.openLearnMoreLink, 
                navigateOnActivated = function()
                    v40.props.navigateToLuaAppPages[v34.ViewUserProfile](v40.props.localUser.id, {
                        profilePeekViewProps = if not l_FFlagLuaAppConsolidateProfileLogging_0 then nil else {
                            source = l_Sources_0.SocialTab
                        }
                    });
                end, 
                entryPoint = l_EntryPoints_0.SocialTabProfile, 
                onClose = v40.props.closeCentralOverlay
            });
            return ;
        end;
    end;
    v40.goToProfileShare = function()
        v3:info("Going to Share Profile");
        v40.props.analytics:buttonClick("userShareProfileLink", {
            page = "Chat"
        });
        v40.props.navigateToLuaAppPages[v34.ProfileShare](v40.props.localUser.id);
    end;
    v40.goToFriendsLanding = function()
        if v40.props.navigatingFromSocialTabEvent then
            v40.props.navigatingFromSocialTabEvent(v34.FriendsLanding);
        end;
        v40.props.navigation.navigate(v34.FriendsLanding);
    end;
    v40.goToAddFriends = function()
        v40.props.navigation.navigate(v34.FriendsLanding, {
            EntryPage = "AddFriendsPage"
        });
    end;
    v40.goToUserSearch = function()
        v40.props.navigation.navigate(v34.FriendsLanding, {
            EntryPage = l_AppPage_0.SearchPage, 
            shouldShowUserSearchLandingPage = true, 
            userSearchSource = l_Sources_0.SocialTab, 
            screenTopBarParams = {
                shouldRenderCenter = true, 
                shouldAutoFocusCenter = true
            }
        });
        v40.props.analytics:buttonClick("peopleSearchBar", {
            formFactor = not not v40.props.wideMode and l_FormFactor_0.WIDE or l_FormFactor_0.COMPACT
        });
        v40.props.analytics:openPlayerSearch();
    end;
    v40.renderTopBarButtons = l_memoize_0(function(v41, _)
        local function v48()
            if not (not not l_GetFFlagLuaAppNewStreamNotificationsEnabled_0() and v40.props.newStreamNotificationsEnabled) then
                local l_createElement_0 = l_Roact_0.createElement;
                local l_l_IconButton_0_0 = l_IconButton_0;
                local v45 = {
                    size = UDim2.fromOffset(0, 0), 
                    icon = l_Images_0["icons/common/notificationOn"], 
                    layoutOrder = 3, 
                    onActivated = function()
                        v3:info("Going to Notifications");
                        v40.props.analytics:buttonClick("Notifications");
                        v40.props.analytics:navigate("Notifications");
                        v40.props.navigateToLuaAppPages[v34.Notifications](true);
                    end
                };
                local v46 = {};
                local v47 = false;
                if v41 > 0 then
                    v47 = l_Roact_0.createElement(l_Badge_0, {
                        position = UDim2.new(0.5, 0, 0.5, 0), 
                        anchorPoint = Vector2.new(0, 1), 
                        value = v41, 
                        badgeVariant = l_BadgeVariant_0.Alert
                    });
                end;
                v46.notificationsBadge = v47;
                return l_createElement_0(l_l_IconButton_0_0, v45, v46);
            else
                return l_Roact_0.createElement(l_StreamNotificationsBellIcon_0, {
                    notificationCount = v41, 
                    compactWidth = not v40.props.wideMode, 
                    layoutOrder = 3
                });
            end;
        end;
        local v49 = nil;
        v49 = if not v40.props.enableNotificationsPolicy then nil else v48();
        if not v40.props.disableWebViewSupport then
            return function()
                return l_Roact_0.createFragment({
                    filter = if not v40.props.replaceSearchEntry then l_Roact_0.createElement(l_IconButton_0, {
                        size = UDim2.fromOffset(0, 0), 
                        icon = l_Images_0["icons/common/search"], 
                        layoutOrder = 1, 
                        onActivated = function()
                            v3:info("Going to AddFriends");
                            v40.props.analytics:buttonClick("SearchFriends");
                            v40.props.analytics:navigate("SearchFriends");
                            v40.props.navigateToLuaAppPages[v34.AddFriends]();
                        end
                    }) else nil, 
                    notifications = v49
                });
            end;
        else
            return function()
                return l_Roact_0.createFragment({});
            end;
        end;
    end);
    v40.renderButtonGridItem = l_memoize_0(function(v50)
        return function(v51, v52)
            if v51 == "Chats" then
                return l_Roact_0.createElement(v24, {
                    unreadConversationCount = v50, 
                    LayoutOrder = v52, 
                    title = v40.props.chatsText, 
                    onActivated = v40.goToChat
                });
            elseif v51 == "Groups" then
                return l_Roact_0.createElement(v25, {
                    LayoutOrder = v52, 
                    title = v40.props.groupsText, 
                    onActivated = v40.goToGroups
                });
            else
                return nil;
            end;
        end;
    end);
    v40.getButtonGridItemHeight = function(v53)
        return v53;
    end;
    local v54, v55 = l_Roact_0.createBinding(0);
    v40.contentHeight = v54;
    v40.updateContentHeight = v55;
end;
v38.getGridItems = function(v56)
    local v57 = {
        "Chats"
    };
    if not (not v56.props.shouldShowGroupsTilePolicy or v56.props.disableWebViewSupport) then
        table.insert(v57, "Groups");
    end;
    return v57;
end;
v38.render = function(v58)
    return l_UIBlox_0.Style.withStyle(function(_)
        return l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, {
            layout = l_Roact_0.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            topBar = l_Roact_0.createElement("Frame", {
                LayoutOrder = 1, 
                Size = UDim2.new(1, 0, 0, if not v58.props.replaceSearchEntry then v58.props.topBarHeight else v58.props.topBarHeight + 48), 
                BackgroundTransparency = 1
            }, {
                UIListLayout = l_Roact_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }), 
                Header = l_Roact_0.createElement(l_HeaderBar_0, {
                    barHeight = v58.props.topBarHeight, 
                    title = v58.props.socialText, 
                    renderRight = v58.renderTopBarButtons(v58.props.numberOfNotifications, v58.props.enableNotificationsPolicy)
                }), 
                UserSearchBarButton = if not v58.props.replaceSearchEntry then nil else l_Roact_0.createElement(l_UserSearchBarButton_0, {
                    onActivated = v58.goToUserSearch
                })
            }), 
            gridFrame = l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, {
                ScrollView = l_Roact_0.createElement(l_RefreshScrollingFrame_0, {
                    scrollingElementProps = {
                        Size = UDim2.new(1, 0, 1, if not v58.props.replaceSearchEntry then -v58.props.topBarHeight else -(v58.props.topBarHeight + 48)), 
                        ScrollBarThickness = 0, 
                        BackgroundTransparency = 1, 
                        CanvasSize = UDim2.new(1, 0, 1, if not v58.props.replaceSearchEntry then -v58.props.topBarHeight + 1 else -(v58.props.topBarHeight + 48) + 1), 
                        AutomaticCanvasSize = Enum.AutomaticSize.XY, 
                        ScrollingDirection = Enum.ScrollingDirection.Y
                    }, 
                    refresh = v58.props.refreshPageData
                }, {
                    Layout = l_Roact_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    pageMargin = l_Roact_0.createElement(l_HorizontalPageMargin_0, {
                        size = UDim2.new(1, 0, 0, 0), 
                        useAutomaticSizing = true, 
                        layoutOrder = 1, 
                        backgroundTransparency = 1
                    }, {
                        Layout = l_Roact_0.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }), 
                        spacerTopBar = l_Roact_0.createElement("Frame", {
                            Size = UDim2.new(1, 0, 0, v32), 
                            BackgroundTransparency = 1, 
                            LayoutOrder = 1
                        }), 
                        profileEntry = l_Roact_0.createElement(v26, {
                            userText = not not v58.props.enableDisplayNamePolicy and v58.props.localUser.displayName or v58.props.localUser.username, 
                            avatarImage = v58.props.localUser.thumbnail, 
                            isPremium = v58.props.localUser.isPremium, 
                            navigateToLuaAppPages = v58.props.navigateToLuaAppPages, 
                            hasVerifiedBadge = v58.props.localUser.hasVerifiedBadge, 
                            onActivated = v58.goToUserProfile, 
                            isProfileShareEnabled = v58.props.isProfileShareEnabled, 
                            onActivatedProfileShare = v58.goToProfileShare, 
                            layoutOrder = 2
                        }), 
                        spacerProfile = l_Roact_0.createElement("Frame", {
                            Size = UDim2.new(1, 0, 0, v33), 
                            BackgroundTransparency = 1, 
                            LayoutOrder = 3
                        }), 
                        friendsCarousel = v58.props.renderUserCarousel({
                            LayoutOrder = 4, 
                            wideMode = v58.props.wideMode, 
                            navigateToLuaAppPages = v58.props.navigateToLuaAppPages, 
                            goToFriendsLanding = v58.goToFriendsLanding, 
                            goToAddFriends = v58.goToAddFriends, 
                            luaAddFriendsPageEnabled = v58.props.luaAddFriendsPageEnabled
                        }), 
                        spacerFriends = l_Roact_0.createElement("Frame", {
                            Size = UDim2.new(1, 0, 0, 36), 
                            BackgroundTransparency = 1, 
                            LayoutOrder = 5
                        }), 
                        buttonGrid = l_Roact_0.createElement(l_DefaultMetricsGridView_0, {
                            LayoutOrder = 6, 
                            renderItem = v58.renderButtonGridItem(v58.props.unreadConversationCount), 
                            getItemHeight = v58.getButtonGridItemHeight, 
                            getItemMetrics = l_GridMetrics_0.getMediumMetrics, 
                            itemPadding = Vector2.new(12, 12), 
                            items = v58.gridButtons
                        })
                    })
                })
            })
        });
    end);
end;
v38.didMount = function(v60)
    v3:info("SocialTabPage mounted");
    v60.props.analytics:pageLoaded();
end;
return (l_RoactAppExperiment_0.connectUserLayer({
    l_getFStringSocialConnectTabLayer_0()
}, function(v61, _)
    return {
        replaceSearchEntry = (v61[l_getFStringSocialConnectTabLayer_0()] or {}).replace_search_entry
    };
end)((l_RoactAppExperiment_0.connectUserLayer({
    l_GetFStringNotificationsStreamNotificationUXLayer_0()
}, function(v63)
    return {
        newStreamNotificationsEnabled = (v63[l_GetFStringNotificationsStreamNotificationUXLayer_0()] or {}).newStreamNotificationsEnabled or false
    };
end)(v38))));
