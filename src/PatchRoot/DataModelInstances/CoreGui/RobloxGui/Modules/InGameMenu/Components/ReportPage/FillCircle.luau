local l_RunService_0 = game:GetService("RunService");
local v1 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_t_0 = v1.t;
local l_UIBlox_0 = v1.UIBlox;
local v5 = require(script.Parent.Parent.Parent.Resources.Assets);
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local v7 = Color3.fromRGB(98, 98, 99);
local v8 = Color3.fromRGB(255, 255, 255);
local v9 = Color3.fromRGB(196, 0, 1);
local v10 = l_Roact_0.PureComponent:extend("FillCircle");
v10.validateProps = l_t_0.strictInterface({
    Position = l_t_0.UDim2, 
    AnchorPoint = l_t_0.Vector2, 
    fillFraction = l_t_0.number, 
    largerCircleFraction = l_t_0.number, 
    popCircleFraction = l_t_0.number, 
    shakeCircleFraction = l_t_0.number, 
    BackgroundColor = l_t_0.Color3
});
local function _(v11)
    if v11 > 0.75 then
        return 8;
    elseif v11 > 0.5 then
        return 6;
    elseif v11 > 0.25 then
        return 4;
    elseif v11 > 0 then
        return 2;
    else
        return 0;
    end;
end;
local function _(v13, v14, v15)
    return (v13 - v14 / 30) / ((v15 - v14) / 30);
end;
local function _(v17, v18, v19)
    local v20 = false;
    if v18 / 30 <= v17 then
        v20 = v17 <= v19 / 30;
    end;
    return v20;
end;
local function v28(v22, v23, v24, v25)
    if v24 then
        v22 = 0.26666666666666666 - v22;
    end;
    local l_v22_0 = v22;
    local v27 = false;
    if l_v22_0 >= 0 then
        v27 = l_v22_0 <= 0.16666666666666666;
    end;
    if not v27 then
        l_v22_0 = v22;
        v27 = false;
        if l_v22_0 >= 0.16666666666666666 then
            v27 = l_v22_0 <= 0.26666666666666666;
        end;
        if not v27 then
            if v22 < 0 then
                v23.size(UDim2.new(0, 16, 0, 16));
                v25();
                return ;
            else
                v23.size(UDim2.new(0, 20, 0, 20));
                v25();
                return ;
            end;
        else
            l_v22_0 = 22 - 2 * ((v22 - 0.16666666666666666) / 0.1);
            v23.size(UDim2.new(0, l_v22_0, 0, l_v22_0));
            return ;
        end;
    else
        l_v22_0 = 16 + 6 * ((v22 - 0) / 0.16666666666666666);
        v23.size(UDim2.new(0, l_v22_0, 0, l_v22_0));
        return ;
    end;
end;
local function v36(v29, v30, _, v32)
    local v33 = false;
    if v29 >= 0 then
        v33 = v29 <= 0.1;
    end;
    if not v33 then
        v33 = false;
        if v29 >= 0.1 then
            v33 = v29 <= 0.2;
        end;
        if not v33 then
            v30.size(UDim2.new(0, 20, 0, 20));
            v32();
            return ;
        else
            local v34 = 24 - 4 * ((v29 - 0.1) / 0.1);
            v30.size(UDim2.new(0, v34, 0, v34));
            return ;
        end;
    else
        local v35 = 20 + 4 * ((v29 - 0) / 0.1);
        v30.size(UDim2.new(0, v35, 0, v35));
        return ;
    end;
end;
local function v42(v37, v38, _, v40)
    local v41 = false;
    if v37 >= 0 then
        v41 = v37 <= 0.1;
    end;
    if not v41 then
        v41 = false;
        if v37 >= 0.1 then
            v41 = v37 <= 0.2;
        end;
        if not v41 then
            v41 = false;
            if v37 >= 0.2 then
                v41 = v37 <= 0.26666666666666666;
            end;
            if not v41 then
                v41 = false;
                if v37 >= 0.26666666666666666 then
                    v41 = v37 <= 0.3333333333333333;
                end;
                if not v41 then
                    v41 = false;
                    if v37 >= 0.3333333333333333 then
                        v41 = v37 <= 0.4;
                    end;
                    if not v41 then
                        v41 = false;
                        if v37 >= 0.4 then
                            v41 = v37 <= 0.4666666666666667;
                        end;
                        if not v41 then
                            v38.positionOffset(UDim2.new(0, 0, 0, 0));
                            v40();
                            return ;
                        else
                            v38.positionOffset(UDim2.new(0, -8 + 8 * ((v37 - 0.4) / 0.06666666666666667), 0, 0));
                            return ;
                        end;
                    else
                        v38.positionOffset(UDim2.new(0, 8 - 16 * ((v37 - 0.3333333333333333) / 0.06666666666666667), 0, 0));
                        return ;
                    end;
                else
                    v38.positionOffset(UDim2.new(0, -8 + 16 * ((v37 - 0.26666666666666666) / 0.06666666666666667), 0, 0));
                    return ;
                end;
            else
                v38.positionOffset(UDim2.new(0, 8 - 16 * ((v37 - 0.2) / 0.06666666666666667), 0, 0));
                return ;
            end;
        else
            v38.positionOffset(UDim2.new(0, -4 + 12 * ((v37 - 0.1) / 0.1), 0, 0));
            return ;
        end;
    else
        v38.positionOffset(UDim2.new(0, -4 * ((v37 - 0) / 0.1), 0, 0));
        return ;
    end;
end;
v10.init = function(v43)
    local v44, v45 = l_Roact_0.createBinding(UDim2.new(0, 16, 0, 16));
    v43.sizeBinding = v44;
    v43.sizeBindingUpdate = v45;
    v43.largerSizeBinding = v43.sizeBinding:map(function(v46)
        return v46 + UDim2.new(0, 2, 0, 2);
    end);
    v44, v45 = l_Roact_0.createBinding(UDim2.new(0, 0, 0, 0));
    v43.positionOffsetBinding = v44;
    v43.positionOffsetBindingUpdate = v45;
    v43.updateBindings = {
        size = v43.sizeBindingUpdate, 
        positionOffset = v43.positionOffsetBindingUpdate
    };
    v43.animationStartTime = nil;
    v43.animationFunction = nil;
    v43.reverseAnimation = false;
    v43.renderSteppedConnection = nil;
end;
v10.render = function(v47)
    local l_props_0 = v47.props;
    local v49 = l_props_0.fillFraction >= 1 and v9 or v8;
    local l_createElement_0 = l_Roact_0.createElement;
    local v51 = "Frame";
    local v52 = {
        Size = v47.sizeBinding, 
        Position = l_props_0.Position, 
        AnchorPoint = l_props_0.AnchorPoint, 
        BackgroundTransparency = 1
    };
    local v53 = {};
    local l_createElement_1 = l_Roact_0.createElement;
    local v55 = "Frame";
    local v56 = {
        Position = v47.positionOffsetBinding, 
        Size = UDim2.new(1, 0, 1, 0), 
        BorderSizePixel = 0, 
        BackgroundColor3 = v7
    };
    local v57 = {
        OuterRing = l_Roact_0.createElement(l_ImageSetLabel_0, {
            Image = v5.Images.CircleCutout, 
            Size = UDim2.new(1, 0, 1, 0), 
            ImageColor3 = l_props_0.BackgroundColor, 
            BackgroundTransparency = 1, 
            ZIndex = 10
        }), 
        InnerRing = l_Roact_0.createElement(l_ImageSetLabel_0, {
            Image = v5.Images.Circle, 
            Size = UDim2.new(1, -4, 1, -4), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            ImageColor3 = l_props_0.BackgroundColor, 
            BackgroundTransparency = 1, 
            ZIndex = 10
        })
    };
    local l_createElement_2 = l_Roact_0.createElement;
    local v59 = "Frame";
    local v60 = {
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, 0, 0, 0), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        Rotation = l_props_0.fillFraction * 360
    };
    local l_fillFraction_0 = l_props_0.fillFraction;
    v60.ZIndex = l_fillFraction_0 > 0.75 and 8 or (l_fillFraction_0 > 0.5 and 6 or (l_fillFraction_0 > 0.25 and 4 or (l_fillFraction_0 > 0 and 2 or 0)));
    v57.FillRingRotationFrame = l_createElement_2(v59, v60, {
        FillRing = l_Roact_0.createElement(l_ImageSetLabel_0, {
            Image = v5.Images.QuarterCircle, 
            Size = v47.largerSizeBinding, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            ImageColor3 = v49, 
            BackgroundTransparency = 1
        })
    });
    v57.EdgeBlockers = l_Roact_0.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        ZIndex = 10
    }, {
        Top = l_Roact_0.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 1), 
            Position = UDim2.new(0.5, 0, 0, 0), 
            Size = UDim2.new(1, 4, 0, 2), 
            BackgroundColor3 = l_props_0.BackgroundColor, 
            BorderSizePixel = 0
        }), 
        Right = l_Roact_0.createElement("Frame", {
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(1, 0, 0.5, 0), 
            Size = UDim2.new(0, 2, 1, 4), 
            BackgroundColor3 = l_props_0.BackgroundColor, 
            BorderSizePixel = 0
        }), 
        Bottom = l_Roact_0.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0), 
            Position = UDim2.new(0.5, 0, 1, 0), 
            Size = UDim2.new(1, 4, 0, 2), 
            BackgroundColor3 = l_props_0.BackgroundColor, 
            BorderSizePixel = 0
        }), 
        Left = l_Roact_0.createElement("Frame", {
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.new(0, 0, 0.5, 0), 
            Size = UDim2.new(0, 2, 1, 4), 
            BackgroundColor3 = l_props_0.BackgroundColor, 
            BorderSizePixel = 0
        })
    });
    v57.TopLeftFill = l_Roact_0.createElement("Frame", {
        Size = UDim2.new(0.5, 0, 0.5, 0), 
        BackgroundColor3 = l_props_0.fillFraction >= 1 and v49 or v7, 
        BorderSizePixel = 0, 
        ZIndex = l_props_0.fillFraction >= 1 and 9 or 7
    });
    v57.BottomLeftFill = l_Roact_0.createElement("Frame", {
        Size = UDim2.new(0.5, 0, 0.5, 0), 
        Position = UDim2.new(0, 0, 0.5, 0), 
        BackgroundColor3 = l_props_0.fillFraction >= 0.75 and v49 or v7, 
        BorderSizePixel = 0, 
        ZIndex = l_props_0.fillFraction >= 0.75 and 9 or 5
    });
    v57.BottomRightFill = l_Roact_0.createElement("Frame", {
        Size = UDim2.new(0.5, 0, 0.5, 0), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        BackgroundColor3 = l_props_0.fillFraction >= 0.5 and v49 or v7, 
        BorderSizePixel = 0, 
        ZIndex = l_props_0.fillFraction >= 0.5 and 9 or 3
    });
    v57.TopRightFill = l_Roact_0.createElement("Frame", {
        Size = UDim2.new(0.5, 0, 0.5, 0), 
        Position = UDim2.new(0.5, 0, 0, 0), 
        BackgroundColor3 = l_props_0.fillFraction >= 0.25 and v49 or v7, 
        BorderSizePixel = 0, 
        ZIndex = l_props_0.fillFraction >= 0.25 and 9 or 1
    });
    v53.PositionOffsetFrame = l_createElement_1(v55, v56, v57);
    return l_createElement_0(v51, v52, v53);
end;
v10.didUpdate = function(v62, v63, _)
    local v65 = v63.largerCircleFraction <= v63.fillFraction;
    local v66 = v62.props.largerCircleFraction <= v62.props.fillFraction;
    if v65 ~= v66 then
        v62:playAnimation(v28, not v66);
    end;
    local v67 = v63.popCircleFraction <= v63.fillFraction;
    if not (not (v62.props.popCircleFraction <= v62.props.fillFraction) or v67) then
        v62:playAnimation(v36, false);
    end;
    local v68 = v63.shakeCircleFraction <= v63.fillFraction;
    if not (not (v62.props.shakeCircleFraction <= v62.props.fillFraction) or v68) then
        v62:playAnimation(v42, false);
    end;
end;
v10.playAnimation = function(v69, v70, v71)
    if v69.animationFunction then
        v69.animationFunction(100, v69.updateBindings, v69.reverseAnimation, function()
        end);
    end;
    v69.animationStartTime = tick();
    v69.animationFunction = v70;
    v69.reverseAnimation = v71;
    if not v69.renderSteppedConnection then
        v69.renderSteppedConnection = l_RunService_0.RenderStepped:Connect(function()
            v69.animationFunction(tick() - v69.animationStartTime, v69.updateBindings, v69.reverseAnimation, function()
                v69:stopAnimation();
            end);
        end);
    end;
end;
v10.stopAnimation = function(v72)
    if v72.renderSteppedConnection then
        v72.renderSteppedConnection:Disconnect();
        v72.renderSteppedConnection = nil;
    end;
end;
v10.willUnmount = function(v73)
    v73:stopAnimation();
end;
return v10;
