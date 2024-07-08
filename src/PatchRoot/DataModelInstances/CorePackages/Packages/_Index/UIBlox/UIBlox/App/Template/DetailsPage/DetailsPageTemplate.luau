local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v4 = require(l_Parent_3.Roact);
local v5 = require(l_Parent_3.t);
local v6 = require(l_Parent_2.UIBloxConfig);
local v7 = require(l_Parent_2.Core.Style.withStyle);
local v8 = require(l_Parent_1.Loading.LoadableImage);
local v9 = require(l_Parent_1.ImageSet.Images);
local v10 = require(l_Parent_1.Button.IconButton);
local v11 = require(l_Parent_1.ImageSet.Enum.IconSize);
local v12 = require(l_Parent_1.ImageSet.getIconSize);
local v13 = require(l_Parent_1.ImageSet.getIconSizeUDim2);
local v14 = require(l_Parent_1.Container.VerticalScrollView);
local v15 = require(l_Parent_1.Button.ActionBar);
local v16 = require(l_Parent_1.Button.StickyActionBar);
local l_DeviceType_0 = require(l_Parent_1.Style.Constants).DeviceType;
local v18 = require(l_Parent_0.getPlatformConfig);
local v19 = require(l_Parent_0.DetailsPageHeader);
local v20 = require(l_Parent_0.DetailsPageBody);
local v21 = require(l_Parent_0.validateDetailsPageComponentList);
local v22 = v4.PureComponent:extend("DetailsPageTemplate");
v22.validateProps = v5.strictInterface({
    thumbnailImageUrl = v5.optional(v5.string), 
    thumbnailHeight = v5.optional(v5.number), 
    thumbnailAspectRatio = v5.optional(v5.Vector2), 
    titleText = v5.optional(v5.string), 
    subTitleText = v5.optional(v5.string), 
    renderInfoContent = v5.optional(v5.callback), 
    actionBarProps = v5.optional(v15.validateProps), 
    componentList = v5.optional(v21), 
    dualPanelBreakpoint = v5.optional(v5.number), 
    sideMargin = v5.optional(v5.number), 
    bodyClipsDescendants = v5.optional(v5.boolean), 
    startingOffsetPosition = v5.optional(v5.number), 
    headerBarBackgroundHeight = v5.optional(v5.number), 
    onClose = v5.callback, 
    bannerPlaceholderGradient = v5.optional(v5.table), 
    bannerImageUrl = v5.optional(v5.string), 
    isFullscreen = v5.optional(v5.boolean), 
    renderFullscreenContent = v5.optional(v5.callback), 
    deviceType = v5.optional(v5.string), 
    isMobile = v5.optional(v5.boolean), 
    tokens = v5.optional(v5.table)
});
v22.defaultProps = {
    deviceType = l_DeviceType_0.Desktop, 
    isFullscreen = false
};
local function _(v23, v24)
    return v24 - if not v23.headerBarBackgroundHeight then v18(v23.deviceType).headerBarBackgroundHeight else v23.headerBarBackgroundHeight;
end;
v22.init = function(v26)
    v26.containerRef = v4.createRef();
    v26.scrollingFrameRef = v4.createRef();
    v26.scrolled = false;
    v26.state = {
        showStickyActionTopBar = false, 
        backgroundHeight = 500, 
        containerSize = Vector2.new(500, 500), 
        backgroundComponentPosition = 250
    };
    v26.onContainerSizeChange = function(v27)
        v26:setState({
            containerSize = v27.AbsoluteSize
        });
    end;
    v26.onBackgroundComponentFrameSizeChange = function(v28)
        v26:setState(function(_, v30)
            local l_Y_0 = v28.AbsoluteSize.Y;
            return {
                backgroundHeight = l_Y_0, 
                backgroundComponentPosition = math.max(0, l_Y_0 - if not v30.headerBarBackgroundHeight then v18(v30.deviceType).headerBarBackgroundHeight else v30.headerBarBackgroundHeight) / 2
            };
        end);
    end;
    v26.canvasPositionChange = function(v32)
        v26.scrolled = true;
        v26:setState(function(v33, v34)
            local v35 = v33.backgroundHeight - if not v34.headerBarBackgroundHeight then v18(v34.deviceType).headerBarBackgroundHeight else v34.headerBarBackgroundHeight;
            local v36 = math.max(0, v35 - v32.CanvasPosition.Y) / 2;
            if v35 < v32.CanvasPosition.Y then
                if v33.showStickyActionTopBar == false and v26.props.deviceType ~= l_DeviceType_0.Phone then
                    return {
                        showStickyActionTopBar = true
                    };
                else
                    return nil;
                end;
            elseif v33.showStickyActionTopBar == true then
                return {
                    showStickyActionTopBar = false, 
                    backgroundComponentPosition = v36
                };
            else
                return {
                    backgroundComponentPosition = v36
                };
            end;
        end);
    end;
end;
v22.render = function(v37)
    local v38 = v37.props.deviceType == l_DeviceType_0.Phone;
    local v39 = v18(v37.props.deviceType);
    local v40 = if not v37.props.thumbnailHeight then v39.thumbnailHeight else v37.props.thumbnailHeight;
    local v41 = if not v37.props.headerBarBackgroundHeight then v39.headerBarBackgroundHeight else v37.props.headerBarBackgroundHeight;
    local v42 = if not v37.props.sideMargin then v39.sideMargin else v37.props.sideMargin;
    local v43 = if not v37.props.dualPanelBreakpoint then v39.dualPanelBreakpoint else v37.props.dualPanelBreakpoint;
    local l_props_0 = v37.props;
    local v45 = v37.state.backgroundHeight - if not l_props_0.headerBarBackgroundHeight then v18(l_props_0.deviceType).headerBarBackgroundHeight else l_props_0.headerBarBackgroundHeight;
    l_props_0 = v37.state.backgroundComponentPosition;
    local l_containerSize_0 = v37.state.containerSize;
    local l_isFullscreen_0 = v37.props.isFullscreen;
    local l_renderFullscreenContent_0 = v37.props.renderFullscreenContent;
    local v49 = not v38 and ((l_isFullscreen_0 and l_renderFullscreenContent_0) and true or false);
    return v7(function(v50)
        local l_Theme_0 = v50.Theme;
        local v52 = v37.props.bannerImageUrl == nil;
        local v53 = v37.props.bannerPlaceholderGradient or {
            Rotation = 90, 
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, l_Theme_0.BackgroundMuted.Color), 
                ColorSequenceKeypoint.new(1, l_Theme_0.BackgroundUIDefault.Color)
            })
        };
        local v54 = not not v38 and (v12(v11.Large) + 22) / 2 or v41 / 2;
        local v55 = v38 and v37.props.actionBarProps;
        return v4.createElement("TextButton", {
            Text = "", 
            AutoButtonColor = false, 
            Size = UDim2.fromScale(1, 1), 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            ClipsDescendants = true, 
            [v4.Ref] = v37.containerRef, 
            [v4.Change.AbsoluteSize] = v37.onContainerSizeChange
        }, {
            CloseButtonFrame = v4.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = v13(v11.Large), 
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.new(0, 22, 0, v54), 
                ZIndex = 2
            }, {
                CloseButton = v4.createElement(v10, {
                    size = UDim2.fromScale(1, 1), 
                    icon = not not v49 and v9["icons/navigation/pushBack"] or v9["icons/navigation/close"], 
                    iconColor3 = if not v6.useNewThemeColorPalettes then v50.Theme.UIEmphasis.Color else nil, 
                    iconSize = v11.Medium, 
                    onActivated = v37.props.onClose, 
                    showBackground = v37.state.showStickyActionTopBar == false, 
                    backgroundColor = if not v6.useNewThemeColorPalettes then v50.Theme.BackgroundUIDefault else nil
                })
            }), 
            BackgroundDetailsFrame = v4.createElement("Frame", {
                BackgroundColor3 = l_Theme_0.BackgroundMuted.Color, 
                BackgroundTransparency = l_Theme_0.BackgroundMuted.Transparency, 
                Size = UDim2.fromScale(1, 1), 
                AnchorPoint = Vector2.new(0.5, 0), 
                Position = UDim2.fromScale(0.5, 0), 
                [v4.Change.AbsoluteSize] = v37.onBackgroundComponentFrameSizeChange
            }, {
                GradientPlaceholder = not not v52 and v4.createElement("UIGradient", v53) or nil, 
                UIAspectRatioConstraint = v4.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1.7777777777777777
                }), 
                BackgroundImage = v52 == false and v4.createElement(v8, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 0, l_props_0), 
                    Size = UDim2.new(0, l_containerSize_0.x, 1, 0), 
                    Image = v37.props.bannerImageUrl, 
                    ScaleType = Enum.ScaleType.Crop
                }) or nil
            }), 
            StickyActionBarFrame = (v37.state.showStickyActionTopBar or v49) and v4.createElement("TextButton", {
                Text = "", 
                AutoButtonColor = false, 
                Size = UDim2.new(1, 0, 0, v41), 
                BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                BackgroundTransparency = l_Theme_0.BackgroundUIDefault.Transparency, 
                BorderSizePixel = 0
            }, {
                StickyActionBar = v4.createElement(v16, {
                    actionBarProps = v37.props.actionBarProps, 
                    infoProps = {
                        icon = v37.props.thumbnailImageUrl, 
                        title = v37.props.titleText
                    }
                })
            }) or nil, 
            ContentScrollingFrame = v4.createElement(v14, {
                size = UDim2.fromScale(1, 1), 
                canvasSizeY = UDim.new(1, 0), 
                useAutomaticCanvasSize = true, 
                scrollingEnabled = not v49, 
                [v4.Change.CanvasPosition] = v37.canvasPositionChange, 
                scrollingFrameRef = v37.scrollingFrameRef
            }, {
                Layout = v4.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical
                }), 
                Padding = v4.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v45), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                }), 
                MainView = v4.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 0), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2, 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, {
                    Layout = v4.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical
                    }), 
                    HeaderContainer = v4.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, v41), 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1
                    }, {
                        DetailsPageHeader = v4.createElement(v19, {
                            thumbnailImageUrl = v37.props.thumbnailImageUrl, 
                            thumbnailAspectRatio = v37.props.thumbnailAspectRatio, 
                            thumbnailHeight = v40, 
                            titleText = v37.props.titleText, 
                            subTitleText = v37.props.subTitleText, 
                            renderInfoContent = v37.props.renderInfoContent, 
                            actionBarProps = if not v6.hideHeaderActionBarWhenStickyBarActive then v37.props.actionBarProps else if v37.state.showStickyActionTopBar or v49 then nil else v37.props.actionBarProps, 
                            headerBarBackgroundHeight = v41, 
                            sideMargin = v42, 
                            deviceType = v37.props.deviceType
                        })
                    }), 
                    BodyContainer = v4.createElement("Frame", {
                        Size = UDim2.fromScale(1, 0), 
                        LayoutOrder = 2, 
                        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                        BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
                        BorderSizePixel = 0, 
                        AutomaticSize = Enum.AutomaticSize.Y
                    }, {
                        BodyContainerSafeArea = v4.createElement("Frame", {
                            Size = UDim2.fromOffset(math.min(l_containerSize_0.x, l_containerSize_0.y * 1.7777777777777777), 0), 
                            AnchorPoint = Vector2.new(0.5, 0), 
                            Position = UDim2.fromScale(0.5, 0), 
                            BackgroundTransparency = 1, 
                            AutomaticSize = Enum.AutomaticSize.Y
                        }, {
                            DetailsPageBody = v4.createElement(v20, {
                                titleText = v37.props.titleText, 
                                subTitleText = v37.props.subTitleText, 
                                renderInfoContent = v37.props.renderInfoContent, 
                                bodyClipsDescendants = v37.props.bodyClipsDescendants, 
                                componentList = v37.props.componentList, 
                                dualPanelBreakpoint = v43, 
                                sideMargin = v42, 
                                deviceType = v37.props.deviceType
                            })
                        })
                    })
                }), 
                MobileActionViewPadding = v55 and v4.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 72), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 3
                })
            }), 
            FullscreenFrame = not not v49 and v4.createElement("TextButton", {
                Size = UDim2.new(1, 0, 1, -v41), 
                Position = UDim2.fromOffset(0, v41), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                AutoButtonColor = false, 
                ClipsDescendants = true, 
                ZIndex = 2
            }, {
                FullscreenContent = l_renderFullscreenContent_0()
            }) or nil, 
            MobileActionBarFrame = v55 and v4.createElement("TextButton", {
                Text = "", 
                AutoButtonColor = false, 
                AnchorPoint = Vector2.new(0, 1), 
                Position = UDim2.fromScale(0, 1), 
                Size = UDim2.new(1, 0, 0, 72), 
                BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
                BorderSizePixel = 0, 
                ZIndex = 3
            }, {
                GradientBar = v4.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 24), 
                    BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                    AnchorPoint = Vector2.new(0, 1), 
                    BorderSizePixel = 0, 
                    LayoutOrder = 1
                }, {
                    Gradient = v4.createElement("UIGradient", {
                        Rotation = 270, 
                        Transparency = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, 0.25), 
                            NumberSequenceKeypoint.new(1, 0.9999)
                        })
                    })
                }), 
                ActionBar = v4.createElement(v15, {
                    button = v37.props.actionBarProps.button, 
                    icons = v37.props.actionBarProps.icons
                })
            })
        });
    end);
end;
v22.didMount = function(v56)
    if v56.containerRef.current then
        v56.onContainerSizeChange(v56.containerRef.current);
    end;
end;
v22.didUpdate = function(v57)
    local v58 = v18(v57.props.deviceType);
    if not (not (v57.scrolled == false) or not v57.scrollingFrameRef.current) then
        local v59 = if not v57.props.startingOffsetPosition then v58.startingOffsetPosition else v57.props.startingOffsetPosition;
        local v60 = 0;
        local l_props_1 = v57.props;
        v57.scrollingFrameRef.current.CanvasPosition = Vector2.new(0, (math.max(v60, (v57.state.backgroundHeight - if not l_props_1.headerBarBackgroundHeight then v18(l_props_1.deviceType).headerBarBackgroundHeight else l_props_1.headerBarBackgroundHeight) - v59)));
    end;
end;
return v22;
