local v0 = require(script:FindFirstAncestor("Squads").dependencies);
local l_Roact_0 = v0.Roact;
local l_RunService_0 = v0.RunService;
local l_UIBlox_0 = v0.UIBlox;
local l_t_0 = v0.t;
local v5 = l_Roact_0.Component:extend("ProgressBar");
v5.validateProps = l_t_0.interface({
    targetElapsedTime = l_t_0.number
});
v5.init = function(v6)
    v6.progressBarReference = l_Roact_0.createRef();
    v6.totalElapsedTime = 0;
end;
v5.didMount = function(v7)
    v7.connection = l_RunService_0.RenderStepped:Connect(function(v8)
        v7.totalElapsedTime = math.min(v7.totalElapsedTime + v8, v7.props.targetElapsedTime);
        if v7.progressBarReference.current ~= nil then
            v7.progressBarReference.current.Size = UDim2.new(v7.totalElapsedTime / v7.props.targetElapsedTime, 0, 0, 4);
        end;
    end);
end;
v5.render = function(v9)
    return l_Roact_0.createElement("Frame", {
        BackgroundColor3 = l_UIBlox_0.App.Style.Colors.White, 
        BackgroundTransparency = 0, 
        BorderSizePixel = 0, 
        [l_Roact_0.Ref] = v9.progressBarReference
    }, {
        UICorner = l_Roact_0.createElement("UICorner", {
            CornerRadius = UDim.new(0, 2)
        })
    });
end;
v5.willUnmount = function(v10)
    v10.connection:Disconnect();
    v10.connection = nil;
end;
return v5;
