local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v4 = require(l_Parent_3.RoactGamepad);
local v5 = require(l_Parent_3.React);
local v6 = require(l_Parent_3.Cryo);
local v7 = require(l_Parent_3.t);
local v8 = require(l_Parent_2.Core.Style.withStyle);
local v9 = require(l_Parent_2.Core.Style.Validator.validateFontInfo);
local v10 = require(l_Parent_2.Core.Style.Validator.validateTypographyInfo);
local v11 = require(l_Parent_2.Core.Text.GetTextSize);
local v12 = require(l_Parent_2.Core.Text.GetWrappedTextWithIcon);
local v13 = require(l_Parent_1.SelectionImage.CursorKind);
local v14 = require(l_Parent_1.SelectionImage.withSelectionCursorProvider);
local v15 = require(l_Parent_2.App.SelectionCursor.useCursor);
local v16 = require(l_Parent_0.TileName);
local v17 = require(l_Parent_0.TileThumbnail);
local v18 = require(l_Parent_0.TileBanner);
local v19 = require(l_Parent_1.Text.StyledTextLabel);
local v20 = require(l_Parent_2.App.ImageSet.Images);
local v21 = require(l_Parent_2.UIBloxConfig);
local v22 = UDim.new(0, 10);
local v23 = v5.PureComponent:extend("Tile");
v23.validateProps = v7.intersection(v7.strictInterface({
    footer = v7.optional(v7.table), 
    name = v7.optional(v7.string), 
    nameTextColor = v7.optional(v7.Color3), 
    nameOverThumbnail = v7.optional(v7.boolean), 
    subtitle = v7.optional(v7.string), 
    hasVerifiedBadge = v7.optional(v7.boolean), 
    titleTextLineCount = v7.optional(v7.integer), 
    innerPadding = v7.optional(v7.integer), 
    titleTopPadding = v7.optional(v7.integer), 
    subtitleTopPadding = v7.optional(v7.integer), 
    footerTopPadding = v7.optional(v7.integer), 
    onActivated = v7.optional(v7.callback), 
    thumbnail = v7.optional(v7.union(v7.string, v7.table)), 
    thumbnailSize = v7.optional(v7.UDim2), 
    thumbnailColor = v7.optional(v7.Color3), 
    thumbnailTransparency = v7.optional(v7.number), 
    thumbnailAspectRatio = v7.optional(v7.number), 
    thumbnailScaleType = v7.optional(v7.enum(Enum.ScaleType)), 
    bannerText = v7.optional(v7.string), 
    backgroundImage = v7.optional(v7.union(v7.string, v7.table)), 
    isSelected = v7.optional(v7.boolean), 
    Selectable = v7.optional(v7.boolean), 
    multiSelect = v7.optional(v7.boolean), 
    isDisabled = v7.optional(v7.boolean), 
    hasRoundedCorners = v7.optional(v7.boolean), 
    titleIcon = v7.optional(v7.table), 
    thumbnailOverlayComponents = v7.optional(v7.table), 
    NextSelectionLeft = v7.optional(v7.table), 
    NextSelectionRight = v7.optional(v7.table), 
    NextSelectionUp = v7.optional(v7.table), 
    NextSelectionDown = v7.optional(v7.table), 
    thumbnailRef = v7.optional(v7.table), 
    textButtonRef = v7.optional(v7.table), 
    inputBindings = v7.optional(v7.table), 
    useMaxTitleHeight = v7.optional(v7.boolean), 
    addSubtitleSpace = v7.optional(v7.boolean), 
    titleFontStyle = v7.optional(v7.union(v9, v10)), 
    subtitleFontStyle = v7.optional(v7.union(v9, v10)), 
    renderTileInset = v7.optional(v7.callback), 
    [v5.Tag] = v7.optional(v7.string), 
    cursor = v7.optional(v7.any)
}), function(v24)
    if not v24.bannerText or not v24.footer then
        return true;
    else
        return false, "A custom footer and bannerText can't be used together";
    end;
end);
v23.defaultProps = {
    titleTextLineCount = 2, 
    innerPadding = 8, 
    titleTopPadding = 0, 
    subtitleTopPadding = 0, 
    footerTopPadding = 0, 
    isSelected = false, 
    multiSelect = false, 
    isDisabled = false, 
    hasRoundedCorners = true, 
    Selectable = false
};
v23.init = function(v25)
    v25.state = {
        tileWidth = 0, 
        tileHeight = 0
    };
    v25.onAbsoluteSizeChange = function(v26)
        v25:setState({
            tileWidth = v26.AbsoluteSize.X, 
            tileHeight = v26.AbsoluteSize.Y
        });
    end;
end;
v23.render = function(v27)
    local l_footer_0 = v27.props.footer;
    local l_name_0 = v27.props.name;
    local l_subtitle_0 = v27.props.subtitle;
    local l_hasVerifiedBadge_0 = v27.props.hasVerifiedBadge;
    local l_titleTextLineCount_0 = v27.props.titleTextLineCount;
    local l_innerPadding_0 = v27.props.innerPadding;
    local l_titleTopPadding_0 = v27.props.titleTopPadding;
    local l_subtitleTopPadding_0 = v27.props.subtitleTopPadding;
    local l_footerTopPadding_0 = v27.props.footerTopPadding;
    local l_onActivated_0 = v27.props.onActivated;
    local l_thumbnail_0 = v27.props.thumbnail;
    local l_thumbnailSize_0 = v27.props.thumbnailSize;
    local l_thumbnailColor_0 = v27.props.thumbnailColor;
    local l_thumbnailTransparency_0 = v27.props.thumbnailTransparency;
    local l_bannerText_0 = v27.props.bannerText;
    local l_hasRoundedCorners_0 = v27.props.hasRoundedCorners;
    local l_isSelected_0 = v27.props.isSelected;
    local l_multiSelect_0 = v27.props.multiSelect;
    local l_isDisabled_0 = v27.props.isDisabled;
    local l_titleIcon_0 = v27.props.titleIcon;
    local l_thumbnailOverlayComponents_0 = v27.props.thumbnailOverlayComponents;
    local l_backgroundImage_0 = v27.props.backgroundImage;
    local l_useMaxTitleHeight_0 = v27.props.useMaxTitleHeight;
    local l_addSubtitleSpace_0 = v27.props.addSubtitleSpace;
    return v8(function(v52)
        return v14(function(v53)
            local l_Font_0 = v52.Font;
            local l_Theme_0 = v52.Theme;
            local l_tileHeight_0 = v27.state.tileHeight;
            local l_tileWidth_0 = v27.state.tileWidth;
            local v58 = v27.props.titleFontStyle or l_Font_0.Header2;
            local v59 = v27.props.subtitleFontStyle or l_Font_0.CaptionHeader;
            local v60 = if not v58.RelativeSize then v58.FontSize else l_Font_0.BaseSize * v58.RelativeSize;
            local v61 = if not v59.RelativeSize then v59.FontSize else l_Font_0.BaseSize * v59.RelativeSize;
            local v62 = math.ceil(v60 * l_titleTextLineCount_0);
            local v63 = ((((l_tileHeight_0 - l_tileWidth_0 / (v27.props.thumbnailAspectRatio or 1)) - l_innerPadding_0) - v62) - l_innerPadding_0) - l_titleTopPadding_0;
            local v64 = Vector2.new(0, 0);
            local v65 = 0;
            if not l_addSubtitleSpace_0 then
                if not l_useMaxTitleHeight_0 then
                    local v66 = l_name_0 or "";
                    local l_Font_1 = v58.Font;
                    if l_titleIcon_0 then
                        v66 = v12(v66, v60, l_Font_1, l_titleIcon_0.ImageRectSize.X / v20.ImagesResolutionScale, 4);
                    end;
                    v64 = v11(v66, v60, l_Font_1, Vector2.new(l_tileWidth_0, v62));
                else
                    v64 = Vector2.new(0, v62);
                end;
                if l_subtitle_0 ~= nil and l_subtitle_0 ~= "" then
                    v65 = math.ceil(v61);
                    v63 = v63 - v65;
                end;
            else
                v64 = Vector2.new(0, v62);
                v65 = math.ceil(v61);
                v63 = v63 - v65;
            end;
            v63 = math.max(0, v63);
            local v68 = true;
            if l_footer_0 == nil then
                v68 = l_bannerText_0 ~= nil;
            end;
            local l_renderTileInset_0 = v27.props.renderTileInset;
            local v70 = UDim2.new(1, 0, 0, (v64.Y + v65) + l_titleTopPadding_0);
            local v71 = nil;
            if v27.props.nameOverThumbnail then
                v70 = UDim2.new(0, l_tileWidth_0 - 10, 0, -(v64.Y + 20));
                v71 = v5.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 10)
                });
            end;
            local v72 = v27.props.inputBindings or ((not l_isDisabled_0 and l_onActivated_0) and {
                Activate = v4.Input.onBegin(Enum.KeyCode.ButtonA, l_onActivated_0)
            } or nil);
            local l_createElement_0 = v5.createElement;
            local v74 = "TextButton";
            local v75 = {
                Text = "", 
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                Selectable = v27.props.Selectable, 
                [v5.Event.Activated] = not l_isDisabled_0 and l_onActivated_0 or nil, 
                [v5.Change.AbsoluteSize] = v27.onAbsoluteSizeChange, 
                ref = v27.props.textButtonRef, 
                SelectionImageObject = if not v27.props.cursor then v53(v13.RoundedRect) else v27.props.cursor
            };
            local v76 = {
                UIListLayout = v5.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, l_innerPadding_0)
                }), 
                Thumbnail = v5.createElement(v4.Focusable.Frame, {
                    Size = UDim2.new(1, 0, 1, 0), 
                    SizeConstraint = Enum.SizeConstraint.RelativeXX, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1, 
                    NextSelectionLeft = v27.props.NextSelectionLeft, 
                    NextSelectionRight = v27.props.NextSelectionRight, 
                    NextSelectionUp = v27.props.NextSelectionUp, 
                    NextSelectionDown = v27.props.NextSelectionDown, 
                    ref = v27.props.thumbnailRef, 
                    [v5.Tag] = v27.props[v5.Tag], 
                    SelectionImageObject = if not v27.props.cursor then v53(v13.RoundedRectNoInset) else v27.props.cursor, 
                    inputBindings = v72
                }, {
                    Image = v5.createElement(v17, {
                        Image = l_thumbnail_0, 
                        hasRoundedCorners = l_hasRoundedCorners_0, 
                        cornerRadius = if not v21.useNewSelectionCursor then nil else v22, 
                        isSelected = l_isSelected_0, 
                        multiSelect = l_multiSelect_0, 
                        overlayComponents = l_thumbnailOverlayComponents_0, 
                        imageSize = l_thumbnailSize_0, 
                        imageColor = l_thumbnailColor_0, 
                        imageTransparency = l_thumbnailTransparency_0, 
                        backgroundImage = l_backgroundImage_0, 
                        scaleType = v27.props.thumbnailScaleType
                    }), 
                    TileInset = not not l_renderTileInset_0 and l_renderTileInset_0() or nil, 
                    UIAspectRatioConstraint = if v27.props.thumbnailAspectRatio ~= nil then v5.createElement("UIAspectRatioConstraint", {
                        AspectRatio = v27.props.thumbnailAspectRatio, 
                        AspectType = Enum.AspectType.ScaleWithParentSize
                    }) else nil
                })
            };
            local l_createElement_1 = v5.createElement;
            local v78 = "Frame";
            local v79 = {
                Size = v70, 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            };
            local v80 = {
                TitleTopPadding = v5.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, l_titleTopPadding_0)
                }), 
                UIListLayout = v5.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, l_subtitleTopPadding_0)
                }), 
                NameOverThumbnailPadding = v71
            };
            local v81 = false;
            if l_titleTextLineCount_0 > 0 then
                v81 = false;
                if l_tileWidth_0 > 0 then
                    v81 = v5.createElement(v16, {
                        titleIcon = l_titleIcon_0, 
                        name = l_name_0, 
                        nameTextColor = v27.props.nameTextColor, 
                        hasVerifiedBadge = l_hasVerifiedBadge_0, 
                        maxHeight = v62, 
                        maxWidth = l_tileWidth_0, 
                        LayoutOrder = 1, 
                        useMaxHeight = l_useMaxTitleHeight_0, 
                        titleFontStyle = v58
                    });
                end;
            end;
            v80.Name = v81;
            v81 = false;
            if l_subtitle_0 ~= "" then
                v81 = false;
                if l_subtitle_0 ~= nil then
                    v81 = v5.createElement(v19, {
                        size = UDim2.new(1, 0, 0, v65), 
                        text = l_subtitle_0, 
                        colorStyle = l_Theme_0.TextDefault, 
                        fontStyle = v59, 
                        layoutOrder = 2, 
                        fluidSizing = false, 
                        textTruncate = Enum.TextTruncate.AtEnd, 
                        richText = false, 
                        lineHeight = 1
                    });
                end;
            end;
            v80.Subtitle = v81;
            v76.TitleArea = l_createElement_1(v78, v79, v80);
            v76.FooterContainer = v68 and v5.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v63), 
                BackgroundTransparency = 1, 
                LayoutOrder = 3
            }, {
                FooterTopPadding = v5.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, l_footerTopPadding_0)
                }), 
                Banner = l_bannerText_0 and v5.createElement(v18, {
                    bannerText = l_bannerText_0
                }), 
                Footer = not l_bannerText_0 and l_footer_0
            });
            return l_createElement_0(v74, v75, v76);
        end);
    end);
end;
local function v83(v82)
    return v5.createElement(v23, (v6.Dictionary.join({
        cursor = v15(v22)
    }, v82)));
end;
return v5.forwardRef(function(v84, v85)
    return v5.createElement(if not v21.useNewSelectionCursor then v23 else v83, v6.Dictionary.join(v84, {
        thumbnailRef = v85
    }));
end);
