local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v5 = require(l_Parent_2.Cryo);
local v6 = require(l_Parent_2.Otter);
local v7 = require(l_Parent_2.Roact);
local v8 = require(l_Parent_2.t);
local l_Focusable_0 = require(l_Parent_2.RoactGamepad).Focusable;
local v10 = require(l_Parent_2.UIBlox.Core.Style.withStyle);
local v11 = require(l_Parent_0.SelectionImage.CursorKind);
local v12 = require(l_Parent_0.SelectionImage.withSelectionCursorProvider);
local v13 = require(l_Parent_0.SelectionCursor.withCursor);
local v14 = require(l_Parent_0.SelectionCursor.CursorType);
local v15 = require(l_Parent_1.UIBloxConfig);
local v16 = require(l_Parent_1.App.Container.getPageMargin);
local v17 = UDim.new(0, 0);
local v18 = {
    frequency = 3, 
    dampingRatio = 1.5
};
local v19 = v7.Component:extend("VerticalScrollView");
v19.validateProps = v8.strictInterface({
    size = v8.optional(v8.UDim2), 
    position = v8.optional(v8.UDim2), 
    elasticBehavior = v8.optional(v8.EnumItem), 
    canvasSizeY = v8.optional(v8.UDim), 
    useAutomaticCanvasSize = v8.optional(v8.boolean), 
    paddingHorizontal = v8.optional(v8.number), 
    isGamepadFocusable = v8.optional(v8.boolean), 
    Selectable = v8.optional(v8.boolean), 
    [v7.Change.CanvasPosition] = v8.optional(v8.callback), 
    [v7.Change.CanvasSize] = v8.optional(v8.callback), 
    scrollingFrameRef = v8.optional(v8.table), 
    onSelectionChanged = v8.optional(v8.callback), 
    CanvasPosition = v8.optional(v8.union(v8.table, v8.Vector2)), 
    ScrollingEnabled = v8.optional(v8.boolean), 
    NextSelectionLeft = v8.optional(v8.table), 
    NextSelectionRight = v8.optional(v8.table), 
    NextSelectionUp = v8.optional(v8.table), 
    NextSelectionDown = v8.optional(v8.table), 
    [v7.Children] = v8.optional(v8.table)
});
v19.defaultProps = {
    size = UDim2.new(1, 0, 1, 0), 
    canvasSizeY = UDim.new(2, 0), 
    useAutomaticCanvasSize = false, 
    isGamepadFocusable = false, 
    Selectable = true
};
v19.init = function(v20)
    v20:setState({
        scrollBarThickness = 0, 
        scrollingWithTouch = false
    });
    local v21, v22 = v7.createBinding(0);
    v20.scrollBarImageTransparency = v21;
    v20.updateScrollBarImageTransparency = v22;
    v20.scrollBarImageTransparencyMotor = v6.createSingleMotor(0);
    v20.scrollBarImageTransparencyMotor:onStep(v20.updateScrollBarImageTransparency);
    v20.lastTimeCanvasPositionChanged = tick();
    v20.waitToHideSidebarConnection = nil;
    v20.waitToHideSidebar = function()
        if tick() - v20.lastTimeCanvasPositionChanged > 0.7 then
            v20.scrollBarImageTransparencyMotor:setGoal(v6.spring(1, v18));
            v20.disconnectWaitToHideSidebar();
        end;
    end;
    v20.disconnectWaitToHideSidebar = function()
        if v20.waitToHideSidebarConnection then
            v20.waitToHideSidebarConnection:Disconnect();
            v20.waitToHideSidebarConnection = nil;
        end;
    end;
    v20.inputBegan = function(_, v24)
        if v24.UserInputType == Enum.UserInputType.MouseMovement then
            v20.disconnectWaitToHideSidebar();
            v20:setState({
                scrollBarThickness = 8
            });
            v20.scrollBarImageTransparencyMotor:setGoal(v6.instant(0));
        end;
    end;
    v20.inputEnded = function(_, v26)
        if v26.UserInputType == Enum.UserInputType.MouseMovement then
            v20.disconnectWaitToHideSidebar();
            v20.scrollBarImageTransparencyMotor:setGoal(v6.instant(1));
        end;
    end;
    v20.canvasPosition = function(v27)
        v20.lastTimeCanvasPositionChanged = tick();
        if not v20.waitToHideSidebarConnection and l_UserInputService_0:GetLastInputType() == Enum.UserInputType.Touch then
            v20.scrollBarImageTransparencyMotor:setGoal(v6.instant(0));
            v20:setState({
                scrollBarThickness = 2
            });
            v20.waitToHideSidebarConnection = l_RunService_0.Heartbeat:Connect(v20.waitToHideSidebar);
        end;
        if v20.props[v7.Change.CanvasPosition] then
            v20.props[v7.Change.CanvasPosition](v27);
        end;
    end;
    v20.onGamepadFocused = function()
        v20.scrollBarImageTransparencyMotor:setGoal(v6.instant(0));
        v20:setState({
            scrollBarThickness = 2
        });
    end;
    v20.onGamepadFocusLost = function()
        v20.scrollBarImageTransparencyMotor:setGoal(v6.instant(1));
    end;
    v20.parentFrameRef = v7.createRef();
    v21, v22 = v7.createBinding(0);
    v20.paddingBinding = v21;
    v20.updatePaddingBinding = v22;
    v20.getPadding = function(v28)
        v28 = v28 or 0;
        if not v20.props.paddingHorizontal then
            return v20.paddingBinding:map(function(v29)
                return UDim.new(0, v16(v29) - v28);
            end);
        else
            return UDim.new(0, (math.max(0, v20.props.paddingHorizontal - v28)));
        end;
    end;
end;
v19.renderWithProviders = function(v30, v31, v32, v33)
    local l_Theme_0 = v31.Theme;
    local l_canvasSizeY_0 = v30.props.canvasSizeY;
    local v36 = v30.props[v7.Children] or {};
    local l_position_0 = v30.props.position;
    local l_size_0 = v30.props.size;
    local l_isGamepadFocusable_0 = v30.props.isGamepadFocusable;
    return v7.createElement("Frame", {
        BackgroundTransparency = 1, 
        Position = l_position_0, 
        Size = l_size_0, 
        [v7.Change.AbsoluteSize] = function(v40)
            v30.updatePaddingBinding(v40.AbsoluteSize.X);
        end, 
        [v7.Ref] = v30.parentFrameRef
    }, {
        scrollingFrameOuterMargins = v7.createElement("UIPadding", {
            PaddingRight = UDim.new(0, 4)
        }), 
        scrollingFrame = v7.createElement(not not l_isGamepadFocusable_0 and l_Focusable_0.ScrollingFrame or "ScrollingFrame", {
            Active = true, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.fromScale(1, 1), 
            ElasticBehavior = v30.props.elasticBehavior, 
            CanvasSize = UDim2.new(v17, l_canvasSizeY_0), 
            AutomaticCanvasSize = not not v30.props.useAutomaticCanvasSize and Enum.AutomaticSize.Y or nil, 
            ScrollBarImageColor3 = l_Theme_0.UIEmphasis.Color, 
            ScrollBarImageTransparency = v30.scrollBarImageTransparency, 
            ScrollBarThickness = v30.state.scrollBarThickness, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            ScrollingEnabled = v30.props.ScrollingEnabled, 
            CanvasPosition = v30.props.CanvasPosition, 
            SelectionImageObject = if not v15.migrateToNewSelectionCursor then v32(v11.RoundedRect) else v33, 
            onFocusGained = not not l_isGamepadFocusable_0 and v30.onGamepadFocused or nil, 
            onFocusLost = not not l_isGamepadFocusable_0 and v30.onGamepadFocusLost or nil, 
            Selectable = v30.props.Selectable, 
            NextSelectionLeft = v30.props.NextSelectionLeft, 
            NextSelectionRight = v30.props.NextSelectionRight, 
            NextSelectionUp = v30.props.NextSelectionUp, 
            NextSelectionDown = v30.props.NextSelectionDown, 
            [v7.Event.InputBegan] = v30.inputBegan, 
            [v7.Event.InputEnded] = v30.inputEnded, 
            [v7.Change.CanvasPosition] = v30.canvasPosition, 
            [v7.Change.CanvasSize] = v30.props[v7.Change.CanvasSize], 
            [v7.Event.SelectionChanged] = v30.props.onSelectionChanged, 
            [v7.Ref] = v30.props.scrollingFrameRef
        }, (v5.Dictionary.join({
            scrollingFrameInnerMargin = v7.createElement("UIPadding", {
                PaddingLeft = v30.getPadding(), 
                PaddingRight = v30.getPadding(4)
            })
        }, v36)))
    });
end;
v19.render = function(v41)
    return v10(function(v42)
        if not v15.migrateToNewSelectionCursor then
            return (v12(function(v43)
                return v41:renderWithProviders(v42, v43);
            end));
        else
            return (v13(function(v44)
                return v41:renderWithProviders(v42, nil, (v44.getCursorByType(v14.RoundedRect)));
            end));
        end;
    end);
end;
v19.didMount = function(v45)
    local v46 = v45.parentFrameRef:getValue();
    if v46 then
        v45.updatePaddingBinding(v46.AbsoluteSize.X);
    end;
end;
v19.willUnmount = function(v47)
    v47.disconnectWaitToHideSidebar();
end;
return v7.forwardRef(function(v48, v49)
    return v7.createElement(v19, v5.Dictionary.join(v48, {
        scrollingFrameRef = v49
    }));
end);
