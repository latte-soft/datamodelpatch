local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local v1 = require(l_script_FirstAncestor_0.Footer.GridTileGameStats);
local v2 = require(l_script_FirstAncestor_0.Footer.GridTileIconTextFooter);
local v3 = require(l_script_FirstAncestor_0.Footer.usePlayerCountText);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v5 = require(l_Parent_0.Roact);
local l_Colors_0 = require(l_Parent_0.DiscoveryStyleApi).Colors;
local v7 = require(l_Parent_0.Cryo);
local v8 = require(l_Parent_0.DiscoveryUiBloxApi);
local l_withStyle_0 = v8.withStyle;
local l_ImageSetLabel_0 = v8.ImageSetLabel;
local l_Images_0 = v8.Images;
local l_Interactable_0 = v8.Interactable;
local l_TooltipOrientation_0 = v8.TooltipOrientation;
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local l_SponsoredTooltipHover_0 = require(l_Parent_0.Ads).SponsoredTooltipHover;
local l_GetFFlagLuaAppSponsoredTooltipCustomColorSupport_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppSponsoredTooltipCustomColorSupport;
local v17 = l_Images_0["icons/status/games/rating_small"];
local v18 = l_Images_0["icons/status/games/people-playing_small"];
local v19 = v5.PureComponent:extend("GameStats");
local function _(v20, v21)
    local v22 = "--";
    if not (v20 ~= nil) or v20 < 0 then
        v20 = 0;
    end;
    if not (v21 ~= nil) or v21 < 0 then
        v21 = 0;
    end;
    local v23 = v20 + v21;
    if v23 > 0 then
        v22 = tostring((math.floor((v20 / v23) * 100)));
    end;
    return v22;
end;
v19.renderSponsored = function(v25, v26)
    local l_Theme_0 = v26.Theme;
    local l_Font_0 = v26.Font;
    local v29 = if not v25.props.useLargerFont then l_Font_0.CaptionHeader else l_Font_0.Body;
    local v30 = v29.RelativeSize * l_Font_0.BaseSize;
    return l_withLocalization_0({
        sponsoredText = "Feature.GamePage.Label.Sponsored"
    })(function(v31)
        return v5.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, (math.ceil(v30))), 
            Position = UDim2.new(0, 0, 1, 0), 
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundColor3 = l_Theme_0.UIDefault.Color, 
            BackgroundTransparency = l_Theme_0.UIDefault.Transparency, 
            BorderSizePixel = 0
        }, {
            SponsoredBlock = v5.createElement(l_Interactable_0, {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                onStateChanged = function()
                end, 
                [v5.Event.Activated] = v25.props.onActivateSponsoredTooltip
            }, {
                SponsoredBlockFrame = v5.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0
                }, {
                    Layout = v5.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        Padding = UDim.new(0, 4)
                    }), 
                    SponsoredText = v5.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        TextSize = v30, 
                        TextColor3 = l_Theme_0.TextEmphasis.Color, 
                        TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                        Font = v29.Font, 
                        Text = v31.sponsoredText, 
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        LayoutOrder = 1
                    }), 
                    SponsoredTooltip = v5.createElement(l_SponsoredTooltipHover_0, {
                        tooltipOrientation = l_TooltipOrientation_0.Bottom, 
                        onActivateTooltip = v25.props.onActivateSponsoredTooltip, 
                        size = UDim2.new(0, 16, 0, 16), 
                        color = if not l_GetFFlagLuaAppSponsoredTooltipCustomColorSupport_0() then nil else l_Theme_0.TextEmphasis.Color, 
                        layoutOrder = 2
                    })
                })
            })
        });
    end);
end;
v19.renderGameStats = function(v32, v33, v34)
    local l_stats_0 = v34.stats;
    local l_totalUpVotes_0 = l_stats_0.totalUpVotes;
    local l_totalDownVotes_0 = l_stats_0.totalDownVotes;
    local v38 = "--";
    if not (l_totalUpVotes_0 ~= nil) or l_totalUpVotes_0 < 0 then
        l_totalUpVotes_0 = 0;
    end;
    if not (l_totalDownVotes_0 ~= nil) or l_totalDownVotes_0 < 0 then
        l_totalDownVotes_0 = 0;
    end;
    local v39 = l_totalUpVotes_0 + l_totalDownVotes_0;
    if v39 > 0 then
        v38 = tostring((math.floor((l_totalUpVotes_0 / v39) * 100)));
    end;
    local l_v38_0 = v38;
    if not (l_stats_0.playerCount ~= nil) then
        return l_withLocalization_0({
            longRatingText = {
                "Feature.GameDetails.RatingPercentOnly"; 
                percentRating = l_v38_0
            }
        })(function(v41)
            return v5.createElement(v2, {
                icon = l_Images_0["icons/status/games/rating_small"], 
                text = v41.longRatingText, 
                styleProps = {
                    iconSize = 15, 
                    padding = 4
                }, 
                useLargerFont = v32.props.useLargerFont
            });
        end);
    else
        if l_stats_0.totalUpVotes + l_stats_0.totalDownVotes > 0 then
            l_v38_0 = l_v38_0 .. "%";
        end;
        if not v34.isGridTile then
            return v32:renderFullGameStats(v33, v34, l_v38_0);
        else
            return v5.createElement(v1, {
                playerCountText = v34.playerCountText, 
                ratingText = l_v38_0, 
                useLargerFont = v32.props.useLargerFont
            });
        end;
    end;
end;
v19.renderFullGameStats = function(_, v43, v44, v45)
    local l_playerCount_0 = v44.stats.playerCount;
    local v47 = nil;
    if l_playerCount_0 then
        v47 = v44.playerCountText;
    end;
    local l_Theme_1 = v43.Theme;
    local l_Font_1 = v43.Font;
    local l_Font_2 = l_Font_1.CaptionSubHeader.Font;
    local v51 = l_Font_1.BaseSize * l_Font_1.CaptionSubHeader.RelativeSize;
    local v52 = math.ceil(v51);
    return v5.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        VoteIcon = v5.createElement(l_ImageSetLabel_0, {
            Size = UDim2.new(0.125, 0, 0, v52), 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.fromScale(0, 0.5), 
            BackgroundTransparency = 1, 
            Image = v17, 
            ImageColor3 = l_Theme_1.TextMuted.Color, 
            ImageTransparency = l_Theme_1.TextMuted.Transparency, 
            ScaleType = Enum.ScaleType.Fit
        }), 
        Vote = v5.createElement("TextLabel", {
            Size = UDim2.new(0.3, 0, 0, v52), 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.fromScale(0.15, 0.5), 
            Text = v45, 
            Font = l_Font_2, 
            TextColor3 = l_Theme_1.TextMuted.Color, 
            TextTransparency = l_Theme_1.TextMuted.Transparency, 
            TextSize = v51, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Bottom
        }), 
        PlayerIcon = if v47 ~= nil then v5.createElement(l_ImageSetLabel_0, {
            Size = UDim2.new(0.125, 0, 0, v52), 
            BackgroundTransparency = 1, 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0, 0.5), 
            Image = v18, 
            ImageColor3 = l_Theme_1.TextMuted.Color, 
            ImageTransparency = l_Theme_1.TextMuted.Transparency, 
            ScaleType = Enum.ScaleType.Fit
        }) else nil, 
        PlayerCount = if v47 ~= nil then v5.createElement("TextLabel", {
            Size = UDim2.new(0.3, 0, 0, v52), 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.fromScale(0.65, 0.5), 
            Text = v47, 
            Font = l_Font_2, 
            TextColor3 = l_Theme_1.TextMuted.Color, 
            TextTransparency = l_Theme_1.TextMuted.Transparency, 
            TextSize = v51, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Bottom
        }) else nil
    });
end;
v19.renderConcurrentUsersPill = function(_, v54, v55)
    local l_playerCountText_0 = v55.playerCountText;
    local l_Font_3 = v54.Font;
    return v5.createElement("Frame", {
        Size = UDim2.new(0, 0, 0, 23), 
        Position = UDim2.new(1, -8, 1, -8), 
        AnchorPoint = Vector2.new(1, 1), 
        AutomaticSize = Enum.AutomaticSize.X, 
        BackgroundTransparency = 0, 
        BackgroundColor3 = l_Colors_0.Black
    }, {
        Corner = v5.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        Padding = v5.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 2), 
            PaddingRight = UDim.new(0, 8), 
            PaddingBottom = UDim.new(0, 2), 
            PaddingLeft = UDim.new(0, 15)
        }), 
        Layout = v5.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            Padding = UDim.new(0.15, 0)
        }), 
        PillIcon = v5.createElement(l_ImageSetLabel_0, {
            Size = UDim2.new(0.7, 0, 0.7, 0), 
            SizeConstraint = Enum.SizeConstraint.RelativeYY, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            Image = v18, 
            ImageColor3 = l_Colors_0.White, 
            ImageTransparency = 0, 
            ScaleType = Enum.ScaleType.Fit
        }), 
        PillPlayerCount = v5.createElement("TextLabel", {
            Size = UDim2.new(0, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            Text = l_playerCountText_0, 
            Font = l_Font_3.Footer.Font, 
            TextColor3 = l_Colors_0.White, 
            TextTransparency = 0, 
            TextSize = l_Font_3.BaseSize * l_Font_3.Footer.RelativeSize, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Bottom
        })
    });
end;
v19.render = function(v58)
    local l_stats_1 = v58.props.stats;
    if l_stats_1 == nil then
        return nil;
    else
        return l_withStyle_0(function(v60)
            if not (l_stats_1.isSponsored and l_stats_1.isShowSponsoredLabel) then
                if not l_stats_1.displayConcurrentUsersPill then
                    if not v58.props.hideGameStats then
                        return v58:renderGameStats(v60, v58.props);
                    else
                        return nil;
                    end;
                else
                    return v58:renderConcurrentUsersPill(v60, v58.props);
                end;
            else
                return v58:renderSponsored(v60);
            end;
        end);
    end;
end;
local l_v19_0 = v19;
return function(v62)
    return v5.createElement(l_v19_0, v7.Dictionary.join(v62, {
        playerCountText = v3(not not v62.stats and v62.stats.playerCount or nil)
    }));
end;
