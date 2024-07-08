local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = v3.strictInterface({
    regularProps = v3.optional(v3.table), 
    modelRef = v3.optional(v3.strictInterface({
        value = v3.instanceIsA("Model")
    })), 
    cameraFocusPoint = v3.optional(v3.Vector3), 
    cameraLookVector = v3.optional(v3.Vector3), 
    cameraDistance = v3.optional(v3.number), 
    cameraUpVector = v3.optional(v3.Vector3)
});
local v5 = v1.PureComponent:extend("ViewportFrame");
v5.defaultProps = {
    cameraDistance = 6, 
    cameraUpVector = Vector3.FromAxis(Enum.Axis.Y)
};
v5.init = function(v6)
    v6.viewportRef = v1.createRef();
    v6.model = nil;
    v6.camera = nil;
end;
v5.updateModel = function(v7)
    if v7.model ~= nil then
        v7.model.Parent = nil;
        v7.model = nil;
    end;
    local l_modelRef_0 = v7.props.modelRef;
    if not (v7.viewportRef.current ~= nil) or l_modelRef_0 == nil then
        return ;
    else
        v7.model = l_modelRef_0.value;
        v7.model.Parent = v7.viewportRef.current;
        return ;
    end;
end;
v5.updateCamera = function(v9)
    if not (v9.viewportRef.current ~= nil) or v9.model == nil then
        return ;
    else
        if v9.camera == nil then
            v9.camera = Instance.new("Camera");
            v9.camera.Name = "Camera";
            v9.camera.CameraType = Enum.CameraType.Scriptable;
            v9.camera.Parent = v9.viewportRef.current;
            v9.viewportRef.current.CurrentCamera = v9.camera;
        end;
        local v10 = (v9.props.cameraFocusPoint or v9.model.PrimaryPart ~= nil and v9.model.PrimaryPart.Position) or Vector3.new(0, 0, 0);
        local v11 = ((v9.props.cameraLookVector or v9.model.PrimaryPart ~= nil and -v9.model.PrimaryPart.CFrame.lookVector) or Vector3.new(0, 0, 1)) * v9.props.cameraDistance;
        v9.camera.CFrame = CFrame.fromMatrix(v10 - v11, v11:Cross(v9.props.cameraUpVector).Unit, v11:Cross(v9.props.cameraUpVector):Cross(v11).Unit);
        return ;
    end;
end;
v5.updateViewport = function(v12)
    v12:updateModel();
    v12:updateCamera();
end;
v5.didMount = function(v13)
    v13:updateViewport();
end;
v5.willUnmount = function(v14)
    if v14.model ~= nil then
        v14.model.Parent = nil;
        v14.model = nil;
    end;
    if v14.camera ~= nil then
        v14.camera.Parent = nil;
        v14.camera = nil;
    end;
end;
v5.didUpdate = function(v15, v16)
    if v16.modelRef ~= v15.props.modelRef then
        v15:updateViewport();
        return ;
    else
        if not (v16.cameraFocusPoint == v15.props.cameraFocusPoint and v16.cameraLookVector == v15.props.cameraLookVector) or v16.cameraDistance ~= v15.props.cameraDistance then
            v15:updateCamera();
        end;
        return ;
    end;
end;
v5.render = function(v17)
    assert(v4(v17.props));
    return v1.createElement("ViewportFrame", (v2.Dictionary.join(v17.props.regularProps or {}, {
        [v1.Ref] = v17.viewportRef
    })));
end;
return v5;
