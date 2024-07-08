local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.RoactGamepad);
local v4 = require(l_Parent_2.Roact);
local v5 = require(l_Parent_2.React);
local v6 = require(l_Parent_2.Cryo);
local v7 = require(l_Parent_2.t);
local v8 = require(l_Parent_1.Core.Style.withStyle);
local v9 = require(l_Parent_1.Core.Style.useStyle);
local v10 = require(l_Parent_1.Core.Style.Validator.validateColorInfo);
local v11 = require(l_Parent_1.Core.ImageSet.ImageSetComponent);
local v12 = require(script.Parent.validateButtonProps);
local v13 = require(l_Parent_0.Container.VerticalScrollView);
local v14 = require(l_Parent_0.ImageSet.Images);
local v15 = require(l_Parent_0.SelectionImage.withSelectionCursorProvider);
local v16 = require(l_Parent_0.SelectionImage.CursorKind);
local v17 = require(l_Parent_0.SelectionCursor.withCursor);
local v18 = require(l_Parent_0.SelectionCursor.CursorType);
local v19 = require(l_Parent_1.Utility.setDefault);
local v20 = require(script.Parent.Cell);
local v21 = require(script.Parent.RoundedFrame);
local v22 = require(script.Parent.StyleDefaults);
local v23 = require(l_Parent_1.UIBloxConfig);
local v24 = v14["component_assets/dropshadow_17_8"];
local v25 = v14["component_assets/circle_17"];
local v26 = v4.PureComponent:extend("BaseMenu");
v26.validateProps = v7.strictInterface({
    buttonProps = v12, 
    width = v7.optional(v7.UDim), 
    position = v7.optional(v7.union(v7.UDim2, v7.table)), 
    anchorPoint = v7.optional(v7.Vector2), 
    layoutOrder = v7.optional(v7.number), 
    topElementRounded = v7.optional(v7.boolean), 
    bottomElementRounded = v7.optional(v7.boolean), 
    setFirstItemRef = v7.optional(v7.union(v7.callback, v7.table)), 
    setFrameRef = v7.optional(v7.union(v7.callback, v7.table)), 
    stayOnActivated = v7.optional(v7.boolean), 
    maxHeight = v7.optional(v7.number), 
    showDropShadow = v7.optional(v7.boolean), 
    fixedListHeight = v7.optional(v7.number), 
    isElementBackgroundVisible = v7.optional(v7.boolean), 
    isElementDividerVisible = v7.optional(v7.boolean), 
    elementHeight = v7.optional(v7.number), 
    borderCornerRadius = v7.optional(v7.integer), 
    background = v7.optional(v10), 
    enableTokenOverride = v7.optional(v7.boolean), 
    renderHeader = v7.optional(v7.callback), 
    headerHeight = v7.optional(v7.number), 
    selectionOrder = v7.optional(v7.number)
});
v26.defaultProps = {
    width = UDim.new(1, 0), 
    position = UDim2.new(0, 0, 0, 0), 
    topElementRounded = true, 
    bottomElementRounded = true, 
    showDropShadow = false, 
    fixedListHeight = nil, 
    isElementBackgroundVisible = true, 
    isElementDividerVisible = true, 
    elementHeight = 56, 
    borderCornerRadius = 4, 
    enableTokenOverride = true, 
    headerHeight = 0
};
v26.init = function(v27)
    v27.gamepadRefs = v3.createRefCache();
end;
v26.renderFixedHeightMenu = function(_, v29, v30, v31)
    local l_fixedListHeight_0 = v29.fixedListHeight;
    local v33 = v19(v29.borderCornerRadius, 8);
    local l_BackgroundUIDefault_0 = v30.Theme.BackgroundUIDefault;
    local v35 = v19(v29.background, {
        Color = l_BackgroundUIDefault_0.Color, 
        Transparency = l_BackgroundUIDefault_0.Transparency
    });
    return v4.createElement("Frame", {
        AnchorPoint = v29.anchorPoint, 
        BackgroundTransparency = 1, 
        LayoutOrder = v29.layoutOrder, 
        Size = UDim2.new(v29.width.Scale, v29.width.Offset, 0, l_fixedListHeight_0), 
        Position = v29.position
    }, {
        DropShadow = not not v29.showDropShadow and v4.createElement(v11.Label, {
            ZIndex = 2, 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 16, 1, 16), 
            Image = v24, 
            ImageColor3 = v30.Theme.DropShadow.Color, 
            ImageTransparency = v30.Theme.DropShadow.Transparency, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(16, 16, 16, 16)
        }) or nil, 
        ContentFrame = v4.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            BackgroundColor3 = v35.Color, 
            BackgroundTransparency = v35.Transparency, 
            ZIndex = 3
        }, {
            UICorner = v4.createElement("UICorner", {
                CornerRadius = UDim.new(0, v33)
            }), 
            ClippingFrame = v4.createElement("Frame", {
                ZIndex = 4, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, -v33 * 2), 
                Position = UDim2.new(0, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0, 0.5), 
                ClipsDescendants = true
            }, {
                ScrollingFrame = v4.createElement(v13, {
                    canvasSizeY = UDim.new(0, #v29.buttonProps * v29.elementHeight), 
                    selectable = if not v23.fixFixedHeightMenuFrameSelectable then nil else false
                }, v31)
            })
        })
    });
end;
v26.render = function(v36)
    local l_headerHeight_0 = v36.props.headerHeight;
    local v38 = v36.props.elementHeight * 7.5 + l_headerHeight_0;
    local v39 = #v36.props.buttonProps * v36.props.elementHeight + l_headerHeight_0;
    local v40 = false;
    if v38 <= v39 then
        v39 = v38;
        v40 = true;
    end;
    local l_maxHeight_0 = v36.props.maxHeight;
    if (l_maxHeight_0 and l_maxHeight_0 > 0) and l_maxHeight_0 < v39 then
        v39 = (math.max(math.floor(((l_maxHeight_0 - v36.props.elementHeight * 0.5) - l_headerHeight_0) / v36.props.elementHeight), 1) + 0.5) * v36.props.elementHeight + l_headerHeight_0;
        v40 = true;
    end;
    local v42 = {};
    for v43, v44 in ipairs(v36.props.buttonProps) do
        local l_join_0 = v6.Dictionary.join;
        local l_v44_0 = v44;
        local v47 = {
            elementHeight = v36.props.elementHeight
        };
        local l_topElementRounded_0 = v36.props.topElementRounded;
        if l_topElementRounded_0 then
            l_topElementRounded_0 = false;
            if v43 == 1 then
                l_topElementRounded_0 = not v40;
            end;
        end;
        v47.hasRoundTop = l_topElementRounded_0;
        l_topElementRounded_0 = v36.props.bottomElementRounded;
        if l_topElementRounded_0 then
            l_topElementRounded_0 = false;
            if v43 == #v36.props.buttonProps then
                l_topElementRounded_0 = not v40;
            end;
        end;
        v47.hasRoundBottom = l_topElementRounded_0;
        v47.hasDivider = not not v36.props.isElementDividerVisible and v43 < #v36.props.buttonProps;
        v47.layoutOrder = v43;
        v47.inputBindingKey = v6.None;
        v47.setButtonRef = v43 == 1 and v36.props.setFirstItemRef or nil;
        v47.isElementBackgroundVisible = v36.props.isElementBackgroundVisible;
        v47.borderCornerRadius = v36.props.borderCornerRadius;
        v47.background = v36.props.background;
        l_join_0 = l_join_0(l_v44_0, v47);
        do
            local l_l_join_0_0 = l_join_0;
            if not v23.migrateToNewSelectionCursor then
                l_v44_0 = nil;
                l_v44_0 = if not not l_l_join_0_0.hasRoundBottom and l_l_join_0_0.hasRoundTop then v16.RoundedRectNoInset else if l_l_join_0_0.hasRoundBottom then v16.BulletDown else if l_l_join_0_0.hasRoundTop then v16.BulletUp else v16.Square;
                l_l_join_0_0 = v6.Dictionary.join(l_l_join_0_0, {
                    cursorKind = l_v44_0, 
                    selectionOrder = v36.props.selectionOrder
                });
                do
                    local l_l_v44_0_0 = l_v44_0;
                    v42["cell " .. v43] = v15(function(v51)
                        return v4.createElement(v3.Focusable.Frame, {
                            Size = UDim2.new(v36.props.width, UDim.new(0, v36.props.elementHeight)), 
                            BackgroundTransparency = 1, 
                            LayoutOrder = v43, 
                            [v4.Ref] = v36.gamepadRefs[v43], 
                            NextSelectionUp = v43 > 1 and v36.gamepadRefs[v43 - 1] or nil, 
                            NextSelectionDown = v43 < #v36.props.buttonProps and v36.gamepadRefs[v43 + 1] or nil, 
                            inputBindings = {
                                Activated = v3.Input.onBegin(Enum.KeyCode.ButtonA, v44.onActivated, {
                                    key = v44.inputBindingKey
                                })
                            }, 
                            SelectionImageObject = v51(l_l_v44_0_0)
                        }, {
                            Cell = v4.createElement(v20, l_l_join_0_0)
                        });
                    end);
                end;
            else
                l_v44_0 = nil;
                l_v44_0 = if not not l_l_join_0_0.hasRoundBottom and l_l_join_0_0.hasRoundTop then v18.RoundedRectNoInset else if l_l_join_0_0.hasRoundBottom then v18.BulletDown else if l_l_join_0_0.hasRoundTop then v18.BulletUp else v18.Square;
                do
                    local l_l_v44_0_1 = l_v44_0;
                    v42["cell " .. v43] = v17(function(v53)
                        local v54 = v53.getCursorByType(l_l_v44_0_1);
                        l_l_join_0_0 = v6.Dictionary.join(l_l_join_0_0, {
                            selectionCursor = v54, 
                            selectionOrder = v36.props.selectionOrder
                        });
                        return v4.createElement(v3.Focusable.Frame, {
                            Size = UDim2.new(v36.props.width, UDim.new(0, v36.props.elementHeight)), 
                            BackgroundTransparency = 1, 
                            LayoutOrder = v43, 
                            [v4.Ref] = v36.gamepadRefs[v43], 
                            NextSelectionUp = v43 > 1 and v36.gamepadRefs[v43 - 1] or nil, 
                            NextSelectionDown = v43 < #v36.props.buttonProps and v36.gamepadRefs[v43 + 1] or nil, 
                            inputBindings = {
                                Activated = v3.Input.onBegin(Enum.KeyCode.ButtonA, v44.onActivated, {
                                    key = v44.inputBindingKey
                                })
                            }, 
                            SelectionImageObject = v54
                        }, {
                            Cell = v4.createElement(v20, l_l_join_0_0)
                        });
                    end);
                end;
            end;
        end;
    end;
    v42.layout = v4.createElement("UIListLayout", {
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        FillDirection = Enum.FillDirection.Vertical, 
        SortOrder = Enum.SortOrder.LayoutOrder
    });
    return v8(function(v55)
        local l_Theme_0 = v55.Theme;
        local l_BackgroundUIDefault_1 = l_Theme_0.BackgroundUIDefault;
        local v58 = v19(v36.props.background, {
            Color = l_BackgroundUIDefault_1.Color, 
            Transparency = l_BackgroundUIDefault_1.Transparency
        });
        local l_ImageRectSize_0 = v25.ImageRectSize;
        local l_ImageRectOffset_0 = v25.ImageRectOffset;
        local l_X_0 = l_ImageRectSize_0.X;
        local v62 = l_X_0 / 2;
        local l_isElementBackgroundVisible_0 = v36.props.isElementBackgroundVisible;
        local v64 = (v40 and v36.props.topElementRounded) and l_isElementBackgroundVisible_0;
        local v65 = (v40 and v36.props.bottomElementRounded) and l_isElementBackgroundVisible_0;
        local v66 = (not v64 and 0 or 1) + (not v65 and 0 or 1);
        local l_renderHeader_0 = v36.props.renderHeader;
        local v68 = (not not v23.enableNewMenuLayout and not v64) and (l_renderHeader_0 and true or false);
        if not v36.props.fixedListHeight then
            return v4.createElement("Frame", {
                AnchorPoint = v36.props.anchorPoint, 
                BackgroundTransparency = 1, 
                LayoutOrder = v36.props.layoutOrder, 
                Size = UDim2.new(v36.props.width.Scale, v36.props.width.Offset, 0, v39), 
                Position = v36.props.position
            }, {
                DropShadow = not not v36.props.showDropShadow and v4.createElement(v11.Label, {
                    ZIndex = 2, 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 16, 1, 16), 
                    Image = v24, 
                    ImageColor3 = v55.Theme.DropShadow.Color, 
                    ImageTransparency = v55.Theme.DropShadow.Transparency, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = Rect.new(16, 16, 16, 16)
                }) or nil, 
                Background = if not not v23.enableNewMenuLayout and (v64 or v65) then v4.createElement(v21, {
                    zIndex = -1, 
                    background = v58, 
                    topCornerRadius = if not v64 then nil else UDim.new(0, v36.props.borderCornerRadius), 
                    bottomCornerRadius = if not v65 then nil else UDim.new(0, v36.props.borderCornerRadius)
                }) else nil, 
                TopRoundedCorner = if not v64 or v23.enableNewMenuLayout then nil else v4.createElement("ImageLabel", {
                    ZIndex = 3, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v36.props.borderCornerRadius), 
                    Position = UDim2.fromScale(0, 0), 
                    Image = v25.Image, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceScale = 0.5 / v14.ImagesResolutionScale, 
                    SliceCenter = Rect.new(v62 - 1, v62 - 1, v62 + 1, v62), 
                    ImageRectSize = Vector2.new(l_X_0, v62), 
                    ImageRectOffset = l_ImageRectOffset_0, 
                    ImageTransparency = v58.Transparency, 
                    ImageColor3 = v58.Color
                }), 
                ClippingFrame = v4.createElement("Frame", {
                    ZIndex = 3, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 1, -(v36.props.borderCornerRadius * v66)), 
                    Position = UDim2.fromScale(0, not v64 and 0 or 0.5), 
                    AnchorPoint = Vector2.new(0, not v64 and 0 or 0.5), 
                    ClipsDescendants = true
                }, {
                    HeaderFrame = if not v68 then nil else v4.createElement("Frame", {
                        Selectable = false, 
                        Size = UDim2.new(1, 0, 0, l_headerHeight_0), 
                        Position = UDim2.fromOffset(0, 0), 
                        AnchorPoint = Vector2.new(0, 0), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0
                    }, {
                        Header = l_renderHeader_0()
                    }), 
                    ScrollingFrame = v4.createElement("ScrollingFrame", {
                        [v4.Ref] = v36.props.setFrameRef, 
                        Selectable = false, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, not v64 and 0 or -4, 1, not v68 and 0 or -l_headerHeight_0), 
                        Position = if not v68 then nil else UDim2.fromOffset(0, l_headerHeight_0), 
                        BorderSizePixel = 0, 
                        ScrollBarThickness = 4, 
                        ScrollBarImageColor3 = l_Theme_0.UIEmphasis.Color, 
                        ScrollBarImageTransparency = l_Theme_0.UIEmphasis.Transparency, 
                        ScrollingDirection = Enum.ScrollingDirection.Y, 
                        CanvasSize = UDim2.new(1, 0, 0, #v36.props.buttonProps * v36.props.elementHeight), 
                        ClipsDescendants = v68
                    }, v42)
                }), 
                BottomRoundedCorner = if not v65 or v23.enableNewMenuLayout then nil else v4.createElement("ImageLabel", {
                    ZIndex = 2, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v36.props.borderCornerRadius), 
                    Position = UDim2.fromScale(0, 1), 
                    AnchorPoint = Vector2.new(0, 1), 
                    Image = v25.Image, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceScale = 0.5 / v14.ImagesResolutionScale, 
                    SliceCenter = Rect.new(v62 - 1, 0, v62 + 1, 1), 
                    ImageRectSize = Vector2.new(l_X_0, v62), 
                    ImageRectOffset = l_ImageRectOffset_0 + Vector2.new(0, v62), 
                    ImageTransparency = v58.Transparency, 
                    ImageColor3 = v58.Color
                })
            });
        else
            return v36:renderFixedHeightMenu(v36.props, v55, v42);
        end;
    end);
end;
return function(v69)
    local l_v69_0 = v69;
    if not (not v23.enableNewMenuLayout or not v69.enableTokenOverride) then
        local v71 = v9();
        local v72 = {};
        for v73, v74 in ipairs(v69.buttonProps) do
            v72[v73] = v6.Dictionary.join(v74, v22.getCellDefaultTokens(v71));
        end;
        l_v69_0 = v6.Dictionary.join(l_v69_0, v22.getBaseMenuDefaultTokens(v71), {
            buttonProps = v72
        });
    end;
    return v5.createElement(v26, l_v69_0);
end;
