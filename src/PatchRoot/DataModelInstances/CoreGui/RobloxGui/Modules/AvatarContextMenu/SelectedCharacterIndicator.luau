local v0 = {};
v0.__index = v0;
local l_RunService_0 = game:GetService("RunService");
local l_Workspace_0 = game:GetService("Workspace");
local l_TweenService_0 = game:GetService("TweenService");
local _ = game:GetService("InsertService");
local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
local function v9(v6)
    for _, v8 in ipairs(v6:GetDescendants()) do
        if v8:IsA("LuaSourceContainer") then
            v8:Destroy();
        end;
    end;
end;
local function v20(v10, v11)
    local l_Model_0 = Instance.new("Model");
    l_Model_0.Name = "ContextMenuArrow";
    l_Model_0.Parent = l_CurrentCamera_0;
    local l_Humanoid_0 = v10:FindFirstChildOfClass("Humanoid");
    if l_Humanoid_0 == nil then
        l_Humanoid_0 = v10:WaitForChild("Humanoid", 15);
        if l_Humanoid_0 == nil then
            return ;
        end;
    end;
    local l_HumanoidRootPart_0 = v10:WaitForChild("HumanoidRootPart");
    local v15 = v11.SelectedCharacterIndicator:Clone();
    v9(v15);
    v15.Anchored = true;
    v15.Transparency = 0;
    v15.CanCollide = false;
    v15.Parent = l_Model_0;
    local v16 = l_TweenService_0:Create(v15, TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1, false), {
        Orientation = Vector3.new(0, 360, 180)
    });
    v16:Play();
    local function v17()
        v15.Position = l_HumanoidRootPart_0.Position + Vector3.new(0, 5, 0);
    end;
    local v18 = false;
    local function v19()
        if not v18 then
            v18 = true;
            l_Model_0:Destroy();
            v16:Destroy();
            l_RunService_0:UnbindFromRenderStep("ContextActionMenuRenderArrow");
            return ;
        else
            return ;
        end;
    end;
    l_Humanoid_0.Died:Connect(v19);
    v10.AncestryChanged:Connect(v19);
    l_RunService_0:BindToRenderStep("ContextActionMenuRenderArrow", Enum.RenderPriority.Camera.Value + 1, v17);
    l_Model_0.Parent = l_CurrentCamera_0;
    return v19;
end;
v0.ChangeSelectedPlayer = function(v21, v22, v23)
    coroutine.wrap(function()
        if v21.SelectedPlayer then
            v21.SelectedPlayer = nil;
            v21.CharacterAddedConn:Disconnect();
            v21.CharacterAddedConn = nil;
            if v21.KillOldRenderFunction then
                v21.KillOldRenderFunction();
                v21.KillOldRenderFunction = nil;
            end;
        end;
        if v22 then
            v21.SelectedPlayer = v22;
            v21.CharacterAddedConn = v22.CharacterAdded:Connect(function(v24)
                if v21.KillOldRenderFunction then
                    v21.KillOldRenderFunction();
                end;
                v21.KillOldRenderFunction = v20(v24, v23);
            end);
            if v22.Character then
                v21.KillOldRenderFunction = v20(v22.Character, v23);
            end;
        end;
    end)();
end;
v0.new = function()
    local v25 = setmetatable({}, v0);
    v25.KillOldRenderFunction = nil;
    v25.SelectedPlayer = nil;
    v25.CharacterAddedConn = nil;
    return v25;
end;
return v0.new();
