local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.ArgCheck);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.Roact);
local v5 = require(l_Parent_0.UIBlox);
local v6 = require(l_script_FirstAncestor_0.EnumScreens);
local v7 = require(l_script_FirstAncestor_0.TopBarContext);
local v8 = require(l_script_FirstAncestor_0.createChatTopBar);
local v9 = require(l_script_FirstAncestor_0.Navigators.Wide.conversationSwitchNavigator);
local v10 = require(script.Parent.ChatLandingScreen);
local v11 = require(script.Parent.ChatLandingContainer);
local v12 = require(script.Parent.Logger);
local l_withStyle_0 = v5.Style.withStyle;
local v14 = v4.PureComponent:extend("ChatLandingScreenWithSwitchNavigator");
v14.router = v9.router;
v14.defaultProps = {
    navigation = nil
};
v14.init = function(v15)
    v15.navigateToConversation = function(v16)
        v12:info("Navigate To Conversation: {} from {screen}", v16);
        v15.props.navigation.navigate(v6.ChatConversation, {
            conversationId = v16
        });
    end;
    v15.navigateToCreateChat = function()
        v12:info("Navigate To CreateNewChat from {screen}");
        v15.props.navigation.navigate(v6.CreateNewChat);
    end;
    v15.navigateToToast = function(v17)
        v12:info("Navigate To Toast from {screen}");
        v15.props.navigation.navigate(v6.RoactChatToast, v17);
    end;
    v15.navigateToNotifications = function()
        local v18 = v15.props.navigation.getScreenProps("navigateToLuaAppPages", {})[v6.Notifications];
        if not v18 then
            v12:warning("Notifications page was not set in navigateToLuaAppPages screenProps");
            return ;
        else
            v12:info("Navigate To Notifications from {screen}");
            v18();
            return ;
        end;
    end;
    v15.navigateToPrivacy = function()
        local v19 = v15.props.navigation.getScreenProps("navigateToLuaAppPages", {})[v6.PrivacySettings];
        if not v19 then
            v12:warning("PrivacySettings page was not set in navigateToLuaAppPages screenProps");
            return ;
        else
            v12:info("Navigate To PrivacySettings from {screen}");
            v19();
            return ;
        end;
    end;
    v15.setScreenTopBar = function(v20)
        local v21 = v15.props.navigation.getScreenProps("setScreenTopBar", nil);
        v2.isNotNil(v21, "setScreenTopBar in screenProps");
        v21(v6.ChatLanding, v20);
    end;
    local v22, v23 = v4.createBinding(0);
    v15.getLeftContainerWidth = v22;
    v15.setLeftContainerWidth = v23;
end;
v14.render = function(v24)
    v12:info("{screen} render");
    local v25 = v2.isNotNil(v24.props.navigation, "navigation in ChatLandingScreenWithSwitchNavigator");
    local v27 = v24.getLeftContainerWidth:map(function(v26)
        return UDim2.new(1, -(v26 + 1), 1, 0);
    end);
    return l_withStyle_0(function(v28)
        return v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = v28.Theme.BackgroundDefault.Color, 
            BackgroundTransparency = v28.Theme.BackgroundDefault.Transparency, 
            BorderSizePixel = 0
        }, {
            containerLayout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 1)
            }), 
            LeftContainer = v4.createElement(v7.Consumer, {
                render = function(v29)
                    local v30 = v29.getScreenTopBar(v6.ChatLanding);
                    v2.isType(v30, "table", "screenTopBar");
                    return v4.createElement("Frame", {
                        Size = UDim2.new(0.4, 0, 1, 0), 
                        Position = UDim2.new(0, 0, 0, 0), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        [v4.Change.AbsoluteSize] = function(v31)
                            v24.setLeftContainerWidth(v31.AbsoluteSize.X);
                        end
                    }, {
                        layout = v4.createElement("UIListLayout", {
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }), 
                        sizeConstraint = v4.createElement("UISizeConstraint", {
                            MinSize = Vector2.new(320, 0), 
                            MaxSize = Vector2.new(640, math.huge)
                        }), 
                        leftTopBar = v8(v3.Dictionary.join(v30, {
                            navigation = v25
                        }, v10.navigationOptions({
                            screenProps = nil, 
                            navigationOptions = nil, 
                            navigation = v25
                        }))), 
                        content = v4.createElement("Frame", {
                            BorderSizePixel = 0, 
                            Size = UDim2.new(1, 0, 1, -v25.getScreenProps("topBarHeight", 0)), 
                            LayoutOrder = 2
                        }, {
                            ChatLanding = v4.createElement(v11, {
                                isShowingFilterBox = v30.shouldRenderCenter, 
                                filterText = v30.filterText, 
                                navigateToConversation = v24.navigateToConversation, 
                                navigateToCreateChat = v24.navigateToCreateChat, 
                                navigateToPrivacy = v24.navigateToPrivacy, 
                                navigateToToast = v24.navigateToToast
                            })
                        })
                    });
                end
            }), 
            Border = v4.createElement("Frame", {
                BackgroundColor3 = v28.Theme.Divider.Color, 
                BackgroundTransparency = v28.Theme.Divider.Transparency, 
                BorderSizePixel = 0, 
                Size = UDim2.new(0, 1, 1, 0), 
                LayoutOrder = 2
            }), 
            RightContainer = v4.createElement("Frame", {
                Size = v27, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 3
            }, {
                Content = v4.createElement(v9, {
                    navigation = v25
                })
            })
        });
    end);
end;
v14.didMount = function(v32)
    v12:info("{screen} mounted");
    v32.setScreenTopBar({
        shouldRenderCenter = false, 
        filterText = ""
    });
end;
return v14;
