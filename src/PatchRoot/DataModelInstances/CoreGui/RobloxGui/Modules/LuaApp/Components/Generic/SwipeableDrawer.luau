local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(game:GetService("CorePackages").Roact);
local v2 = require(l_Modules_0.LuaApp.FitChildren);
local v3 = v1.PureComponent:extend("SwipeableDrawer");
v3.init = function(v4)
    v4.frameRef = nil;
    v4.onFrameRef = function(v5)
        if v5 then
            local l_startPosition_0 = v4.props.startPosition;
            v4.frameRef = v5;
            v4.frameRef.Position = UDim2.new(0, 0, 0, l_startPosition_0);
        end;
    end;
    v4.scrollingFrameRef = v1.createRef();
    v4.recalculateDrawerPosition = function()
        if not (not v4.frameRef or not v4.scrollingFrameRef.current) then
            local l_startPosition_1 = v4.props.startPosition;
            local v8 = math.max(0, v4.props.containerHeight - v4.scrollingFrameRef.current.CanvasSize.Y.Offset);
            local l_Offset_0 = v4.frameRef.Position.Y.Offset;
            local l_Y_0 = v4.scrollingFrameRef.current.CanvasPosition.Y;
            if not (not (l_Offset_0 == v8) or l_Y_0 <= 0) or l_Offset_0 == l_startPosition_1 and l_Y_0 < 0 then
                return ;
            else
                v4.frameRef.Position = UDim2.new(0, 0, 0, (math.min(math.max(l_Offset_0 - l_Y_0, v8), l_startPosition_1)));
                v4.scrollingFrameRef.current.CanvasPosition = Vector2.new(0, 0);
            end;
        end;
    end;
end;
v3.render = function(v11)
    return v1.createElement("Frame", {
        Size = v11.props.Size, 
        AnchorPoint = v11.props.AnchorPoint, 
        BackgroundTransparency = 1, 
        ClipsDescendants = false, 
        [v1.Ref] = v11.onFrameRef
    }, {
        ScrollingFrame = v1.createElement(v2.FitScrollingFrame, {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ScrollBarThickness = 0, 
            ClipsDescendants = false, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            ElasticBehavior = Enum.ElasticBehavior.Always, 
            fitFields = {
                CanvasSize = v2.FitAxis.Height
            }, 
            [v1.Ref] = v11.scrollingFrameRef, 
            [v1.Change.CanvasSize] = v11.recalculateDrawerPosition, 
            [v1.Change.CanvasPosition] = v11.recalculateDrawerPosition
        }, v11.props[v1.Children])
    });
end;
v3.didUpdate = function(v12, v13)
    if not (v13.startPosition == v12.props.startPosition) or v13.containerHeight ~= v12.props.containerHeight then
        v12.recalculateDrawerPosition();
    end;
end;
return v3;
