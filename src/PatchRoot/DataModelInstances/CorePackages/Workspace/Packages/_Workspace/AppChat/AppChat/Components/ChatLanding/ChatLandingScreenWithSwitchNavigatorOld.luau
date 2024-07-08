local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.ArgCheck);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.Roact);
local v5 = require(l_Parent_0.UIBlox);
local l_default_0 = require(l_Parent_0.SocialCommon).Experiments.NewChatTabExperimentation.default;
local v7 = require(l_script_FirstAncestor_0.EnumScreens);
local v8 = require(l_script_FirstAncestor_0.TopBarContext);
local v9 = require(l_script_FirstAncestor_0.createChatTopBar);
local v10 = require(l_script_FirstAncestor_0.Navigators.Wide.conversationSwitchNavigator);
local v11 = require(script.Parent.ChatLandingScreen);
local v12 = require(script.Parent.ChatLandingContainer);
local v13 = require(script.Parent.Logger);
local l_withStyle_0 = v5.Style.withStyle;
local v15 = require(l_script_FirstAncestor_0.Flags.isAppChatChannelsAPIEnabled);
local v16 = v4.PureComponent:extend("ChatLandingScreenWithSwitchNavigator");
v16.router = v10.router;
v16.defaultProps = {
    navigation = nil
};
v16.init = function(v17)
    v17.navigateToConversation = function(v18)
        v13:info("Navigate To Conversation: {} from {screen}", v18);
        v17.props.navigation.navigate(v7.ChatConversation, {
            conversationId = v18
        });
    end;
    v17.navigateToCreateChat = function()
        v13:info("Navigate To CreateNewChat from {screen}");
        v17.props.navigation.navigate(v7.CreateNewChat);
    end;
    v17.navigateToToast = function(v19)
        v13:info("Navigate To Toast from {screen}");
        v17.props.navigation.navigate(v7.RoactChatToast, v19);
    end;
    v17.navigateToNotifications = function()
        local v20 = v17.props.navigation.getScreenProps("navigateToLuaAppPages", {})[v7.Notifications];
        if not v20 then
            v13:warning("Notifications page was not set in navigateToLuaAppPages screenProps");
            return ;
        else
            v13:info("Navigate To Notifications from {screen}");
            v20();
            return ;
        end;
    end;
    v17.navigateToPrivacy = function()
        local v21 = v17.props.navigation.getScreenProps("navigateToLuaAppPages", {})[v7.PrivacySettings];
        if not v21 then
            v13:warning("PrivacySettings page was not set in navigateToLuaAppPages screenProps");
            return ;
        else
            v13:info("Navigate To PrivacySettings from {screen}");
            v21();
            return ;
        end;
    end;
    v17.setScreenTopBar = function(v22)
        local v23 = v17.props.navigation.getScreenProps("setScreenTopBar", nil);
        v2.isNotNil(v23, "setScreenTopBar in screenProps");
        v23(v7.ChatLanding, v22);
    end;
end;
v16.render = function(v24)
    v13:info("{screen} render");
    local v25 = v2.isNotNil(v24.props.navigation, "navigation in ChatLandingScreenWithSwitchNavigator");
    local v26 = not not v25 and v25.getParam("key", "") or "";
    return l_withStyle_0(function(v27)
        return v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = v27.Theme.BackgroundDefault.Color, 
            BackgroundTransparency = v27.Theme.BackgroundDefault.Transparency, 
            BorderSizePixel = 0
        }, {
            LeftContainer = v4.createElement(v8.Consumer, {
                render = function(v28)
                    local v29 = v28.getScreenTopBar(v7.ChatLanding);
                    v2.isType(v29, "table", "screenTopBar");
                    return v4.createElement("Frame", {
                        Size = UDim2.new(0.37, 0, 1, 0), 
                        Position = UDim2.new(0, 0, 0, 0), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0
                    }, {
                        layout = v4.createElement("UIListLayout", {
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }), 
                        leftTopBar = v9(v3.Dictionary.join(v29, {
                            navigation = v25
                        }, v11.navigationOptions({
                            screenProps = nil, 
                            navigationOptions = nil, 
                            navigation = v25
                        }), if not not l_default_0.isEnabled() and l_default_0:getConnectTabLeadsToChatTab() then {
                            backButtonEnabled = false, 
                            shouldBoldHeader = true
                        } else {})), 
                        content = v4.createElement("Frame", {
                            BorderSizePixel = 0, 
                            Size = UDim2.new(1, 0, 1, -v25.getScreenProps("topBarHeight", 0)), 
                            LayoutOrder = 2
                        }, {
                            ChatLanding = v4.createElement(v12, {
                                isShowingFilterBox = v29.shouldRenderCenter, 
                                filterText = v29.filterText, 
                                navigateToConversation = v24.navigateToConversation, 
                                navigateToCreateChat = v24.navigateToCreateChat, 
                                navigateToPrivacy = v24.navigateToPrivacy, 
                                navigateToToast = v24.navigateToToast, 
                                navigateToAddFriends = if not l_default_0.isEnabled() then nil else v24.props.navigation.getScreenProps("navigateToAddFriends", {}), 
                                key = if not v15() then nil else "ChatLanding" .. v26
                            })
                        })
                    });
                end
            }), 
            Border = v4.createElement("Frame", {
                BackgroundColor3 = v27.Theme.Divider.Color, 
                BackgroundTransparency = v27.Theme.Divider.Transparency, 
                BorderSizePixel = 0, 
                Position = UDim2.new(0.37, 0, 0, 0), 
                Size = UDim2.new(0, 1, 1, 0)
            }), 
            RightContainer = v4.createElement("Frame", {
                Size = UDim2.new(0.63, -1, 1, 0), 
                Position = UDim2.new(0.37, 1, 0, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }, {
                Content = v4.createElement(v10, {
                    navigation = v25
                })
            })
        });
    end);
end;
v16.didMount = function(v30)
    v13:info("{screen} mounted");
    v30.setScreenTopBar({
        shouldRenderCenter = false, 
        filterText = ""
    });
end;
return v16;
