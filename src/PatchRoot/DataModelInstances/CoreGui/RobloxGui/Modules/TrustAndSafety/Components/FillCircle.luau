local l_RunService_0 = game:GetService("RunService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.UIBlox);
local v4 = require(l_CorePackages_0.Packages.t);
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v3.App.ImageSet.Images;
local v7 = Color3.fromRGB(98, 98, 99);
local v8 = Color3.fromRGB(255, 255, 255);
local v9 = Color3.fromRGB(196, 0, 1);
local v10 = l_Images_0["component_assets/circle_29"];
local v11 = v2.PureComponent:extend("FillCircle");
v11.validateProps = v4.strictInterface({
    Position = v4.UDim2, 
    AnchorPoint = v4.Vector2, 
    fillFraction = v4.number, 
    largerCircleFraction = v4.number, 
    popCircleFraction = v4.number, 
    shakeCircleFraction = v4.number, 
    BackgroundColor = v4.Color3
});
local function _(v12)
    if v12 > 0.75 then
        return 8;
    elseif v12 > 0.5 then
        return 6;
    elseif v12 > 0.25 then
        return 4;
    elseif v12 > 0 then
        return 2;
    else
        return 0;
    end;
end;
local function _(v14, v15, v16)
    return (v14 - v15 / 30) / ((v16 - v15) / 30);
end;
local function _(v18, v19, v20)
    local v21 = false;
    if v19 / 30 <= v18 then
        v21 = v18 <= v20 / 30;
    end;
    return v21;
end;
local function v29(v23, v24, v25, v26)
    if v25 then
        v23 = 0.26666666666666666 - v23;
    end;
    local l_v23_0 = v23;
    local v28 = false;
    if l_v23_0 >= 0 then
        v28 = l_v23_0 <= 0.16666666666666666;
    end;
    if not v28 then
        l_v23_0 = v23;
        v28 = false;
        if l_v23_0 >= 0.16666666666666666 then
            v28 = l_v23_0 <= 0.26666666666666666;
        end;
        if not v28 then
            if v23 < 0 then
                v24.size(UDim2.new(0, 16, 0, 16));
                v26();
                return ;
            else
                v24.size(UDim2.new(0, 20, 0, 20));
                v26();
                return ;
            end;
        else
            l_v23_0 = 22 - 2 * ((v23 - 0.16666666666666666) / 0.1);
            v24.size(UDim2.new(0, l_v23_0, 0, l_v23_0));
            return ;
        end;
    else
        l_v23_0 = 16 + 6 * ((v23 - 0) / 0.16666666666666666);
        v24.size(UDim2.new(0, l_v23_0, 0, l_v23_0));
        return ;
    end;
end;
local function v37(v30, v31, _, v33)
    local v34 = false;
    if v30 >= 0 then
        v34 = v30 <= 0.1;
    end;
    if not v34 then
        v34 = false;
        if v30 >= 0.1 then
            v34 = v30 <= 0.2;
        end;
        if not v34 then
            v31.size(UDim2.new(0, 20, 0, 20));
            v33();
            return ;
        else
            local v35 = 24 - 4 * ((v30 - 0.1) / 0.1);
            v31.size(UDim2.new(0, v35, 0, v35));
            return ;
        end;
    else
        local v36 = 20 + 4 * ((v30 - 0) / 0.1);
        v31.size(UDim2.new(0, v36, 0, v36));
        return ;
    end;
end;
local function v43(v38, v39, _, v41)
    local v42 = false;
    if v38 >= 0 then
        v42 = v38 <= 0.1;
    end;
    if not v42 then
        v42 = false;
        if v38 >= 0.1 then
            v42 = v38 <= 0.2;
        end;
        if not v42 then
            v42 = false;
            if v38 >= 0.2 then
                v42 = v38 <= 0.26666666666666666;
            end;
            if not v42 then
                v42 = false;
                if v38 >= 0.26666666666666666 then
                    v42 = v38 <= 0.3333333333333333;
                end;
                if not v42 then
                    v42 = false;
                    if v38 >= 0.3333333333333333 then
                        v42 = v38 <= 0.4;
                    end;
                    if not v42 then
                        v42 = false;
                        if v38 >= 0.4 then
                            v42 = v38 <= 0.4666666666666667;
                        end;
                        if not v42 then
                            v39.positionOffset(UDim2.new(0, 0, 0, 0));
                            v41();
                            return ;
                        else
                            v39.positionOffset(UDim2.new(0, -8 + 8 * ((v38 - 0.4) / 0.06666666666666667), 0, 0));
                            return ;
                        end;
                    else
                        v39.positionOffset(UDim2.new(0, 8 - 16 * ((v38 - 0.3333333333333333) / 0.06666666666666667), 0, 0));
                        return ;
                    end;
                else
                    v39.positionOffset(UDim2.new(0, -8 + 16 * ((v38 - 0.26666666666666666) / 0.06666666666666667), 0, 0));
                    return ;
                end;
            else
                v39.positionOffset(UDim2.new(0, 8 - 16 * ((v38 - 0.2) / 0.06666666666666667), 0, 0));
                return ;
            end;
        else
            v39.positionOffset(UDim2.new(0, -4 + 12 * ((v38 - 0.1) / 0.1), 0, 0));
            return ;
        end;
    else
        v39.positionOffset(UDim2.new(0, -4 * ((v38 - 0) / 0.1), 0, 0));
        return ;
    end;
end;
v11.init = function(v44)
    local v45, v46 = v2.createBinding(UDim2.new(0, 16, 0, 16));
    v44.sizeBinding = v45;
    v44.sizeBindingUpdate = v46;
    v44.largerSizeBinding = v44.sizeBinding:map(function(v47)
        return v47 + UDim2.new(0, 2, 0, 2);
    end);
    v45, v46 = v2.createBinding(UDim2.new(0, 0, 0, 0));
    v44.positionOffsetBinding = v45;
    v44.positionOffsetBindingUpdate = v46;
    v44.updateBindings = {
        size = v44.sizeBindingUpdate, 
        positionOffset = v44.positionOffsetBindingUpdate
    };
    v44.animationStartTime = nil;
    v44.animationFunction = nil;
    v44.reverseAnimation = false;
    v44.renderSteppedConnection = nil;
end;
v11.render = function(v48)
    local l_props_0 = v48.props;
    local v50 = l_props_0.fillFraction >= 1 and v9 or v8;
    local l_createElement_0 = v2.createElement;
    local v52 = "Frame";
    local v53 = {
        Size = v48.sizeBinding, 
        Position = l_props_0.Position, 
        AnchorPoint = l_props_0.AnchorPoint, 
        BackgroundTransparency = 1
    };
    local v54 = {};
    local l_createElement_1 = v2.createElement;
    local v56 = "Frame";
    local v57 = {
        Position = v48.positionOffsetBinding, 
        Size = UDim2.new(1, 0, 1, 0), 
        BorderSizePixel = 0, 
        BackgroundColor3 = v7
    };
    local v58 = {
        OuterRing = v2.createElement(l_ImageSetLabel_0, {
            Image = "rbxasset://textures/ui/InGameMenu/CircleCutout.png", 
            Size = UDim2.new(1, 0, 1, 0), 
            ImageColor3 = l_props_0.BackgroundColor, 
            BackgroundTransparency = 1, 
            ZIndex = 10
        }), 
        InnerRing = v2.createElement(l_ImageSetLabel_0, {
            Image = v10, 
            Size = UDim2.new(1, -4, 1, -4), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            ImageColor3 = l_props_0.BackgroundColor, 
            BackgroundTransparency = 1, 
            ZIndex = 10
        })
    };
    local l_createElement_2 = v2.createElement;
    local v60 = "Frame";
    local v61 = {
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, 0, 0, 0), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        Rotation = l_props_0.fillFraction * 360
    };
    local l_fillFraction_0 = l_props_0.fillFraction;
    v61.ZIndex = l_fillFraction_0 > 0.75 and 8 or (l_fillFraction_0 > 0.5 and 6 or (l_fillFraction_0 > 0.25 and 4 or (l_fillFraction_0 > 0 and 2 or 0)));
    v58.FillRingRotationFrame = l_createElement_2(v60, v61, {
        FillRing = v2.createElement(l_ImageSetLabel_0, {
            Image = "rbxasset://textures/ui/InGameMenu/QuarterCircle.png", 
            Size = v48.largerSizeBinding, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            ImageColor3 = v50, 
            BackgroundTransparency = 1
        })
    });
    v58.EdgeBlockers = v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        ZIndex = 10
    }, {
        Top = v2.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 1), 
            Position = UDim2.new(0.5, 0, 0, 0), 
            Size = UDim2.new(1, 4, 0, 2), 
            BackgroundColor3 = l_props_0.BackgroundColor, 
            BorderSizePixel = 0
        }), 
        Right = v2.createElement("Frame", {
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(1, 0, 0.5, 0), 
            Size = UDim2.new(0, 2, 1, 4), 
            BackgroundColor3 = l_props_0.BackgroundColor, 
            BorderSizePixel = 0
        }), 
        Bottom = v2.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0), 
            Position = UDim2.new(0.5, 0, 1, 0), 
            Size = UDim2.new(1, 4, 0, 2), 
            BackgroundColor3 = l_props_0.BackgroundColor, 
            BorderSizePixel = 0
        }), 
        Left = v2.createElement("Frame", {
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.new(0, 0, 0.5, 0), 
            Size = UDim2.new(0, 2, 1, 4), 
            BackgroundColor3 = l_props_0.BackgroundColor, 
            BorderSizePixel = 0
        })
    });
    v58.TopLeftFill = v2.createElement("Frame", {
        Size = UDim2.new(0.5, 0, 0.5, 0), 
        BackgroundColor3 = l_props_0.fillFraction >= 1 and v50 or v7, 
        BorderSizePixel = 0, 
        ZIndex = l_props_0.fillFraction >= 1 and 9 or 7
    });
    v58.BottomLeftFill = v2.createElement("Frame", {
        Size = UDim2.new(0.5, 0, 0.5, 0), 
        Position = UDim2.new(0, 0, 0.5, 0), 
        BackgroundColor3 = l_props_0.fillFraction >= 0.75 and v50 or v7, 
        BorderSizePixel = 0, 
        ZIndex = l_props_0.fillFraction >= 0.75 and 9 or 5
    });
    v58.BottomRightFill = v2.createElement("Frame", {
        Size = UDim2.new(0.5, 0, 0.5, 0), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        BackgroundColor3 = l_props_0.fillFraction >= 0.5 and v50 or v7, 
        BorderSizePixel = 0, 
        ZIndex = l_props_0.fillFraction >= 0.5 and 9 or 3
    });
    v58.TopRightFill = v2.createElement("Frame", {
        Size = UDim2.new(0.5, 0, 0.5, 0), 
        Position = UDim2.new(0.5, 0, 0, 0), 
        BackgroundColor3 = l_props_0.fillFraction >= 0.25 and v50 or v7, 
        BorderSizePixel = 0, 
        ZIndex = l_props_0.fillFraction >= 0.25 and 9 or 1
    });
    v54.PositionOffsetFrame = l_createElement_1(v56, v57, v58);
    return l_createElement_0(v52, v53, v54);
end;
v11.didUpdate = function(v63, v64, _)
    local v66 = v64.largerCircleFraction <= v64.fillFraction;
    local v67 = v63.props.largerCircleFraction <= v63.props.fillFraction;
    if v66 ~= v67 then
        v63:playAnimation(v29, not v67);
    end;
    local v68 = v64.popCircleFraction <= v64.fillFraction;
    if not (not (v63.props.popCircleFraction <= v63.props.fillFraction) or v68) then
        v63:playAnimation(v37, false);
    end;
    local v69 = v64.shakeCircleFraction <= v64.fillFraction;
    if not (not (v63.props.shakeCircleFraction <= v63.props.fillFraction) or v69) then
        v63:playAnimation(v43, false);
    end;
end;
v11.playAnimation = function(v70, v71, v72)
    if v70.animationFunction then
        v70.animationFunction(100, v70.updateBindings, v70.reverseAnimation, function()
        end);
    end;
    v70.animationStartTime = tick();
    v70.animationFunction = v71;
    v70.reverseAnimation = v72;
    if not v70.renderSteppedConnection then
        v70.renderSteppedConnection = l_RunService_0.RenderStepped:Connect(function()
            v70.animationFunction(tick() - v70.animationStartTime, v70.updateBindings, v70.reverseAnimation, function()
                v70:stopAnimation();
            end);
        end);
    end;
end;
v11.stopAnimation = function(v73)
    if v73.renderSteppedConnection then
        v73.renderSteppedConnection:Disconnect();
        v73.renderSteppedConnection = nil;
    end;
end;
v11.willUnmount = function(v74)
    v74:stopAnimation();
end;
return v11;
