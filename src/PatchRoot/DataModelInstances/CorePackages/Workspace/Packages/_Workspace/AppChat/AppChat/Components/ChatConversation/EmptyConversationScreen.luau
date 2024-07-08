local v0 = require(script:FindFirstAncestor("AppChat").Parent.Roact);
local v1 = require(script.Parent.EmptyConversationPage);
local v2 = v0.PureComponent:extend("EmptyConversationScreen");
v2.defaultProps = {
    navigation = nil
};
v2.render = function(v3)
    local l_navigation_0 = v3.props.navigation;
    assert(type(l_navigation_0) ~= "nil", "ChatConversationScreen should be wrapped with Roact Navigation");
    return v0.createElement(v1, {
        topBarHeight = l_navigation_0.getScreenProps("topBarHeight", 0)
    });
end;
return v2;
