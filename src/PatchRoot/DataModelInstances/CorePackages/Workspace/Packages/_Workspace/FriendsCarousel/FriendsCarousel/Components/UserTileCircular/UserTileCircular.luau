local v0 = require(script:FindFirstAncestor("FriendsCarousel").dependencies);
local l_Roact_0 = v0.Roact;
local l_React_0 = v0.React;
local l_Text_0 = v0.Text;
local l_llama_0 = v0.llama;
local l_memoize_0 = v0.memoize;
local l_useDesignTokens_0 = v0.Hooks.useDesignTokens;
local l_useUiModeInfo_0 = v0.Hooks.useUiModeInfo;
local l_UiMode_0 = v0.RobloxAppEnums.UiMode;
local l_UIBlox_0 = v0.UIBlox;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_StyledTextLabel_0 = l_UIBlox_0.App.Text.StyledTextLabel;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_ShimmerPanel_0 = l_UIBlox_0.App.Loading.ShimmerPanel;
local l_useCursor_0 = l_UIBlox_0.App.SelectionCursor.useCursor;
local l_getFFlagUpdateFriendCarousel10ft_0 = v0.getFFlagUpdateFriendCarousel10ft;
local l_FFlagLuaAppFixCursorHooks_0 = v0.FFlagLuaAppFixCursorHooks;
local v18 = game:DefineFastString("FriendCarouselVendorImagePath", "rbxasset://textures/ui/Shell/Icons/PlatformLogo.png");
local v19 = l_Images_0["component_assets/circle_25"];
local v20 = UDim.new(0.5, 0);
local v24 = l_memoize_0(function(v21, v22, v23)
    return l_Text_0.GetTextBounds(v21, v22.Font, if not v22.RelativeSize then v22.FontSize else v22.RelativeSize * v23, Vector2.new(10000, 10000));
end);
local v25 = {
    username = "", 
    thumbnail = "", 
    layoutOrder = 0, 
    tileSize = 96, 
    infoHeight = 24
};
return function(v26)
    local v27 = l_llama_0.Dictionary.join(v25, v26 or {});
    local v28 = l_Roact_0.createRef();
    local v29 = l_React_0.useCallback(function()
        if not (not v28 or not v27.onActivated) then
            v27.onActivated(v28);
        end;
    end, {
        v28
    });
    local v30 = l_useUiModeInfo_0();
    local v32 = l_useDesignTokens_0(function(v31)
        if v30.uiMode == l_UiMode_0.TenFoot then
            return {
                presenceIconSize = v31.Global.Size_150, 
                presenceIconPadding = v31.Global.Space_50, 
                tilePadding = v31.Global.Space_100, 
                gameTitlePadding = v31.Global.Space_50, 
                usernameTextFont = v31.Semantic.Typography.CaptionHeader, 
                contextualTextFont = v31.Semantic.Typography.CaptionBody
            };
        else
            return {
                presenceIconSize = 12, 
                presenceIconPadding = 4, 
                tilePadding = 8, 
                gameTitlePadding = 4
            };
        end;
    end);
    local v33 = if not l_FFlagLuaAppFixCursorHooks_0 then nil else l_useCursor_0(v20);
    local v34 = l_useStyle_0();
    local v35 = v32.contextualTextFont or v34.Font.CaptionSubHeader;
    local v36 = v32.usernameTextFont or v34.Font.CaptionHeader;
    local v37 = v24(v27.username, v36, v34.Font.BaseSize);
    local v38 = if not l_getFFlagUpdateFriendCarousel10ft_0() then math.min((v27.tileSize - 12) - 4, v37.X) else math.min((v27.tileSize - v32.presenceIconSize) - v32.presenceIconPadding, v37.X);
    if not l_getFFlagUpdateFriendCarousel10ft_0() then
        return l_Roact_0.createFragment({
            UserTileCircular = l_Roact_0.createElement("TextButton", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.fromOffset(v27.tileSize, 0), 
                BackgroundTransparency = 1, 
                Text = "", 
                LayoutOrder = v27.layoutOrder, 
                [l_Roact_0.Ref] = v28, 
                [l_Roact_0.Event.Activated] = v29
            }, {
                Layout = l_Roact_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = if not l_getFFlagUpdateFriendCarousel10ft_0() then UDim.new(0, 8) else UDim.new(0, v32.tilePadding)
                }), 
                PlayerAvatar = l_Roact_0.createElement(l_ImageSetLabel_0, {
                    Image = v27.thumbnail, 
                    LayoutOrder = 1, 
                    Size = UDim2.new(0, v27.tileSize, 0, v27.tileSize)
                }, {
                    UICorner = l_Roact_0.createElement("UICorner", {
                        CornerRadius = UDim.new(1, 0)
                    })
                }), 
                UserInfo = l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v27.infoHeight), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2
                }, {
                    Layout = l_Roact_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Top, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = if not l_getFFlagUpdateFriendCarousel10ft_0() then UDim.new(0, 4) else UDim.new(0, v32.gameTitlePadding)
                    }), 
                    UsernameFrame = l_Roact_0.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1
                    }, {
                        Layout = l_Roact_0.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            Padding = if not l_getFFlagUpdateFriendCarousel10ft_0() then UDim.new(0, 4) else UDim.new(0, v32.presenceIconPadding)
                        }), 
                        PresenceIcon = not not v27.showOnlineIndicator and l_Roact_0.createElement(l_ImageSetLabel_0, {
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            Image = v19, 
                            ImageColor3 = v34.Theme.OnlineStatus.Color, 
                            ImageTransparency = v34.Theme.OnlineStatus.Transparency, 
                            LayoutOrder = 1, 
                            Position = UDim2.fromScale(0.5, 0.5), 
                            Size = if not l_getFFlagUpdateFriendCarousel10ft_0() then UDim2.new(0, 12, 0, 12) else UDim2.new(0, v32.presenceIconSize, 0, v32.presenceIconSize), 
                            BackgroundTransparency = 1, 
                            ScaleType = Enum.ScaleType.Slice
                        }) or nil, 
                        PlayerName = if v27.shouldShimmerName then nil else l_Roact_0.createElement(l_StyledTextLabel_0, {
                            layoutOrder = 2, 
                            text = v27.username, 
                            fontStyle = v36, 
                            size = UDim2.new(0, v38, 0, v37.Y), 
                            colorStyle = v34.Theme.TextEmphasis, 
                            textTruncate = Enum.TextTruncate.AtEnd, 
                            textXAlignment = Enum.TextXAlignment.Left, 
                            textYAlignment = Enum.TextYAlignment.Center, 
                            fluidSizing = false, 
                            richText = false
                        }), 
                        ShimmerName = if not v27.shouldShimmerName then nil else l_Roact_0.createElement(l_ShimmerPanel_0, {
                            Size = UDim2.fromScale(0.8, 0.8), 
                            LayoutOrder = 2
                        })
                    }), 
                    ContextualInfo = if not v27.contextualText then nil else l_Roact_0.createElement(l_StyledTextLabel_0, {
                        layoutOrder = 2, 
                        text = v27.contextualText, 
                        fontStyle = v35, 
                        size = UDim2.new(1, 0, 0, v24(v27.contextualText, v35, v34.Font.BaseSize).Y), 
                        colorStyle = not not v27.isContextualTextMuted and v34.Theme.TextMuted or v34.Theme.TextEmphasis, 
                        textTruncate = Enum.TextTruncate.AtEnd, 
                        textXAlignment = Enum.TextXAlignment.Center, 
                        textYAlignment = Enum.TextYAlignment.Top, 
                        fluidSizing = false, 
                        richText = false, 
                        lineHeight = 1
                    })
                })
            })
        });
    else
        return l_Roact_0.createFragment({
            UserTileCircular = l_Roact_0.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                LayoutOrder = v27.layoutOrder, 
                Size = UDim2.fromOffset(v27.tileSize, 0), 
                [l_Roact_0.Ref] = v28
            }, {
                Layout = l_Roact_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, v32.tilePadding)
                }), 
                PlayerAvatar = l_Roact_0.createElement("TextButton", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1, 
                    SelectionImageObject = if not l_FFlagLuaAppFixCursorHooks_0 then l_useCursor_0(v20) else v33, 
                    Size = UDim2.fromOffset(v27.tileSize, v27.tileSize), 
                    Text = "", 
                    [l_Roact_0.Event.Activated] = v29
                }, {
                    AvatarImage = l_Roact_0.createElement(l_ImageSetLabel_0, {
                        Image = v27.thumbnail, 
                        Size = UDim2.fromScale(1, 1)
                    }, {
                        UICorner = l_Roact_0.createElement("UICorner", {
                            CornerRadius = v20
                        })
                    })
                }), 
                UserInfo = l_Roact_0.createElement("TextButton", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2, 
                    Selectable = false, 
                    Size = UDim2.new(1, 0, 0, v27.infoHeight), 
                    Text = "", 
                    [l_Roact_0.Event.Activated] = v29
                }, {
                    Layout = l_Roact_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Top, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, v32.gameTitlePadding)
                    }), 
                    UsernameFrame = l_Roact_0.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1
                    }, {
                        Layout = l_Roact_0.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            Padding = UDim.new(0, v32.presenceIconPadding)
                        }), 
                        PresenceIcon = not not v27.showOnlineIndicator and l_Roact_0.createElement(l_ImageSetLabel_0, {
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            Image = v19, 
                            ImageColor3 = v34.Theme.OnlineStatus.Color, 
                            ImageTransparency = v34.Theme.OnlineStatus.Transparency, 
                            LayoutOrder = 1, 
                            Position = UDim2.fromScale(0.5, 0.5), 
                            Size = UDim2.new(0, v32.presenceIconSize, 0, v32.presenceIconSize), 
                            BackgroundTransparency = 1, 
                            ScaleType = Enum.ScaleType.Slice, 
                            Visible = v27.showVendorIcon ~= true
                        }) or nil, 
                        VendorIcon = not not v27.showVendorIcon and l_Roact_0.createElement(l_ImageSetLabel_0, {
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            Image = {
                                Image = v18, 
                                ImageRectOffset = Vector2.zero, 
                                ImageRectSize = Vector2.zero
                            }, 
                            LayoutOrder = 1, 
                            Position = UDim2.fromScale(0.5, 0.5), 
                            Size = UDim2.new(0, v32.presenceIconSize, 0, v32.presenceIconSize), 
                            BackgroundTransparency = 1
                        }) or nil, 
                        PlayerName = if v27.shouldShimmerName then nil else l_Roact_0.createElement(l_StyledTextLabel_0, {
                            layoutOrder = 2, 
                            text = v27.username, 
                            fontStyle = v36, 
                            size = UDim2.new(0, v38, 0, v37.Y), 
                            colorStyle = v34.Theme.TextEmphasis, 
                            textTruncate = Enum.TextTruncate.AtEnd, 
                            textXAlignment = Enum.TextXAlignment.Left, 
                            textYAlignment = Enum.TextYAlignment.Center, 
                            fluidSizing = false, 
                            richText = false
                        }), 
                        ShimmerName = if not v27.shouldShimmerName then nil else l_Roact_0.createElement(l_ShimmerPanel_0, {
                            Size = UDim2.fromScale(0.8, 0.8), 
                            LayoutOrder = 2
                        })
                    }), 
                    ContextualInfo = if not v27.contextualText then nil else l_Roact_0.createElement(l_StyledTextLabel_0, {
                        layoutOrder = 2, 
                        text = v27.contextualText, 
                        fontStyle = v35, 
                        size = UDim2.new(1, 0, 0, v24(v27.contextualText, v35, v34.Font.BaseSize).Y), 
                        colorStyle = not not v27.isContextualTextMuted and v34.Theme.TextMuted or v34.Theme.TextEmphasis, 
                        textTruncate = Enum.TextTruncate.AtEnd, 
                        textXAlignment = Enum.TextXAlignment.Center, 
                        textYAlignment = Enum.TextYAlignment.Top, 
                        fluidSizing = false, 
                        richText = false, 
                        lineHeight = 1
                    })
                })
            })
        });
    end;
end;
