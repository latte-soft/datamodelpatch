local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.EnumScreens);
local v3 = require(l_Parent_0.ArgCheck);
local v4 = require(l_Parent_0.Roact);
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local v6 = require(l_script_FirstAncestor_0.TopBarContext);
local v7 = require(l_script_FirstAncestor_0.Components.SelectChatMembers.createSystemMenuButton);
local v8 = require(script.Parent.CreateNewChatContainer);
local v9 = require(script.Parent.Logger);
local v10 = v4.PureComponent:extend("CreateNewChatScreen");
v10.defaultProps = {};
v10.navigationOptions = function()
    return {
        headerText = {
            raw = "Feature.Chat.Heading.ChatWithFriends", 
            shouldLocalize = true
        }, 
        backButtonEnabled = true, 
        renderRight = function()
            return v4.createElement(v6.Consumer, {
                render = function(v11)
                    local v12 = v11.getScreenTopBar(v2.CreateNewChat);
                    v3.isType(v12, "table", "screenTopBar");
                    return l_withLocalization_0({
                        systemButtonText = "Feature.Chat.Action.StartChatWithFriends", 
                        networkErrorText = "Feature.Chat.Response.NetworkError"
                    })(function(v13)
                        return v7({
                            localizedStrings = v13, 
                            isDisabled = not v12.systemButtonEnabled, 
                            onActivated = v12.systemButtonActivated
                        });
                    end);
                end
            });
        end
    };
end;
v10.init = function(v14)
    v14.navigateToConversation = function(v15)
        local l_navigation_0 = v14.props.navigation;
        v9:info("Navigate To Conversation: {} from {screen}", v15);
        if not l_navigation_0.getScreenProps("wideMode", false) then
            l_navigation_0.replace(v2.ChatConversation, {
                conversationId = v15
            });
            return ;
        else
            l_navigation_0.navigate(v2.ChatConversation, {
                conversationId = v15
            });
            return ;
        end;
    end;
    v14.navigateToToast = function(v17)
        v9:info("Navigate To Toast from {screen}");
        v14.props.navigation.navigate(v2.RoactChatToast, v17);
    end;
    v14.setSystemButtonActivated = function(v18)
        local v19 = v14.props.navigation.getScreenProps("setScreenTopBar", nil);
        v3.isNotNil(v19, "setScreenTopBar in screenProps");
        v19(v2.CreateNewChat, {
            systemButtonActivated = v18
        });
    end;
    v14.setSystemButtonEnabled = function(v20)
        local v21 = v14.props.navigation.getScreenProps("setScreenTopBar", nil);
        v3.isNotNil(v21, "setScreenTopBar in screenProps");
        v21(v2.CreateNewChat, {
            systemButtonEnabled = v20
        });
    end;
end;
v10.render = function(v22)
    return v4.createElement(v8, {
        topBarHeight = v3.isNotNil(v22.props.navigation, "navigation in CreateNewChatScreen").getScreenProps("topBarHeight", 0), 
        navigateToConversation = v22.navigateToConversation, 
        navigateToToast = v22.navigateToToast, 
        setSystemButtonActivated = v22.setSystemButtonActivated, 
        setSystemButtonEnabled = v22.setSystemButtonEnabled
    });
end;
v10.didMount = function(v23)
    v9:info("{screen} mounted");
    v23.setSystemButtonEnabled(false);
end;
return v10;
