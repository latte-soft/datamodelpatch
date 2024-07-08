local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.SharedFlags);
local l_InvisibleMode_0 = v2.InvisibleMode;
local l_llama_0 = v2.llama;
local l_Roact_0 = v2.Roact;
local l_t_0 = v2.t;
local l_UIBlox_0 = v2.UIBlox;
local l_VerifiedBadges_0 = v2.VerifiedBadges;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_IconButton_0 = l_UIBlox_0.App.Button.IconButton;
local v13 = require(l_script_FirstAncestor_0.Components.StyledTextLabel);
local v14 = require(l_script_FirstAncestor_0.Components.StyledImageSetLabel);
local v15 = require(l_script_FirstAncestor_0.EnumScreens);
local l_SelfPresenceStatusIndicatorContainer_0 = l_InvisibleMode_0.Components.SelfPresenceStatusIndicatorContainer;
local l_FFlagInvisibleModeEnabledForAll_0 = l_InvisibleMode_0.Flags.FFlagInvisibleModeEnabledForAll;
local l_FFlagInvisibleModeExperimentEnabled_0 = l_InvisibleMode_0.Flags.FFlagInvisibleModeExperimentEnabled;
local l_InvisibleModeIXP_0 = l_InvisibleMode_0.Flags.InvisibleModeIXP;
local l_FFlagProfileViewFixTextTruncation_0 = v4.FFlagProfileViewFixTextTruncation;
local v21 = l_t_0.interface({
    userText = l_t_0.string, 
    avatarImage = l_t_0.optional(l_t_0.string), 
    onActivated = l_t_0.optional(l_t_0.callback), 
    isPremium = l_t_0.optional(l_t_0.boolean), 
    navigateToLuaAppPages = l_t_0.optional(l_t_0.table), 
    hasVerifiedBadge = l_t_0.optional(l_t_0.boolean), 
    isProfileShareEnabled = l_t_0.optional(l_t_0.boolean), 
    onActivatedProfileShare = l_t_0.optional(l_t_0.callback)
});
local v22 = {
    userText = "", 
    avatarImage = "", 
    onActivated = function()
    end, 
    isPremium = false, 
    hasVerifiedBadge = false, 
    isProfileShareEnabled = false, 
    onActivatedProfileShare = function()
    end
};
return function(v23)
    local v24, v25 = v3.useState(1000);
    v23 = l_llama_0.Dictionary.join(v22, v23);
    assert(v21(v23));
    local v26 = nil;
    v26 = if not v23.hasVerifiedBadge then if v23.isPremium then l_VerifiedBadges_0.emoji.premium else "" else l_VerifiedBadges_0.emoji.verified;
    local v27 = l_FFlagInvisibleModeEnabledForAll_0 or l_FFlagInvisibleModeExperimentEnabled_0 and l_InvisibleModeIXP_0.useIsExperimentEnabled();
    return l_UIBlox_0.Style.withStyle(function(v28)
        local l_Theme_0 = v28.Theme;
        local l_Font_0 = v28.Font;
        if not l_FFlagProfileViewFixTextTruncation_0 then
            return (l_Roact_0.createElement("ImageButton", {
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.X, 
                Size = UDim2.new(0, 0, 0, 36), 
                [l_Roact_0.Event.Activated] = v23.onActivated, 
                LayoutOrder = v23.layoutOrder
            }, {
                layout = l_Roact_0.createElement("UIListLayout", {
                    Padding = UDim.new(0, 4), 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                avatarImage = l_Roact_0.createElement(v14, {
                    Image = v23.avatarImage, 
                    BackgroundStyle = v28.Theme.PlaceHolder, 
                    Size = UDim2.fromOffset(36, 36), 
                    LayoutOrder = 1
                }, {
                    corner = l_Roact_0.createElement("UICorner", {
                        CornerRadius = UDim.new(1, 0)
                    })
                }), 
                spacer = l_Roact_0.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromOffset(4, 0), 
                    LayoutOrder = 2
                }), 
                selfPresenceStatusIndicator = if not v27 then nil else l_Roact_0.createElement(l_SelfPresenceStatusIndicatorContainer_0, {
                    layoutOrder = 3, 
                    surface = l_InvisibleMode_0.Analytics.Surface.SocialTab
                }), 
                userTextWrapper = l_Roact_0.createElement(l_VerifiedBadges_0.EmojiWrapper, {
                    size = UDim2.fromScale(0, 0), 
                    emoji = if not v23.hasVerifiedBadge then if v23.isPremium then l_VerifiedBadges_0.emoji.premium else "" else l_VerifiedBadges_0.emoji.verified, 
                    color = if not v23.isPremium then nil else l_Theme_0.TextEmphasis.Color, 
                    layoutOrder = 4, 
                    onActivated = v26 == l_VerifiedBadges_0.emoji.verified and function()
                        v23.navigateToLuaAppPages[v15.VerifiedBadgeModal]();
                    end or nil
                }, {
                    userText = l_Roact_0.createElement(v13, {
                        TextStyle = l_Theme_0.TextEmphasis, 
                        FontStyle = l_Font_0.Header1, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        Text = v23.userText, 
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        LayoutOrder = 4
                    })
                }), 
                shareButtonSpacer = v23.isProfileShareEnabled and l_Roact_0.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromOffset(0, 0), 
                    LayoutOrder = 5
                }), 
                shareButton = v23.isProfileShareEnabled and l_Roact_0.createElement(l_IconButton_0, {
                    icon = l_Images_0["icons/actions/share"], 
                    size = UDim2.fromOffset(36, 36), 
                    layoutOrder = 6, 
                    onActivated = v23.onActivatedProfileShare
                })
            }));
        else
            return (l_Roact_0.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 36), 
                [l_Roact_0.Change.AbsoluteSize] = function(v31)
                    v25(v31.AbsoluteSize.X);
                end, 
                LayoutOrder = v23.layoutOrder
            }, {
                profileButton = l_Roact_0.createElement("ImageButton", {
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.X, 
                    Size = UDim2.new(0, 0, 0, 36), 
                    [l_Roact_0.Event.Activated] = v23.onActivated
                }, {
                    layout = l_Roact_0.createElement("UIListLayout", {
                        Padding = UDim.new(0, 4), 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        VerticalAlignment = Enum.VerticalAlignment.Center
                    }), 
                    avatarImage = l_Roact_0.createElement(v14, {
                        Image = v23.avatarImage, 
                        BackgroundStyle = v28.Theme.PlaceHolder, 
                        Size = UDim2.fromOffset(36, 36), 
                        LayoutOrder = 1
                    }, {
                        corner = l_Roact_0.createElement("UICorner", {
                            CornerRadius = UDim.new(1, 0)
                        })
                    }), 
                    spacer = l_Roact_0.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.fromOffset(4, 0), 
                        LayoutOrder = 2
                    }), 
                    selfPresenceStatusIndicator = if not v27 then nil else l_Roact_0.createElement(l_SelfPresenceStatusIndicatorContainer_0, {
                        layoutOrder = 3, 
                        surface = l_InvisibleMode_0.Analytics.Surface.SocialTab
                    }), 
                    userTextWrapper = l_Roact_0.createElement(l_VerifiedBadges_0.EmojiWrapper, {
                        size = UDim2.fromScale(0, 0), 
                        emoji = if not v23.hasVerifiedBadge then if v23.isPremium then l_VerifiedBadges_0.emoji.premium else "" else l_VerifiedBadges_0.emoji.verified, 
                        color = if not v23.isPremium then nil else l_Theme_0.TextEmphasis.Color, 
                        layoutOrder = 4, 
                        onActivated = v26 == l_VerifiedBadges_0.emoji.verified and function()
                            v23.navigateToLuaAppPages[v15.VerifiedBadgeModal]();
                        end or nil
                    }, {
                        userText = l_Roact_0.createElement(v13, {
                            TextTruncate = Enum.TextTruncate.AtEnd, 
                            TextStyle = l_Theme_0.TextEmphasis, 
                            FontStyle = l_Font_0.Header1, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            Text = v23.userText, 
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            LayoutOrder = 4
                        }, {
                            uISizeConstraint = l_Roact_0.createElement("UISizeConstraint", {
                                MaxSize = Vector2.new((v24 - 36) - 4, 36)
                            })
                        })
                    }), 
                    shareButtonSpacer = v23.isProfileShareEnabled and l_Roact_0.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.fromOffset(0, 0), 
                        LayoutOrder = 5
                    }), 
                    shareButton = v23.isProfileShareEnabled and l_Roact_0.createElement(l_IconButton_0, {
                        icon = l_Images_0["icons/actions/share"], 
                        size = UDim2.fromOffset(36, 36), 
                        layoutOrder = 6, 
                        onActivated = v23.onActivatedProfileShare
                    })
                })
            }));
        end;
    end);
end;
