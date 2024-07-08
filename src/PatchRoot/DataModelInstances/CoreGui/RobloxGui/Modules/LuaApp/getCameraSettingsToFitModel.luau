local v0 = require(game:GetService("CorePackages").Packages.t);
local v1 = v0.strictInterface({
    model = v0.instanceIsA("Model"), 
    cameraFieldOfView = v0.optional(v0.numberConstrained(1, 120)), 
    upVector = v0.optional(v0.Vector3), 
    lookVector = v0.optional(v0.Vector3), 
    bottomOffset = v0.optional(v0.numberMin(0)), 
    topOffset = v0.optional(v0.numberMin(0))
});
return function(v2)
    assert(v1(v2));
    local v3 = v2.model:Clone();
    local v4 = v2.cameraFieldOfView or 70;
    local v5 = v2.upVector.Unit or Vector3.fromAxis(Enum.Axis.Y);
    local v6 = v2.lookVector.Unit or Vector3.fromAxis(Enum.Axis.Z);
    local v7 = v5:Cross(v6);
    local v8 = v2.bottomOffset or 0;
    local v9 = v2.topOffset or 0;
    assert(math.abs((v5:Dot(v6))) < 1.0E-5, "upVector and lookVector must be perpendicular");
    local l_PrimaryPart_0 = v3.PrimaryPart;
    local v11 = not not l_PrimaryPart_0 and l_PrimaryPart_0.CFrame.Position or Vector3.new();
    local v12 = CFrame.fromMatrix(Vector3.new(), v7, v5);
    local v13 = Instance.new("Part", v3);
    v13.Size = Vector3.new(0, 0, 0);
    v3.PrimaryPart = v13;
    v13.CFrame = v12 * CFrame.fromMatrix(Vector3.new(), Vector3.fromAxis(Enum.Axis.X), (Vector3.new(0, math.cos((v4 * 3.141592653589793) / 360), (math.sin((v4 * 3.141592653589793) / 360))))) + v11;
    local l_v3_BoundingBox_0, v15 = v3:GetBoundingBox();
    l_v3_BoundingBox_0 = l_v3_BoundingBox_0 + v12 * Vector3.new(0, -v8, 0);
    local v16 = v13.Position - (l_v3_BoundingBox_0:VectorToWorldSpace(Vector3.fromAxis(Enum.Axis.Y)):Dot(v11 - l_v3_BoundingBox_0.Position) + v15.Y / 2) * l_v3_BoundingBox_0.UpVector;
    local l_LookVector_0 = l_v3_BoundingBox_0.LookVector;
    v13.CFrame = v12 * CFrame.fromMatrix(Vector3.new(), Vector3.fromAxis(Enum.Axis.X), (Vector3.new(0, math.cos((v4 * 3.141592653589793) / 360), -math.sin((v4 * 3.141592653589793) / 360)))) + v11;
    local l_v3_BoundingBox_1, v19 = v3:GetBoundingBox();
    l_v3_BoundingBox_1 = l_v3_BoundingBox_1 + v12 * Vector3.new(0, v9, 0);
    local v20 = v13.Position + (l_v3_BoundingBox_1:VectorToWorldSpace(Vector3.fromAxis(Enum.Axis.Y)):Dot(l_v3_BoundingBox_1.Position - v11) + v19.Y / 2) * l_v3_BoundingBox_1.UpVector;
    local l_LookVector_1 = l_v3_BoundingBox_1.LookVector;
    v3:Destroy();
    local v22 = v16 + (l_LookVector_0 * l_LookVector_1:Cross(v20 - v16).Magnitude) / l_LookVector_1:Cross(l_LookVector_0).Magnitude;
    local v23 = (v11 - v22):Dot(v6);
    return {
        distance = v23, 
        focusPoint = v22 + v23 * v6
    };
end;
