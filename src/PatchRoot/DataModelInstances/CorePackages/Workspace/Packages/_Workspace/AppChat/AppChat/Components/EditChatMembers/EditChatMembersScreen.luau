local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.EnumScreens);
local v3 = require(l_Parent_0.ArgCheck);
local v4 = require(l_Parent_0.Roact);
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local v6 = require(l_script_FirstAncestor_0.TopBarContext);
local v7 = require(l_script_FirstAncestor_0.Components.SelectChatMembers.createSystemMenuButton);
local v8 = require(script.Parent.EditChatMembersContainer);
local v9 = require(script.Parent.Logger);
local v10 = v4.PureComponent:extend("EditChatMembersScreen");
v10.defaultProps = {};
v10.navigationOptions = function()
    return {
        headerText = {
            raw = "Feature.Chat.Label.AddFriends", 
            shouldLocalize = true
        }, 
        backButtonEnabled = true, 
        renderRight = function()
            return v4.createElement(v6.Consumer, {
                render = function(v11)
                    local v12 = v11.getScreenTopBar(v2.EditChatMembers);
                    v3.isType(v12, "table", "screenTopBar");
                    return l_withLocalization_0({
                        systemButtonText = "Feature.Chat.Action.Add", 
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
        v9:info("Navigate To Conversation: {} from {screen}", v15);
        v14.props.navigation.navigate(v2.ChatConversation, {
            conversationId = v15
        });
    end;
    v14.navigateToToast = function(v16)
        v9:info("Navigate To Toast from {screen}");
        v14.props.navigation.navigate(v2.RoactChatToast, v16);
    end;
    v14.setSystemButtonActivated = function(v17)
        local v18 = v14.props.navigation.getScreenProps("setScreenTopBar", nil);
        v3.isNotNil(v18, "setScreenTopBar in screenProps");
        v18(v2.EditChatMembers, {
            systemButtonActivated = v17
        });
    end;
    v14.setSystemButtonEnabled = function(v19)
        local v20 = v14.props.navigation.getScreenProps("setScreenTopBar", nil);
        v3.isNotNil(v20, "setScreenTopBar in screenProps");
        v20(v2.EditChatMembers, {
            systemButtonEnabled = v19
        });
    end;
end;
v10.render = function(v21)
    local v22 = v3.isNotNil(v21.props.navigation, "navigation in EditChatMembersScreen");
    local v23 = v22.getParam("conversation", nil);
    if v23 then
        return v4.createElement(v8, {
            topBarHeight = v22.getScreenProps("topBarHeight", 0), 
            conversation = v23, 
            navigateToConversation = v21.navigateToConversation, 
            navigateToToast = v21.navigateToToast, 
            setSystemButtonActivated = v21.setSystemButtonActivated, 
            setSystemButtonEnabled = v21.setSystemButtonEnabled
        });
    else
        v9:warning("Conversation info required to open {screen}");
        return nil;
    end;
end;
v10.didMount = function(v24)
    v9:info("{screen} mounted");
    v24.setSystemButtonEnabled(false);
end;
return v10;
