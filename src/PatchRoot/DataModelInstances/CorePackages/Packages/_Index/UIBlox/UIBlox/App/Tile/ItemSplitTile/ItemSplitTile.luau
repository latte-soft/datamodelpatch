local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Core_0 = l_Parent_1.Core;
local l_Parent_2 = l_Parent_1.Parent;
local v4 = require(l_Parent_2.Roact);
local v5 = require(l_Parent_2.t);
local v6 = require(l_Parent_1.UIBloxConfig);
local v7 = require(l_Core_0.Style.withStyle);
local v8 = require(l_Core_0.Control.Interactable);
local v9 = require(l_Core_0.Control.Enum.ControlState);
local v10 = require(l_Parent_1.App.Loading.LoadableImage);
local v11 = require(l_Parent_0.ImageSet.Images);
local v12 = require(l_Core_0.ImageSet.ImageSetComponent);
local v13 = require(l_Parent_1.App.Tile.ItemSplitTile.ItemSplitTileFooter);
local v14 = UDim.new(0, 8);
local v15 = UDim.new(0, 8);
local v16 = UDim.new(0, 12);
local v17 = 146 + (not v6.enableFontNameMapping and 84 or 87);
local v18 = v4.PureComponent:extend("ItemSplitTile");
v18.validateProps = v5.strictInterface({
    itemName = v5.optional(v5.string), 
    priceText = v5.optional(v5.string), 
    isOwned = v5.optional(v5.boolean), 
    hasBackground = v5.optional(v5.boolean), 
    isHovered = v5.optional(v5.boolean), 
    onActivated = v5.optional(v5.callback), 
    thumbnail = v5.optional(v5.string)
});
v18.defaultProps = {
    itemName = "--", 
    priceText = "--", 
    hasBackground = true, 
    isHovered = false
};
v18.init = function(v19)
    v19:setState({
        controlState = v9.Initialize
    });
    v19.onStateChanged = function(_, v21)
        v19:setState({
            controlState = v21
        });
    end;
end;
v18.renderImageFrame = function(_, v23, v24, v25, v26)
    local l_Theme_0 = v26.Theme;
    local v28 = v25 or not v24;
    return v4.createElement("Frame", {
        Position = UDim2.fromScale(0, not v24 and 0 or 0.5), 
        Size = UDim2.fromScale(1, not v25 and 0.5 or 1), 
        ClipsDescendants = true, 
        BackgroundTransparency = 1
    }, {
        Image = if not (typeof(v23) == "table") then v4.createElement(v10, {
            BackgroundColor3 = l_Theme_0.PlaceHolder.Color, 
            BackgroundTransparency = 1, 
            Image = v23, 
            Position = UDim2.fromScale(0.5, not v24 and 1 or 0), 
            Size = UDim2.fromScale(1, not v25 and 2 or 1), 
            AnchorPoint = Vector2.new(0.5, not v25 and 0.5 or 1), 
            cornerRadius = if not v28 then nil else v14, 
            showFailedStateWhenLoadingFailed = true, 
            useShimmerAnimationWhileLoading = true
        }) else v4.createElement(v12.Label, {
            BackgroundColor3 = l_Theme_0.PlaceHolder.Color, 
            BackgroundTransparency = 1, 
            Image = v23, 
            Position = UDim2.fromScale(0, not v24 and 0 or -1), 
            Size = UDim2.fromScale(1, not v25 and 2 or 1)
        }, {
            UICorner = if not v28 then nil else v4.createElement("UICorner", {
                CornerRadius = v14
            })
        })
    });
end;
v18.renderTopContent = function(v29, v30)
    local l_hasBackground_0 = v29.props.hasBackground;
    local l_isHovered_0 = v29.props.isHovered;
    local v33 = not l_hasBackground_0;
    local l_Theme_1 = v30.Theme;
    local v35 = v11[l_Theme_1.ItemBackgroundDefault.Image];
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        SizeConstraint = Enum.SizeConstraint.RelativeXX, 
        ZIndex = 2
    }, {
        BackgroundImage = if not v29.props.thumbnail then nil else v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            TopImageFrame = v29:renderImageFrame(v35, false, v33, v30), 
            BottomImageFrame = if v33 then nil else v29:renderImageFrame(v35, true, false, v30)
        }), 
        ItemImage = v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            TopImageFrame = v29:renderImageFrame(v29.props.thumbnail, false, v33, v30), 
            BottomImageFrame = if v33 then nil else v29:renderImageFrame(v29.props.thumbnail, true, false, v30)
        }), 
        HoverShadow = if not l_isHovered_0 or l_hasBackground_0 then nil else v4.createElement(v12.Label, {
            ZIndex = 0, 
            Position = UDim2.new(0.5, 0, 0.5, 2), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 12), 
            Image = v11["component_assets/dropshadow_24_6"], 
            ImageColor3 = l_Theme_1.DropShadow.Color, 
            ImageTransparency = l_Theme_1.DropShadow.Transparency, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(18, 18, 18, 18)
        })
    });
end;
v18.renderBottomContent = function(v36, v37)
    local l_itemName_0 = v36.props.itemName;
    local l_hasBackground_1 = v36.props.hasBackground;
    local l_Font_0 = v37.Font;
    local v41 = math.ceil(v37.Font.BaseSize * v37.Font.Header2.RelativeSize);
    local l_Theme_2 = v37.Theme;
    local v43 = if (v36.props.isHovered or v36.state.controlState == v9.Pressed) and l_hasBackground_1 then v16 else v15;
    local v44 = (v41 * 3 + v15.Offset) + v43.Offset * 2;
    local v45 = if not v6.useNewThemeColorPalettes then l_Theme_2.TextEmphasis else l_Theme_2.TextDefault;
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v44), 
        BackgroundTransparency = 1, 
        LayoutOrder = 2
    }, {
        UIListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = v15
        }), 
        Padding = v4.createElement("UIPadding", {
            PaddingLeft = if not l_hasBackground_1 then nil else v43, 
            PaddingRight = if not l_hasBackground_1 then nil else v43, 
            PaddingTop = if not l_hasBackground_1 then v15 else v43, 
            PaddingBottom = if not l_hasBackground_1 then v15 else v43
        }), 
        TitleArea = if not not l_itemName_0 and string.len(l_itemName_0) > 0 then v4.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Text = l_itemName_0, 
            Font = l_Font_0.Header2.Font, 
            TextSize = v41, 
            TextTransparency = v45.Transparency, 
            TextColor3 = v45.Color, 
            TextWrapped = true, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            LayoutOrder = 1
        }, {
            UISizeConstraint = v4.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(math.huge, v41 * 2)
            })
        }) else nil, 
        Footer = v4.createElement(v13, {
            priceText = v36.props.priceText, 
            isOwned = v36.props.isOwned, 
            layoutOrder = 2
        })
    });
end;
v18.renderTileContent = function(v46, v47)
    local l_hasBackground_2 = v46.props.hasBackground;
    local l_onActivated_0 = v46.props.onActivated;
    local l_Theme_3 = v47.Theme;
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = if not l_hasBackground_2 then nil else l_Theme_3.BackgroundUIDefault.Color, 
        BackgroundTransparency = not l_hasBackground_2 and 1 or l_Theme_3.BackgroundUIDefault.Transparency, 
        ClipsDescendants = true, 
        ZIndex = 1
    }, {
        UICorner = v4.createElement("UICorner", {
            CornerRadius = v14
        }), 
        Panel = v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            UIListLayout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            TopContentPlaceholder = v4.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                SizeConstraint = Enum.SizeConstraint.RelativeXX, 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }), 
            BottomContent = v46:renderBottomContent(v47)
        }), 
        TopContent = v46:renderTopContent(v47), 
        TileOverlay = v4.createElement(v8, {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            onStateChanged = v46.onStateChanged, 
            [v4.Event.Activated] = l_onActivated_0, 
            ZIndex = 3
        }, {
            UICorner = v4.createElement("UICorner", {
                CornerRadius = v14
            }), 
            BorderFrame = v4.createElement("Frame", {
                Size = UDim2.new(1, -2, 1, -2), 
                Position = UDim2.fromOffset(1, 1), 
                BackgroundTransparency = 1, 
                SizeConstraint = if l_hasBackground_2 then nil else Enum.SizeConstraint.RelativeXX
            }, {
                UIStroke = v4.createElement("UIStroke", {
                    Color = l_Theme_3.Divider.Color, 
                    Transparency = l_Theme_3.Divider.Transparency, 
                    Thickness = 1
                }), 
                UICorner = v4.createElement("UICorner", {
                    CornerRadius = v14
                })
            })
        })
    });
end;
v18.render = function(v51)
    local l_hasBackground_3 = v51.props.hasBackground;
    local l_isHovered_1 = v51.props.isHovered;
    return v7(function(v54)
        local l_Theme_4 = v54.Theme;
        return v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            UISizeConstraint = v4.createElement("UISizeConstraint", {
                MinSize = Vector2.new(146, v17)
            }), 
            TileContent = v51:renderTileContent(v54), 
            HoverShadow = if not not l_isHovered_1 and l_hasBackground_3 then v4.createElement(v12.Label, {
                ZIndex = 0, 
                Position = UDim2.new(0.5, 0, 0.5, 2), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 10, 1, 12), 
                Image = v11["component_assets/dropshadow_24_6"], 
                ImageColor3 = l_Theme_4.DropShadow.Color, 
                ImageTransparency = l_Theme_4.DropShadow.Transparency, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(18, 18, 18, 18)
            }) else nil
        });
    end);
end;
return v18;
