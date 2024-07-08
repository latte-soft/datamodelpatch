local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v4.Style.withStyle;
local v6 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v8 = require(l_CorePackages_0.Workspace.Packages.VerifiedBadges);
local l_isPlayerVerified_0 = v8.isPlayerVerified;
local v10 = require(l_CorePackages_0.Workspace.Packages.InvisibleMode);
local l_FFlagInvisibleModeEnabledForAll_0 = v10.Flags.FFlagInvisibleModeEnabledForAll;
local l_FFlagInvisibleModeExperimentEnabled_0 = v10.Flags.FFlagInvisibleModeExperimentEnabled;
local l_SelfPresenceStatusIndicatorContainer_0 = v10.Components.SelfPresenceStatusIndicatorContainer;
local l_InvisibleModeIXP_0 = v10.Flags.InvisibleModeIXP;
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb;
local l_GetFFlagFixTenFootUiMorePage_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagFixTenFootUiMorePage;
local v17 = require(l_Modules_0.LuaApp.Enum.OptionalContactMethodUpsellTypes);
local v18 = require(l_Modules_0.LuaApp.Components.Home.HomePageUpsellCardWithIcon);
local v19 = require(l_Modules_0.Common.Text);
local l_GetImageData_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppAssets).GetImageData;
local l_Images_0 = v4.App.ImageSet.Images;
local l_IconButton_0 = v4.App.Button.IconButton;
local l_LoadableImage_0 = v4.App.Loading.LoadableImage;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local v25 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableHomePageUpsellCard);
local v26 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableHomePageEmailUpsellCard);
local v27 = require(l_Modules_0.LuaApp.Flags.GetFFlagShowVerifiedBadgeUserInfoWidget);
local v28 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUserWidgetAvatarButton);
local v29 = require(l_Modules_0.LuaApp.Flags.FFlagMovePremiumIcon);
local l_FFlagProfileViewFixTextTruncation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagProfileViewFixTextTruncation;
local v31 = require(l_Modules_0.Personalization.Flags.GetFFlagUseUpsellCardOmniFeedItem);
local v32 = v3.PureComponent:extend("UserWidget");
local v33 = {
    [Enum.MembershipType.BuildersClub] = "LuaApp/icons/status_BC", 
    [Enum.MembershipType.TurboBuildersClub] = "LuaApp/icons/status_TBC", 
    [Enum.MembershipType.OutrageousBuildersClub] = "LuaApp/icons/status_OBC", 
    [Enum.MembershipType.Premium] = "LuaApp/icons/status_premium"
};
local v34 = {
    [Enum.MembershipType.None] = 0, 
    [Enum.MembershipType.BuildersClub] = 24, 
    [Enum.MembershipType.TurboBuildersClub] = 24, 
    [Enum.MembershipType.OutrageousBuildersClub] = 24, 
    [Enum.MembershipType.Premium] = 36
};
local function v36(v35)
    return v3.createElement(v8.EmojiWrapper, {
        emoji = not l_isPlayerVerified_0(l_Players_0.LocalPlayer) and "" or v8.emoji.verified, 
        layoutOrder = 2
    }, {
        UsernameText = v3.createElement("TextButton", {
            Size = UDim2.new(0, v35.textBounds.X, 0, v35.textBounds.Y), 
            BackgroundTransparency = 1, 
            TextSize = v35.textSize, 
            TextColor3 = v35.textColor, 
            TextTransparency = v35.textTransparency, 
            Font = v35.textFont, 
            Text = v35.username, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            LayoutOrder = 2, 
            [v3.Event.Activated] = v35.onActivated, 
            Selectable = v35.onActivated ~= nil
        })
    });
end;
v32.renderUserAvatar = function(_, v38, v39, v40, v41)
    return v3.createElement(l_LoadableImage_0, {
        Size = UDim2.new(0, v38, 0, v38), 
        LayoutOrder = 1, 
        BackgroundColor3 = v39, 
        BackgroundTransparency = v40, 
        Image = l_getStandardSizeAvatarHeadShotRbxthumb_0(v41.id), 
        useShimmerAnimationWhileLoading = true, 
        cornerRadius = UDim.new(0.5, 0), 
        shouldHandleReloads = true
    });
end;
v32.render = function(v42)
    local l_localUserModel_0 = v42.props.localUserModel;
    local l_onActivated_0 = v42.props.onActivated;
    local l_layoutOrder_0 = v42.props.layoutOrder;
    local l_sideMargin_0 = v42.props.sideMargin;
    local l_isProfileShareEnabled_0 = v42.props.isProfileShareEnabled;
    local l_onActivatedProfileShare_0 = v42.props.onActivatedProfileShare;
    if l_localUserModel_0 == nil then
        return nil;
    else
        local v49 = if not not l_GetFFlagFixTenFootUiMorePage_0() and v42.props.thumbnailSize then v42.props.thumbnailSize else 36;
        local l_name_0 = l_localUserModel_0.name;
        if v42.props.enableDisplayNamePolicy then
            l_name_0 = l_localUserModel_0.displayName;
        end;
        local l_membership_0 = l_localUserModel_0.membership;
        local v52 = l_membership_0 ~= Enum.MembershipType.None;
        local v53 = l_FFlagInvisibleModeEnabledForAll_0 or v42.props.invisibleModeEnabled;
        local function _(v54)
            local v55 = true;
            if v54 ~= v17.ContactMethodPhoneNumber then
                v55 = true;
                if v54 ~= v17.ContactMethodPhoneNumberVoiceOptIn then
                    v55 = true;
                    if v54 ~= v17.ContactMethodPhoneNumberEmailVerticalLayout then
                        v55 = true;
                        if v54 ~= v17.ContactMethodPhoneNumberEmailHorizontalLayout then
                            v55 = v26() and v54 == v17.ContactMethodEmail;
                        end;
                    end;
                end;
            end;
            return v55;
        end;
        return l_withStyle_0(function(v57)
            local l_Font_0 = v57.Font;
            local l_Theme_0 = v57.Theme;
            local v60 = if not not l_GetFFlagFixTenFootUiMorePage_0() and v42.props.usernameTextFont then v42.props.usernameTextFont else l_Font_0.Header1;
            local v61 = if not not l_GetFFlagFixTenFootUiMorePage_0() and v42.props.usernameTextStyle then v42.props.usernameTextStyle else l_Theme_0.TextEmphasis;
            local l_Font_1 = v60.Font;
            local v63 = if not not l_GetFFlagFixTenFootUiMorePage_0() and v60.FontSize then v60.FontSize else l_Font_0.BaseSize * v60.RelativeSize;
            local v64 = l_membership_0 ~= nil and v34[l_membership_0] or 0;
            local l_Color_0 = v61.Color;
            local l_Transparency_0 = v61.Transparency;
            local l_Color_1 = l_Theme_0.PlaceHolder.Color;
            local l_Transparency_1 = l_Theme_0.PlaceHolder.Transparency;
            local v69 = v19.GetTextBounds(l_name_0, l_Font_1, v63, Vector2.new(10000, 10000));
            local v70 = v3.createElement("Frame", {
                Size = if not l_isProfileShareEnabled_0 then UDim2.new(0, (v69.X + v64) + 4, 0, v69.Y) else UDim2.new(0, 0, 0, v69.Y), 
                AutomaticSize = if not l_isProfileShareEnabled_0 then Enum.AutomaticSize.None else Enum.AutomaticSize.X, 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, {
                HorizontalLayout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = UDim.new(0, 4)
                }), 
                PresenceStatusIndicator = if not v53 then nil else v3.createElement(l_SelfPresenceStatusIndicatorContainer_0, {
                    layoutOrder = 1, 
                    surface = v10.Analytics.Surface.HomePage
                }), 
                MembershipIcon = v52 and v3.createElement(l_ImageSetLabel_0, {
                    Size = UDim2.new(0, v64, 0, v64), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Image = l_GetImageData_0(v33[l_membership_0]) or v33[l_membership_0], 
                    ImageColor3 = l_Color_0, 
                    ImageTransparency = l_Transparency_0, 
                    LayoutOrder = 2
                }), 
                Username = if not v27() then v3.createElement("TextButton", {
                    Size = UDim2.new(0, v69.X, 0, v69.Y), 
                    BackgroundTransparency = 1, 
                    TextSize = v63, 
                    TextColor3 = l_Color_0, 
                    TextTransparency = l_Transparency_0, 
                    Font = l_Font_1, 
                    Text = l_name_0, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    LayoutOrder = 3, 
                    [v3.Event.Activated] = l_onActivated_0, 
                    Selectable = l_onActivated_0 ~= nil
                }) else v36({
                    textBounds = v69, 
                    textSize = v63, 
                    textColor = l_Color_0, 
                    textTransparency = l_Transparency_0, 
                    textFont = l_Font_1, 
                    username = l_name_0, 
                    onActivated = l_onActivated_0
                }), 
                ShareButtonSpacer = l_isProfileShareEnabled_0 and v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromOffset(0, 0), 
                    LayoutOrder = 4
                }), 
                ShareButton = l_isProfileShareEnabled_0 and v3.createElement(l_IconButton_0, {
                    icon = l_Images_0["icons/actions/share"], 
                    size = UDim2.fromOffset(36, 36), 
                    layoutOrder = 5, 
                    onActivated = l_onActivatedProfileShare_0
                })
            });
            local v71 = nil;
            if v29 then
                v71 = v3.createElement("Frame", {
                    Size = if not l_FFlagProfileViewFixTextTruncation_0 then if l_isProfileShareEnabled_0 then UDim2.new(0, 0, 0, v69.Y) else UDim2.new(0, (v69.X + v64) + 4, 0, v69.Y) else UDim2.new(1, ((-v64 - 4) - l_sideMargin_0) - l_sideMargin_0, 0, v69.Y), 
                    AutomaticSize = if not l_isProfileShareEnabled_0 then Enum.AutomaticSize.None else Enum.AutomaticSize.X, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2
                }, {
                    HorizontalLayout = v3.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        Padding = UDim.new(0, 4)
                    }), 
                    PresenceStatusIndicator = if not v53 then nil else v3.createElement(l_SelfPresenceStatusIndicatorContainer_0, {
                        layoutOrder = 1, 
                        surface = v10.Analytics.Surface.HomePage
                    }), 
                    Username = v3.createElement(v8.EmojiWrapper, {
                        size = UDim2.fromScale(0, 0), 
                        emoji = if not l_isPlayerVerified_0(l_Players_0.LocalPlayer) then if l_membership_0 == Enum.MembershipType.Premium then v8.emoji.premium else "" else v8.emoji.verified, 
                        color = if l_membership_0 == Enum.MembershipType.Premium then l_Theme_0.TextEmphasis.Color else nil, 
                        layoutOrder = 2, 
                        onActivated = l_onActivated_0
                    }, {
                        UsernameText = v3.createElement("TextButton", {
                            Size = if not l_FFlagProfileViewFixTextTruncation_0 then UDim2.new(0, v69.X, 0, v69.Y) else UDim2.new(1, 0, 0, v69.Y), 
                            BackgroundTransparency = 1, 
                            TextSize = v63, 
                            TextColor3 = l_Color_0, 
                            TextTransparency = l_Transparency_0, 
                            TextTruncate = if not l_FFlagProfileViewFixTextTruncation_0 then Enum.TextTruncate.None else Enum.TextTruncate.AtEnd, 
                            Font = l_Font_1, 
                            Text = l_name_0, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            [v3.Event.Activated] = l_onActivated_0, 
                            Selectable = l_onActivated_0 ~= nil
                        })
                    }), 
                    ShareButtonSpacer = l_isProfileShareEnabled_0 and v3.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.fromOffset(0, 0), 
                        LayoutOrder = 3
                    }), 
                    ShareButton = l_isProfileShareEnabled_0 and v3.createElement(l_IconButton_0, {
                        icon = l_Images_0["icons/actions/share"], 
                        size = UDim2.fromOffset(36, 36), 
                        layoutOrder = 4, 
                        onActivated = l_onActivatedProfileShare_0
                    })
                });
            end;
            if not v25() or v31() then
                return v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = l_layoutOrder_0, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, {
                    UIPadding = v3.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, l_sideMargin_0), 
                        PaddingRight = UDim.new(0, l_sideMargin_0)
                    }), 
                    UsernameAvatarFrame = v3.createElement(not v28() and "Frame" or "TextButton", {
                        Size = if not l_FFlagProfileViewFixTextTruncation_0 then UDim2.new(0, v49, 0, v49) else UDim2.new(1, 0, 0, v49), 
                        BackgroundTransparency = 1, 
                        Text = if not v28() then nil else "", 
                        LayoutOrder = 1, 
                        [v3.Event.Activated] = if not v28() then nil else l_onActivated_0
                    }, {
                        HorizontalLayout = v3.createElement("UIListLayout", {
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            FillDirection = Enum.FillDirection.Horizontal, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            Padding = UDim.new(0, 12)
                        }), 
                        UserAvatar = v42:renderUserAvatar(v49, l_Color_1, l_Transparency_1, l_localUserModel_0); 
                        if not v29 then v70 else v71
                    })
                });
            else
                local l_createElement_0 = v3.createElement;
                local v73 = "Frame";
                local v74 = {
                    BackgroundTransparency = 1, 
                    LayoutOrder = l_layoutOrder_0, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y
                };
                local v75 = {
                    UIPadding = v3.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, l_sideMargin_0), 
                        PaddingRight = UDim.new(0, l_sideMargin_0)
                    }), 
                    UsernameAvatarFrame = v3.createElement(not v28() and "Frame" or "TextButton", {
                        Size = if not l_FFlagProfileViewFixTextTruncation_0 then UDim2.new(0, v49, 0, v49) else UDim2.new(1, 0, 0, v49), 
                        BackgroundTransparency = 1, 
                        Text = if not v28() then nil else "", 
                        LayoutOrder = 1, 
                        [v3.Event.Activated] = if not v28() then nil else l_onActivated_0
                    }, {
                        HorizontalLayout = v3.createElement("UIListLayout", {
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            FillDirection = Enum.FillDirection.Horizontal, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            Padding = UDim.new(0, 12)
                        }), 
                        UserAvatar = v42:renderUserAvatar(v49, l_Color_1, l_Transparency_1, l_localUserModel_0); 
                        if not v29 then v70 else v71
                    }), 
                    VerticalLayout = v3.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        Padding = UDim.new(0, 10)
                    })
                };
                local l_createElement_1 = v3.createElement;
                local v77 = "Frame";
                local v78 = {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                    AutomaticSize = Enum.AutomaticSize.Y
                };
                local v79 = {};
                local l_upsellCardVariation_0 = v42.props.upsellCardVariation;
                if l_upsellCardVariation_0 then
                    local l_upsellCardType_0 = v42.props.upsellCardVariation.upsellCardType;
                    l_upsellCardVariation_0 = true;
                    if l_upsellCardType_0 ~= v17.ContactMethodPhoneNumber then
                        l_upsellCardVariation_0 = true;
                        if l_upsellCardType_0 ~= v17.ContactMethodPhoneNumberVoiceOptIn then
                            l_upsellCardVariation_0 = true;
                            if l_upsellCardType_0 ~= v17.ContactMethodPhoneNumberEmailVerticalLayout then
                                l_upsellCardVariation_0 = true;
                                if l_upsellCardType_0 ~= v17.ContactMethodPhoneNumberEmailHorizontalLayout then
                                    l_upsellCardVariation_0 = v26() and l_upsellCardType_0 == v17.ContactMethodEmail;
                                end;
                            end;
                        end;
                    end;
                    if l_upsellCardVariation_0 then
                        l_upsellCardVariation_0 = v3.createElement(v18, {
                            emailButtonClickCallback = v42.props.upsellCardEmailButtonClickedCallback, 
                            phoneButtonClickCallback = v42.props.upsellCardPhoneButtonClickedCallback, 
                            upsellCardVariation = v42.props.upsellCardVariation
                        });
                    end;
                end;
                v79.HomePageUpsellCard = l_upsellCardVariation_0;
                v75.HomePageUpsellCardFrame = l_createElement_1(v77, v78, v79);
                return l_createElement_0(v73, v74, v75);
            end;
        end);
    end;
end;
if l_FFlagInvisibleModeExperimentEnabled_0 then
    v32 = v6.connectUserLayer({
        l_InvisibleModeIXP_0.ExperimentLayer
    }, function(v82, _)
        return {
            invisibleModeEnabled = l_InvisibleModeIXP_0.isExperimentEnabled(v82)
        };
    end)(v32);
end;
return l_RoactAppPolicy_0.connect(function(v84, _)
    return {
        enableDisplayNamePolicy = v84.getShowDisplayName()
    };
end)(v32);
