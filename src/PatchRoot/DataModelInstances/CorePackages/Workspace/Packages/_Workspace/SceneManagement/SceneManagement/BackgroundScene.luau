local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Object_0 = require(script:FindFirstAncestor("SceneManagement").Parent.LuauPolyfill).Object;
local v2 = {
    FieldOfView = 50, 
    Position = Vector3.new(0, 20, 0)
};
local v3 = {
    PositionOffset = Vector3.zero, 
    RotationOffset = Vector3.zero, 
    DistanceToCamera = 60
};
local function _()
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    if l_CurrentCamera_0 == nil then
        l_CurrentCamera_0 = Instance.new("Camera");
        l_CurrentCamera_0.Parent = workspace;
    end;
    return l_CurrentCamera_0;
end;
local function v9(v6, v7)
    local v8 = l_Object_0.assign({}, v2, v7 or {});
    v6.FieldOfView = v8.FieldOfView;
    v6.CFrame = CFrame.new(v8.Position);
    v6.CameraType = Enum.CameraType.Fixed;
end;
local function v11(v10)
    return (workspace:FindFirstChild(v10));
end;
local function v18(v12, v13, v14)
    local v15 = l_Object_0.assign({}, v3, v14);
    local l_PositionOffset_0 = v15.PositionOffset;
    local l_RotationOffset_0 = v15.RotationOffset;
    v12:PivotTo(CFrame.new((v13.CFrame.Position + v15.DistanceToCamera * v13.CFrame.LookVector) + l_PositionOffset_0) * CFrame.Angles(math.rad(l_RotationOffset_0.X), math.rad(l_RotationOffset_0.Y), (math.rad(l_RotationOffset_0.Z))));
end;
return {
    initialize = function(v19)
        local l_CurrentCamera_1 = workspace.CurrentCamera;
        if l_CurrentCamera_1 == nil then
            l_CurrentCamera_1 = Instance.new("Camera");
            l_CurrentCamera_1.Parent = workspace;
        end;
        local l_l_CurrentCamera_1_0 = l_CurrentCamera_1;
        v9(l_l_CurrentCamera_1_0, v19.CameraConfigs);
        l_CurrentCamera_1 = v19.BackgroundConfigs;
        local l_BackgroundModelName_0 = l_CurrentCamera_1.BackgroundModelName;
        assert(l_ReplicatedStorage_0:FindFirstChild(l_BackgroundModelName_0) ~= nil, string.format("Background Model %s is missing in ReplicatedStorage.", l_BackgroundModelName_0));
        local v23 = l_ReplicatedStorage_0:WaitForChild(l_BackgroundModelName_0);
        if v23 then
            v23.Parent = workspace;
        end;
        v18(v23, l_l_CurrentCamera_1_0, l_CurrentCamera_1);
        return v23, l_l_CurrentCamera_1_0;
    end, 
    getBackgroundInstance = v11, 
    updateXPosition = function(v24, v25)
        local l_workspace_FirstChild_0 = workspace:FindFirstChild(v24);
        if l_workspace_FirstChild_0 then
            local l_l_workspace_FirstChild_0_Pivot_0 = l_workspace_FirstChild_0:GetPivot();
            local l_Position_0 = l_l_workspace_FirstChild_0_Pivot_0.Position;
            l_workspace_FirstChild_0:PivotTo(CFrame.new((Vector3.new(v25, l_Position_0.Y, l_Position_0.Z))) * (l_l_workspace_FirstChild_0_Pivot_0 - l_Position_0));
        end;
    end, 
    updateZPosition = function(v29, v30)
        local l_workspace_FirstChild_1 = workspace:FindFirstChild(v29);
        if l_workspace_FirstChild_1 then
            local l_l_workspace_FirstChild_1_Pivot_0 = l_workspace_FirstChild_1:GetPivot();
            local l_Position_1 = l_l_workspace_FirstChild_1_Pivot_0.Position;
            l_workspace_FirstChild_1:PivotTo(CFrame.new((Vector3.new(l_Position_1.X, l_Position_1.Y, v30))) * (l_l_workspace_FirstChild_1_Pivot_0 - l_Position_1));
        end;
    end
};
