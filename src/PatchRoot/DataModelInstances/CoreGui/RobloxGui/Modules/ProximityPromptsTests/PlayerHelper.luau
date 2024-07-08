local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_GuiService_0 = game:GetService("GuiService");
local v3 = {
    initStarted = false, 
    TestModel = nil, 
    hrp = nil, 
    humanoid = nil, 
    player = nil
};
v3.Init = function()
    if not v3.initStarted then
        v3.initStarted = true;
        local v4 = v3.WaitForExpression(function()
            return l_Players_0.LocalPlayer;
        end, 10, "Players.LocalPlayer not found");
        v3.player = v4;
        if not (not (v4.Character == nil) or not l_RunService_0:IsServer()) then
            v4:LoadCharacter();
        end;
        v3.WaitForExpression(function()
            return v4.Character;
        end, 10, "LocalPlayer.Character not found");
        v3.hrp = v4.Character:WaitForChild("HumanoidRootPart");
        v3.humanoid = v4.Character:WaitForChild("Humanoid");
        if v3.TestModel == nil then
            v3.TestModel = Instance.new("Model");
            v3.TestModel.Name = "_TestContainer";
            v3.TestModel.Parent = workspace;
        end;
        v3.PlayerGui = l_Players_0.LocalPlayer:WaitForChild("PlayerGui");
        return ;
    else
        return ;
    end;
end;
v3.AddInstance = function(v5)
    local v6 = Instance.new(v5);
    v6.Parent = v3.TestModel;
    return v6;
end;
v3.CleanUpAfterTest = function()
    v3.TestModel:ClearAllChildren();
end;
v3.SetCameraFOV = function(v7)
    workspace.CurrentCamera.FieldOfView = v7;
end;
v3.IsPartOnscreen = function(v8)
    local _, v10 = workspace.CurrentCamera:WorldToViewportPoint(v8.Position);
    return v10;
end;
v3.GetPartViewportPixelPosition = function(v11)
    local v12, _ = workspace.CurrentCamera:WorldToViewportPoint(v11.Position);
    return Vector2.new(v12.x, v12.y);
end;
v3.MovePlayerToPosition = function(v14)
    if v3.hrp ~= nil then
        v3.hrp.CFrame = (CFrame.new() + v14) + Vector3.new(0, 1 + v3.humanoid.HipHeight, 0);
    end;
end;
v3.SetPlayerCamera = function(v15, v16)
    local v17 = (CFrame.new(Vector3.new(), v15) + v3.player.Character:WaitForChild("Head", 10).Position) - v16 * v15.Unit;
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    l_CurrentCamera_0.CameraType = Enum.CameraType.Scriptable;
    l_CurrentCamera_0.CFrame = v17;
end;
v3.WaitNFrames = function(v19)
    for _ = 1, v19 do
        l_RunService_0.RenderStepped:Wait();
    end;
end;
v3.WaitWallTime = function(v21)
    local v22 = tick();
    if v21 > 2 then
        warn("Requested wait time too long, waiting 2s");
        v21 = 2;
    end;
    while not (v21 < tick() - v22) do
        v3.WaitNFrames(1);
    end;
end;
v3.WaitGameTime = function(v23)
    local v24, v25 = l_RunService_0.Stepped:Wait();
    local l_v24_0 = v24;
    while l_v24_0 - v24 < v23 do
        local v27, v28 = l_RunService_0.Stepped:Wait();
        l_v24_0 = v27;
        v25 = v28;
    end;
end;
v3.WaitForExpression = function(v29, v30, v31)
    local v32 = tick();
    local v33 = v29();
    while not v33 and tick() - v32 < v30 do
        v3.WaitNFrames(1);
        v33 = v29();
    end;
    if not v33 then
        error(v31);
    end;
    return v33;
end;
v3.GetCornersOfBillboardGui = function(v34)
    local v35 = (v3.GetPartViewportPixelPosition(v34.Adornee) - l_GuiService_0:GetGuiInset()) + Vector2.new(v34.SizeOffset.x * v34.AbsoluteSize.x, v34.SizeOffset.y * v34.AbsoluteSize.y);
    local l_AbsoluteSize_0 = v34.AbsoluteSize;
    return {
        center = v35, 
        topLeft = (v35 - l_AbsoluteSize_0 / 2) + Vector2.new(1, 1), 
        topRight = v35 + Vector2.new(l_AbsoluteSize_0.x / 2 - 1, -l_AbsoluteSize_0.y / 2 + 1), 
        bottomRight = v35 + Vector2.new(l_AbsoluteSize_0.x / 2 - 1, l_AbsoluteSize_0.y / 2 - 1), 
        bottomLeft = v35 + Vector2.new(-l_AbsoluteSize_0.x / 2 + 1, l_AbsoluteSize_0.y / 2 - 1)
    };
end;
return v3;
