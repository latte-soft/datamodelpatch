local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.EnumScreens);
local v3 = require(l_script_FirstAncestor_0.TopBarContext);
local v4 = require(l_Parent_0.ArgCheck);
local v5 = require(l_Parent_0.Roact);
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local v7 = require(l_Parent_0.UIBlox);
local l_IconButton_0 = v7.App.Button.IconButton;
local l_Images_0 = v7.App.ImageSet.Images;
local l_Badge_0 = v7.App.Indicator.Badge;
local l_BadgeVariant_0 = v7.App.Indicator.Enum.BadgeVariant;
local v12 = require(script.Parent.SearchTopBar);
local v13 = require(script.Parent.ChatLandingContainer);
local v14 = require(script.Parent.Logger);
local v15 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local l_default_0 = require(l_Parent_0.SocialCommon).Experiments.NewChatTabExperimentation.default;
local v17 = require(l_script_FirstAncestor_0.Flags.isAppChatChannelsAPIEnabled);
local v18 = require(l_script_FirstAncestor_0.LegacyAnalytics.withRoactChatAnalytics);
local v19 = v5.PureComponent:extend("ChatLandingScreen");
v19.defaultProps = {
    navigation = nil
};
local function v24()
    return v5.createElement(v3.Consumer, {
        render = function(v20)
            local v21 = v20.getScreenTopBar(v2.ChatLanding);
            v4.isType(v21, "table", "screenTopBar");
            return l_withLocalization_0({
                searchPlaceholderText = "Feature.Chat.Label.SearchWord", 
                cancelText = "Feature.Chat.Action.Cancel"
            })(function(v22)
                return v5.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1
                }, {
                    filterBox = v5.createElement(v12, {
                        initialInputText = v21.filterText, 
                        cancelText = v22.cancelText, 
                        searchPlaceholderText = v22.searchPlaceholderText, 
                        captureFocusOnMount = v21.shouldAutoFocusCenter, 
                        onSelectCallback = v21.closeInputBar or function()
                        end, 
                        resetOnMount = function()
                            v20.setScreenTopBar(v2.ChatLanding, {
                                shouldAutoFocusCenter = false
                            });
                        end, 
                        cancelCallback = function()
                            v20.setScreenTopBar(v2.ChatLanding, {
                                shouldRenderCenter = false, 
                                filterText = ""
                            });
                        end, 
                        textChangedCallback = function(v23)
                            v20.setScreenTopBar(v2.ChatLanding, {
                                filterText = v23
                            });
                        end
                    })
                });
            end);
        end
    });
end;
v19.navigationOptions = function(v25)
    local l_navigation_0 = v25.navigation;
    local v27 = l_navigation_0.getScreenProps("navigateToRootStack", nil);
    return {
        headerText = {
            raw = "CommonUI.Features.Label.Chat", 
            shouldLocalize = true
        }, 
        backButtonEnabled = not not v27 or false, 
        tabBarVisible = not v27 or nil, 
        isRoot = true, 
        renderCenter = v24, 
        shouldBoldHeader = (not not l_default_0.isEnabled() and l_default_0:getConnectTabLeadsToChatTab()) and true or nil, 
        renderRight = function()
            return v18(function(v28)
                return v5.createElement(v3.Consumer, {
                    render = function(v29)
                        local v30 = v29.getScreenTopBar(v2.ChatLanding);
                        v4.isType(v30, "table", "screenTopBar");
                        local v31 = l_navigation_0.getScreenProps("notificationCount", 0);
                        local v32 = l_navigation_0.getScreenProps("topBarShowSearch", false);
                        local v33 = l_navigation_0.getScreenProps("topBarShowCreateChatGroup", false);
                        local v34 = l_navigation_0.getScreenProps("topBarShowNotifications", false);
                        if not v30.shouldRenderCenter then
                            local l_createFragment_0 = v5.createFragment;
                            local v36 = {
                                filter = v32 and v5.createElement(l_IconButton_0, {
                                    size = UDim2.fromOffset(0, 0), 
                                    icon = l_Images_0["icons/common/search"], 
                                    layoutOrder = 1, 
                                    onActivated = function()
                                        v29.setScreenTopBar(v2.ChatLanding, {
                                            shouldRenderCenter = true, 
                                            shouldAutoFocusCenter = true
                                        });
                                        if v28 then
                                            v28.fireAnalyticsEvent(v15.ChatLandingSearchBtnClicked);
                                        end;
                                    end
                                }), 
                                createNewChat = v33 and v5.createElement(l_IconButton_0, {
                                    size = UDim2.fromOffset(0, 0), 
                                    icon = l_Images_0["icons/actions/compose"], 
                                    layoutOrder = 2, 
                                    onActivated = function()
                                        l_navigation_0.navigate(v2.CreateNewChat);
                                        if v28 then
                                            v28.fireAnalyticsEvent(v15.ChatLandingComposeBtnClicked);
                                        end;
                                    end
                                })
                            };
                            local l_v34_0 = v34;
                            if l_v34_0 then
                                l_v34_0 = v5.createElement;
                                local l_l_IconButton_0_0 = l_IconButton_0;
                                local v40 = {
                                    size = UDim2.fromOffset(0, 0), 
                                    icon = l_Images_0["icons/common/notificationOn"], 
                                    layoutOrder = 3, 
                                    onActivated = function()
                                        local v39 = l_navigation_0.getScreenProps("navigateToLuaAppPages", {})[v2.Notifications];
                                        if not v39 then
                                            v14:warning("Notifications page was not set in navigateToLuaAppPages screenProps");
                                        else
                                            v14:info("Navigate To Notifications from {screen}");
                                            v39();
                                        end;
                                        if v28 then
                                            v28.fireAnalyticsEvent(v15.ChatLandingNotifBtnClicked);
                                        end;
                                    end
                                };
                                local v41 = {};
                                local v42 = false;
                                if v31 > 0 then
                                    v42 = v5.createElement(l_Badge_0, {
                                        position = UDim2.new(0.5, 0, 0.5, 0), 
                                        anchorPoint = Vector2.new(0, 1), 
                                        value = v31, 
                                        badgeVariant = l_BadgeVariant_0.Alert
                                    });
                                end;
                                v41.notificationBadge = v42;
                                l_v34_0 = l_v34_0(l_l_IconButton_0_0, v40, v41);
                            end;
                            v36.notifications = l_v34_0;
                            return l_createFragment_0(v36);
                        else
                            return nil;
                        end;
                    end
                });
            end);
        end
    };
end;
v19.init = function(v43)
    v43.navigateToConversation = function(v44)
        v14:info("Navigate To Conversation: {} from {screen}", v44);
        v43.props.navigation.navigate(v2.ChatConversation, {
            conversationId = v44
        });
        v43.resetScreenTopBar();
    end;
    v43.navigateToCreateChat = function()
        v14:info("Navigate To CreateNewChat from {screen}");
        v43.props.navigation.push(v2.CreateNewChat);
    end;
    v43.navigateToToast = function(v45)
        v14:info("Navigate To Toast from {screen}");
        v43.props.navigation.navigate(v2.RoactChatToast, v45);
    end;
    v43.navigateToPrivacy = function()
        local v46 = v43.props.navigation.getScreenProps("navigateToLuaAppPages", {})[v2.PrivacySettings];
        if not v46 then
            v14:warning("PrivacySettings page was not set in navigateToLuaAppPages screenProps");
            return ;
        else
            v14:info("Navigate To PrivacySettings from {screen}");
            v46();
            return ;
        end;
    end;
    v43.setScreenTopBar = function(v47)
        local v48 = v43.props.navigation.getScreenProps("setScreenTopBar", nil);
        v4.isNotNil(v48, "setScreenTopBar in screenProps");
        v48(v2.ChatLanding, v47);
    end;
    v43.resetScreenTopBar = function()
        local v49 = v4.isNotNil(v43.props.navigation.getScreenProps("getScreenTopBar", nil), "getScreenTopBar in screenProps")(v2.ChatLanding);
        if not (not (v49.filterText == "") or not v49.shouldRenderCenter) then
            v43.setScreenTopBar({
                shouldRenderCenter = false
            });
        end;
    end;
end;
v19.render = function(v50)
    v14:info("{screen} render");
    local v51 = v4.isNotNil(v50.props.navigation, "navigation in ChatLandingScreen");
    local v52 = not not v51 and v51.getParam("key", "") or "";
    return v5.createElement(v3.Consumer, {
        render = function(v53)
            local v54 = v53.getScreenTopBar(v2.ChatLanding);
            v4.isType(v54, "table", "screenTopBar");
            return v5.createElement(v13, {
                isShowingFilterBox = v54.shouldRenderCenter, 
                filterText = v54.filterText, 
                topBarHeight = v51.getScreenProps("topBarHeight", 0), 
                pageHeaderText = "CommonUI.Features.Label.Chat", 
                navigateToAddFriends = if not l_default_0.isEnabled() then nil else v50.props.navigation.getScreenProps("navigateToAddFriends", {}), 
                navigateToConversation = v50.navigateToConversation, 
                navigateToCreateChat = v50.navigateToCreateChat, 
                navigateToPrivacy = v50.navigateToPrivacy, 
                navigateToToast = v50.navigateToToast, 
                key = if not v17() then nil else "ChatLanding" .. v52
            });
        end
    });
end;
v19.didMount = function(v55)
    v14:info("{screen} mounted");
    v55.setScreenTopBar({
        shouldRenderCenter = false, 
        filterText = ""
    });
end;
return v19;
