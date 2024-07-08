local l_script_FirstAncestor_0 = script:FindFirstAncestor("App");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Core_0 = l_Parent_0.Core;
local l_Parent_1 = l_Parent_0.Parent;
local v4 = require(l_Parent_1.t);
local v5 = require(l_Parent_1.Roact);
local l_Object_0 = require(l_Parent_1.LuauPolyfill).Object;
local v7 = require(l_Parent_1.Cryo);
local l_Dictionary_0 = v7.Dictionary;
local l_List_0 = v7.List;
local v10 = require(l_script_FirstAncestor_0.ImageSet.Images);
local v11 = require(l_Core_0.ImageSet.Validator.validateImageSetData);
local v12 = require(l_Core_0.Control.Enum.ControlState);
local v13 = require(l_Core_0.Style.withStyle);
local v14 = require(l_Core_0.Button.getContentStyle);
local v15 = require(l_script_FirstAncestor_0.Tile.PlayerTile.PlayerTileButton);
local v16 = require(l_script_FirstAncestor_0.Indicator.PlayerContext);
local v17 = require(l_Parent_0.Utility.SpringAnimatedItem);
local v18 = require(l_Core_0.Style.Validator.validateFontInfo);
local v19 = require(l_Parent_0.Core.Style.Validator.validateTypographyInfo);
local v20 = require(l_script_FirstAncestor_0.Tile.BaseTile.Tile);
local v21 = v5.PureComponent:extend("PlayerTile");
v21.validateProps = v4.strictInterface({
    title = v4.optional(v4.string), 
    subtitle = v4.optional(v4.string), 
    hasVerifiedBadge = v4.optional(v4.boolean), 
    Selectable = v4.optional(v4.boolean), 
    thumbnail = v4.optional(v4.union(v4.string, v4.table)), 
    buttons = v4.optional(v4.array(v4.strictInterface({
        icon = v4.optional((v4.union(v4.string, v11))), 
        onActivated = v4.optional(v4.callback), 
        isSecondary = v4.optional(v4.boolean), 
        isDisabled = v4.optional(v4.boolean)
    }))), 
    relevancyInfo = v4.strictInterface({
        text = v4.optional(v4.string), 
        icon = v4.optional(v4.union(v4.string, v4.table)), 
        iconSize = v4.optional(v4.UDim2), 
        iconColor = v4.optional(v4.Color3), 
        iconTransparency = v4.optional(v4.number), 
        onActivated = v4.optional(v4.callback), 
        fontStyle = v4.optional(v4.union(v18, v19))
    }), 
    tileSize = v4.optional(v4.UDim2), 
    onActivated = v4.optional(v4.callback), 
    forwardedRef = v4.optional(v4.table)
});
v21.defaultProps = {
    buttons = {}, 
    relevancyInfo = {}, 
    tileSize = UDim2.new(0, 150, 0, 150), 
    onActivated = function()
    end, 
    Selectable = false
};
local v22 = {
    dampingRatio = 1, 
    frequency = 4
};
local v23 = {
    [v12.Default] = "SystemPrimaryContent"
};
local v24 = v10["component_assets/vignette_246"];
local function _(v25)
    return v13(function(v26)
        local l_Tokens_0 = v26.Tokens;
        return v5.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1
        }, {
            PlayerContext = v5.createElement(v16, (l_Object_0.assign({}, {
                fontStyle = if not v25.playerContext.onActivated then l_Tokens_0.Semantic.Typography.CaptionBody else l_Tokens_0.Semantic.Typography.CaptionHeader, 
                iconTextSpacing = l_Tokens_0.Global.Space_50, 
                iconPadding = 0, 
                iconSize = UDim2.fromOffset(l_Tokens_0.Global.Size_150, l_Tokens_0.Global.Size_150), 
                textHeight = l_Tokens_0.Global.Size_350
            }, v25.playerContext)))
        });
    end);
end;
local function _(v29)
    return v13(function(v30)
        local l_Tokens_1 = v30.Tokens;
        local l_Space_100_0 = l_Tokens_1.Global.Space_100;
        local l_Space_100_1 = l_Tokens_1.Global.Space_100;
        local l_Size_450_0 = l_Tokens_1.Global.Size_450;
        return v5.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            ButtonBackgroundGradient = not v7.isEmpty(v29.buttons) and v5.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_Size_450_0 + l_Space_100_0 * 2), 
                AnchorPoint = Vector2.new(0, 1), 
                Position = UDim2.new(0, 0, 1, 0), 
                LayoutOrder = 1
            }, {
                UIGradient = v5.createElement("UIGradient", {
                    Rotation = 90, 
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, v30.Theme.BackgroundUIContrast.Color), 
                        ColorSequenceKeypoint.new(1, v30.Theme.BackgroundUIContrast.Color)
                    }), 
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1), 
                        NumberSequenceKeypoint.new(1, v30.Theme.BackgroundUIContrast.Transparency)
                    })
                }), 
                UICorner = v5.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 8)
                })
            }), 
            HoverTransparency = v5.createElement(v17.AnimatedImageLabel, {
                springOptions = v22, 
                animatedValues = {
                    imageTransparency = not v29.mouseEntered and 1 or 0.6
                }, 
                mapValuesToProps = function(v35)
                    return {
                        ImageTransparency = v35.imageTransparency
                    };
                end, 
                regularProps = {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    Image = v24.Image, 
                    ImageRectSize = v24.ImageRectSize, 
                    ImageRectOffset = v24.ImageRectOffset, 
                    ImageColor3 = v14(v23, v29.controlState, v30).Color, 
                    ImageTransparency = 0, 
                    LayoutOrder = 2, 
                    [v5.Event.MouseEnter] = v29.hoverMouseEnter, 
                    [v5.Event.MouseLeave] = v29.hoverMouseLeave
                }
            }, {
                corner = v5.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 8)
                })
            }), 
            ButtonContainer = v5.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                ZIndex = 2
            }, {
                PlayerTileButtons = v5.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Position = UDim2.new(1, 0, 1, 0), 
                    Size = UDim2.new(0, v29.tileSize.X.Offset - l_Space_100_0 * 2, 0, l_Size_450_0), 
                    AnchorPoint = Vector2.new(1, 1), 
                    LayoutOrder = 3, 
                    ZIndex = 2
                }, l_List_0.join(l_List_0.map(v29.buttons, function(v36)
                    return v5.createElement(v15, {
                        buttonHeight = l_Size_450_0, 
                        outerButtonPadding = l_Space_100_0, 
                        tileSize = v29.tileSize, 
                        icon = v36.icon, 
                        isSecondary = v36.isSecondary, 
                        isDisabled = v36.isDisabled, 
                        onActivated = v36.onActivated, 
                        mouseEnter = v29.hoverMouseEnter, 
                        mouseLeave = v29.hoverMouseLeave
                    });
                end), {
                    v5.createElement("UIListLayout", {
                        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                        Padding = UDim.new(0, l_Space_100_1), 
                        FillDirection = Enum.FillDirection.Horizontal
                    })
                })), 
                UIPadding = v5.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, l_Space_100_0), 
                    PaddingRight = UDim.new(0, l_Space_100_0)
                })
            })
        });
    end);
end;
v21.init = function(v38)
    v38.firstButtonIcon = v5.createRef();
    v38.secondButtonIcon = v5.createRef();
    v38.mouseEntered = false;
    v38.state = {
        controlState = v12.Initialize, 
        mouseEntered = false
    };
    v38.onStateChanged = function(v39, v40)
        v38:setState({
            controlState = v40
        });
        if v38.props.onStateChanged then
            v38.props.onStateChanged(v39, v40);
        end;
    end;
    v38.hoverMouseEnter = function()
        v38:setState({
            mouseEntered = true
        });
    end;
    v38.hoverMouseLeave = function()
        v38:setState({
            mouseEntered = false
        });
    end;
end;
v21.render = function(v41)
    local l_tileSize_0 = v41.props.tileSize;
    local l_title_0 = v41.props.title;
    local l_onActivated_0 = v41.props.onActivated;
    local l_thumbnail_0 = v41.props.thumbnail;
    return v13(function(v46)
        local l_Tokens_2 = v46.Tokens;
        local l_createElement_0 = v5.createElement;
        local v49 = "Frame";
        local v50 = {
            Size = l_tileSize_0, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            [v5.Ref] = v41.props.forwardedRef
        };
        local v51 = {};
        local l_createElement_1 = v5.createElement;
        local l_v20_0 = v20;
        local v54 = {};
        local v55 = {
            playerContext = if not v41.props.Selectable then v41.props.relevancyInfo else l_Dictionary_0.join(v41.props.relevancyInfo, {
                Selectable = false
            }), 
            controlState = v41.state.controlState
        };
        local l_v55_0 = v55 --[[ copy: 10 -> 11 ]];
        v54.footer = v13(function(v57)
            local l_Tokens_3 = v57.Tokens;
            return v5.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1
            }, {
                PlayerContext = v5.createElement(v16, (l_Object_0.assign({}, {
                    fontStyle = if not l_v55_0.playerContext.onActivated then l_Tokens_3.Semantic.Typography.CaptionBody else l_Tokens_3.Semantic.Typography.CaptionHeader, 
                    iconTextSpacing = l_Tokens_3.Global.Space_50, 
                    iconPadding = 0, 
                    iconSize = UDim2.fromOffset(l_Tokens_3.Global.Size_150, l_Tokens_3.Global.Size_150), 
                    textHeight = l_Tokens_3.Global.Size_350
                }, l_v55_0.playerContext)))
            });
        end);
        v54.Selectable = v41.props.Selectable;
        v54.hasRoundedCorners = true;
        v54.innerPadding = 0;
        v54.titleTopPadding = l_Tokens_2.Global.Space_100;
        v54.subtitleTopPadding = l_Tokens_2.Global.Space_25;
        v54.footerTopPadding = l_Tokens_2.Global.Space_50;
        v54.name = l_title_0;
        v54.nameTextColor = l_Tokens_2.Semantic.Color.Text.Emphasis.Color3;
        v54.titleFontStyle = l_Tokens_2.Semantic.Typography.Subheader;
        v54.hasVerifiedBadge = v41.props.hasVerifiedBadge;
        v54.titleTextLineCount = 1;
        v54.subtitle = v41.props.subtitle;
        v54.subtitleFontStyle = l_Tokens_2.Semantic.Typography.CaptionHeader;
        v54.onActivated = l_onActivated_0;
        v54.thumbnail = l_thumbnail_0;
        v54.backgroundImage = v10[v46.Theme.PlayerBackgroundDefault.Image];
        v55 = l_Dictionary_0.join(v41.props, {
            hoverMouseEnter = v41.hoverMouseEnter, 
            hoverMouseLeave = v41.hoverMouseLeave, 
            mouseEntered = v41.state.mouseEntered
        });
        v54.thumbnailOverlayComponents = v13(function(v59)
            local l_Tokens_4 = v59.Tokens;
            local l_Space_100_2 = l_Tokens_4.Global.Space_100;
            local l_Space_100_3 = l_Tokens_4.Global.Space_100;
            local l_Size_450_1 = l_Tokens_4.Global.Size_450;
            return v5.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                ButtonBackgroundGradient = not v7.isEmpty(v55.buttons) and v5.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, l_Size_450_1 + l_Space_100_2 * 2), 
                    AnchorPoint = Vector2.new(0, 1), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    LayoutOrder = 1
                }, {
                    UIGradient = v5.createElement("UIGradient", {
                        Rotation = 90, 
                        Color = ColorSequence.new({
                            ColorSequenceKeypoint.new(0, v59.Theme.BackgroundUIContrast.Color), 
                            ColorSequenceKeypoint.new(1, v59.Theme.BackgroundUIContrast.Color)
                        }), 
                        Transparency = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, 1), 
                            NumberSequenceKeypoint.new(1, v59.Theme.BackgroundUIContrast.Transparency)
                        })
                    }), 
                    UICorner = v5.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 8)
                    })
                }), 
                HoverTransparency = v5.createElement(v17.AnimatedImageLabel, {
                    springOptions = v22, 
                    animatedValues = {
                        imageTransparency = not v55.mouseEntered and 1 or 0.6
                    }, 
                    mapValuesToProps = function(v64)
                        return {
                            ImageTransparency = v64.imageTransparency
                        };
                    end, 
                    regularProps = {
                        Size = UDim2.new(1, 0, 1, 0), 
                        BackgroundTransparency = 1, 
                        Image = v24.Image, 
                        ImageRectSize = v24.ImageRectSize, 
                        ImageRectOffset = v24.ImageRectOffset, 
                        ImageColor3 = v14(v23, v55.controlState, v59).Color, 
                        ImageTransparency = 0, 
                        LayoutOrder = 2, 
                        [v5.Event.MouseEnter] = v55.hoverMouseEnter, 
                        [v5.Event.MouseLeave] = v55.hoverMouseLeave
                    }
                }, {
                    corner = v5.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 8)
                    })
                }), 
                ButtonContainer = v5.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    ZIndex = 2
                }, {
                    PlayerTileButtons = v5.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Position = UDim2.new(1, 0, 1, 0), 
                        Size = UDim2.new(0, v55.tileSize.X.Offset - l_Space_100_2 * 2, 0, l_Size_450_1), 
                        AnchorPoint = Vector2.new(1, 1), 
                        LayoutOrder = 3, 
                        ZIndex = 2
                    }, l_List_0.join(l_List_0.map(v55.buttons, function(v65)
                        return v5.createElement(v15, {
                            buttonHeight = l_Size_450_1, 
                            outerButtonPadding = l_Space_100_2, 
                            tileSize = v55.tileSize, 
                            icon = v65.icon, 
                            isSecondary = v65.isSecondary, 
                            isDisabled = v65.isDisabled, 
                            onActivated = v65.onActivated, 
                            mouseEnter = v55.hoverMouseEnter, 
                            mouseLeave = v55.hoverMouseLeave
                        });
                    end), {
                        v5.createElement("UIListLayout", {
                            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                            Padding = UDim.new(0, l_Space_100_3), 
                            FillDirection = Enum.FillDirection.Horizontal
                        })
                    })), 
                    UIPadding = v5.createElement("UIPadding", {
                        PaddingBottom = UDim.new(0, l_Space_100_2), 
                        PaddingRight = UDim.new(0, l_Space_100_2)
                    })
                })
            });
        end);
        v54.addSubtitleSpace = l_title_0 == nil;
        v51.Tile = l_createElement_1(l_v20_0, v54);
        return l_createElement_0(v49, v50, v51);
    end);
end;
return v5.forwardRef(function(v66, v67)
    return v5.createElement(v21, l_Dictionary_0.join(v66, {
        forwardedRef = v67
    }));
end);
