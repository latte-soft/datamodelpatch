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
local v10 = require(l_Parent_3.Utility.setDefault);
local v11 = require(l_Core_0.Style.useStyle);
local v12 = require(l_Core_0.Control.Interactable);
local v13 = require(l_Core_0.Control.useControlState);
local _ = require(l_Parent_2.Style.StyleTypes);
local _ = require(l_Parent_2.Style.Fonts);
local v16 = require(l_Parent_2.SelectionImage.useSelectionCursor);
local v17 = require(l_Parent_2.SelectionImage.CursorKind);
local v18 = require(l_Parent_2.SelectionCursor.useCursor);
local v19 = require(l_Parent_0.Constants);
local v20 = require(l_Parent_0.ExperienceActionRow);
local v21 = require(l_Parent_0.Enum.AspectRatioMode);
local v22 = require(l_Parent_0.getAspectRatio);
local v23 = require(l_Parent_1.VerticalTile.VerticalTile);
local v24 = require(l_Parent_1.TileContentPanel);
local v25 = require(l_Parent_1.VerticalTile.VerticalTileThumbnail);
local v26 = require(l_Parent_3.UIBloxConfig);
local function v31(v27, v28, v29, v30)
    return v7.createElement(v27, v6.Dictionary.join({
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, v29), {
        Padding = v7.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v28.Left), 
            PaddingRight = UDim.new(0, v28.Right), 
            PaddingTop = UDim.new(0, v28.Top), 
            PaddingBottom = UDim.new(0, v28.Bottom)
        }), 
        Content = v8.createFragment(v30)
    });
end;
local function _(v32, v33)
    if v32 ~= nil then
        if not v33 then
            return v32;
        else
            return v21.Wide;
        end;
    elseif not v33 then
        return v21.Square;
    else
        return v21.Wide;
    end;
end;
return function(v35)
    local v36 = v11();
    local v37 = v10(v35.footerHeight, v19.DEFAULT_FOOTER_HEIGHT);
    local v38 = v10(v35.isHoverEnabled, false);
    local v39 = v10(v35.hasBackground, true);
    local v40 = v6.Dictionary.join(v19.getDefaultStyleProps(v36), v35.styleProps or {});
    local l_backgroundColor_0 = v40.backgroundColor;
    local l_border_0 = v40.border;
    local l_dropShadow_0 = v40.dropShadow;
    local l_topContentPadding_0 = v40.topContentPadding;
    local l_bottomContentPadding_0 = v40.bottomContentPadding;
    local l_overlayColors_0 = v40.overlayColors;
    local l_selectionCursorPadding_0 = v40.selectionCursorPadding;
    local l_contentTitlePadding_0 = v40.contentTitlePadding;
    local l_contentTitleFont_0 = v40.contentTitleFont;
    local v50 = v10(v35.contentTextLineCount, v19.DEFAULT_TEXT_LINE_COUNT);
    local v55 = v7.useCallback(function(v51)
        v51 = v51 and not v36.Settings.ReducedMotion;
        local l_thumbnailAspectRatioOverride_0 = v35.thumbnailAspectRatioOverride;
        local l_v51_0 = v51;
        local v54 = if l_thumbnailAspectRatioOverride_0 ~= nil then if l_v51_0 then v21.Wide else l_thumbnailAspectRatioOverride_0 else if l_v51_0 then v21.Wide else v21.Square;
        l_thumbnailAspectRatioOverride_0 = v22(v54);
        return v31("Frame", l_topContentPadding_0, {
            Size = UDim2.new(1, 0, l_thumbnailAspectRatioOverride_0, 0), 
            SizeConstraint = Enum.SizeConstraint.RelativeXX, 
            ZIndex = 3
        }, {
            Thumbnail = v7.createElement(v25, {
                aspectRatio = l_thumbnailAspectRatioOverride_0, 
                border = l_border_0, 
                isTopRounded = true, 
                isBottomRounded = not v39, 
                thumbnail = if v54 == v21.Wide then v35.wideThumbnail else v35.thumbnail
            }), 
            TopContentOverlay = if v35.renderTopContentOverlay ~= nil then v8.createFragment((v35.renderTopContentOverlay(v51, l_border_0))) else nil
        });
    end, {
        v35.renderTopContentOverlay, 
        v35.wideThumbnail, 
        v35.thumbnail, 
        v35.thumbnailAspectRatioOverride, 
        l_topContentPadding_0, 
        l_border_0, 
        v39
    });
    local v58 = v7.useCallback(function(v56)
        local v57 = ((math.floor((v50 * l_contentTitleFont_0.RelativeSize) * v36.Font.BaseSize + l_contentTitlePadding_0) + v37) + l_bottomContentPadding_0.Top) + l_bottomContentPadding_0.Bottom;
        if v35.renderBottomContent ~= nil then
            return v31("Frame", l_bottomContentPadding_0, {
                Size = UDim2.new(1, 0, 0, v57)
            }, {
                BottomContent = v35.renderBottomContent(v56, l_border_0)
            });
        else
            return v7.createElement(v24, {
                contentTitle = v35.experienceName, 
                panelHeight = UDim.new(0, v57), 
                outerPadding = l_bottomContentPadding_0, 
                footerHeight = UDim.new(0, v37), 
                textLineCount = v50, 
                titleFont = l_contentTitleFont_0, 
                titlePadding = l_contentTitlePadding_0, 
                contentFooter = if not v56 then nil else v35.footer, 
                hasSidePadding = true
            });
        end;
    end, {
        v35.experienceName, 
        v35.renderBottomContent, 
        v35.footer, 
        v50, 
        l_contentTitlePadding_0, 
        l_bottomContentPadding_0, 
        v37, 
        l_contentTitleFont_0, 
        l_border_0, 
        v36
    });
    local v60 = v7.useCallback(function(v59)
        if v35.renderBottomContent ~= nil then
            return nil;
        elseif not v59 then
            return v31("Frame", l_bottomContentPadding_0, {
                Size = UDim2.new(1, 0, 0, (v37 + l_bottomContentPadding_0.Top) + l_bottomContentPadding_0.Bottom), 
                Position = UDim2.new(0, 0, 1, 0), 
                AnchorPoint = Vector2.new(0, 1)
            }, {
                FooterContent = v7.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 0), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    AnchorPoint = Vector2.new(0, 1), 
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, {
                    Footer = v35.footer
                })
            });
        elseif v35.renderActionRow ~= nil then
            return v35.renderActionRow();
        else
            return v7.createElement(v20, v35.actionRowProps);
        end;
    end, {
        v35.footer, 
        v35.actionRowProps, 
        v35.renderBottomContent, 
        v35.renderActionRow, 
        l_bottomContentPadding_0, 
        v37
    });
    local v61, v62 = v13();
    local v63 = if not v26.useNewSelectionCursor then v16(v17.RoundedRect) else v18(l_border_0.CornerRadius);
    local v64 = v9(v61, l_overlayColors_0);
    local v65 = nil;
    local v66 = nil;
    if v64 ~= nil then
        v65 = v64.Color;
        v66 = v64.Transparency;
    else
        v65 = nil;
        v66 = 1;
    end;
    return v31(v12, l_selectionCursorPadding_0, {
        Size = UDim2.new(1, 0, 1, 0), 
        SelectionImageObject = v63, 
        onStateChanged = v62, 
        [v7.Event.Activated] = v35.onActivated
    }, {
        VerticalTile = v7.createElement(v23, {
            hasBackground = v39, 
            hasOutline = v10(v35.hasOutline, true), 
            isHoverEnabled = v38, 
            hoverDelay = v35.hoverDelay, 
            onHoverChanged = v35.onHoverChanged, 
            isOverlayVisible = false, 
            isActive = false, 
            renderTopContent = v55, 
            renderBottomContent = v58, 
            renderFooterRow = v60, 
            reservedBottomHeight = 0, 
            backgroundColor = l_backgroundColor_0, 
            border = l_border_0, 
            dropShadow = l_dropShadow_0
        }), 
        OverlayColor = v7.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = v65, 
            ZIndex = 10, 
            BackgroundTransparency = v66
        }, {
            Corner = v7.createElement("UICorner", {
                CornerRadius = l_border_0.CornerRadius
            })
        })
    });
end;
