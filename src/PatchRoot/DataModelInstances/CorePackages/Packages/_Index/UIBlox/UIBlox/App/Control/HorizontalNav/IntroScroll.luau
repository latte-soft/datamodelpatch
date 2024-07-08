local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.t);
local v3 = require(l_Parent_0.Otter);
local v4 = {
    dampingRatio = 1, 
    frequency = 3.5
};
local v5 = v1.PureComponent:extend("IntroScroll");
v5.validateProps = v2.strictInterface({
    childWidgetIndex = v2.number, 
    scrollingFrameRef = v2.table, 
    updateCanvasPosition = v2.callback
});
v5.init = function(v6)
    v6.motor = v3.createSingleMotor(0);
    v6.motor:onStep(function(v7)
        v6.props.updateCanvasPosition(Vector2.new(v7, 0));
    end);
end;
v5.didUpdate = function(v8, v9, _)
    if v8.props.childWidgetIndex and v8.props.childWidgetIndex ~= v9.childWidgetIndex then
        local l_current_0 = v8.props.scrollingFrameRef.current;
        v8.motor:setGoal(v3.instant((math.clamp(l_current_0.AbsoluteCanvasSize.X - l_current_0.AbsoluteSize.X, 0, l_current_0.AbsoluteSize.X * 0.25))));
        v8.motor:step(0);
        v8.motor:setGoal(v8:getGoal());
    end;
end;
v5.getGoal = function(_, _)
    return v3.spring(0, v4);
end;
v5.render = function(_)
    return nil;
end;
v5.willUnmount = function(v15)
    if v15.motor then
        v15.motor:destroy();
        v15.motor = nil;
    end;
end;
return v5;
