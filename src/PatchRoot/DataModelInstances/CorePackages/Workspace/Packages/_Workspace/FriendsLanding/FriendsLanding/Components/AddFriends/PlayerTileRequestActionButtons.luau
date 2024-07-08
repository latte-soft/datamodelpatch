local v0 = require(script:FindFirstAncestor("FriendsLanding").AddFriends.dependencies);
local l_Roact_0 = v0.Roact;
local l_t_0 = v0.t;
local l_UIBlox_0 = v0.UIBlox;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_ImageSetButton_0 = l_UIBlox_0.Core.ImageSet.ImageSetButton;
local v8 = Vector2.new(28, 28);
local v9 = l_Roact_0.PureComponent:extend("PlayerTileRequestActionButtons");
v9.validateProps = l_t_0.strictInterface({
    status = l_t_0.optional(l_t_0.enum(Enum.FriendStatus)), 
    onAccept = l_t_0.optional(l_t_0.callback), 
    onDecline = l_t_0.optional(l_t_0.callback)
});
v9.defaultProps = {
    status = Enum.FriendStatus.FriendRequestReceived
};
v9.render = function(v10)
    local l_status_0 = v10.props.status;
    local l_onDecline_0 = v10.props.onDecline;
    local l_onAccept_0 = v10.props.onAccept;
    if l_status_0 ~= Enum.FriendStatus.FriendRequestReceived then
        return nil;
    else
        return l_withStyle_0(function(v14)
            local l_Theme_0 = v14.Theme;
            return l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 44), 
                AnchorPoint = Vector2.new(0.5, 1), 
                Position = UDim2.new(0.5, 0, 1, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }, {
                Padding = l_Roact_0.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 8), 
                    PaddingRight = UDim.new(0, 8), 
                    PaddingBottom = UDim.new(0, 8)
                }), 
                DeclineButton = l_Roact_0.createElement(l_ImageSetButton_0, {
                    BackgroundTransparency = 1, 
                    Image = l_Images_0["component_assets/circle_17_stroke_1"], 
                    ImageColor3 = l_Theme_0.SecondaryDefault.Color, 
                    ImageTransparency = l_Theme_0.SecondaryDefault.Transparency, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = Rect.new(7, 7, 8, 8), 
                    AnchorPoint = Vector2.new(0, 0), 
                    Position = UDim2.new(0, 0, 0, 0), 
                    Size = UDim2.new(0.5, -4, 1, 0), 
                    [l_Roact_0.Event.Activated] = l_onDecline_0
                }, {
                    DeclineIcon = l_Roact_0.createElement(l_ImageSetLabel_0, {
                        BackgroundTransparency = 1, 
                        Image = l_Images_0["icons/actions/reject"], 
                        ImageColor3 = l_Theme_0.SecondaryContent.Color, 
                        ImageTransparency = l_Theme_0.SecondaryContent.Transparency, 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Position = UDim2.new(0.5, 0, 0.5, 0), 
                        Size = UDim2.new(0, v8.X, 0, v8.Y)
                    })
                }), 
                AcceptButton = l_Roact_0.createElement(l_ImageSetButton_0, {
                    BackgroundTransparency = 1, 
                    Image = l_Images_0["component_assets/circle_17"], 
                    ImageColor3 = l_Theme_0.SystemPrimaryDefault.Color, 
                    ImageTransparency = l_Theme_0.SystemPrimaryDefault.Transparency, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = Rect.new(7, 7, 8, 8), 
                    AnchorPoint = Vector2.new(1, 0), 
                    Position = UDim2.new(1, 0, 0, 0), 
                    Size = UDim2.new(0.5, -4, 1, 0), 
                    [l_Roact_0.Event.Activated] = l_onAccept_0
                }, {
                    AcceptIcon = l_Roact_0.createElement(l_ImageSetLabel_0, {
                        BackgroundTransparency = 1, 
                        Image = l_Images_0["icons/actions/accept"], 
                        ImageColor3 = l_Theme_0.SystemPrimaryContent.Color, 
                        ImageTransparency = l_Theme_0.SystemPrimaryContent.Transparency, 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Position = UDim2.new(0.5, 0, 0.5, 0), 
                        Size = UDim2.new(0, v8.X, 0, v8.Y)
                    })
                })
            });
        end);
    end;
end;
return v9;
