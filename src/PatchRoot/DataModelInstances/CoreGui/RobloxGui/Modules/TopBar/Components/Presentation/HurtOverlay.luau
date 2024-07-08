local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.Otter);
local v6 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.Common.PolicyService);
local v7 = require(script.Parent.Parent.Parent.Constants);
local v8 = {
    frequency = 0.75, 
    dampingRatio = 1
};
local v9 = Color3.fromRGB(187, 0, 4);
local v10 = Color3.new(1, 1, 1);
local v11 = v2.PureComponent:extend("HurtOverlay");
v11.validateProps = v4.strictInterface({
    healthEnabled = v4.boolean, 
    health = v4.number, 
    maxHealth = v4.number, 
    isDead = v4.boolean
});
v11.init = function(v12)
    v12.state = {
        isAnimating = false
    };
    local v13, v14 = v2.createBinding(0);
    v12.animationBinding = v13;
    v12.animationBindingUpdate = v14;
    v12.positionBinding = v12.animationBinding:map(function(v15)
        return UDim2.new(-10 * v15, 0, -10 * v15, 0);
    end);
    v12.sizeBinding = v12.animationBinding:map(function(v16)
        return UDim2.new(1 + 19 * v16, 0, 1 + 19 * v16, 0);
    end);
    v12.motor = v5.createSingleMotor(0);
    v12.motor:onStep(function(v17)
        v12.animationBindingUpdate(v17);
    end);
    v12.motor:onComplete(function()
        v12:setState({
            isAnimating = false
        });
    end);
end;
v11.render = function(v18)
    local v19 = v18.props.healthEnabled and v18.state.isAnimating;
    local l_v9_0 = v9;
    if v6:IsSubjectToChinaPolicies() then
        l_v9_0 = v10;
    end;
    return v2.createElement("ImageLabel", {
        Visible = v19, 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/TopBar/WhiteOverlayAsset.png", 
        ImageColor3 = l_v9_0, 
        Size = v18.sizeBinding, 
        Position = v18.positionBinding
    });
end;
v11.didUpdate = function(v21, v22, _)
    if not (not (v21.props.health < v22.health) or v21.props.isDead and v22.isDead) and v7.HealthPercentForOverlay <= (v22.health - v21.props.health) / v21.props.maxHealth then
        v21.motor:setGoal(v5.instant(0));
        v21.motor:step(0);
        v21.motor:setGoal(v5.spring(1, v8));
        v21.motor:start();
        v21:setState({
            isAnimating = true
        });
    end;
end;
return v3.UNSTABLE_connect2(function(v24)
    return {
        health = v24.health.currentHealth, 
        maxHealth = v24.health.maxHealth, 
        isDead = v24.health.isDead, 
        healthEnabled = v24.coreGuiEnabled[Enum.CoreGuiType.Health]
    };
end, nil)(v11);
