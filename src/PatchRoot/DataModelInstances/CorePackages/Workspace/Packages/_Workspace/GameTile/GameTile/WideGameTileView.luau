local l_TextService_0 = game:GetService("TextService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.DiscoveryStyleApi).useDesignTokens;
local v5 = require(l_Parent_0.DiscoveryUiBloxApi);
local l_Images_0 = v5.Images;
local l_ImageSetLabel_0 = v5.ImageSetLabel;
local l_LoadableImage_0 = v5.LoadableImage;
local l_useCursor_0 = v5.useCursor;
local v10 = require(l_script_FirstAncestor_0.ZoomAnimatedFrame);
local v11 = require(l_script_FirstAncestor_0.WideGameTileViewConfig);
local v12 = require(l_script_FirstAncestor_0.Footer.getGameTileMetadataFont);
local v13 = require(l_script_FirstAncestor_0.Flags.getFFlagLuaAppSingleHoveredGridTile);
local l_GetUIBloxEnableFontNameMapping_0 = require(l_Parent_0.SharedFlags).UIBlox.GetUIBloxEnableFontNameMapping;
local l_game_EngineFeature_0 = game:GetEngineFeature("TextTruncateSplitWord");
local v16 = Vector2.new(math.huge, math.huge);
return function(v17)
    local v18 = l_useDesignTokens_0();
    local v19 = UDim.new(0, v18.Global.Space_100);
    local v20 = l_useCursor_0(v19);
    local l_Subheader_0 = v18.Semantic.Typography.Subheader;
    local l_Emphasis_0 = v18.Semantic.Color.Text.Emphasis;
    local v23 = v12(v17.useLargerMetadataFontSize, v18);
    local l_Default_0 = v18.Semantic.Color.Text.Default;
    local l_Space_50_0 = v18.Global.Space_50;
    local l_Space_150_0 = v18.Global.Space_150;
    local v27 = if not v17.hidePlayButton then v11.getPlayButtonHeight(v18) else 0;
    local v28 = if not v17.hidePlayButton then v18.Global.Space_150 else 0;
    local l_isHovered_0 = v17.isHovered;
    local v30 = not not l_isHovered_0 and v17.ageRatingText or nil;
    local v31 = if not l_GetUIBloxEnableFontNameMapping_0() then v23.FontSize * 1.2 else v23.FontSize;
    local l_Font_0 = v23.Font;
    local v33 = v3.useMemo(function()
        if not (v30 ~= nil) or v30 == "" then
            return 0;
        else
            return l_TextService_0:GetTextSize(v30, v31, l_Font_0, v16).X;
        end;
    end, {
        v30, 
        v31, 
        l_Font_0
    });
    local v34 = if not v17.ageRatingText then UDim.new(1, -v18.Global.Space_150) else UDim.new(1, -(v33 + v18.Global.Space_150));
    local v35 = nil;
    if v13() then
        v35 = v17.Size or UDim2.fromScale(1, 1);
        if l_isHovered_0 then
            v35 = v35 + UDim2.fromOffset(l_Space_150_0 * 2, l_Space_150_0 * 2);
        end;
    end;
    return v3.createElement(v10, {
        isZoomEnabled = l_isHovered_0, 
        expansionOffsetX = l_Space_50_0 * 2, 
        expansionOffsetTop = l_Space_50_0, 
        expansionOffsetBottom = v27 + v28, 
        reducedMotion = v17.reducedMotion
    }, {
        HoverUnderlay = if not v13() then l_isHovered_0 and v3.createElement("Frame", {
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.new(1, l_Space_150_0 * 2, 1, l_Space_150_0 * 2), 
            BackgroundTransparency = 1, 
            ZIndex = -1
        }, {
            HoverShadow = v3.createElement(l_ImageSetLabel_0, {
                Position = UDim2.new(0.5, 0, 0.5, 2), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 18, 1, 20), 
                Image = l_Images_0["component_assets/dropshadow_56_8"], 
                ImageColor3 = v18.Semantic.Color.Common.DropShadow.Color3, 
                ImageTransparency = v18.Semantic.Color.Common.DropShadow.Transparency, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(35, 35, 37, 37), 
                ZIndex = 0
            }), 
            HoverBackground = v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = v18.Semantic.Color.BackgroundUi.Default.Transparency, 
                BackgroundColor3 = v18.Semantic.Color.BackgroundUi.Default.Color3, 
                ZIndex = 1
            }, {
                UICorner = v3.createElement("UICorner", {
                    CornerRadius = v19 + UDim.new(0, l_Space_150_0)
                })
            })
        }) or nil else nil, 
        HoverShadow = (not not v13() and l_isHovered_0) and v3.createElement(l_ImageSetLabel_0, {
            Position = UDim2.new(0.5, 0, 0.5, 2), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, l_Space_150_0 + 18, 1, l_Space_150_0 + 20), 
            Image = l_Images_0["component_assets/dropshadow_56_8"], 
            ImageColor3 = v18.Semantic.Color.Common.DropShadow.Color3, 
            ImageTransparency = v18.Semantic.Color.Common.DropShadow.Transparency, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(35, 35, 37, 37), 
            ZIndex = -1
        }) or nil, 
        WideGameTileContent = v3.createElement("TextButton", {
            ref = v17.forwardRef, 
            Size = if not v13() then v17.Size else v35, 
            Position = if not v13() then v17.Position else UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = if not v13() then nil else Vector2.new(0.5, 0.5), 
            SelectionImageObject = v20, 
            [v3.Event.Activated] = v17.onActivated, 
            ClipsDescendants = false, 
            Text = "", 
            BackgroundTransparency = not v13() and 1 or (l_isHovered_0 and v18.Semantic.Color.BackgroundUi.Default.Transparency or 1), 
            BackgroundColor3 = if not v13() then nil else v18.Semantic.Color.BackgroundUi.Default.Color3, 
            AutoButtonColor = if not v13() then nil else false
        }, {
            UIPadding = (not not v13() and l_isHovered_0) and v3.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, l_Space_150_0), 
                PaddingTop = UDim.new(0, l_Space_150_0), 
                PaddingRight = UDim.new(0, l_Space_150_0), 
                PaddingBottom = UDim.new(0, l_Space_150_0)
            }) or nil, 
            UICorner = v3.createElement("UICorner", {
                CornerRadius = if not v13() then v19 else v19 + UDim.new(0, l_Space_150_0)
            }), 
            UIListLayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            ImageFrame = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                LayoutOrder = 1
            }, {
                Thumbnail = v3.createElement(l_LoadableImage_0, {
                    BackgroundTransparency = 0, 
                    Image = v17.thumbnail, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    cornerRadius = v19, 
                    showFailedStateWhenLoadingFailed = true, 
                    useShimmerAnimationWhileLoading = true, 
                    ZIndex = -1
                }), 
                UIAspectRatioConstraint = v3.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1.7777777777777777
                }), 
                ThumbnailOverlay = v17.thumbnailOverlayPill
            }), 
            PaddingBelowImage = v3.createElement("Frame", {
                LayoutOrder = 2, 
                Size = UDim2.fromOffset(0, v18.Global.Space_100), 
                BackgroundTransparency = 1
            }), 
            Title = v3.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, v18.Global.Space_250), 
                BackgroundTransparency = 1, 
                Text = v17.title, 
                Font = l_Subheader_0.Font, 
                TextSize = if not l_GetUIBloxEnableFontNameMapping_0() then l_Subheader_0.FontSize * 1.2 else l_Subheader_0.FontSize, 
                TextTransparency = l_Emphasis_0.Transparency, 
                TextColor3 = l_Emphasis_0.Color3, 
                TextWrapped = false, 
                TextTruncate = if not l_game_EngineFeature_0 then Enum.TextTruncate.AtEnd else Enum.TextTruncate.SplitWord, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                LayoutOrder = 3
            }), 
            PaddingBelowTitle = v3.createElement("Frame", {
                LayoutOrder = 4, 
                Size = UDim2.fromOffset(0, v18.Global.Space_50), 
                BackgroundTransparency = 1
            }), 
            Metadata = v3.createElement("Frame", {
                Size = UDim2.new(v34, UDim.new(0, v18.Global.Space_250)), 
                ClipsDescendants = false, 
                BackgroundTransparency = 1, 
                LayoutOrder = 5
            }, {
                MetadataContent = v17.footerMetadata, 
                AgeRatingText = if not v17.ageRatingText then nil else v3.createElement("TextLabel", {
                    Text = v30, 
                    Size = UDim2.new(0, v33, v31, 0), 
                    Position = UDim2.new(1, v18.Global.Space_150, 0.5, 0), 
                    AnchorPoint = Vector2.new(0, 0.5), 
                    BackgroundTransparency = 1, 
                    TextSize = if not l_GetUIBloxEnableFontNameMapping_0() then v23.FontSize * 1.2 else v23.FontSize, 
                    Font = v23.Font, 
                    TextTransparency = l_Default_0.Transparency, 
                    TextColor3 = l_Default_0.Color3, 
                    TextWrapped = false, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextXAlignment = Enum.TextXAlignment.Right, 
                    TextYAlignment = Enum.TextYAlignment.Center
                })
            }), 
            PaddingAboveActionRow = not not l_isHovered_0 and v3.createElement("Frame", {
                LayoutOrder = 6, 
                Size = UDim2.fromOffset(0, v28), 
                BackgroundTransparency = 1
            }) or nil, 
            ActionRow = not not l_isHovered_0 and v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v27), 
                BackgroundTransparency = 1, 
                LayoutOrder = 7
            }, {
                Content = v17.hoverActionRow
            }) or nil
        })
    });
end;
