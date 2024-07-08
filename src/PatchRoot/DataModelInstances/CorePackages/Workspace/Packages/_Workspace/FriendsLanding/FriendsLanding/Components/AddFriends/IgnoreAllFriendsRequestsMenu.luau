local v0 = require(script:FindFirstAncestor("FriendsLanding").AddFriends.dependencies);
local l_t_0 = v0.t;
local l_Roact_0 = v0.Roact;
local l_UIBlox_0 = v0.UIBlox;
local l_withLocalization_0 = v0.withLocalization;
local l_BaseMenu_0 = l_UIBlox_0.App.Menu.BaseMenu;
local v6 = l_Roact_0.PureComponent:extend("IgnoreAllFriendsRequestsMenu");
v6.validateProps = l_t_0.strictInterface({
    open = l_t_0.boolean, 
    onIgnoreAll = l_t_0.callback, 
    width = l_t_0.optional(l_t_0.UDim), 
    openPositionY = l_t_0.optional(l_t_0.UDim)
});
v6.defaultProps = {
    openPositionY = UDim.new(0, 0)
};
v6.render = function(v7)
    return l_withLocalization_0({
        ignoreAllLabel = "Feature.AddFriends.Action.IgnoreAll"
    })(function(v8)
        return not not v7.props.open and l_Roact_0.createElement(l_BaseMenu_0, {
            buttonProps = {
                {
                    text = v8.ignoreAllLabel, 
                    onActivated = v7.props.onIgnoreAll
                }
            }, 
            anchorPoint = Vector2.new(1, 0), 
            width = v7.props.width, 
            position = UDim2.new(UDim.new(1, 0), v7.props.openPositionY)
        }) or nil;
    end);
end;
return v6;
