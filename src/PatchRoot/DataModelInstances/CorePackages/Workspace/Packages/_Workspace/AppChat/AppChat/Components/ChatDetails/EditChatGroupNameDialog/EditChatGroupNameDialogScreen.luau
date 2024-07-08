local v0 = require(script:FindFirstAncestor("AppChat").Parent.Roact);
local v1 = require(script.Parent.EditChatGroupNameDialogContainer);
local v2 = require(script.Parent.Logger);
local v3 = v0.PureComponent:extend("EditChatGroupNameDialogScreen");
v3.defaultProps = {
    navigation = nil
};
v3.init = function(v4)
    v4.onEditChatGroupNameDialogClose = function()
        v4.props.navigation.goBack();
    end;
end;
v3.render = function(v5)
    local l_navigation_0 = v5.props.navigation;
    assert(type(l_navigation_0) ~= "nil", "EditChatGroupNameDialogScreen should be wrapped with Roact Navigation");
    local v7 = l_navigation_0.getParam("conversationId", nil);
    if v7 == nil then
        v2:warning("ConversationId is required to open {screen}");
        return nil;
    else
        return v0.createElement(v1, {
            conversationId = v7, 
            onModalClose = v5.onEditChatGroupNameDialogClose
        });
    end;
end;
v3.didMount = function(_)
    v2:info("{screen} mounted");
end;
return v3;
