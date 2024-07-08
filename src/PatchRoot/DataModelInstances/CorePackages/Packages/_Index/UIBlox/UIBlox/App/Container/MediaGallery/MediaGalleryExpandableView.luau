local l_script_FirstAncestor_0 = script:FindFirstAncestor("UIBlox");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactOtter);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_script_FirstAncestor_0.Core.Text.GenericTextLabel.GenericTextLabel);
local v6 = require(l_script_FirstAncestor_0.App.SelectionImage.useSelectionCursor);
local v7 = require(l_script_FirstAncestor_0.Core.Style.useStyle);
local _ = require(l_script_FirstAncestor_0.App.Style.StyleTypes);
local v9 = require(l_script_FirstAncestor_0.App.SelectionCursor.useCursor);
local v10 = require(l_script_FirstAncestor_0.App.SelectionImage.CursorKind);
local v11 = require(l_script_FirstAncestor_0.UIBloxConfig);
local v12 = require(script.Parent.Constants);
local v13 = {
    titleText = "Media", 
    numItemsShown = 4, 
    itemAspectRatio = 1.7777777777777777, 
    animationConfig = {
        dampingRatio = 1, 
        frequency = 6.666666666666667
    }, 
    onActivated = function()
    end, 
    onSelectionGained = function()
    end, 
    exitFullscreen = function()
    end
};
return function(v14)
    local v15 = v4.Dictionary.join(v13, v14);
    local v16 = v7();
    local v17 = v4.Dictionary.join(v12.getDefaultStyleProps(v16), v15.styleProps or {});
    local l_borderRadius_0 = v17.borderRadius;
    local l_gutter_0 = v17.gutter;
    local l_contentGap_0 = v17.contentGap;
    local l_titleFont_0 = v17.titleFont;
    local l_titleTextColor_0 = v17.titleTextColor;
    local v23, v24 = v3.useAnimatedBinding(0);
    local v25 = nil;
    local v26 = nil;
    if not v11.mediaGalleryExpandedViewImmediateAnimation then
        local v27, v28 = v2.useState(false);
        v25 = v27;
        v26 = v28;
        v2.useEffect(function()
            if not v25 then
                v24(v3.spring(0, v15.animationConfig));
            else
                v24(v3.spring(v15.expandableAreaHeightOffset, v15.animationConfig));
            end;
            return nil;
        end, {
            v25, 
            v15.expandableAreaHeightOffset, 
            v15.animationConfig
        });
    end;
    local v29, v30 = v2.useState(Vector2.zero);
    local v36 = v2.useCallback(function(v31, _, _, _)
        local v35 = (v31.AbsoluteSize.X - l_gutter_0 * (v15.numItemsShown - 1)) / v15.numItemsShown;
        v30(Vector2.new(v35, v35 / v15.itemAspectRatio));
    end, {
        l_gutter_0, 
        v15.itemAspectRatio, 
        v15.numItemsShown
    });
    local v46 = v2.useCallback(function(v37, _, v39, v40)
        if v37 then
            local v41 = false;
            if v40 ~= nil then
                v41 = v40:isDescendantOf(v37);
            end;
            local v42 = false;
            if v39 ~= nil then
                v42 = v39:IsDescendantOf(v37);
            end;
            local v43 = v41 and not v42;
            local v44 = not v41 and v42;
            if not v43 then
                if not v44 then
                    return nil;
                else
                    local v45 = false;
                    if v40 ~= nil then
                        v45 = v39.AbsolutePosition.Y < v40.AbsolutePosition.Y;
                    end;
                    if not v11.mediaGalleryExpandedViewImmediateAnimation then
                        v26(v45);
                    elseif not v45 then
                        v24(v3.spring(0, v15.animationConfig));
                    end;
                    v15.exitFullscreen();
                    v15.mediaGalleryGainFocused(false);
                    return nil;
                end;
            else
                if not v11.mediaGalleryExpandedViewImmediateAnimation then
                    v26(true);
                else
                    v24(v3.spring(v15.expandableAreaHeightOffset, v15.animationConfig));
                end;
                v15.mediaGalleryGainFocused(true);
                return nil;
            end;
        else
            return nil;
        end;
    end, {
        if not v11.mediaGalleryExpandedViewImmediateAnimation then nil else v15.expandableAreaHeightOffset, 
        if not v11.mediaGalleryExpandedViewImmediateAnimation then nil else v15.animationConfig, 
        v15.exitFullscreen, 
        v15.mediaGalleryGainFocused
    });
    local v47 = if not v11.useNewSelectionCursor then v6(v15.selectionCursor) else if v15.showCursor then if not v11.useNewSelectionCursor then nil else v9(l_borderRadius_0) else if not v11.useNewSelectionCursor then nil else v6(v10.Invisible);
    return v2.createElement("CanvasGroup", {
        GroupTransparency = v15.groupTransparency, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, l_contentGap_0)
        }), 
        ExpandableArea = v2.createElement("Frame", {
            Size = v23:map(function(v48)
                return UDim2.new(1, 0, 0, v48);
            end), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }), 
        Title = v2.createElement(v5, {
            Size = UDim2.new(1, 0, 0, if not l_titleFont_0.RelativeSize then l_titleFont_0.FontSize else l_titleFont_0.RelativeSize * v16.Font.BaseSize), 
            Text = v15.titleText, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            colorStyle = l_titleTextColor_0, 
            fontStyle = l_titleFont_0, 
            LayoutOrder = 2
        }), 
        MediaGallery = v2.createElement("ScrollingFrame", {
            Size = UDim2.new(1, 0, 0, v29.Y), 
            BackgroundTransparency = 1, 
            AutomaticCanvasSize = Enum.AutomaticSize.XY, 
            ScrollBarImageTransparency = 1, 
            ScrollBarThickness = 0, 
            ScrollingDirection = Enum.ScrollingDirection.X, 
            Selectable = false, 
            LayoutOrder = 3, 
            [v2.Change.AbsoluteSize] = v36, 
            [v2.Event.SelectionChanged] = v46
        }, {
            Layout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                Padding = UDim.new(0, l_gutter_0)
            }), 
            Items = v2.createElement(v2.Fragment, {}, (v2.useMemo(function()
                local v49 = {};
                for v50, v51 in v15.items, nil, nil do
                    v49["Item" .. v50] = v2.createElement("ImageButton", {
                        LayoutOrder = v50, 
                        Size = UDim2.fromOffset(v29.X, v29.Y), 
                        Image = v51.imageId, 
                        ScaleType = Enum.ScaleType.Crop, 
                        BackgroundTransparency = 1, 
                        AutoButtonColor = false, 
                        SelectionImageObject = v47, 
                        [v2.Event.Activated] = function()
                            v15.onActivated(v50);
                        end, 
                        [v2.Event.SelectionGained] = function()
                            v15.onSelectionGained(v50);
                        end
                    }, {
                        Corner = v2.createElement("UICorner", {
                            CornerRadius = l_borderRadius_0
                        })
                    });
                end;
                return v49;
            end, {
                v29, 
                v15.items, 
                v15.onActivated, 
                v15.onSelectionGained, 
                v47, 
                l_borderRadius_0
            })))
        })
    });
end;
