local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v5 = require(l_Parent_3.Roact);
local v6 = require(l_Parent_3.t);
local v7 = require(l_Parent_2.Core.Style.withStyle);
local v8 = require(l_Parent_3.Otter);
local l_EventConnection_0 = require(l_Parent_3.ReactUtils).EventConnection;
local v10 = require(l_Parent_1.ImageSet.getIconSize);
local v11 = require(l_Parent_1.ImageSet.Enum.IconSize);
local v12 = require(l_Parent_1.ImageSet.Images);
local v13 = require(l_Parent_1.Button.IconButton);
local v14 = require(l_Parent_0.ThumbnailButton);
local v15 = require(l_Parent_0.getShowItems);
local v16 = v10(v11.Medium);
local v17 = {
    frequency = 4, 
    dampingRatio = 1
};
local v18 = v5.Component:extend("MediaGalleryPreview");
v18.validateProps = v6.strictInterface({
    layoutOrder = v6.optional(v6.integer), 
    size = v6.optional(v6.UDim2), 
    anchorPoint = v6.optional(v6.Vector2), 
    position = v6.optional(v6.UDim2), 
    items = v6.array(v6.strictInterface({
        imageId = v6.string, 
        isVideo = v6.optional(v6.boolean)
    })), 
    numberOfThumbnails = v6.optional(v6.integer), 
    onPreviewActivated = v6.optional(v6.callback), 
    onVideoPlayActivated = v6.optional(v6.callback)
});
v18.defaultProps = {
    size = UDim2.fromScale(1, 1), 
    numberOfThumbnails = 5
};
v18.getDerivedStateFromProps = function(v19, v20)
    if v20.items == v19.items and v20.numberOfThumbnails == v19.numberOfThumbnails then
        return ;
    else
        local v21, v22, v23 = v15(v19);
        return {
            items = v19.items, 
            numberOfThumbnails = v19.numberOfThumbnails, 
            itemsToShow = v21, 
            videoItemsSize = v22, 
            imageItemsSize = v23, 
            animationOn = v23 > 1, 
            animatedIndex = v22 + 1, 
            selectedIndex = v22 + 1
        };
    end;
end;
v18.init = function(v24)
    v24.state = {
        items = nil, 
        numberOfThumbnails = 1, 
        itemsToShow = nil, 
        videoItemsSize = 0, 
        imageItemsSize = 0, 
        animationOn = false, 
        animatedIndex = 1, 
        selectedIndex = 1, 
        showArrows = false, 
        focusIndex = 1
    };
    v24.animationTime = 0;
    v24.scrolling = false;
    v24.scrollMotor = v8.createSingleMotor(0);
    local v25, v26 = v5.createBinding(UDim2.fromScale(1, 1));
    v24.contentSize = v25;
    v24.updateContentSize = v26;
    v25, v26 = v5.createBinding(UDim2.fromScale(1, 0.5));
    v24.previewSize = v25;
    v24.updatePreviewSize = v26;
    v25, v26 = v5.createBinding(UDim2.fromScale(1, 0.5));
    v24.paginationSize = v25;
    v24.updatePaginationSize = v26;
    v25, v26 = v5.createBinding(UDim2.fromScale(0, 0));
    v24.thumbnailSize = v25;
    v24.updateThumbnailSize = v26;
    v25, v26 = v5.createBinding(Vector2.new(0, 0));
    v24.canvasPosition = v25;
    v24.updateCanvasPosition = v26;
    v25, v26 = v5.createBinding(0);
    v24.progress = v25;
    v24.updateProgress = v26;
    v25, v26 = v5.createBinding(0);
    v24.previewTransparency = v25;
    v24.updatePreviewTransparency = v26;
    v24.onResize = function(v27)
        v24:updateSizes(v27);
        v24.updateCanvasPosition(Vector2.new(v24:getCanvasPositionX(), 0));
    end;
    v24.onMouseLeave = function(_, v29)
        if v29.UserInputType ~= Enum.UserInputType.MouseMovement then
            return ;
        else
            v24.resetAnimation();
            v24:setState(function(v30)
                local l_selectedIndex_0 = v30.selectedIndex;
                return {
                    animationOn = v30.imageItemsSize > 1, 
                    animatedIndex = l_selectedIndex_0, 
                    focusIndex = v24.getNextFocusIndex(l_selectedIndex_0)
                };
            end);
            return ;
        end;
    end;
    v24.onPreviewActivated = function()
        v24.resetAnimation();
        v24:setState({
            animationOn = false
        });
        if v24.props.onPreviewActivated then
            v24.props.onPreviewActivated(v24.state.itemsToShow[v24.state.selectedIndex].originalIndex);
        end;
    end;
    v24.onMouseEnterPagination = function(_, v33)
        if v33.UserInputType ~= Enum.UserInputType.MouseMovement then
            return ;
        else
            v24:setState(function(v34)
                if not v34.showArrows then
                    return {
                        showArrows = true
                    };
                else
                    return ;
                end;
            end);
            return ;
        end;
    end;
    v24.onMouseLeavePagination = function(_, v36)
        if v36.UserInputType ~= Enum.UserInputType.MouseMovement then
            return ;
        else
            v24:setState(function(v37)
                if v37.showArrows then
                    return {
                        showArrows = false
                    };
                else
                    return ;
                end;
            end);
            return ;
        end;
    end;
    v24.onCycleLeftActivated = function()
        if not v24.scrolling then
            local v38 = math.max(v24.state.focusIndex - 1, 1);
            v24.resetAnimation();
            v24:setState({
                animationOn = false, 
                focusIndex = v38
            });
            return ;
        else
            return ;
        end;
    end;
    v24.onCycleRightActivated = function()
        if not v24.scrolling then
            local v39 = math.min(v24.state.focusIndex + 1, #v24.props.items);
            v24.resetAnimation();
            v24:setState({
                animationOn = false, 
                focusIndex = v39
            });
            return ;
        else
            return ;
        end;
    end;
    v24.onItemActivated = function(v40)
        local l_isVideo_0 = v24.state.itemsToShow[v40].isVideo;
        v24.resetAnimation();
        v24:setState({
            animationOn = false, 
            selectedIndex = not l_isVideo_0 and v40 or nil
        });
        if l_isVideo_0 then
            v24.onVideoPlayActivated(v40);
        end;
    end;
    v24.onItemPlayActivated = function(v42)
        v24.resetAnimation();
        v24:setState({
            animationOn = false
        });
        v24.onVideoPlayActivated(v42);
    end;
    v24.onVideoPlayActivated = function(v43)
        if v24.props.onVideoPlayActivated then
            v24.props.onVideoPlayActivated(v24.state.itemsToShow[v43].originalIndex);
        end;
    end;
    v24.getNextFocusIndex = function(v44)
        local l_focusIndex_0 = v24.state.focusIndex;
        local l_numberOfThumbnails_0 = v24.props.numberOfThumbnails;
        if v44 < l_focusIndex_0 then
            return v44;
        elseif l_focusIndex_0 + l_numberOfThumbnails_0 <= v44 then
            return (v44 - l_numberOfThumbnails_0) + 1;
        else
            return l_focusIndex_0;
        end;
    end;
    v24.resetAnimation = function()
        v24.animationTime = 0;
        v24.updateProgress(0);
        v24.updatePreviewTransparency(0);
    end;
    v24.renderSteppedCallback = function(v47)
        v24.animationTime = v24.animationTime + v47;
        local v48 = v24.animationTime - 4.5;
        if v24.animationTime > 5 then
            v24.animationTime = 0;
            v24.updateProgress(0);
            local l_animatedIndex_0 = v24.state.animatedIndex;
            local l_videoItemsSize_0 = v24.state.videoItemsSize;
            local v51 = ((l_animatedIndex_0 - l_videoItemsSize_0) % v24.state.imageItemsSize + 1) + l_videoItemsSize_0;
            v24:setState({
                animatedIndex = v51, 
                selectedIndex = v51, 
                focusIndex = v24.getNextFocusIndex(v51)
            });
            return ;
        else
            v24.updateProgress(v24.animationTime / 5);
            if v48 > 0 then
                v24.updatePreviewTransparency(v48 / 0.5);
            end;
            return ;
        end;
    end;
    v24.scrollMotorOnStep = function(v52)
        v24.updateCanvasPosition(Vector2.new(v52, 0));
    end;
    v24.scrollMotorOnComplete = function()
        v24.scrolling = false;
    end;
    v24.scrollMotor:onStep(v24.scrollMotorOnStep);
    v24.scrollMotor:onComplete(v24.scrollMotorOnComplete);
end;
v18.render = function(v53)
    local l_layoutOrder_0 = v53.props.layoutOrder;
    local l_anchorPoint_0 = v53.props.anchorPoint;
    local l_position_0 = v53.props.position;
    local l_size_0 = v53.props.size;
    local l_numberOfThumbnails_1 = v53.props.numberOfThumbnails;
    local v59 = #v53.props.items;
    local l_itemsToShow_0 = v53.state.itemsToShow;
    local l_showArrows_0 = v53.state.showArrows;
    local l_focusIndex_1 = v53.state.focusIndex;
    local l_selectedIndex_1 = v53.state.selectedIndex;
    local l_animationOn_0 = v53.state.animationOn;
    local l_videoItemsSize_1 = v53.state.videoItemsSize;
    local l_imageItemsSize_0 = v53.state.imageItemsSize;
    local v67 = false;
    if v59 > 1 then
        v67 = not l_animationOn_0;
    end;
    local v68 = not not l_animationOn_0 and ((l_selectedIndex_1 - l_videoItemsSize_1) % l_imageItemsSize_0 + 1) + l_videoItemsSize_1 or nil;
    local v69 = l_numberOfThumbnails_1 < v59;
    local v70 = l_focusIndex_1 <= 1;
    local v71 = #l_itemsToShow_0 < l_focusIndex_1 + l_numberOfThumbnails_1;
    return v7(function(v72)
        return v5.createElement("Frame", {
            LayoutOrder = l_layoutOrder_0, 
            Size = l_size_0, 
            AnchorPoint = l_anchorPoint_0, 
            Position = l_position_0, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            [v5.Change.AbsoluteSize] = v53.onResize, 
            [v5.Event.InputEnded] = not not v67 and v53.onMouseLeave or nil
        }, {
            Content = v5.createElement("Frame", {
                Size = v53.contentSize, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            }, {
                ListLayout = v5.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 24)
                }), 
                Preview = v5.createElement("Frame", {
                    LayoutOrder = 1, 
                    Size = v53.previewSize, 
                    BackgroundTransparency = 1
                }, {
                    AnimationLabel = not not l_animationOn_0 and v5.createElement("ImageLabel", {
                        Size = UDim2.fromScale(1, 1), 
                        Image = v68 and l_itemsToShow_0[v68].imageId, 
                        BackgroundTransparency = 1, 
                        ZIndex = -1
                    }, {
                        Corner = v5.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 8)
                        })
                    }) or nil, 
                    Button = v5.createElement("ImageButton", {
                        Size = UDim2.fromScale(1, 1), 
                        Image = l_itemsToShow_0[l_selectedIndex_1].imageId, 
                        ImageTransparency = v53.previewTransparency, 
                        BackgroundTransparency = 1, 
                        AutoButtonColor = false, 
                        ZIndex = 1, 
                        [v5.Event.Activated] = v53.onPreviewActivated
                    }, {
                        Corner = v5.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 8)
                        })
                    })
                }), 
                Pagination = v5.createElement("Frame", {
                    LayoutOrder = 2, 
                    Size = v53.paginationSize, 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    [v5.Event.InputBegan] = not not v69 and v53.onMouseEnterPagination or nil, 
                    [v5.Event.InputEnded] = not not v69 and v53.onMouseLeavePagination or nil
                }, {
                    LeftArrow = not not l_showArrows_0 and v5.createElement(v13, {
                        size = UDim2.new(0, v16, 1, 0), 
                        anchorPoint = Vector2.new(0, 0.5), 
                        position = UDim2.fromScale(0, 0.5), 
                        icon = v12["icons/actions/cycleLeft"], 
                        isDisabled = v70, 
                        onActivated = v53.onCycleLeftActivated
                    }) or nil, 
                    Scroller = v53:renderScroller(v72), 
                    RightArrow = not not l_showArrows_0 and v5.createElement(v13, {
                        size = UDim2.new(0, v16, 1, 0), 
                        anchorPoint = Vector2.new(1, 0.5), 
                        position = UDim2.fromScale(1, 0.5), 
                        icon = v12["icons/actions/cycleRight"], 
                        isDisabled = v71, 
                        onActivated = v53.onCycleRightActivated
                    }) or nil
                })
            }), 
            EventConnection = not not l_animationOn_0 and v5.createElement(l_EventConnection_0, {
                event = l_RunService_0.RenderStepped, 
                callback = v53.renderSteppedCallback
            }) or nil
        });
    end);
end;
v18.renderScroller = function(v73, v74)
    return v5.createElement("ScrollingFrame", {
        Size = UDim2.new(1, -v16 * 2, 1, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.fromScale(0.5, 0.5), 
        BackgroundTransparency = 1, 
        ScrollBarThickness = 0, 
        ClipsDescendants = true, 
        ScrollingDirection = Enum.ScrollingDirection.X, 
        AutomaticCanvasSize = Enum.AutomaticSize.XY, 
        CanvasPosition = v73.canvasPosition
    }, v73:renderThumbnails(v74));
end;
v18.renderThumbnails = function(v75, v76)
    local l_selectedIndex_2 = v75.state.selectedIndex;
    local l_animationOn_1 = v75.state.animationOn;
    local l_animatedIndex_1 = v75.state.animatedIndex;
    local v80 = {
        ListLayout = v5.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 12)
        })
    };
    for v81, v82 in ipairs(v75.state.itemsToShow) do
        v80["item" .. v81] = v5.createElement("Frame", {
            LayoutOrder = v81, 
            Size = v75.thumbnailSize, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1
        }, {
            Thumbnail = v5.createElement(v14, {
                itemKey = v81, 
                imageId = v82.imageId, 
                isVideo = v82.isVideo, 
                isSelected = v81 == l_selectedIndex_2, 
                onActivated = not not (v82.imageId and v82.imageId ~= "") and v75.onItemActivated or nil, 
                onPlayActivated = not not v82.isVideo and v75.onItemPlayActivated or nil, 
                useScaledPlayButton = true
            }), 
            TimerBar = not not (l_animationOn_1 and v81 == l_animatedIndex_1) and v75:renderTimerBar(v76) or nil
        });
    end;
    return v80;
end;
v18.renderTimerBar = function(v83, v84)
    local l_UIDefault_0 = v84.Theme.UIDefault;
    local l_SecondaryContent_0 = v84.Theme.SecondaryContent;
    return v5.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 2), 
        AnchorPoint = Vector2.new(0, 1), 
        Position = UDim2.fromScale(0, 1), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        ClipsDescendants = true, 
        ZIndex = 100
    }, {
        Background = v5.createElement("Frame", {
            Size = v83.thumbnailSize, 
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.fromScale(0, 1), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_UIDefault_0.Color, 
            BackgroundTransparency = l_UIDefault_0.Transparency
        }, {
            Corner = v5.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            }), 
            Progress = v5.createElement("Frame", {
                Size = v83.progress:map(function(v87)
                    return UDim2.fromScale(v87, 1);
                end), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                ClipsDescendants = true
            }, {
                Foreground = v5.createElement("Frame", {
                    Size = v83.thumbnailSize, 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = l_SecondaryContent_0.Color, 
                    BackgroundTransparency = l_SecondaryContent_0.Transparency
                }, {
                    Corner = v5.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 8)
                    })
                })
            })
        })
    });
end;
v18.didUpdate = function(v88, _, v90)
    if v88.state.focusIndex ~= v90.focusIndex then
        v88:scrollToNewIndex();
    end;
    if v88.state.selectedIndex ~= v90.selectedIndex then
        v88.updatePreviewTransparency(0);
    end;
end;
v18.calcSizesFromWidth = function(_, v92, v93)
    local v94 = v92 - v16 * 2;
    local v95 = math.floor(v94 / 1.7777777777777777);
    local v96 = math.floor(((v92 - 12 * (v93 - 1)) - v16 * 2) / v93);
    local v97 = math.floor(v96 / 1.7777777777777777);
    return {
        contentSize = UDim2.fromOffset(v92, (v95 + v97) + 24), 
        previewSize = UDim2.fromOffset(v94, v95), 
        paginationSize = UDim2.fromOffset(v92, v97), 
        thumbnailSize = UDim2.fromOffset(v96, v97)
    };
end;
v18.calcSizesFromHeight = function(v98, v99, v100)
    return v98:calcSizesFromWidth(math.floor((((math.floor(((v99 - 24) * 1.7777777777777777) * v100) + 12 * (v100 - 1)) + v16 * 2) + (v16 * 2) * v100) / (v100 + 1)), v100);
end;
v18.updateSizes = function(v101, v102)
    local l_X_0 = v102.AbsoluteSize.X;
    local l_Y_0 = v102.AbsoluteSize.Y;
    local l_numberOfThumbnails_2 = v101.props.numberOfThumbnails;
    local v106 = v101:calcSizesFromWidth(l_X_0, l_numberOfThumbnails_2);
    if l_Y_0 < v106.contentSize.Y.Offset then
        v106 = v101:calcSizesFromHeight(l_Y_0, l_numberOfThumbnails_2);
    end;
    v101.updateContentSize(v106.contentSize);
    v101.updatePreviewSize(v106.previewSize);
    v101.updatePaginationSize(v106.paginationSize);
    v101.updateThumbnailSize(v106.thumbnailSize);
end;
v18.getCanvasPositionX = function(v107)
    return (v107.state.focusIndex - 1) * (v107.thumbnailSize:getValue().X.Offset + 12);
end;
v18.scrollToNewIndex = function(v108)
    local l_X_1 = v108.canvasPosition:getValue().X;
    local v110 = v108:getCanvasPositionX();
    v108.scrollMotor:setGoal(v8.instant(l_X_1));
    v108.scrollMotor:setGoal(v8.spring(v110, v17));
    v108.scrolling = true;
end;
return v18;
