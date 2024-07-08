local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.Packages.t);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local l_RunService_0 = game:GetService("RunService");
local v5 = Vector3.new(0, 1, 0);
local v6 = v1.PureComponent:extend("ObjectViewport");
v6.validateProps = v2.strictInterface({
    model = v2.instanceOf("Model")
});
local function _(v7, v8)
    local l_X_0 = v8.X;
    local l_Y_0 = v8.Y;
    local l_Z_0 = v8.Z;
    return (math.max(l_X_0, l_Y_0, l_Z_0) / 2) * (1 / math.tan(math.rad(v7) / 2)) + l_Z_0 / 2;
end;
local function _(v13, v14, v15)
    return CFrame.fromAxisAngle(v15, v14):VectorToWorldSpace(v13);
end;
v6.init = function(v17)
    v17.cameraRef = v1.createRef();
    v17.worldModelRef = v1.createRef();
    local v18, v19 = v1.createBinding(CFrame.new());
    v17.cameraCFrameBinding = v18;
    v17.updateCameraCFrameBinding = v19;
    v18, v19 = v1.createBinding(0);
    v17.cameraRotationBinding = v18;
    v17.updateCameraRotationBinding = v19;
    v18, v19 = v1.createBinding(CFrame.new());
    v17.cameraFocusBinding = v18;
    v17.updateCameraFocusBinding = v19;
    v17:OnModelChanged();
end;
v6.OnModelChanged = function(v20)
    if v20.props.model ~= nil then
        v20.modelCFrame = v20.props.model:GetModelCFrame();
        v20.initialLookVector = v20.modelCFrame.lookVector;
        v20.modelExtentsSize = v20.props.model:GetExtentsSize();
        local l_modelExtentsSize_0 = v20.modelExtentsSize;
        local l_X_1 = l_modelExtentsSize_0.X;
        local l_Y_1 = l_modelExtentsSize_0.Y;
        local l_Z_1 = l_modelExtentsSize_0.Z;
        v20.cameraDistance = (math.max(l_X_1, l_Y_1, l_Z_1) / 2) * 1.4281480067421146 + l_Z_1 / 2;
    end;
end;
v6.render = function(v25)
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Position = UDim2.fromScale(0, 0), 
        AnchorPoint = Vector2.new(0, 0), 
        Size = UDim2.fromScale(1, 1)
    }, {
        AspectRatioConstraint = v1.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1, 
            AspectType = Enum.AspectType.FitWithinMaxSize, 
            DominantAxis = Enum.DominantAxis.Width
        }), 
        ViewportFrame = v1.createElement("ViewportFrame", {
            BackgroundTransparency = 0, 
            BackgroundColor3 = Color3.new(0, 0, 0), 
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            LightColor = Color3.fromRGB(240, 240, 240), 
            LightDirection = Vector3.new(1, 1, 1), 
            Ambient = Color3.fromRGB(240, 240, 240), 
            CurrentCamera = v25.cameraRef
        }, {
            Camera = v1.createElement("Camera", {
                CameraType = Enum.CameraType.Scriptable, 
                FieldOfView = 70, 
                CFrame = v25.cameraCFrameBinding, 
                Focus = v25.cameraFocusBinding, 
                [v1.Ref] = v25.cameraRef
            }), 
            WorldModel = v1.createElement("WorldModel", {
                [v1.Ref] = v25.worldModelRef
            }), 
            RenderSteppedConnection = v1.createElement(l_ExternalEventConnection_0, {
                event = l_RunService_0.RenderStepped, 
                callback = function()
                    v25.updateCameraRotationBinding(v25.cameraRotationBinding:getValue() + 0.01);
                    v25.updateCameraCFrameBinding((CFrame.new(v25.modelCFrame.p + CFrame.fromAxisAngle(v5, (v25.cameraRotationBinding:getValue())):VectorToWorldSpace(v25.initialLookVector) * v25.cameraDistance, v25.modelCFrame.p)));
                end
            })
        })
    });
end;
v6.didMount = function(v26)
    if v26.worldModelRef:getValue() and v26.props.model ~= nil then
        v26.props.model.Parent = v26.worldModelRef:getValue();
    end;
end;
v6.willUnmount = function(v27)
    if v27.props.model then
        v27.props.model.Parent = nil;
    end;
end;
v6.didUpdate = function(v28, v29)
    if v28.props.model ~= v29.model then
        if v29.model ~= nil then
            v29.model.Parent = nil;
        end;
        if v28.props.model ~= nil then
            v28.props.model.Parent = v28.worldModelRef:getValue();
        end;
        v28:OnModelChanged();
    end;
end;
return v6;
