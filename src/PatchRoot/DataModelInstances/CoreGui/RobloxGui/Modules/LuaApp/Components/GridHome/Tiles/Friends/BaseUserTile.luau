local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v3.Core.Style.withStyle;
local l_Interactable_0 = v3.Core.Control.Interactable;
local l_ControlState_0 = v3.Core.Control.Enum.ControlState;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_LoadableImage_0 = v3.App.Loading.LoadableImage;
local l_ShimmerPanel_0 = v3.App.Loading.ShimmerPanel;
local l_Images_0 = v3.App.ImageSet.Images;
local l_Emoji_0 = v3.App.Emoji.Emoji;
local l_Emoji_1 = v3.App.Emoji.Enum.Emoji;
local v13 = require(l_Modules_0.LuaApp.Flags.GetFFlagShowVerifiedBadgeFriendsCarousel);
local l_FFlagFriendGridRowCreateCarouselList_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagFriendGridRowCreateCarouselList;
local v15 = {
    [l_ControlState_0.Hover] = "BackgroundOnHover", 
    [l_ControlState_0.Pressed] = "BackgroundOnPress", 
    default = "PlaceHolder"
};
local v16 = l_Images_0["component_assets/circle_16"];
local v17 = v2.PureComponent:extend("BaseTile");
v17.init = function(v18)
    v18:setState({
        thumbnailBackground = v15.default
    });
    v18.onStateChanged = function(_, v20)
        v18:setState({
            thumbnailBackground = v15[v20] or v15.default
        });
    end;
    local v21, v22 = v2.createBinding(Vector2.new(0, 0));
    v18.maxTextSize = v21;
    v18.updateMaxTextSize = v22;
    v18.onResize = function(v23)
        local v24 = (v23.AbsoluteSize.X - (not v18.props.isOnline and 0 or 16)) - (not v18.props.isVerified and 0 or 18);
        if v24 ~= v18.maxTextSize:getValue().X then
            v18.updateMaxTextSize(Vector2.new(v24, 14));
        end;
    end;
end;
v17.render = function(v25)
    local l_thumbnail_0 = v25.props.thumbnail;
    local l_icon_0 = v25.props.icon;
    local l_isOnline_0 = v25.props.isOnline;
    local v29 = if not v13() then nil else v25.props.isVerified;
    local l_text_0 = v25.props.text;
    local l_metaDataText_0 = v25.props.metaDataText;
    local l_onActivated_0 = v25.props.onActivated;
    local l_thumbnailBackground_0 = v25.state.thumbnailBackground;
    local l_shouldShimmerName_0 = v25.props.shouldShimmerName;
    return l_withStyle_0(function(v35)
        local l_Font_0 = v35.Font.CaptionHeader.Font;
        local v37 = v35.Font.BaseSize * v35.Font.CaptionHeader.RelativeSize;
        local l_Color_0 = v35.Theme.TextEmphasis.Color;
        local l_Transparency_0 = v35.Theme.TextEmphasis.Transparency;
        local l_Font_1 = v35.Font.CaptionSubHeader.Font;
        local v41 = v35.Font.BaseSize * v35.Font.CaptionSubHeader.RelativeSize;
        local l_Color_1 = v35.Theme.TextMuted.Color;
        local l_Transparency_1 = v35.Theme.TextMuted.Transparency;
        local l_Color_2 = v35.Theme[l_thumbnailBackground_0].Color;
        local l_Transparency_2 = v35.Theme[l_thumbnailBackground_0].Transparency;
        local l_Color_3 = v35.Theme.IconEmphasis.Color;
        local l_Transparency_3 = v35.Theme.IconEmphasis.Transparency;
        return v2.createElement(l_Interactable_0, {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            onStateChanged = v25.onStateChanged, 
            [v2.Event.Activated] = l_onActivated_0, 
            [v2.Change.AbsoluteSize] = v25.onResize
        }, {
            ThumbnailContainer = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1), 
                SizeConstraint = Enum.SizeConstraint.RelativeXX, 
                BorderSizePixel = 0
            }, {
                StrokeWrapper = if not not l_FFlagFriendGridRowCreateCarouselList_0 and v25.props.noBorder then nil else v2.createElement("Frame", {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    Size = UDim2.new(1, -4, 1, -4), 
                    BackgroundTransparency = 1, 
                    ZIndex = 3
                }, {
                    UICorner = v2.createElement("UICorner", {
                        CornerRadius = UDim.new(0.5, 0)
                    }), 
                    UIStroke = v2.createElement("UIStroke", {
                        Thickness = 2, 
                        Color = v35.Theme.Divider.Color, 
                        Transparency = v35.Theme.Divider.Transparency
                    })
                }), 
                Thumbnail = v2.createElement(l_LoadableImage_0, {
                    BackgroundColor3 = if not l_FFlagFriendGridRowCreateCarouselList_0 then l_Color_2 else v25.props.backgroundColor or l_Color_2, 
                    BackgroundTransparency = if not l_FFlagFriendGridRowCreateCarouselList_0 then l_Transparency_2 else v25.props.backgroundColor and 0 or l_Transparency_2, 
                    Image = l_thumbnail_0, 
                    Size = UDim2.fromScale(1, 1), 
                    cornerRadius = UDim.new(0.5, 0), 
                    showFailedStateWhenLoadingFailed = not l_icon_0 and true or false, 
                    useShimmerAnimationWhileLoading = not l_icon_0 and true or false, 
                    ZIndex = 1
                }), 
                Icon = if not l_icon_0 then nil else v2.createElement(l_ImageSetLabel_0, {
                    Size = UDim2.new(0.45, 0, 0.45, 0), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    Image = l_icon_0, 
                    ImageColor3 = if not l_FFlagFriendGridRowCreateCarouselList_0 then l_Color_3 else v25.props.iconColor or l_Color_3, 
                    ImageTransparency = if not l_FFlagFriendGridRowCreateCarouselList_0 then l_Transparency_3 else v25.props.iconColor and 0 or l_Transparency_3, 
                    ZIndex = 2
                })
            }), 
            TextContainer = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                AnchorPoint = Vector2.new(1, 1), 
                Position = UDim2.new(1, 0, 1, -22), 
                Size = UDim2.new(1, 0, 0, 14)
            }, {
                TextContainerLayout = if l_isOnline_0 or v29 then v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    Padding = UDim.new(0, 4)
                }) else nil, 
                Presence = if not l_isOnline_0 then nil else v2.createElement(l_ImageSetLabel_0, {
                    Size = UDim2.new(0, 12, 0, 12), 
                    Image = v16, 
                    ImageColor3 = v35.Theme.OnlineStatus.Color, 
                    ImageTransparency = v35.Theme.OnlineStatus.Transparency, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                }), 
                Text = if l_shouldShimmerName_0 then nil else v2.createElement("TextLabel", {
                    Text = l_text_0, 
                    Font = l_Font_0, 
                    TextSize = v37, 
                    TextColor3 = l_Color_0, 
                    TextTransparency = l_Transparency_0, 
                    TextXAlignment = if l_isOnline_0 or v29 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    Size = UDim2.fromScale((l_isOnline_0 or v29) and 0 or 1, 1), 
                    AutomaticSize = if l_isOnline_0 or v29 then Enum.AutomaticSize.X else Enum.AutomaticSize.None, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2
                }, {
                    MaxTextWidth = if l_isOnline_0 or v29 then v2.createElement("UISizeConstraint", {
                        MaxSize = v25.maxTextSize
                    }) else nil
                }), 
                ShimmerName = if not l_shouldShimmerName_0 then nil else v2.createElement(l_ShimmerPanel_0, {
                    Size = UDim2.fromScale(0.8, 1)
                }), 
                VerifiedBadgeFrame = if not v29 then nil else v2.createElement("Frame", {
                    Size = UDim2.new(0, 14, 0, 14), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 3
                }, {
                    Emoji = v2.createElement(l_Emoji_0, {
                        emoji = l_Emoji_1.Verified, 
                        textFont = l_Font_0, 
                        textSize = v37
                    })
                })
            }), 
            MetaDataText = if not l_metaDataText_0 then nil else v2.createElement("TextLabel", {
                Position = UDim2.new(0, 0, 1, -14), 
                Size = UDim2.new(1, 0, 0, 14), 
                Text = l_metaDataText_0, 
                Font = l_Font_1, 
                TextSize = v41, 
                TextColor3 = l_Color_1, 
                TextTransparency = l_Transparency_1, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            })
        });
    end);
end;
return v17;
