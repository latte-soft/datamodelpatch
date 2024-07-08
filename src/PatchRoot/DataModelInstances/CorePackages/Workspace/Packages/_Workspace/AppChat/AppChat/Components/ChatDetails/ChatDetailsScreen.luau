local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.EnumScreens);
local v3 = require(l_Parent_0.Roact);
local v4 = require(script.Parent.ChatDetailsContainer);
local v5 = require(script.Parent.Logger);
local v6 = v3.PureComponent:extend("ChatDetailsScreen");
v6.defaultProps = {
    navigation = nil
};
v6.navigationOptions = function()
    return {
        headerText = {
            raw = "Feature.Chat.Label.ChatDetails", 
            shouldLocalize = true
        }
    };
end;
v6.init = function(v7)
    v7.navigateToEditChatMembers = function(v8)
        v5:info("Navigate To EditChatMembers from {screen}");
        v7.props.navigation.navigate(v2.EditChatMembers, {
            conversation = v8
        });
    end;
    v7.navigateToToast = function(v9)
        v5:info("Navigate To Toast from {screen}");
        v7.props.navigation.navigate(v2.RoactChatToast, v9);
    end;
    v7.navigateToDialog = function(v10, v11)
        v5:info("Navigate To {} from {screen}", v10);
        v7.props.navigation.navigate(v10, v11);
    end;
    v7.navigateBack = function()
        if v7.props.navigation.isFocused() then
            v7.props.navigation.goBack();
        end;
    end;
end;
v6.render = function(v12)
    local l_navigation_0 = v12.props.navigation;
    assert(type(l_navigation_0) ~= "nil", "ChatDetailsScreen should be wrapped with Roact Navigation");
    local v14 = l_navigation_0.getParam("conversationId", nil);
    if v14 == nil then
        v5:warning("ConversationId is required to open {screen}");
        return nil;
    else
        return v3.createElement(v4, {
            topBarHeight = l_navigation_0.getScreenProps("topBarHeight", 0), 
            wideMode = l_navigation_0.getScreenProps("wideMode", false), 
            conversationId = v14, 
            navigateBack = v12.navigateBack, 
            navigateToEditChatMembers = v12.navigateToEditChatMembers, 
            navigateToDialog = v12.navigateToDialog, 
            navigateToToast = v12.navigateToToast
        });
    end;
end;
v6.didMount = function(_)
    v5:info("{screen} mounted");
end;
return v6;
