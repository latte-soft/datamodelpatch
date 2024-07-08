local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_t_0 = v1.t;
local l_Mock_0 = v1.Mock;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local v8 = require(l_script_FirstAncestor_0.Components.StyledImageSetLabel);
local v9 = require(l_script_FirstAncestor_0.Components.StyledTextLabel);
local v10 = require(l_script_FirstAncestor_0.utils.calculateTextSize);
local l_withLocalization_0 = v1.withLocalization;
local v12 = require(l_script_FirstAncestor_0.Enums.LocalizedKeys);
local v13 = l_Roact_0.PureComponent:extend("AddFriendsTile");
v13.defaultProps = {
    accountProviderName = "", 
    layoutOrder = 0, 
    onActivated = function()
    end, 
    shouldInviteFromAccountProvider = false, 
    thumbnailSize = 96, 
    totalHeight = 96
};
v13.validateProps = l_t_0.interface({
    accountProviderName = l_t_0.optional(l_t_0.string), 
    layoutOrder = l_t_0.optional(l_t_0.number), 
    onActivated = l_t_0.optional(l_t_0.union(l_t_0.callback, l_Mock_0.MagicMock.is)), 
    shouldInviteFromAccountProvider = l_t_0.optional(l_t_0.boolean), 
    thumbnailSize = l_t_0.number, 
    totalHeight = l_t_0.number
});
v13.init = function(v14)
    v14.calculateTextSize = v10();
end;
v13.render = function(v15)
    local v16 = v12.AddFriend.rawValue();
    if v15.props.shouldInviteFromAccountProvider and v15.props.accountProviderName ~= "" then
        v16 = {
            v12.InviteFriend.rawValue(); 
            provider = v15.props.accountProviderName
        };
    end;
    return l_withLocalization_0({
        addFriendText = v16
    })(function(v17)
        return l_withStyle_0(function(v18)
            return l_Roact_0.createElement("Frame", {
                Size = UDim2.new(0, v15.props.thumbnailSize, 0, v15.props.totalHeight), 
                BackgroundTransparency = 1, 
                LayoutOrder = v15.props.layoutOrder
            }, {
                Layout = l_Roact_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 8)
                }), 
                AddFriendButton = l_Roact_0.createElement("TextButton", {
                    Size = UDim2.new(0, v15.props.thumbnailSize, 0, v15.props.thumbnailSize), 
                    BackgroundColor3 = v18.Theme.UIEmphasis.Color, 
                    Text = "", 
                    BackgroundTransparency = v18.Theme.UIEmphasis.Transparency, 
                    [l_Roact_0.Event.Activated] = v15.props.onActivated
                }, {
                    AddFriendButtonBorder = l_Roact_0.createElement(v8, {
                        Image = l_Images_0["component_assets/circle_68_stroke_2"], 
                        ImageStyle = v18.Theme.SecondaryDefault, 
                        Size = UDim2.new(0, v15.props.thumbnailSize, 0, v15.props.thumbnailSize)
                    }, {
                        AddIcon = l_Roact_0.createElement(v8, {
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            Image = l_Images_0["icons/actions/friends/friendAdd"], 
                            ImageStyle = v18.Theme.IconEmphasis, 
                            Position = UDim2.new(0.5, 0, 0.5, 0), 
                            Size = UDim2.new(0.45, 0, 0.45, 0)
                        })
                    }), 
                    UICorner = l_Roact_0.createElement("UICorner", {
                        CornerRadius = UDim.new(1, 0)
                    })
                }), 
                AddFriendsLabel = l_Roact_0.createElement(v9, {
                    BackgroundTransparency = 1, 
                    FontStyle = v18.Font.CaptionHeader, 
                    LayoutOrder = 2, 
                    Size = UDim2.new(0, v15.props.thumbnailSize, 0, v15.calculateTextSize(v17.addFriendText .. "...", v18.Font.CaptionHeader, v18.Font.BaseSize).Y), 
                    TextStyle = v18.Theme.TextEmphasis, 
                    Text = v17.addFriendText, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextXAlignment = Enum.TextXAlignment.Center
                })
            });
        end);
    end);
end;
return v13;
