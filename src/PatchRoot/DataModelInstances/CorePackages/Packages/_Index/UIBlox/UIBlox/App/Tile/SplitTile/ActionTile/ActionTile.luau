local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local l_Core_0 = l_Parent_3.Core;
local l_Parent_4 = l_Parent_3.Parent;
local v6 = require(l_Parent_4.Cryo);
local v7 = require(l_Parent_4.React);
local v8 = require(l_Parent_4.Roact);
local v9 = require(l_Parent_3.Utility.getControlStateColor);
local v10 = require(l_Parent_3.UIBloxConfig);
local v11 = require(l_Core_0.Style.useStyle);
local v12 = require(l_Core_0.Control.Interactable);
local v13 = require(l_Core_0.Control.useControlState);
local _ = require(l_Parent_2.Style.StyleTypes);
local _ = require(l_Parent_2.Style.Fonts);
local v16 = require(l_Parent_2.SelectionImage.useSelectionCursor);
local v17 = require(l_Parent_2.SelectionImage.CursorKind);
local v18 = require(l_Parent_2.SelectionCursor.useCursor);
local v19 = require(l_Core_0.ImageSet.ImageSetComponent);
local v20 = require(l_Core_0.Text.GenericTextLabel.GenericTextLabel);
local _ = require(l_Parent_2.ImageSet.ImagesTypes);
local v22 = require(l_Parent_0.Constants);
local v23 = require(l_Parent_1.VerticalTile.VerticalTile);
local v24 = {
    isHoverEnabled = false
};
local function v29(v25, v26, v27, v28)
    return v7.createElement(v25, v27, {
        Padding = v7.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v26.Left), 
            PaddingRight = UDim.new(0, v26.Right), 
            PaddingTop = UDim.new(0, v26.Top), 
            PaddingBottom = UDim.new(0, v26.Bottom)
        }), 
        Content = v8.createFragment(v28)
    });
end;
return function(v30)
    local v31 = v11();
    local v32 = v6.Dictionary.join(v22.getDefaultStyleProps(v31), v30.styleProps or {});
    local l_backgroundColor_0 = v32.backgroundColor;
    local l_border_0 = v32.border;
    local l_dropShadow_0 = v32.dropShadow;
    local l_topContentPadding_0 = v32.topContentPadding;
    local l_overlayColors_0 = v32.overlayColors;
    local l_selectionCursorPadding_0 = v32.selectionCursorPadding;
    local l_contentGap_0 = v32.contentGap;
    local l_titleFont_0 = v32.titleFont;
    local l_iconSize_0 = v32.iconSize;
    local l_iconImageColor_0 = v32.iconImageColor;
    local l_titleTextColor_0 = v32.titleTextColor;
    v30 = v6.Dictionary.join(v24, v30);
    local v44 = nil;
    if v30.title then
        v44 = l_titleFont_0.RelativeSize * v31.Font.BaseSize;
    end;
    local v46 = v7.useCallback(function(_)
        return v29("Frame", l_topContentPadding_0, {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            Content = v7.createElement("Frame", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                ClipsDescendants = true, 
                BackgroundTransparency = 1
            }, {
                v7.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, l_contentGap_0)
                }); 
                Icon = if not v30.icon then nil else v7.createElement(v19.Label, {
                    Size = UDim2.fromOffset(l_iconSize_0, l_iconSize_0), 
                    BackgroundTransparency = 1, 
                    Image = v30.icon, 
                    ImageColor3 = l_iconImageColor_0.Color, 
                    ImageTransparency = l_iconImageColor_0.Transparency, 
                    LayoutOrder = 1
                }), 
                Title = if not v30.title then nil else v7.createElement(v20, {
                    Text = v30.title, 
                    Size = UDim2.new(1, 0, 0, v44), 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    LayoutOrder = 2, 
                    fontStyle = l_titleFont_0, 
                    colorStyle = l_titleTextColor_0, 
                    TextTruncate = Enum.TextTruncate.AtEnd
                })
            })
        });
    end, {
        l_contentGap_0, 
        v30.title, 
        v30.icon, 
        l_iconSize_0, 
        v44, 
        l_titleFont_0, 
        l_topContentPadding_0, 
        v31
    });
    local v47, v48 = v13();
    local v49 = if not v10.useNewSelectionCursor then v16(v17.RoundedRect) else v18(l_border_0.CornerRadius);
    local v50 = v9(v47, l_overlayColors_0);
    local v51 = nil;
    local v52 = nil;
    if v50 ~= nil then
        v51 = v50.Color;
        v52 = v50.Transparency;
    else
        v51 = nil;
        v52 = 1;
    end;
    return v29(v12, l_selectionCursorPadding_0, {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        SelectionImageObject = v49, 
        onStateChanged = v48, 
        [v7.Event.Activated] = v30.onActivated
    }, {
        VerticalTile = v7.createElement(v23, {
            hasBackground = true, 
            hasOutline = true, 
            isHoverEnabled = v30.isHoverEnabled, 
            isOverlayVisible = false, 
            isActive = false, 
            renderTopContent = v46, 
            renderBottomContent = nil, 
            renderFooterRow = nil, 
            reservedBottomHeight = 0, 
            backgroundColor = l_backgroundColor_0, 
            border = l_border_0, 
            dropShadow = l_dropShadow_0
        }), 
        OverlayColor = v7.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = v51, 
            BackgroundTransparency = v52
        }, {
            Corner = v7.createElement("UICorner", {
                CornerRadius = l_border_0.CornerRadius
            })
        })
    });
end;
