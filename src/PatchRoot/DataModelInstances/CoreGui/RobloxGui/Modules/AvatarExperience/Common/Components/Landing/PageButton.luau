local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local v5 = require(l_CorePackages_0.UIBlox);
local v6 = require(l_CorePackages_0.Packages.t);
local l_Focusable_0 = v4.Focusable;
local l_withSelectionCursorProvider_0 = v5.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v5.App.SelectionImage.CursorKind;
local v10 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.Landing.ThumbnailSide);
local v12 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v13 = game:DefineFastFlag("PageButtonDropShadow", false);
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_withStyle_0 = v5.Style.withStyle;
local v16 = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 1), 
    NumberSequenceKeypoint.new(0.5, 1), 
    NumberSequenceKeypoint.new(1, 0.1)
});
local v17 = v3.PureComponent:extend("PageButton");
v17.validateProps = v6.strictInterface({
    Size = v6.UDim2, 
    backgroundImage = v6.string, 
    icon = v6.union(v6.string, v6.table), 
    text = v6.string, 
    transparencyModifier = v6.number, 
    onActivated = v6.callback, 
    getThumbnail = v6.optional(v6.callback), 
    thumbnailImageYInsetScale = v6.optional(v6.number), 
    thumbnailImage = v6.optional(v6.string), 
    thumbnailSize = v6.optional(v6.integer), 
    thumbnailScaleOffset = v6.optional(v6.Vector2), 
    ignoreThumbnail = v6.optional(v6.boolean), 
    thumbnailZoom = v6.optional(v6.number), 
    extraThumbnails = v6.optional(v6.array(v6.strictInterface({
        side = v11.isEnumValue, 
        image = v6.string, 
        imageRectSize = v6.optional(v6.Vector2), 
        imageRectOffset = v6.optional(v6.Vector2), 
        paddingTopScale = v6.optional(v6.number), 
        paddingBottomScale = v6.optional(v6.number), 
        paddingSideScale = v6.optional(v6.number)
    }))), 
    iconBeforeText = v6.optional(v6.boolean), 
    NextSelectionLeft = v6.optional(v6.table), 
    NextSelectionRight = v6.optional(v6.table), 
    NextSelectionUp = v6.optional(v6.table), 
    NextSelectionDown = v6.optional(v6.table), 
    [v3.Children] = v6.optional(v6.table), 
    forwardRef = v6.optional(v6.table), 
    dropShadowTransparency = not not v13 and v6.optional(v6.number) or nil, 
    dropShadowOffset = not not v13 and v6.optional(v6.Vector2) or nil, 
    dropShadowColor = not not v13 and v6.optional(v6.Color3) or nil
});
v17.defaultProps = {
    transparencyModifier = 0, 
    thumbnailScaleOffset = Vector2.new(0, 0), 
    thumbnailZoom = 1, 
    dropShadowTransparency = if not v13 then nil else 0.6, 
    dropShadowOffset = not not v13 and Vector2.new(2, 2) or nil, 
    dropShadowColor = not not v13 and Color3.new(0, 0, 0) or nil
};
v17.calculateShadowPosition = function(v18, v19)
    return UDim2.new(v18.props.dropShadowOffset.X / v19.X, 0, 1 + v18.props.dropShadowOffset.Y / v19.Y, 0);
end;
v17.init = function(v20)
    local v21, v22 = v3.createBinding(Vector2.new(1, 1));
    v20.buttonSize = v21;
    v20.updateButtonSize = v22;
    v20:setState({
        imageButtonWidth = 0
    });
end;
v17.renderSideThumbnail = function(v23, v24)
    if v23.props.extraThumbnails then
        local v25 = nil;
        for _, v27 in v23.props.extraThumbnails, nil, nil do
            if v27.side == v24 then
                v25 = v27;
                break;
            end;
        end;
        if v25 then
            local v28 = nil;
            local v29 = nil;
            if v24 == v11.Left then
                v29 = Vector2.new(0, 0);
                v28 = UDim2.fromScale(v25.paddingSideScale, v25.paddingTopScale);
            else
                v29 = Vector2.new(1, 0);
                v28 = UDim2.fromScale(1 - v25.paddingSideScale, v25.paddingTopScale);
            end;
            return v3.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                ZIndex = 2, 
                Image = v25.image, 
                ImageRectSize = v25.imageRectSize, 
                ImageRectOffset = v25.imageRectOffset, 
                AnchorPoint = v29, 
                Position = v28, 
                Size = v23.buttonSize:map(function(v30)
                    local v31 = v30.Y * ((1 - v25.paddingTopScale) - v25.paddingBottomScale);
                    return UDim2.fromOffset((v25.imageRectSize.X * v31) / v25.imageRectSize.Y, v31);
                end)
            });
        else
            return nil;
        end;
    else
        return nil;
    end;
end;
v17.calcNormalizedSize = function(_, v33, v34)
    if v33.Y < v33.X then
        return Vector2.new((v34 * v33.Y) / v33.X, v34);
    else
        return Vector2.new(v34, (v34 * v33.X) / v33.Y);
    end;
end;
v17.shouldUseImageRectSizeAndOffset = function(v35)
    local v36 = false;
    if v35.props.thumbnailZoom > 1 then
        v36 = v35.props.thumbnailSize;
    end;
    return v36;
end;
v17.renderThumbnail = function(v37)
    if not v37.props.ignoreThumbnail then
        local l_thumbnailImage_0 = v37.props.thumbnailImage;
        local l_getThumbnail_0 = v37.props.getThumbnail;
        local l_transparencyModifier_0 = v37.props.transparencyModifier;
        local v41 = v37:getThumbnailPosition();
        local v42 = v37:getThumbnailSize();
        local v43 = v37:getThumbnailImageRectOffset();
        local v44 = v37:getThumbnailImageRectSize();
        if not l_getThumbnail_0 then
            return v3.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                ZIndex = 2, 
                Image = l_thumbnailImage_0, 
                ImageTransparency = l_transparencyModifier_0, 
                Position = v41, 
                Size = v42, 
                ImageRectOffset = v43, 
                ImageRectSize = v44
            }, {
                UICorner = v3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, v10.PageButtonCornerRadius)
                })
            });
        else
            return l_getThumbnail_0(v41, v42, v43, v44, 2, {
                UICorner = v3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, v10.PageButtonCornerRadius)
                })
            });
        end;
    else
        return nil;
    end;
end;
v17.getThumbnailPosition = function(v45)
    if not v45:shouldUseImageRectSizeAndOffset() then
        local l_thumbnailScaleOffset_0 = v45.props.thumbnailScaleOffset;
        return v45.buttonSize:map(function(v47)
            local v48 = (l_thumbnailScaleOffset_0 - v45:calcNormalizedSize(v47, v45.props.thumbnailZoom) * Vector2.new(0.5, 0.5)) + Vector2.new(0.5, 0.5);
            local v49 = Vector2.new(math.max(v48.X, l_thumbnailScaleOffset_0.X - 0.5), (math.max(v48.Y, l_thumbnailScaleOffset_0.Y)));
            return UDim2.fromScale(v49.X, v49.Y);
        end);
    else
        return UDim2.fromScale(0, 0);
    end;
end;
v17.getThumbnailSize = function(v50)
    if not v50:shouldUseImageRectSizeAndOffset() then
        return v50.buttonSize:map(function(v51)
            local v52 = v50:calcNormalizedSize(v51, v50.props.thumbnailZoom);
            return UDim2.fromScale(v52.X, v52.Y);
        end);
    else
        return UDim2.fromScale(1, 1);
    end;
end;
v17.getThumbnailImageRectOffset = function(v53)
    if not v53:shouldUseImageRectSizeAndOffset() then
        return nil;
    else
        return v53.buttonSize:map(function(v54)
            local v55 = v53:calcNormalizedSize(v54, v53.props.thumbnailZoom);
            local v56 = Vector2.new(v53.props.thumbnailSize / v55.X, v53.props.thumbnailSize / v55.Y);
            local v57 = (v53.props.thumbnailSize - v56.X) * 0.5;
            local _ = nil;
            return (Vector2.new(v57, if not v53.props.thumbnailImageYInsetScale then (v53.props.thumbnailSize - v56.Y) * 0.5 else v53.props.thumbnailSize * v53.props.thumbnailImageYInsetScale));
        end);
    end;
end;
v17.getThumbnailImageRectSize = function(v59)
    if not v59:shouldUseImageRectSizeAndOffset() then
        return nil;
    else
        return v59.buttonSize:map(function(v60)
            local v61 = v59:calcNormalizedSize(v60, v59.props.thumbnailZoom);
            return Vector2.new(v59.props.thumbnailSize / v61.X, v59.props.thumbnailSize / v61.Y);
        end);
    end;
end;
v17.renderTextComponent = function(_, v63, v64, v65, v66, v67, v68, v69)
    local v70 = nil;
    v70 = if not v63 then v69 - 20 else (v69 - 48) - 30;
    if v70 <= 0 then
        return nil;
    else
        local v71, v72 = v12.getLargestPossibleOneLineTextSize(v65, v66, v64.Header1, v70);
        if v71 == nil then
            return nil;
        else
            return v3.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                Size = UDim2.fromOffset(v71.X, v71.Y), 
                Font = v64.Header1.Font, 
                Text = v65, 
                TextColor3 = v67, 
                TextSize = v72, 
                TextTransparency = v68
            });
        end;
    end;
end;
v17.renderWithSelectionCursor = function(v73, v74)
    local l_Size_0 = v73.props.Size;
    local l_backgroundImage_0 = v73.props.backgroundImage;
    local l_icon_0 = v73.props.icon;
    local l_iconBeforeText_0 = v73.props.iconBeforeText;
    local l_text_0 = v73.props.text;
    local l_transparencyModifier_1 = v73.props.transparencyModifier;
    local l_NextSelectionLeft_0 = v73.props.NextSelectionLeft;
    local l_NextSelectionRight_0 = v73.props.NextSelectionRight;
    local l_NextSelectionUp_0 = v73.props.NextSelectionUp;
    local l_NextSelectionDown_0 = v73.props.NextSelectionDown;
    local v85 = UDim2.new(1, 0, 0.6666666666666666, 0);
    return l_withStyle_0(function(v86)
        local l_Theme_0 = v86.Theme;
        local l_Font_0 = v86.Font;
        local v89 = l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize;
        local l_forwardRef_0 = v73.props.forwardRef;
        local l_dropShadowTransparency_0 = v73.props.dropShadowTransparency;
        local l_dropShadowColor_0 = v73.props.dropShadowColor;
        return v3.createElement(l_Focusable_0.ImageButton, {
            BackgroundTransparency = 0.9, 
            BorderSizePixel = 0, 
            ClipsDescendants = true, 
            Size = l_Size_0, 
            NextSelectionLeft = l_NextSelectionLeft_0, 
            NextSelectionRight = l_NextSelectionRight_0, 
            NextSelectionUp = l_NextSelectionUp_0, 
            NextSelectionDown = l_NextSelectionDown_0, 
            [v3.Ref] = l_forwardRef_0, 
            SelectionImageObject = v74(l_CursorKind_0.RoundedRectNoInset), 
            [v3.Event.Activated] = v73.props.onActivated, 
            [v3.Change.AbsoluteSize] = function(v93)
                v73:setState({
                    imageButtonWidth = v93.AbsoluteSize.X
                });
                v73.updateButtonSize(v93.AbsoluteSize);
            end
        }, {
            BackgroundImage = v3.createElement("ImageLabel", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Image = l_backgroundImage_0, 
                ImageTransparency = l_transparencyModifier_1, 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                Size = UDim2.fromScale(1, 1), 
                ScaleType = Enum.ScaleType.Crop, 
                ZIndex = 1
            }, {
                UICorner = v3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, v10.PageButtonCornerRadius)
                })
            }), 
            Thumbnail = v73:renderThumbnail(), 
            LeftThumbnail = v73:renderSideThumbnail(v11.Left), 
            RightThumbnail = v73:renderSideThumbnail(v11.Right), 
            Overlay = v3.createElement("Frame", {
                BackgroundTransparency = l_transparencyModifier_1, 
                BackgroundColor3 = l_Theme_0.Overlay.Color, 
                BorderSizePixel = 0, 
                Size = UDim2.fromScale(1, 1), 
                ZIndex = 3
            }, {
                Gradient = v3.createElement("UIGradient", {
                    Rotation = 90, 
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)), 
                        ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0))
                    }), 
                    Transparency = v16
                }), 
                UICorner = v3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, v10.PageButtonCornerRadius)
                })
            }), 
            ForegroundShadow = not not v13 and v3.createElement("Frame", {
                AnchorPoint = Vector2.new(0, 1), 
                BackgroundTransparency = 1, 
                Position = v73.buttonSize:map(function(v94)
                    return v73:calculateShadowPosition(v94);
                end), 
                Size = not not v73.props.iconBeforeText and UDim2.fromScale(1, 1) or v85, 
                ZIndex = 4
            }, {
                uiSizeConstraint = not v73.props.iconBeforeText and v3.createElement("UISizeConstraint", {
                    MinSize = Vector2.new(0, v10.PageButtonForegroundMinHeightPix)
                }) or nil, 
                UIListLayout = v3.createElement("UIListLayout", {
                    FillDirection = not not l_iconBeforeText_0 and Enum.FillDirection.Horizontal or Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 10)
                }), 
                IconShadow = v3.createElement(l_ImageSetLabel_0, {
                    BackgroundTransparency = 1, 
                    Image = l_icon_0, 
                    ImageColor3 = l_dropShadowColor_0, 
                    ImageTransparency = l_dropShadowTransparency_0, 
                    LayoutOrder = 1, 
                    Size = UDim2.new(0, 48, 0, 48)
                }), 
                DropShadow = v73:renderTextComponent(l_iconBeforeText_0, l_Font_0, l_text_0, v89, l_dropShadowColor_0, l_dropShadowTransparency_0, v73.state.imageButtonWidth)
            }) or nil, 
            Foreground = v3.createElement("Frame", {
                AnchorPoint = Vector2.new(0, 1), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(0, 0, 1, 0), 
                Size = not not v73.props.iconBeforeText and UDim2.fromScale(1, 1) or v85, 
                ZIndex = 4
            }, {
                uiSizeConstraint = not v73.props.iconBeforeText and v3.createElement("UISizeConstraint", {
                    MinSize = Vector2.new(0, v10.PageButtonForegroundMinHeightPix)
                }) or nil, 
                UIListLayout = v3.createElement("UIListLayout", {
                    FillDirection = not not l_iconBeforeText_0 and Enum.FillDirection.Horizontal or Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 10)
                }), 
                Icon = v3.createElement(l_ImageSetLabel_0, {
                    BackgroundTransparency = 1, 
                    Image = l_icon_0, 
                    ImageTransparency = l_transparencyModifier_1, 
                    LayoutOrder = 1, 
                    Size = UDim2.new(0, 48, 0, 48)
                }), 
                Text = v73:renderTextComponent(l_iconBeforeText_0, l_Font_0, l_text_0, v89, Color3.new(1, 1, 1), l_transparencyModifier_1, v73.state.imageButtonWidth)
            }), 
            UICorner = v3.createElement("UICorner", {
                CornerRadius = UDim.new(0, v10.PageButtonCornerRadius)
            })
        });
    end);
end;
v17.render = function(v95)
    return l_withSelectionCursorProvider_0(function(v96)
        return v95:renderWithSelectionCursor(v96);
    end);
end;
return v3.forwardRef(function(v97, v98)
    return v3.createElement(v17, v2.Dictionary.join(v97, {
        forwardRef = v98
    }));
end);
