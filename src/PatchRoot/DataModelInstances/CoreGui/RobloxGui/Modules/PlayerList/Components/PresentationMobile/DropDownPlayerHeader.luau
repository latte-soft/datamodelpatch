local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_CorePackages_0.UIBlox);
local v4 = require(l_CorePackages_0.Workspace.Packages.VerifiedBadges);
local l_withStyle_0 = v3.Style.withStyle;
local l_WithLayoutValues_0 = require(script.Parent.Parent.Connection.LayoutValues).WithLayoutValues;
local l_EmojiTextLabel_0 = v3.Core.Text.EmojiTextLabel;
local l_Emoji_0 = v3.App.Emoji.Enum.Emoji;
local v9 = v1.PureComponent:extend("DropDownPlayerHeader");
v9.validateProps = v2.strictInterface({
    player = v2.instanceIsA("Player"), 
    transparency = v2.any, 
    contentVisible = v2.boolean
});
v9.render = function(v10)
    return l_WithLayoutValues_0(function(v11)
        return l_withStyle_0(function(v12)
            local l_player_0 = v10.props.player;
            return v1.createElement("TextButton", {
                BackgroundTransparency = 1, 
                Text = "", 
                Size = UDim2.new(1, 0, 0, v11.DropDownHeaderSizeY), 
                LayoutOrder = 0, 
                Selectable = false
            }, {
                Background = v1.createElement("ImageLabel", {
                    BackgroundTransparency = 1, 
                    Image = "rbxasset://textures/ui/PlayerList/NewAvatarBackground.png", 
                    ImageTransparency = v10.props.transparency, 
                    Size = UDim2.new(1, 0, 0, v11.DropDownHeaderBackgroundSize), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    AnchorPoint = Vector2.new(0, 1)
                }, {
                    TextContainerFrame = v1.createElement("Frame", {
                        Visible = v10.props.contentVisible, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, -124, 1, 0), 
                        Position = UDim2.new(0, 107, 0, 0)
                    }, {
                        Layout = v1.createElement("UIListLayout", {
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            FillDirection = Enum.FillDirection.Vertical, 
                            Padding = UDim.new(0, 0), 
                            VerticalAlignment = Enum.VerticalAlignment.Center
                        }), 
                        DisplayName = not not v4.isPlayerVerified(l_player_0) and v1.createElement(l_EmojiTextLabel_0, {
                            fontStyle = v12.Font.Header2, 
                            colorStyle = v12.Theme.TextEmphasis, 
                            fluidSizing = false, 
                            emoji = l_Emoji_0.Verified, 
                            maxSize = Vector2.new(v11.PlayerDropDownSizeXMobile - 124, 22), 
                            LayoutOrder = 1, 
                            Text = l_player_0.DisplayName, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextTruncate = Enum.TextTruncate.AtEnd, 
                            BackgroundTransparency = 1, 
                            TextScaled = true
                        }) or v1.createElement("TextLabel", {
                            LayoutOrder = 1, 
                            Size = UDim2.new(1, 0, 0, 22), 
                            Text = l_player_0.DisplayName, 
                            Font = v12.Font.Header2.Font, 
                            TextSize = v12.Font.BaseSize * v12.Font.Header2.RelativeSize, 
                            TextColor3 = v12.Theme.TextEmphasis.Color, 
                            TextTransparency = v12.Theme.TextEmphasis.Transparency, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextTruncate = Enum.TextTruncate.AtEnd, 
                            BackgroundTransparency = 1, 
                            TextScaled = true
                        }, {
                            SizeConstraint = v1.createElement("UITextSizeConstraint", {
                                MaxTextSize = v12.Font.BaseSize * v12.Font.Header2.RelativeSize, 
                                MinTextSize = v12.Font.BaseSize * v12.Font.Footer.RelativeSize
                            })
                        }), 
                        PlayerName = v1.createElement("TextLabel", {
                            LayoutOrder = 2, 
                            Size = UDim2.new(1, 0, 0, 22), 
                            Text = "@" .. l_player_0.Name, 
                            Font = v12.Font.CaptionHeader.Font, 
                            TextSize = v12.Font.BaseSize * v12.Font.CaptionHeader.RelativeSize, 
                            TextColor3 = v12.Theme.TextMuted.Color, 
                            TextTransparency = v12.Theme.TextMuted.Transparency, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextTruncate = Enum.TextTruncate.AtEnd, 
                            BackgroundTransparency = 1, 
                            TextScaled = true
                        }, {
                            SizeConstraint = v1.createElement("UITextSizeConstraint", {
                                MaxTextSize = v12.Font.BaseSize * v12.Font.CaptionHeader.RelativeSize, 
                                MinTextSize = v12.Font.BaseSize * v12.Font.Footer.RelativeSize
                            })
                        })
                    })
                }), 
                AvatarImage = v1.createElement("ImageLabel", {
                    Position = UDim2.new(0, 56, 0, 0), 
                    Size = UDim2.new(0, v11.DropDownHeaderSizeY, 0, v11.DropDownHeaderSizeY), 
                    AnchorPoint = Vector2.new(0.5, 0), 
                    BackgroundTransparency = 1, 
                    ImageTransparency = v10.props.transparency, 
                    Image = ("rbxthumb://type=AvatarHeadShot&id=%d&w=150&h=150"):format(l_player_0.UserId), 
                    ZIndex = 2
                }), 
                Divider = not v10.props.lastButton and v1.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    AnchorPoint = Vector2.new(0, 1), 
                    Visible = v10.props.contentVisible, 
                    BackgroundTransparency = v12.Theme.Divider.Transparency, 
                    BackgroundColor3 = v12.Theme.Divider.Color, 
                    BorderSizePixel = 0, 
                    ZIndex = 3
                })
            });
        end);
    end);
end;
return v9;
