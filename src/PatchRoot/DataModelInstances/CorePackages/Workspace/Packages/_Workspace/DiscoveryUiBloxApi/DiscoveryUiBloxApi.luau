local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local v3 = require(l_Parent_0.t);
local function _(v4, v5, v6)
    if not _G.__DEV__ and not _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
        return v4;
    else
        return function(v7)
            local v8, v9 = v5(v7);
            if not v8 then
                error((("%* prop validation failed: %*"):format(v6, v9)));
            end;
            if type(v4) == "function" then
                return v4(v7);
            else
                return v1.createElement(v4, v7);
            end;
        end;
    end;
end;
local v17 = {
    AspectRatioModeEnum = v2.App.Tile.AspectRatioModeEnum, 
    Images = v2.App.ImageSet.Images, 
    TooltipOrientation = v2.App.Dialog.Enum.TooltipOrientation, 
    useCursor = function(v11, v12, v13)
        return v2.App.SelectionCursor.useCursor(v11, v12, v13);
    end, 
    useStyle = function()
        return v2.Core.Style.useStyle();
    end, 
    withGridConfig_DEPRECATED = function(v14, v15)
        return v2.Core.Layout.Grid.withGridConfig_DEPRECATED(v14, v15);
    end, 
    withStyle = function(v16)
        return v2.Style.withStyle(v16);
    end
};
local l_ExperienceActionRow_0 = v2.App.Tile.ExperienceActionRow;
local v19 = v3.strictInterface({
    isActionable = v3.optional(v3.boolean), 
    height = v3.optional(v3.number), 
    horizontalPadding = v3.optional(v3.number), 
    verticalPadding = v3.optional(v3.number), 
    onPlayPressed = v3.optional(v3.callback), 
    text = v3.optional(v3.string), 
    icon = v3.optional(v3.strictInterface({
        ImageRectOffset = v3.Vector2, 
        ImageRectSize = v3.Vector2, 
        Image = v3.string
    })), 
    feedbackType = v3.optional(v3.string)
});
local v20;
if not _G.__DEV__ and not _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
    v20 = l_ExperienceActionRow_0;
else
    local v21 = "ExperienceActionRow";
    local l_v19_0 = v19 --[[ copy: 8 -> 10 ]];
    local l_v21_0 = v21 --[[ copy: 9 -> 11 ]];
    local l_l_ExperienceActionRow_0_0 = l_ExperienceActionRow_0 --[[ copy: 7 -> 12 ]];
    v20 = function(v25)
        local v26, v27 = l_v19_0(v25);
        if not v26 then
            error((("%* prop validation failed: %*"):format(l_v21_0, v27)));
        end;
        if type(l_l_ExperienceActionRow_0_0) == "function" then
            return l_l_ExperienceActionRow_0_0(v25);
        else
            return v1.createElement(l_l_ExperienceActionRow_0_0, v25);
        end;
    end;
end;
v17.ExperienceActionRow = v20;
l_ExperienceActionRow_0 = v2.App.Tile.ExperienceTileMetadata.CoPlayFooter;
v19 = v3.strictInterface({
    users = v3.table, 
    labelText = v3.optional(v3.string), 
    faceGroupCount = v3.optional(v3.number), 
    maxBadgeDisplayNumber = v3.optional(v3.number), 
    size = v3.optional(v3.UDim2), 
    position = v3.optional(v3.UDim2), 
    anchorPoint = v3.optional(v3.Vector2), 
    layoutOrder = v3.optional(v3.number), 
    styleProps = v3.optional(v3.table), 
    showEmphasisBorder = v3.optional(v3.boolean)
});
if not _G.__DEV__ and not _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
    v20 = l_ExperienceActionRow_0;
else
    local v28 = "ExperienceTileMetadataCoPlayFooter";
    local l_v19_1 = v19 --[[ copy: 8 -> 13 ]];
    local l_v28_0 = v28 --[[ copy: 9 -> 14 ]];
    local l_l_ExperienceActionRow_0_1 = l_ExperienceActionRow_0 --[[ copy: 7 -> 15 ]];
    v20 = function(v32)
        local v33, v34 = l_v19_1(v32);
        if not v33 then
            error((("%* prop validation failed: %*"):format(l_v28_0, v34)));
        end;
        if type(l_l_ExperienceActionRow_0_1) == "function" then
            return l_l_ExperienceActionRow_0_1(v32);
        else
            return v1.createElement(l_l_ExperienceActionRow_0_1, v32);
        end;
    end;
end;
v17.ExperienceTileMetadataCoPlayFooter = v20;
l_ExperienceActionRow_0 = v2.App.Tile.ExperienceTileMetadata.SocialProofFooter;
v19 = v3.strictInterface({
    ratingText = v3.string, 
    playingText = v3.string
});
if not _G.__DEV__ and not _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
    v20 = l_ExperienceActionRow_0;
else
    local v35 = "ExperienceTileMetadataSocialProofFooter";
    local l_v19_2 = v19 --[[ copy: 8 -> 16 ]];
    local l_v35_0 = v35 --[[ copy: 9 -> 17 ]];
    local l_l_ExperienceActionRow_0_2 = l_ExperienceActionRow_0 --[[ copy: 7 -> 18 ]];
    v20 = function(v39)
        local v40, v41 = l_v19_2(v39);
        if not v40 then
            error((("%* prop validation failed: %*"):format(l_v35_0, v41)));
        end;
        if type(l_l_ExperienceActionRow_0_2) == "function" then
            return l_l_ExperienceActionRow_0_2(v39);
        else
            return v1.createElement(l_l_ExperienceActionRow_0_2, v39);
        end;
    end;
end;
v17.ExperienceTileMetadataSocialProofFooter = v20;
l_ExperienceActionRow_0 = v2.App.Tile.ExperienceTileMetadata.TextFooter;
v19 = v3.strictInterface({
    text = v3.string, 
    styleProps = v3.optional(v3.table)
});
if not _G.__DEV__ and not _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
    v20 = l_ExperienceActionRow_0;
else
    local v42 = "ExperienceTileMetadataTextFooter";
    local l_v19_3 = v19 --[[ copy: 8 -> 19 ]];
    local l_v42_0 = v42 --[[ copy: 9 -> 20 ]];
    local l_l_ExperienceActionRow_0_3 = l_ExperienceActionRow_0 --[[ copy: 7 -> 21 ]];
    v20 = function(v46)
        local v47, v48 = l_v19_3(v46);
        if not v47 then
            error((("%* prop validation failed: %*"):format(l_v42_0, v48)));
        end;
        if type(l_l_ExperienceActionRow_0_3) == "function" then
            return l_l_ExperienceActionRow_0_3(v46);
        else
            return v1.createElement(l_l_ExperienceActionRow_0_3, v46);
        end;
    end;
end;
v17.ExperienceTileMetadataTextFooter = v20;
l_ExperienceActionRow_0 = v2.App.Tile.ExperienceTileV3;
v19 = v3.strictInterface({
    experienceName = v3.optional(v3.string), 
    thumbnail = v3.optional(v3.string), 
    wideThumbnail = v3.optional(v3.string), 
    footer = v3.optional(v3.any), 
    thumbnailAspectRatioOverride = v3.optional(v3.string), 
    contentTextLineCount = v3.number, 
    onActivated = v3.optional(v3.callback), 
    isHoverEnabled = v3.optional(v3.boolean), 
    onHoverChanged = v3.optional(v3.callback), 
    hoverDelay = v3.optional(v3.number), 
    hasBackground = v3.optional(v3.boolean), 
    hasOutline = v3.optional(v3.boolean), 
    renderActionRow = v3.optional(v3.callback), 
    styleProps = v3.table
});
if not _G.__DEV__ and not _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
    v20 = l_ExperienceActionRow_0;
else
    local v49 = "ExperienceTileV3";
    local l_v19_4 = v19 --[[ copy: 8 -> 22 ]];
    local l_v49_0 = v49 --[[ copy: 9 -> 23 ]];
    local l_l_ExperienceActionRow_0_4 = l_ExperienceActionRow_0 --[[ copy: 7 -> 24 ]];
    v20 = function(v53)
        local v54, v55 = l_v19_4(v53);
        if not v54 then
            error((("%* prop validation failed: %*"):format(l_v49_0, v55)));
        end;
        if type(l_l_ExperienceActionRow_0_4) == "function" then
            return l_l_ExperienceActionRow_0_4(v53);
        else
            return v1.createElement(l_l_ExperienceActionRow_0_4, v53);
        end;
    end;
end;
v17.ExperienceTileV3 = v20;
v17.ImageSetLabel = v2.Core.ImageSet.ImageSetLabel;
v17.Interactable = v2.Core.Control.Interactable;
l_ExperienceActionRow_0 = v2.App.Loading.LoadableImage;
v19 = v3.strictInterface({
    BackgroundTransparency = v3.optional(v3.number), 
    Image = v3.optional(v3.union(v3.string, v3.table)), 
    Size = v3.UDim2, 
    cornerRadius = v3.optional(v3.UDim), 
    useShimmerAnimationWhileLoading = v3.optional(v3.boolean), 
    showFailedStateWhenLoadingFailed = v3.optional(v3.boolean), 
    ZIndex = v3.optional(v3.integer), 
    AnchorPoint = v3.optional(v3.Vector2), 
    BackgroundColor3 = v3.optional(v3.Color3), 
    ImageColor3 = v3.optional(v3.Color3), 
    ImageTransparency = v3.optional(v3.number), 
    ImageRectOffset = v3.optional(v3.union(v3.Vector2, v3.table)), 
    ImageRectSize = v3.optional(v3.union(v3.Vector2, v3.table)), 
    LayoutOrder = v3.optional(v3.integer), 
    loadingImage = v3.optional(v3.union(v3.string, v3.table)), 
    loadingStrategy = v3.optional(v3.any), 
    loadingTimeout = v3.optional(v3.numberPositive), 
    renderOnLoading = v3.optional(v3.callback), 
    renderOnFailed = v3.optional(v3.callback), 
    MaxSize = v3.optional(v3.Vector2), 
    MinSize = v3.optional(v3.Vector2), 
    onLoaded = v3.optional(v3.callback), 
    Position = v3.optional(v3.UDim2), 
    ScaleType = v3.optional(v3.enum(Enum.ScaleType)), 
    shouldHandleReloads = v3.optional(v3.boolean)
});
if not _G.__DEV__ and not _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
    v20 = l_ExperienceActionRow_0;
else
    local v56 = "LoadableImage";
    local l_v19_5 = v19 --[[ copy: 8 -> 25 ]];
    local l_v56_0 = v56 --[[ copy: 9 -> 26 ]];
    local l_l_ExperienceActionRow_0_5 = l_ExperienceActionRow_0 --[[ copy: 7 -> 27 ]];
    v20 = function(v60)
        local v61, v62 = l_v19_5(v60);
        if not v61 then
            error((("%* prop validation failed: %*"):format(l_v56_0, v62)));
        end;
        if type(l_l_ExperienceActionRow_0_5) == "function" then
            return l_l_ExperienceActionRow_0_5(v60);
        else
            return v1.createElement(l_l_ExperienceActionRow_0_5, v60);
        end;
    end;
end;
v17.LoadableImage = v20;
l_ExperienceActionRow_0 = v2.App.Indicator.StatGroup;
v19 = v3.strictInterface({
    ratingText = v3.string, 
    playingText = v3.optional(v3.string)
});
if not _G.__DEV__ and not _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
    v20 = l_ExperienceActionRow_0;
else
    local v63 = "StatGroup";
    local l_v19_6 = v19 --[[ copy: 8 -> 28 ]];
    local l_v63_0 = v63 --[[ copy: 9 -> 29 ]];
    local l_l_ExperienceActionRow_0_6 = l_ExperienceActionRow_0 --[[ copy: 7 -> 30 ]];
    v20 = function(v67)
        local v68, v69 = l_v19_6(v67);
        if not v68 then
            error((("%* prop validation failed: %*"):format(l_v63_0, v69)));
        end;
        if type(l_l_ExperienceActionRow_0_6) == "function" then
            return l_l_ExperienceActionRow_0_6(v67);
        else
            return v1.createElement(l_l_ExperienceActionRow_0_6, v67);
        end;
    end;
end;
v17.StatGroup = v20;
l_ExperienceActionRow_0 = v2.App.Text.StyledTextLabel;
v19 = v3.strictInterface({
    text = v3.string, 
    fontStyle = v3.any, 
    colorStyle = v3.any, 
    textTruncate = v3.optional(v3.EnumItem), 
    textWrapped = v3.optional(v3.boolean), 
    textXAlignment = v3.optional(v3.EnumItem), 
    textYAlignment = v3.optional(v3.EnumItem), 
    size = v3.optional(v3.UDim2), 
    maxSize = v3.optional(v3.Vector2), 
    richText = v3.optional(v3.boolean), 
    layoutOrder = v3.optional(v3.number), 
    fluidSizing = v3.optional(v3.boolean), 
    automaticSize = v3.optional(v3.EnumItem), 
    lineHeight = v3.optional(v3.number), 
    clipsDescendants = v3.optional(v3.boolean)
});
if not _G.__DEV__ and not _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
    v20 = l_ExperienceActionRow_0;
else
    local v70 = "StyledTextLabel";
    v20 = function(v71)
        local v72, v73 = v19(v71);
        if not v72 then
            error((("%* prop validation failed: %*"):format(v70, v73)));
        end;
        if type(l_ExperienceActionRow_0) == "function" then
            return l_ExperienceActionRow_0(v71);
        else
            return v1.createElement(l_ExperienceActionRow_0, v71);
        end;
    end;
end;
v17.StyledTextLabel = v20;
return v17;
