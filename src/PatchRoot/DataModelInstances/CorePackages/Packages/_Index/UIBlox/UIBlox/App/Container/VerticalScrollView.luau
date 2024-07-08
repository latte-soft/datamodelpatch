local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = script.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v6 = require(l_Parent_3.Cryo);
local v7 = require(l_Parent_3.Otter);
local v8 = require(l_Parent_3.Roact);
local v9 = require(l_Parent_3.t);
local l_Focusable_0 = require(l_Parent_3.RoactGamepad).Focusable;
local v11 = require(l_Parent_3.UIBlox.Core.Style.withStyle);
local v12 = require(l_Parent_1.SelectionImage.CursorKind);
local v13 = require(l_Parent_1.SelectionImage.withSelectionCursorProvider);
local v14 = require(l_Parent_1.SelectionCursor.withCursor);
local v15 = require(l_Parent_1.SelectionCursor.CursorType);
local v16 = require(l_Parent_2.UIBloxConfig);
local v17 = require(l_Parent_3.UIBlox.App.ImageSet.Images);
local v18 = require(l_Parent_0.Enum.ScrollBarType);
local v19 = require(script.Parent.ScrollBar);
local v20 = {
    frequency = 3, 
    dampingRatio = 1.5
};
local v21 = v8.Component:extend("VerticalScrollView");
v21.validateProps = v9.strictInterface({
    size = v9.optional(v9.UDim2), 
    position = v9.optional(v9.UDim2), 
    layoutOrder = v9.optional(v9.number), 
    elasticBehavior = v9.optional(v9.EnumItem), 
    canvasSizeY = v9.optional(v9.UDim), 
    useAutomaticCanvasSize = v9.optional(v9.boolean), 
    isGamepadFocusable = v9.optional(v9.boolean), 
    scrollingEnabled = v9.optional(v9.boolean), 
    selectable = v9.optional(v9.boolean), 
    [v8.Change.CanvasPosition] = v9.optional(v9.callback), 
    [v8.Change.CanvasSize] = v9.optional(v9.callback), 
    scrollingFrameRef = v9.optional(v9.table), 
    NextSelectionLeft = v9.optional(v9.table), 
    NextSelectionRight = v9.optional(v9.table), 
    NextSelectionUp = v9.optional(v9.table), 
    NextSelectionDown = v9.optional(v9.table), 
    [v8.Children] = v9.optional(v9.table), 
    scrollBarType = v9.optional(v9.string)
});
v21.defaultProps = {
    size = UDim2.new(1, 0, 1, 0), 
    canvasSizeY = UDim.new(2, 0), 
    useAutomaticCanvasSize = false, 
    isGamepadFocusable = false, 
    selectable = nil, 
    scrollingEnabled = true, 
    scrollBarType = v18.Compact
};
v21.init = function(v22)
    v22.parentFrameRef = v8.createRef();
    v22.mainCanvasRef = v8.createRef();
    local v23, v24 = v8.createBinding(0);
    v22.scrollPosition = v23;
    v22.updateScroll = v24;
    v23, v24 = v8.createBinding(Vector2.new(0, 0));
    v22.mainCanvasSize = v23;
    v22.updateCanvasSize = v24;
    v22:setState({
        scrollingWithTouch = false
    });
    v23, v24 = v8.createBinding(1);
    v22.scrollBarImageTransparency = v23;
    v22.updateScrollBarImageTransparency = v24;
    v22.scrollBarImageTransparencyMotor = v7.createSingleMotor(0);
    v22.scrollBarImageTransparencyMotor:onStep(v22.updateScrollBarImageTransparency);
    v22.lastTimeCanvasPositionChanged = tick();
    v22.waitToHideSidebarConnection = nil;
    v22.waitToHideSidebar = function()
        if tick() - v22.lastTimeCanvasPositionChanged > 0.7 then
            v22.scrollBarImageTransparencyMotor:setGoal(v7.spring(1, v20));
            v22.disconnectWaitToHideSidebar();
        end;
    end;
    v22.disconnectWaitToHideSidebar = function()
        if v22.waitToHideSidebarConnection then
            v22.waitToHideSidebarConnection:Disconnect();
            v22.waitToHideSidebarConnection = nil;
        end;
    end;
    v22.inputBegan = function(_, v26)
        if v22.props.scrollingEnabled then
            if v26.UserInputType == Enum.UserInputType.MouseMovement then
                v22.disconnectWaitToHideSidebar();
                v22.scrollBarImageTransparencyMotor:setGoal(v7.instant(0));
            end;
            return ;
        else
            return ;
        end;
    end;
    v22.inputEnded = function(_, v28)
        if v22.props.scrollingEnabled then
            if v28.UserInputType == Enum.UserInputType.MouseMovement then
                v22.disconnectWaitToHideSidebar();
                v22.scrollBarImageTransparencyMotor:setGoal(v7.instant(1));
            end;
            return ;
        else
            return ;
        end;
    end;
    v22.canvasPosition = function(v29)
        v22.lastTimeCanvasPositionChanged = tick();
        if not v22.waitToHideSidebarConnection and l_UserInputService_0:GetLastInputType() == Enum.UserInputType.Touch then
            v22.scrollBarImageTransparencyMotor:setGoal(v7.instant(0));
            v22.waitToHideSidebarConnection = l_RunService_0.Heartbeat:Connect(v22.waitToHideSidebar);
        end;
        v22.updateScroll(v29.CanvasPosition.Y);
        if v22.props[v8.Change.CanvasPosition] then
            v22.props[v8.Change.CanvasPosition](v29);
        end;
    end;
    v22.onGamepadFocused = function()
        v22.scrollBarImageTransparencyMotor:setGoal(v7.instant(0));
    end;
    v22.onGamepadFocusLost = function()
        v22.scrollBarImageTransparencyMotor:setGoal(v7.instant(1));
    end;
    v22.getMainCanvasPosition = function()
        return v22.scrollPosition:map(function(v30)
            return Vector2.new(0, v30);
        end);
    end;
    v22.onMainCanvasSizeChange = function(v31)
        v22.updateCanvasSize(v31.AbsoluteCanvasSize);
    end;
    v22.getMainCanvasSize = function()
        return v22.mainCanvasSize:map(function(v32)
            return UDim2.new(0, 2, 0, v32.Y);
        end);
    end;
    v23, v24 = v8.createBinding(Vector2.new(0, 0));
    v22.viewSize = v23;
    v22.updateViewSize = v24;
    v23, v24 = v8.createBinding(Vector2.new(0, 0));
    v22.mainCanvasPosition = v23;
    v22.updateMainCanvasPosition = v24;
    v22.onScrollBarDragging = function(v33)
        v22.updateMainCanvasPosition(Vector2.new(0, v33));
    end;
    v22.onViewSizeChange = function(v34)
        v22.updateViewSize(v34.AbsoluteSize);
    end;
    v22.onSelectionChanged = function(v35, v36, _, v38)
        if not v36 and v38 == nil then
            v22.onGamepadFocusLost();
            return ;
        elseif not v36 and not v38:IsDescendantOf(v35) then
            v22.onGamepadFocusLost();
            return ;
        else
            v22.onGamepadFocused();
            return ;
        end;
    end;
end;
v21.getScrollBarStyleProps = function(_, v40, v41)
    local l_Tokens_0 = v40.Tokens;
    if v41 == v18.Wide then
        return {
            userInteractionEnabled = true, 
            width = l_Tokens_0.Global.Size_200, 
            handleWidth = l_Tokens_0.Global.Size_100, 
            paddingStartEnd = l_Tokens_0.Global.Space_50, 
            marginRight = 0
        };
    elseif v41 == v18.Gamepad then
        return {
            userInteractionEnabled = false, 
            width = l_Tokens_0.Global.Space_200, 
            handleWidth = l_Tokens_0.Global.Space_100, 
            handleIcon = v17["icons/controls/keys/xboxRSVertical"], 
            handleIconSize = l_Tokens_0.Semantic.Icon.Size.Medium, 
            handleIconColor = {
                Color = l_Tokens_0.Semantic.Color.Icon.Emphasis.Color3, 
                Transparency = l_Tokens_0.Semantic.Color.Icon.Emphasis.Transparency
            }, 
            paddingStartEnd = l_Tokens_0.Global.Space_300, 
            marginRight = l_Tokens_0.Global.Space_300
        };
    else
        return {
            userInteractionEnabled = false, 
            width = l_Tokens_0.Global.Space_150, 
            handleWidth = l_Tokens_0.Global.Size_25, 
            paddingStartEnd = l_Tokens_0.Global.Space_50, 
            marginRight = 0
        };
    end;
end;
v21.renderScrollBar = function(v43, v44)
    local l_Tokens_1 = v44.Tokens;
    local v46 = v43:getScrollBarStyleProps(v44, v43.props.scrollBarType);
    return v8.createElement(v19, {
        userInteractionEnabled = v46.userInteractionEnabled, 
        width = v46.width, 
        anchorPoint = Vector2.new(1, 0), 
        position = UDim2.new(1, -v46.marginRight, 0, 0), 
        zIndex = 2, 
        transparency = v43.scrollBarImageTransparency, 
        backgroundColor = v46.backgroundColor, 
        paddingStartEnd = v46.paddingStartEnd, 
        handleWidth = v46.handleWidth, 
        handleColor = {
            Color = l_Tokens_1.Semantic.Color.Ui.Emphasis.Color3, 
            Transparency = l_Tokens_1.Semantic.Color.Ui.Emphasis.Transparency
        }, 
        handleCornerRadius = l_Tokens_1.Semantic.Radius.Circle, 
        handleIcon = v46.handleIcon, 
        handleIconColor = v46.handleIconColor, 
        handleIconSize = v46.handleIconSize, 
        onDragging = v43.onScrollBarDragging, 
        viewSize = v43.viewSize, 
        canvasSize = v43.mainCanvasSize, 
        canvasPosition = v43.getMainCanvasPosition()
    });
end;
v21.renderWithProviders = function(v47, v48, v49, v50)
    local l_position_0 = v47.props.position;
    local l_size_0 = v47.props.size;
    local l_layoutOrder_0 = v47.props.layoutOrder;
    local l_canvasSizeY_0 = v47.props.canvasSizeY;
    local v55 = not not v47.props.useAutomaticCanvasSize and Enum.AutomaticSize.Y or nil;
    local l_isGamepadFocusable_0 = v47.props.isGamepadFocusable;
    return v8.createElement("Frame", {
        BackgroundTransparency = 1, 
        Position = l_position_0, 
        Size = l_size_0, 
        LayoutOrder = l_layoutOrder_0, 
        ClipsDescendants = true, 
        [v8.Ref] = v47.parentFrameRef
    }, {
        MainCanvas = v8.createElement(not not l_isGamepadFocusable_0 and l_Focusable_0.ScrollingFrame or "ScrollingFrame", {
            Active = false, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.fromScale(1, 1), 
            ElasticBehavior = v47.props.elasticBehavior, 
            CanvasSize = UDim2.new(UDim.new(1, 0), l_canvasSizeY_0), 
            AutomaticCanvasSize = v55, 
            CanvasPosition = v47.mainCanvasPosition, 
            ScrollingEnabled = v47.props.scrollingEnabled, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            ScrollBarImageTransparency = 1, 
            ScrollBarThickness = 0, 
            Selectable = v47.props.selectable, 
            SelectionImageObject = if not v16.migrateToNewSelectionCursor then v49(v12.RoundedRect) else v50, 
            onFocusGained = not not l_isGamepadFocusable_0 and v47.onGamepadFocused or nil, 
            onFocusLost = not not l_isGamepadFocusable_0 and v47.onGamepadFocusLost or nil, 
            NextSelectionLeft = v47.props.NextSelectionLeft, 
            NextSelectionRight = v47.props.NextSelectionRight, 
            NextSelectionUp = v47.props.NextSelectionUp, 
            NextSelectionDown = v47.props.NextSelectionDown, 
            [v8.Event.InputBegan] = v47.inputBegan, 
            [v8.Event.InputEnded] = v47.inputEnded, 
            [v8.Change.CanvasPosition] = v47.canvasPosition, 
            [v8.Change.AbsoluteCanvasSize] = v47.onMainCanvasSizeChange, 
            [v8.Change.CanvasSize] = v47.props[v8.Change.CanvasSize], 
            [v8.Ref] = v47.props.scrollingFrameRef, 
            [v8.Change.AbsoluteSize] = v47.onViewSizeChange, 
            [v8.Event.SelectionChanged] = if not l_isGamepadFocusable_0 then nil else v47.onSelectionChanged
        }, v47.props[v8.Children]), 
        ScrollBar = v47:renderScrollBar(v48)
    });
end;
v21.render = function(v57)
    return v11(function(v58)
        if not v16.migrateToNewSelectionCursor then
            return (v13(function(v59)
                return v57:renderWithProviders(v58, v59);
            end));
        else
            return (v14(function(v60)
                return v57:renderWithProviders(v58, nil, (v60.getCursorByType(v15.RoundedRect)));
            end));
        end;
    end);
end;
v21.willUnmount = function(v61)
    v61.disconnectWaitToHideSidebar();
end;
return v8.forwardRef(function(v62, v63)
    return v8.createElement(v21, v6.Dictionary.join(v62, {
        scrollingFrameRef = v63
    }));
end);
