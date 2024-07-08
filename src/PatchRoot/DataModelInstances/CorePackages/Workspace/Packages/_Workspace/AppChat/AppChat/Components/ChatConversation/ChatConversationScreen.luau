local l_CorePackages_0 = game:GetService("CorePackages");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_script_FirstAncestor_0.EnumScreens);
local v4 = require(l_Parent_0.ArgCheck);
local v5 = require(l_Parent_0.Roact);
local v6 = require(l_Parent_0.RoactNavigation);
local v7 = require(l_Parent_0.UIBlox);
local l_Images_0 = v7.App.ImageSet.Images;
local l_IconButton_0 = v7.App.Button.IconButton;
local v10 = require(script.Parent.Utils.readingMessagesIsEnabled);
local v11 = require(script.Parent.ChatConversationContainer);
local v12 = require(script.Parent.Logger);
local v13 = require(l_script_FirstAncestor_0.LegacyAnalytics.withRoactChatAnalytics);
local v14 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local l_SquadJoinButton_0 = require(l_Parent_0.Squads).SquadJoinButton;
local l_GetFFlagLuaAppEnableSquadPage_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableSquadPage;
local l_GetFFlagLuaAppEnableSquadNewDesign_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableSquadNewDesign;
local v18 = v5.PureComponent:extend("ChatConversationScreen");
v18.defaultProps = {
    navigation = nil
};
v18.navigationOptions = function(v19)
    local l_navigation_0 = v19.navigation;
    local v21 = nil;
    if l_GetFFlagLuaAppEnableSquadPage_0() then
        local v22 = l_navigation_0.getParam("conversationId", nil);
        if not v22 then
            v22 = nil;
        else
            v22 = tostring(v22);
        end;
        do
            local l_v22_0 = v22;
            local function v24()
                if l_v22_0 then
                    l_navigation_0.getScreenProps("navigateToLuaAppPages", {})[v3.SquadLobby](l_v22_0);
                end;
            end;
            if not l_GetFFlagLuaAppEnableSquadNewDesign_0() then
                v21 = v5.createElement(l_IconButton_0, {
                    layoutOrder = 1, 
                    size = UDim2.fromOffset(0, 0), 
                    icon = l_Images_0["icons/actions/friends/friendsplaying"], 
                    isDisabled = not l_v22_0, 
                    onActivated = v24
                });
            elseif l_v22_0 then
                v21 = v5.createElement(l_SquadJoinButton_0, {
                    conversationId = l_v22_0, 
                    onActivated = v24
                });
            end;
        end;
    end;
    return {
        renderRight = function()
            return v13(function(v25)
                return v5.createFragment({
                    groupUp = v21, 
                    chatDetails = v5.createElement(l_IconButton_0, {
                        layoutOrder = 2, 
                        size = UDim2.fromOffset(0, 0), 
                        icon = l_Images_0["icons/actions/info"], 
                        onActivated = function()
                            local v26 = l_navigation_0.getParam("conversationId", nil);
                            v26 = not not v26 and tostring(v26) or nil;
                            v12:info("Navigate To ChatDetails: {} from {screen}", v26);
                            l_navigation_0.navigate(v3.ChatDetails, {
                                conversationId = v26
                            });
                            if v25 then
                                v25.fireAnalyticsEvent(v14.ConversationInfoBtnClicked, {
                                    conversationId = v26
                                });
                            end;
                        end
                    })
                });
            end);
        end
    };
end;
v18.init = function(v27)
    v27.toastProps = nil;
    v27.inputBoxRef = v5.createRef();
    v27.queueNavigationToToast = function(v28)
        if not v27.props.navigation.isFocused() then
            v27.toastProps = v28;
            return ;
        else
            v27.navigateToToast(v28);
            v27.toastProps = nil;
            return ;
        end;
    end;
    v27.onDidFocus = function()
        v27.setInputBarCloseCallback(v27.releaseFocus);
        if v27.toastProps then
            v27.navigateToToast(v27.toastProps);
            v27.toastProps = nil;
        end;
    end;
    v27.releaseFocus = function()
        if not (not v27.inputBoxRef or not v27.inputBoxRef:getValue()) then
            v27.inputBoxRef:getValue():ReleaseFocus();
        end;
    end;
    v27.onWillBlur = function()
        v27.releaseFocus();
        v27.setInputBarCloseCallback();
    end;
    v27.navigateToToast = function(v29)
        v12:info("Navigate To Toast from {screen}");
        v27.props.navigation.navigate(v3.RoactChatToast, v29);
    end;
    v27.openViewProfile = function(v30)
        local v31 = v27.props.navigation.getScreenProps("navigateToLuaAppPages", {})[v3.ViewUserProfile];
        if not v31 then
            v12:warning("UserProfile page was not set in navigateToLuaAppPages screenProps");
            return ;
        else
            v12:info("Navigate To UserProfile from {screen}");
            v31(v30, {});
            return ;
        end;
    end;
    v27.openGameDetailsPage = function(v32, v33)
        local v34 = v27.props.navigation.getScreenProps("navigateToLuaAppPages", {})[v3.GameDetail];
        if not v34 then
            v12:warning("GameDetail page was not set in navigateToLuaAppPages screenProps");
            return ;
        else
            v12:info("Navigate To GameDetail from " .. tostring(v33));
            v34(v32, v33);
            return ;
        end;
    end;
    v27.navigateToChatConversation = function(v35)
        v12:info("Navigate To Conversation: {} from {screen}", v35);
        v27.props.navigation.navigate(v3.ChatConversation, {
            conversationId = v35
        });
    end;
    v27.navigateBack = function()
        if v27.props.navigation.isFocused() then
            v27.props.navigation.goBack();
        end;
    end;
    v27.updateConversationTitle = function(v36)
        local v37 = v27.props.navigation.getScreenProps("setScreenTopBar", nil);
        v4.isNotNil(v37, "setScreenTopBar in screenProps");
        v37(v3.ChatConversation, {
            headerText = if not v36 then {
                raw = "CommonUI.Features.Label.Chat", 
                shouldLocalize = true
            } else {
                raw = v36, 
                shouldLocalize = false
            }
        });
    end;
    v27.setInputBarCloseCallback = function(v38)
        local v39 = v27.props.navigation.getScreenProps("setScreenTopBar", nil);
        v4.isNotNil(v39, "setScreenTopBar in screenProps");
        v39(v3.ChatLanding, {
            closeInputBar = v38
        });
    end;
    v27.getReadingMessagesIsEnabled = function()
        return v10(v27.props.navigation);
    end;
    v27.updatePrivateConversationTopBar = function(v40)
        local v41 = v27.props.navigation.getScreenProps("setScreenTopBar", nil);
        v4.isNotNil(v41, "setScreenTopBar in screenProps");
        v41(v3.ChatConversation, {
            isPrivateConversation = v40
        });
    end;
end;
v18.render = function(v42)
    local v43 = v4.isNotNil(v42.props.navigation, "navigation in ChatConversationScreen");
    local v44 = v5.createElement(v6.NavigationEvents, {
        onDidFocus = v42.onDidFocus, 
        onWillBlur = v42.onWillBlur
    });
    local v45 = v43.getParam("conversationId", nil);
    return v5.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        container = v5.createElement(v11, {
            topBarHeight = v43.getScreenProps("topBarHeight", 0), 
            wideMode = v43.getScreenProps("wideMode", false), 
            openGameDetailsPage = v42.openGameDetailsPage, 
            getReadingMessagesIsEnabled = v42.getReadingMessagesIsEnabled, 
            conversationId = not not v45 and tostring(v45) or nil, 
            inputBoxRef = v42.inputBoxRef, 
            updateConversationTitle = v42.updateConversationTitle, 
            updatePrivateConversationTopBar = v42.updatePrivateConversationTopBar, 
            navigateBack = v42.navigateBack, 
            navigateToToast = v42.queueNavigationToToast, 
            openViewProfile = v42.openViewProfile, 
            navigateToChatConversation = v42.navigateToChatConversation
        }), 
        eventsAdapter = v44
    });
end;
v18.didMount = function(_)
    v12:info("{screen} mounted");
end;
return v18;
