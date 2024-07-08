local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local l_Workspace_0 = game:GetService("Workspace");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Constants;
local v6 = require(l_Modules_0.Common.RoactUtilities.ExternalEventConnection);
local v7 = require(l_Modules_0.Common.Roact);
local l_GRAY3_0 = l_Constants_0.Color.GRAY3;
local l_BLUE_PRIMARY_0 = l_Constants_0.Color.BLUE_PRIMARY;
local v10 = v7.PureComponent:extend("LoadingIndicator");
v10.defaultProps = {
    AnimationSpeedMultiplier = 1.75, 
    DotColor = l_GRAY3_0, 
    DotHighlightColor = l_BLUE_PRIMARY_0, 
    DotScale = 0.7, 
    Size = UDim2.new(0, 70, 0, 16)
};
v10.init = function(v11)
    v11.state = {
        timer = true
    };
    v11.renderSteppedCallback = function(_)
        v11:setState({
            timer = not v11.state.timer
        });
    end;
end;
v10.render = function(v13)
    local l_AnimationSpeedMultiplier_0 = v13.props.AnimationSpeedMultiplier;
    local l_DotColor_0 = v13.props.DotColor;
    local l_DotHighlightColor_0 = v13.props.DotHighlightColor;
    local l_DotScale_0 = v13.props.DotScale;
    local l_Size_0 = v13.props.Size;
    local v19 = (l_Workspace_0.DistributedGameTime * l_AnimationSpeedMultiplier_0) % 3;
    local v20 = {
        RatioConstraint = v7.createElement("UIAspectRatioConstraint", {
            AspectRatio = 4.375, 
            AspectType = Enum.AspectType.FitWithinMaxSize
        })
    };
    for v21 = 1, 3 do
        local l_l_DotColor_0_0 = l_DotColor_0;
        local l_l_DotScale_0_0 = l_DotScale_0;
        local v24 = (v21 - 1) / 2;
        if v21 - 1 <= v19 and v19 <= v21 then
            local v25 = math.sin(3.141592653589793 * (v19 % 1));
            l_l_DotScale_0_0 = l_l_DotScale_0_0 + (1 - l_l_DotScale_0_0) * v25;
            l_l_DotColor_0_0 = l_DotColor_0:lerp(l_DotHighlightColor_0, v25);
        end;
        v20[v21] = v7.createElement("Frame", {
            AnchorPoint = Vector2.new(v24, 0.5), 
            BackgroundColor3 = l_l_DotColor_0_0, 
            BorderSizePixel = 0, 
            Size = UDim2.new(l_DotScale_0, 0, l_l_DotScale_0_0, 0), 
            SizeConstraint = Enum.SizeConstraint.RelativeYY, 
            Position = UDim2.new(v24, 0, 0.5, 0)
        });
    end;
    v20.RenderStepped = v7.createElement(v6, {
        callback = v13.renderSteppedCallback, 
        event = l_RunService_0.renderStepped
    });
    return v7.createElement("Frame", {
        AnchorPoint = v13.props.AnchorPoint, 
        BackgroundTransparency = 1, 
        Position = v13.props.Position, 
        Size = l_Size_0
    }, v20);
end;
return v10;
