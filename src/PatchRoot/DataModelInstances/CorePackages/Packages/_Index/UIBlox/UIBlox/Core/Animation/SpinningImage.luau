local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Parent.Roact);
local v3 = require(l_Parent_0.Parent.t);
local l_Label_0 = require(l_Parent_0.Core.ImageSet.ImageSetComponent).Label;
local v5 = v2.PureComponent:extend("SpinningImage");
v5.validateProps = v3.strictInterface({
    image = v3.table, 
    size = v3.optional(v3.UDim2), 
    anchorPoint = v3.optional(v3.Vector2), 
    position = v3.optional(v3.union(v3.UDim2, v3.table)), 
    rotationRate = v3.optional(v3.number)
});
v5.defaultProps = {
    rotationRate = 360
};
v5.init = function(v6)
    v6.state = {
        angle = 0
    };
end;
v5.didMount = function(v7)
    v7.heartbeatConnection = l_RunService_0.Heartbeat:Connect(function(v8)
        local v9 = v7.state.angle + v7.props.rotationRate * v8;
        if v9 > 360 then
            v9 = v9 - 360;
        elseif v9 < 0 then
            v9 = v9 + 360;
        end;
        v7:setState({
            angle = v9
        });
    end);
end;
v5.willUnmount = function(v10)
    v10.heartbeatConnection:Disconnect();
end;
v5.getDerivedStateFromProps = function(v11, _)
    local l_ImageRectSize_0 = v11.image.ImageRectSize;
    return {
        size = v11.size or UDim2.fromOffset(l_ImageRectSize_0.X, l_ImageRectSize_0.Y)
    };
end;
v5.render = function(v14)
    return v2.createElement("Frame", {
        Size = v14.state.size, 
        AnchorPoint = v14.props.anchorPoint, 
        Position = v14.props.position, 
        BackgroundTransparency = 1
    }, {
        inner = v2.createElement(l_Label_0, {
            Size = v14.state.size, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Image = v14.props.image, 
            Rotation = v14.state.angle, 
            BackgroundTransparency = 1
        })
    });
end;
return v5;
