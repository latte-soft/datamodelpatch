local l_TextService_0 = game:GetService("TextService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.dependencies);
local l_Roact_0 = v2.Roact;
local l_SocialCommon_0 = v2.SocialCommon;
local l_VerifiedBadges_0 = v2.VerifiedBadges;
local l_InvisibleMode_0 = v2.InvisibleMode;
local l_ContextualInfoTypes_0 = l_SocialCommon_0.Enums.ContextualInfoTypes;
local l_UIBlox_0 = v2.UIBlox;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_Interactable_0 = l_UIBlox_0.Core.Control.Interactable;
local _ = require(l_Parent_0.Common.ContextPropsTypes);
local v14 = require(l_Parent_0.Components.ProfileNonFriendContextualInfo);
local v15 = require(l_Parent_0.Components.ProfileFriendContextualInfo);
local v16 = require(l_Parent_0.Components.ProfileUserDetailsNames);
local v17 = require(l_Parent_0.Components.MutualFriendsList);
local l_SelfPresenceStatusIndicatorContainer_0 = l_InvisibleMode_0.Components.SelfPresenceStatusIndicatorContainer;
local l_FFlagInvisibleModeEnabledForAll_0 = l_InvisibleMode_0.Flags.FFlagInvisibleModeEnabledForAll;
local v20 = l_Roact_0.PureComponent:extend("ProfileUserDetails");
v20.defaultProps = {
    padding = 24
};
v20.render = function(v21)
    return l_withStyle_0(function(v22)
        return v21:renderWithProviders(v22);
    end);
end;
v20.renderWithProviders = function(v23, v24)
    local l_props_0 = v23.props;
    local l_Theme_0 = v24.Theme;
    local l_Font_0 = v24.Font;
    local v28 = l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize;
    local l_Font_1 = l_Font_0.Header1.Font;
    local l_Font_2 = l_Font_0.CaptionBody.Font;
    local v31 = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize;
    local v32 = l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize;
    local l_Font_3 = l_Font_0.CaptionHeader.Font;
    local v34 = not not l_props_0.alias and l_TextService_0:GetTextSize(l_props_0.alias, v31, l_Font_2, Vector2.new(10000, 10000)).X or 0;
    local l_invisibleModeEnabled_0 = l_props_0.invisibleModeEnabled;
    if l_FFlagInvisibleModeEnabledForAll_0 then
        l_invisibleModeEnabled_0 = true;
    end;
    local v36 = l_props_0.isLocalUser and l_invisibleModeEnabled_0;
    local v37 = "@" .. l_props_0.username;
    local l_displayName_0 = l_props_0.displayName;
    local l_alias_0 = l_props_0.alias;
    if not l_props_0.hasVerifiedBadge then
        if l_props_0.hasPremiumMembership then
            l_displayName_0 = l_displayName_0 .. l_VerifiedBadges_0.emoji.premium;
        end;
    else
        l_displayName_0 = l_displayName_0 .. l_VerifiedBadges_0.emoji.verified;
    end;
    return l_Roact_0.createElement("Frame", {
        Position = UDim2.new(0, 0, 0.9, 0), 
        Size = UDim2.new(1, 0, 0, 0), 
        AnchorPoint = Vector2.new(0, 1), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = l_props_0.layoutOrder, 
        ZIndex = l_props_0.zIndex
    }, {
        PagePadding = l_Roact_0.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_props_0.padding), 
            PaddingRight = UDim.new(0, l_props_0.padding), 
            PaddingTop = UDim.new(0, 0), 
            PaddingBottom = UDim.new(0, 12)
        }), 
        ListLayout = l_Roact_0.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 4)
        }), 
        UserNameContainer = l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            ListLayout = l_Roact_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 0)
            }), 
            UsernameFrame = if not l_props_0.uplevelAliasEnabled then l_Roact_0.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                Font = l_Font_1, 
                Text = l_displayName_0, 
                TextSize = v28, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextWrapped = true, 
                LayoutOrder = 2
            }, {
                l_Roact_0.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(math.huge, v28 * 2)
                })
            }) else l_Roact_0.createElement(v16, {
                profileUserId = l_props_0.profileUserId, 
                primaryNameActivated = l_props_0.aliasActivated, 
                isLocalUser = l_props_0.isLocalUser
            }), 
            UserName = if not l_props_0.uplevelAliasEnabled then l_Roact_0.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                Font = l_Font_3, 
                Text = v37, 
                TextSize = v32, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = 3
            }) else nil
        }), 
        AliasFrame = if not l_props_0.uplevelAliasEnabled and l_alias_0 then l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 4, 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            l_Roact_0.createElement(l_Interactable_0, {
                Size = UDim2.new(0, 20 + v34, 0, 0), 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                onStateChanged = function()
                end, 
                [l_Roact_0.Event.Activated] = l_props_0.aliasActivated
            }, {
                PagePadding = l_Roact_0.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 6)
                }), 
                HorizontalLayout = l_Roact_0.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = UDim.new(0, 4)
                }), 
                AliasIcon = l_Roact_0.createElement(l_ImageSetLabel_0, {
                    Size = UDim2.new(0, 16, 0, 16), 
                    Image = l_Images_0["icons/actions/edit/edit_small"], 
                    ImageColor3 = v24.Theme.IconDefault.Color, 
                    ImageTransparency = v24.Theme.IconDefault.Transparency, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 1
                }), 
                Alias = l_Roact_0.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 0, 0), 
                    BackgroundTransparency = 1, 
                    Font = l_Font_2, 
                    Text = l_alias_0, 
                    TextSize = v31, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextColor3 = l_Theme_0.TextDefault.Color, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextWrapped = true, 
                    LayoutOrder = 2
                }, {
                    l_Roact_0.createElement("UISizeConstraint", {
                        MaxSize = Vector2.new(math.huge, v31 * 2)
                    })
                })
            })
        }) else nil, 
        ContextualInfo = if l_props_0.contextualInfoType == l_ContextualInfoTypes_0.MutualFriends and l_props_0.mutualFriendsListEnabled then nil else l_Roact_0.createElement(l_props_0.friendshipStatus == Enum.FriendStatus.Friend and v15 or v14, {
            layoutOrder = 5, 
            profileUserId = l_props_0.profileUserId
        }), 
        MutualFriendsList = if l_props_0.contextualInfoType == l_ContextualInfoTypes_0.MutualFriends and l_props_0.mutualFriendsListEnabled then l_Roact_0.createElement(v17, {
            layoutOrder = 5, 
            profileUserId = l_props_0.profileUserId
        }) else nil, 
        SelfPresenceStatusIndicator = if not v36 then nil else l_Roact_0.createElement(l_SelfPresenceStatusIndicatorContainer_0, {
            isInteractable = l_invisibleModeEnabled_0, 
            layoutOrder = 6, 
            showText = true, 
            showToast = l_props_0.showToast, 
            surface = l_InvisibleMode_0.Analytics.Surface.ProfileCard, 
            width = UDim.new(1, 0), 
            ZIndex = 5
        })
    });
end;
return v20;
