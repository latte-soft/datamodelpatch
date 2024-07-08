local _ = script.Parent.Parent.Parent;
local v1 = require(game:GetService("CorePackages").PurchasePromptDeps);
local l_Roact_0 = v1.Roact;
local l_Otter_0 = v1.Otter;
local l_t_0 = v1.t;
local v5 = l_Roact_0.Component:extend(script.Name);
local v6 = {
    dampingRatio = 1, 
    frequency = 1.6
};
v5.validateProps = l_t_0.interface({
    shouldShow = l_t_0.boolean, 
    onShown = l_t_0.optional(l_t_0.callback), 
    onHidden = l_t_0.optional(l_t_0.callback)
});
v5.init = function(v7)
    local v8, v9 = l_Roact_0.createBinding(1);
    v7.motor = l_Otter_0.createSingleMotor(1);
    v7.motor:start();
    v7.motor:onStep(v9);
    v7.animationProgress = v8;
    v7.motor:onComplete(function()
        if not v7.props.shouldShow then
            if v7.props.onHidden then
                v7.props.onHidden();
            end;
        elseif v7.props.onShown then
            v7.props.onShown();
            return ;
        end;
    end);
    v7.motor:setGoal(l_Otter_0.spring(not v7.props.shouldShow and 1 or 0, v6));
end;
v5.didUpdate = function(v10, v11, _)
    if v11.shouldShow ~= v10.props.shouldShow then
        v10.motor:setGoal(l_Otter_0.spring(not v10.props.shouldShow and 1 or 0, v6));
    end;
end;
v5.render = function(v13)
    return l_Roact_0.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        Position = v13.animationProgress:map(function(v14)
            return UDim2.new(0, 0, -1 * v14, 0);
        end)
    }, v13.props[l_Roact_0.Children]);
end;
return v5;
