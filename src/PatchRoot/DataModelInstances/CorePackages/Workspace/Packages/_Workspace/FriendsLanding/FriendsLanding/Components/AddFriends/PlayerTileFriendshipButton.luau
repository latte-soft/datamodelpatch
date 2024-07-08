local l_AddFriends_0 = script:FindFirstAncestor("FriendsLanding").AddFriends;
local v1 = require(l_AddFriends_0.dependencies);
local v2 = require(l_AddFriends_0.Enums.LocalizedKeys);
local l_Roact_0 = v1.Roact;
local l_t_0 = v1.t;
local l_UIBlox_0 = v1.UIBlox;
local l_withLocalization_0 = v1.withLocalization;
local l_Text_0 = v1.Text;
local l_memoize_0 = v1.memoize;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_ImageSetButton_0 = l_UIBlox_0.Core.ImageSet.ImageSetButton;
local v13 = Vector2.new(70, 20);
local v14 = Vector2.new(18, 18);
local v15 = l_Roact_0.PureComponent:extend("PlayerTileFriendshipButton");
v15.validateProps = l_t_0.strictInterface({
    status = l_t_0.optional(l_t_0.enum(Enum.FriendStatus)), 
    onActivated = l_t_0.optional(l_t_0.callback)
});
v15.defaultProps = {
    status = Enum.FriendStatus.NotFriend
};
v15.init = function(v16)
    v16.getTextBounds = l_memoize_0(function(v17, v18, v19)
        return l_Text_0.GetTextBounds(v17, v18, v19, v13);
    end);
    v16.getButtonSize = l_memoize_0(function(v20, v21)
        return UDim2.new(0, ((v14.X + 6) + v20) + 16, 0, math.max(v14.Y, v21) + 10);
    end);
end;
v15.renderWithProviders = function(v22, v23, v24)
    local l_status_0 = v22.props.status;
    local l_onActivated_0 = v22.props.onActivated;
    local v27 = l_Images_0["icons/actions/friends/friendAdd"];
    local v28 = nil;
    local v29 = nil;
    if l_status_0 == Enum.FriendStatus.NotFriend then
        v28 = v24.addFriend;
        v29 = 0;
    elseif l_status_0 == Enum.FriendStatus.FriendRequestSent then
        v28 = v24.requestPending;
        v29 = 0.2;
    else
        return ;
    end;
    local l_Theme_0 = v23.Theme;
    local l_Font_0 = v23.Font;
    local l_Font_1 = l_Font_0.CaptionHeader.Font;
    local v33 = l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize;
    local v34 = v22.getTextBounds(v28, l_Font_1, v33);
    return l_Roact_0.createElement(l_ImageSetButton_0, {
        BackgroundTransparency = 1, 
        Image = l_Images_0["component_assets/circle_21"], 
        ImageColor3 = l_Theme_0.SystemPrimaryDefault.Color, 
        ImageTransparency = l_Theme_0.SystemPrimaryDefault.Transparency + v29, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(8, 8, 9, 9), 
        AnchorPoint = Vector2.new(1, 1), 
        Position = UDim2.new(1, -12, 1, -12), 
        Size = v22.getButtonSize(v34.X, v34.Y), 
        [l_Roact_0.Event.Activated] = l_onActivated_0
    }, {
        Icon = l_Roact_0.createElement(l_ImageSetLabel_0, {
            BackgroundTransparency = 1, 
            Image = v27, 
            ImageColor3 = l_Theme_0.SystemPrimaryContent.Color, 
            ImageTransparency = l_Theme_0.SystemPrimaryContent.Transparency + v29, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, 8, 0.5, 0), 
            Size = UDim2.new(0, v14.X, 0, v14.Y)
        }), 
        Text = l_Roact_0.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Font = l_Font_1, 
            TextSize = v33, 
            Text = v28, 
            TextColor3 = l_Theme_0.SystemPrimaryContent.Color, 
            TextTransparency = l_Theme_0.SystemPrimaryContent.Transparency + v29, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            Position = UDim2.new(0, (8 + v14.X) + 6, 0, 0), 
            Size = UDim2.new(0, v34.X + 8, 1, 0)
        })
    });
end;
v15.render = function(v35)
    return l_withStyle_0(function(v36)
        return l_withLocalization_0({
            addFriend = v2.AddFriend.rawValue(), 
            requestPending = v2.RequestPending.rawValue()
        })(function(v37)
            return v35:renderWithProviders(v36, v37);
        end);
    end);
end;
return v15;
