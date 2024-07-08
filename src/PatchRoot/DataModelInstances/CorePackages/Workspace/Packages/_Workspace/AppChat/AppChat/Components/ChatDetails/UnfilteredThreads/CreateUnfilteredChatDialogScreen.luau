local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.EnumScreens);
local v3 = require(l_Parent_0.Roact);
local v4 = require(script.Parent.CreateUnfilteredChatDialogContainer);
local v5 = require(script.Parent.Logger);
local v6 = v3.PureComponent:extend("CreateUnfilteredChatDialogScreen");
v6.defaultProps = {
    navigation = nil
};
v6.init = function(v7)
    v7.onCreatePrivateConversationDialogClose = function()
        v7.props.navigation.goBack();
    end;
    v7.navigateToConversation = function(v8)
        v7.props.navigation.navigate(v2.ChatConversation, {
            conversationId = v8
        });
    end;
end;
v6.render = function(v9)
    local l_navigation_0 = v9.props.navigation;
    assert(type(l_navigation_0) ~= "nil", "CreateUnfilteredChatDialogScreen should be wrapped with Roact Navigation");
    local v11 = l_navigation_0.getParam("conversationId", nil);
    if v11 == nil then
        v5:warning("ConversationId is required to open {screen}");
        return nil;
    else
        return v3.createElement(v4, {
            conversationId = v11, 
            onModalClose = v9.onCreatePrivateConversationDialogClose, 
            navigateToConversation = v9.navigateToConversation
        });
    end;
end;
v6.didMount = function(_)
    v5:info("{screen} mounted");
end;
return v6;
