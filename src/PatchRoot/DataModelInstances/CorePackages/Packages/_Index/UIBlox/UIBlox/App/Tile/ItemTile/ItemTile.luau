local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v4 = require(l_Parent_3.React);
local v5 = require(l_Parent_3.Cryo);
local v6 = require(l_Parent_3.t);
local v7 = require(l_Parent_2.App.ImageSet.Images);
local v8 = require(l_Parent_0.ItemRestrictionStatus);
local v9 = require(l_Parent_0.ItemTileStatus);
local v10 = require(l_Parent_1.Enum.ItemTileEnums);
local v11 = require(l_Parent_0.ItemIcon);
local v12 = require(l_Parent_1.BaseTile.Tile);
local v13 = v4.PureComponent:extend("ItemTile");
local function v15(v14)
    if not v14.bannerText or not v14.footer then
        return true;
    else
        return false, "A custom footer and bannerText can't be used together";
    end;
end;
v13.validateProps = v6.strictInterface({
    footer = v6.optional(v6.table), 
    name = v6.optional(v6.string), 
    subtitle = v6.optional(v6.string), 
    titleTextLineCount = v6.optional(v6.integer), 
    innerPadding = v6.optional(v6.integer), 
    onActivated = v6.optional(v6.callback), 
    thumbnail = v6.optional(v6.string), 
    backgroundImage = v6.optional(v6.union(v6.string, v6.table)), 
    bannerText = v6.optional(v6.string), 
    itemIconType = v6.optional(v10.ItemIconType.isEnumValue), 
    isSelected = v6.optional(v6.boolean), 
    Selectable = v6.optional(v6.boolean), 
    multiSelect = v6.optional(v6.boolean), 
    isPremium = v6.optional(v6.boolean), 
    restrictionTypes = v6.optional(v6.map(v10.Restriction.isEnumValue, v6.boolean)), 
    restrictionInfo = v6.optional(v6.table), 
    hasRoundedCorners = v6.optional(v6.boolean), 
    statusText = v6.optional(v6.string), 
    statusStyle = v6.optional(v10.StatusStyle.isEnumValue), 
    NextSelectionLeft = v6.optional(v6.table), 
    NextSelectionRight = v6.optional(v6.table), 
    NextSelectionUp = v6.optional(v6.table), 
    NextSelectionDown = v6.optional(v6.table), 
    thumbnailRef = v6.optional(v6.table), 
    textButtonRef = v6.optional(v6.table), 
    inputBindings = v6.optional(v6.table), 
    useMaxTitleHeight = v6.optional(v6.boolean), 
    addSubtitleSpace = v6.optional(v6.boolean), 
    titleFontStyle = v6.optional(v6.table), 
    renderTileInset = v6.optional(v6.callback), 
    hasVerifiedBadge = v6.optional(v6.boolean), 
    [v4.Tag] = v6.optional(v6.string), 
    aspectRatio = v6.optional(v6.number), 
    scaleType = v6.optional(v6.enum(Enum.ScaleType))
});
v13.defaultProps = {
    titleTextLineCount = 2, 
    innerPadding = 8, 
    isSelected = false, 
    multiSelect = false, 
    isPremium = false, 
    hasRoundedCorners = true, 
    Selectable = false
};
v13.render = function(v16)
    assert(v15(v16.props));
    local l_footer_0 = v16.props.footer;
    local l_bannerText_0 = v16.props.bannerText;
    local l_hasRoundedCorners_0 = v16.props.hasRoundedCorners;
    local l_innerPadding_0 = v16.props.innerPadding;
    local l_isPremium_0 = v16.props.isPremium;
    local l_isSelected_0 = v16.props.isSelected;
    local l_multiSelect_0 = v16.props.multiSelect;
    local l_itemIconType_0 = v16.props.itemIconType;
    local l_name_0 = v16.props.name;
    local l_subtitle_0 = v16.props.subtitle;
    local l_onActivated_0 = v16.props.onActivated;
    local l_restrictionInfo_0 = v16.props.restrictionInfo;
    local l_restrictionTypes_0 = v16.props.restrictionTypes;
    local l_statusStyle_0 = v16.props.statusStyle;
    local l_statusText_0 = v16.props.statusText;
    local l_titleTextLineCount_0 = v16.props.titleTextLineCount;
    local l_thumbnail_0 = v16.props.thumbnail;
    local l_backgroundImage_0 = v16.props.backgroundImage;
    local l_useMaxTitleHeight_0 = v16.props.useMaxTitleHeight;
    local l_addSubtitleSpace_0 = v16.props.addSubtitleSpace;
    local l_Selectable_0 = v16.props.Selectable;
    local l_titleFontStyle_0 = v16.props.titleFontStyle;
    local l_renderTileInset_0 = v16.props.renderTileInset;
    local l_aspectRatio_0 = v16.props.aspectRatio;
    local l_scaleType_0 = v16.props.scaleType;
    local v42 = false;
    local v43 = {};
    if l_itemIconType_0 then
        v42 = true;
        v43.ItemIconType = v4.createElement(v11, {
            itemIconType = l_itemIconType_0
        });
    end;
    if l_restrictionTypes_0 then
        v42 = true;
        v43.RestrictionStatus = v4.createElement(v8, {
            restrictionInfo = l_restrictionInfo_0, 
            restrictionTypes = l_restrictionTypes_0
        });
    end;
    if l_statusText_0 then
        v42 = true;
        v43.Status = v4.createElement(v9, {
            statusStyle = l_statusStyle_0, 
            statusText = l_statusText_0
        });
    end;
    return v4.createElement(v12, {
        bannerText = l_bannerText_0, 
        footer = l_footer_0, 
        hasRoundedCorners = l_hasRoundedCorners_0, 
        innerPadding = l_innerPadding_0, 
        isSelected = l_isSelected_0, 
        Selectable = l_Selectable_0, 
        multiSelect = l_multiSelect_0, 
        name = l_name_0, 
        subtitle = l_subtitle_0, 
        onActivated = l_onActivated_0, 
        thumbnail = l_thumbnail_0, 
        backgroundImage = l_backgroundImage_0, 
        thumbnailOverlayComponents = not not v42 and v43 or nil, 
        titleIcon = not not l_isPremium_0 and v7["icons/status/premium_small"] or nil, 
        titleTextLineCount = l_titleTextLineCount_0, 
        useMaxTitleHeight = l_useMaxTitleHeight_0, 
        addSubtitleSpace = l_addSubtitleSpace_0, 
        titleFontStyle = l_titleFontStyle_0, 
        renderTileInset = l_renderTileInset_0, 
        thumbnailAspectRatio = l_aspectRatio_0, 
        thumbnailScaleType = l_scaleType_0, 
        hasVerifiedBadge = v16.props.hasVerifiedBadge, 
        NextSelectionLeft = v16.props.NextSelectionLeft, 
        NextSelectionRight = v16.props.NextSelectionRight, 
        NextSelectionUp = v16.props.NextSelectionUp, 
        NextSelectionDown = v16.props.NextSelectionDown, 
        textButtonRef = v16.props.textButtonRef, 
        inputBindings = v16.props.inputBindings, 
        ref = v16.props.thumbnailRef, 
        [v4.Tag] = v16.props[v4.Tag]
    });
end;
return v4.forwardRef(function(v44, v45)
    return v4.createElement(v13, v5.Dictionary.join(v44, {
        thumbnailRef = v45
    }));
end);
