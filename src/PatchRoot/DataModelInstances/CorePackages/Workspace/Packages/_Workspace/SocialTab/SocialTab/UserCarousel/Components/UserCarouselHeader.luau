local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_t_0 = v1.t;
local l_Mock_0 = v1.Mock;
local l_Badge_0 = l_UIBlox_0.App.Indicator.Badge;
local l_BadgeStates_0 = l_UIBlox_0.App.Indicator.Enum.BadgeStates;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_IconButton_0 = l_UIBlox_0.App.Button.IconButton;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local v11 = require(l_script_FirstAncestor_0.Enums.LocalizedKeys);
local l_withLocalization_0 = v1.withLocalization;
local v13 = l_Roact_0.PureComponent:extend("UserCarouselHeader");
v13.defaultProps = {
    friendCount = 0, 
    hasFriendRequests = false, 
    layoutOrder = 0, 
    goToFriendRequestsPage = function()
    end, 
    goToFriendsPage = function()
    end
};
v13.validateProps = l_t_0.interface({
    friendCount = l_t_0.number, 
    hasFriendRequests = l_t_0.boolean, 
    layoutOrder = l_t_0.optional(l_t_0.number), 
    goToFriendRequestsPage = l_t_0.union(l_t_0.callback, l_Mock_0.MagicMock.is), 
    goToFriendsPage = l_t_0.union(l_t_0.callback, l_Mock_0.MagicMock.is)
});
v13.init = function(v14)
    v14.goToFriendRequestsPage = function(...)
        return v14.props.goToFriendRequestsPage(...);
    end;
end;
v13.render = function(v15)
    return l_withLocalization_0({
        headerText = v15.props.friendCount ~= 0 and {
            v11.FriendsHeaderWithCount.rawValue(); 
            friendCount = v15.props.friendCount
        } or v11.FriendsHeader.rawValue()
    })(function(v16)
        return l_withStyle_0(function(v17)
            return l_Roact_0.createElement("Frame", {
                LayoutOrder = v15.props.layoutOrder, 
                Size = UDim2.new(1, 0, 0, 50), 
                BackgroundTransparency = 1
            }, {
                Title = l_Roact_0.createElement("TextButton", {
                    AutomaticSize = Enum.AutomaticSize.X, 
                    BackgroundTransparency = 1, 
                    Font = v17.Font.Header1.Font, 
                    Size = UDim2.new(0, 0, 0, 50), 
                    Text = v16.headerText, 
                    TextColor3 = v17.Theme.TextEmphasis.Color, 
                    TextSize = v17.Font.Header1.RelativeSize * v17.Font.BaseSize, 
                    TextTransparency = v17.Theme.TextEmphasis.Transparency, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    [l_Roact_0.Event.Activated] = v15.props.goToFriendsPage
                }), 
                FriendRequests = l_Roact_0.createElement(l_IconButton_0, {
                    size = UDim2.fromOffset(28, 28), 
                    icon = l_Images_0["icons/actions/friends/friendAdd"], 
                    position = UDim2.new(1, 0, 0.5, 0), 
                    anchorPoint = Vector2.new(1, 0.5), 
                    onActivated = v15.goToFriendRequestsPage
                }, {
                    FriendRequestsBadge = not not v15.props.hasFriendRequests and (l_Roact_0.createElement(l_Badge_0, {
                        position = UDim2.new(0.6, 2, 0, 6), 
                        anchorPoint = Vector2.new(0, 0.5), 
                        value = l_BadgeStates_0.isEmpty
                    }) or l_Roact_0.createElement(l_Badge_0, {
                        position = UDim2.new(0.6, 0, 0, 0), 
                        anchorPoint = Vector2.new(0, 0.5), 
                        value = ""
                    })) or nil
                })
            });
        end);
    end);
end;
return v13;
