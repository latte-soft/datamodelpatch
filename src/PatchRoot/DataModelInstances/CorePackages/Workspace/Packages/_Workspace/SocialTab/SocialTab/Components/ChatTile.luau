local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local l_isAppChatChannelsAPIEnabled_0 = require(l_script_FirstAncestor_0.Parent.AppChat).Flags.isAppChatChannelsAPIEnabled;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_t_0 = v2.t;
local l_Roact_0 = v2.Roact;
local l_UIBlox_0 = v2.UIBlox;
local l_BadgeStates_0 = l_UIBlox_0.App.Indicator.Enum.BadgeStates;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local v8 = l_Roact_0.PureComponent:extend("ChatTile");
v8.defaultProps = {
    LayoutOrder = 1, 
    unreadConversationCount = nil, 
    onActivated = function()
    end, 
    title = ""
};
v8.validateProps = l_t_0.strictInterface({
    LayoutOrder = l_t_0.optional(l_t_0.number), 
    unreadConversationCount = l_t_0.optional(l_t_0.number), 
    onActivated = l_t_0.optional(l_t_0.callback), 
    title = l_t_0.optional(l_t_0.string)
});
v8.render = function(v9)
    local v10 = nil;
    if not l_isAppChatChannelsAPIEnabled_0() then
        v10 = v9.props.unreadConversationCount;
        if v10 == 0 then
            v10 = nil;
        end;
    else
        v10 = if not not v9.props.unreadConversationCount and v9.props.unreadConversationCount > 0 then l_BadgeStates_0.isEmpty else nil;
    end;
    return l_UIBlox_0.Style.withStyle(function()
        return l_Roact_0.createElement(l_UIBlox_0.App.Tile.MenuTile, {
            size = UDim2.fromScale(1, 1), 
            layoutOrder = v9.props.LayoutOrder, 
            badgeValue = v10, 
            icon = l_Images_0["icons/menu/messages_large"], 
            title = v9.props.title, 
            onActivated = v9.props.onActivated
        });
    end);
end;
return v8;
