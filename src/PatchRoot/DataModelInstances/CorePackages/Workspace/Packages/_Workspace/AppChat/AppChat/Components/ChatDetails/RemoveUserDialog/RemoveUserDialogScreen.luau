local v0 = require(script:FindFirstAncestor("AppChat").Parent.Roact);
local v1 = require(script.Parent.RemoveUserDialogContainer);
local v2 = require(script.Parent.Logger);
local v3 = v0.PureComponent:extend("RemoveUserDialog");
v3.defaultProps = {
    navigation = nil
};
v3.init = function(v4)
    v4.onRemoveUserDialogClose = function()
        v4.props.navigation.goBack();
    end;
end;
v3.render = function(v5)
    local l_navigation_0 = v5.props.navigation;
    assert(type(l_navigation_0) ~= "nil", "RemoveUserDialog should be wrapped with Roact Navigation");
    local v7 = l_navigation_0.getParam("conversationId", nil);
    local v8 = l_navigation_0.getParam("participantId", nil);
    if not (v7 ~= nil) or v8 == nil then
        v2:warning("ConversationId and participantId are required to open {screen}");
        return nil;
    else
        return v0.createElement(v1, {
            conversationId = v7, 
            participantId = v8, 
            onModalClose = v5.onRemoveUserDialogClose
        });
    end;
end;
v3.didMount = function(_)
    v2:info("{screen} mounted");
end;
return v3;
