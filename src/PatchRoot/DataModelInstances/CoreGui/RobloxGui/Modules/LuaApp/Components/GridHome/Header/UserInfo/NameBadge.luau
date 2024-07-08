local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Workspace.Packages.InvisibleMode);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.UIBlox);
local l_Emoji_0 = v4.App.Emoji.Enum.Emoji;
local l_EmojiTextLabel_0 = v4.Core.Text.EmojiTextLabel;
local l_getIconSize_0 = v4.App.ImageSet.getIconSize;
local l_IconSize_0 = v4.App.ImageSet.Enum.IconSize;
local l_Images_0 = v4.App.ImageSet.Images;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_LoadableImage_0 = v4.App.Loading.LoadableImage;
local l_withStyle_0 = v4.Core.Style.withStyle;
local l_SelfPresenceStatusIndicatorContainer_0 = v2.Components.SelfPresenceStatusIndicatorContainer;
local l_FFlagInvisibleModeEnabledForAll_0 = v2.Flags.FFlagInvisibleModeEnabledForAll;
local l_FFlagInvisibleModeExperimentEnabled_0 = v2.Flags.FFlagInvisibleModeExperimentEnabled;
local l_InvisibleModeIXP_0 = v2.Flags.InvisibleModeIXP;
local l_GetTextSize_0 = require(l_CorePackages_0.Workspace.Packages.Style).GetTextSize;
local v18 = require(l_Modules_0.LuaApp.Components.GridHome.Flags.GetFFlagVerifiedBadgeOnDUARHomePageHeaderBarName);
local v19 = l_getIconSize_0(l_IconSize_0.Small);
local v20 = l_Images_0["icons/status/premium_small"];
return function(v21)
    local v22 = v21.displayName or "...";
    local l_thumbnail_0 = v21.thumbnail;
    local l_isPremium_0 = v21.isPremium;
    local v25 = not not v18() and v21.isVerified;
    local l_localUserId_0 = v21.localUserId;
    local v27 = if not v21.luaProfileEnabled then v21.openProfile else function()
        v21.openLuaProfile(l_localUserId_0, {
            profilePeekViewProps = {
                resetPeekView = true
            }
        });
    end;
    local v28 = l_FFlagInvisibleModeEnabledForAll_0 or l_FFlagInvisibleModeExperimentEnabled_0 and l_InvisibleModeIXP_0.useIsExperimentEnabled();
    local v29 = 44 + (not v28 and 0 or 24);
    local v30 = not l_isPremium_0 and 0 or v19 + 4;
    return l_withStyle_0(function(v31)
        local l_Font_0 = v31.Font.Header2.Font;
        local v33 = v31.Font.BaseSize * v31.Font.Header2.RelativeSize;
        local l_Color_0 = v31.Theme.TextEmphasis.Color;
        local l_Transparency_0 = v31.Theme.TextEmphasis.Transparency;
        local l_Color_1 = v31.Theme.PlaceHolder.Color;
        local l_Transparency_1 = v31.Theme.PlaceHolder.Transparency;
        local v38 = l_GetTextSize_0(v22, v33, l_Font_0, Vector2.new(244 - v30, 36));
        local _ = nil;
        return v3.createElement("TextButton", {
            BackgroundTransparency = 1, 
            Text = "", 
            Size = UDim2.new(0, if not v28 then ((44 + v38.X) + v30) + (not v25 and 0 or v33) else ((v29 + v38.X) + v30) + (not v25 and 0 or v33), 1, 0), 
            [v3.Event.Activated] = v27
        }, {
            Thumbnail = v3.createElement(l_LoadableImage_0, {
                BackgroundColor3 = l_Color_1, 
                BackgroundTransparency = l_Transparency_1, 
                Image = l_thumbnail_0, 
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.fromScale(0, 0.5), 
                Size = UDim2.fromOffset(36, 36), 
                cornerRadius = UDim.new(0.5, 0), 
                showFailedStateWhenLoadingFailed = true, 
                useShimmerAnimationWhileLoading = true
            }), 
            SelfPresenceStatusIndicator = if not v28 then nil else v3.createElement("Frame", {
                AnchorPoint = Vector2.new(0, 0.5), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(0, 44, 0.5, 0), 
                Size = UDim2.fromOffset(18, 28)
            }, {
                SelfPresenceStatusIndicator = v3.createElement(l_SelfPresenceStatusIndicatorContainer_0, {
                    surface = v2.Analytics.Surface.UniversalAppHeaderBar
                })
            }), 
            DisplayName = not not v25 and v3.createElement(l_EmojiTextLabel_0, {
                Text = v22, 
                TextTransparency = l_Transparency_0, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.new(0, v29, 0.5, 0), 
                BackgroundTransparency = 1, 
                fontStyle = v31.Font.Header2, 
                colorStyle = v31.Theme.TextEmphasis, 
                fluidSizing = false, 
                emoji = l_Emoji_0.Verified, 
                maxSize = Vector2.new(v38.X + v33, v38.Y)
            }) or v3.createElement("TextLabel", {
                Text = v22, 
                Font = l_Font_0, 
                TextSize = v33, 
                TextColor3 = l_Color_0, 
                TextTransparency = l_Transparency_0, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.new(0, v29, 0.5, 0), 
                Size = UDim2.fromOffset(v38.X, v38.Y), 
                BackgroundTransparency = 1
            }), 
            MembershipIcon = if not l_isPremium_0 then nil else v3.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Image = v20, 
                AnchorPoint = Vector2.new(1, 0.5), 
                Position = UDim2.fromScale(1, 0.5), 
                Size = UDim2.fromOffset(v19, v19), 
                ImageColor3 = l_Color_0, 
                ImageTransparency = l_Transparency_0
            })
        });
    end);
end;
