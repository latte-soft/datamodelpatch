local l_RunService_0 = game:GetService("RunService");
local l_VRService_0 = game:GetService("VRService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Workspace_0 = game:GetService("Workspace");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v6 = require(script.Parent.Parent.Utility.GenerateDummy);
local l_CurrentCamera_0 = workspace.CurrentCamera;
local v8 = require(l_RobloxGui_0.Modules.Flags.FIntSafetyBubbleRadius);
local v9 = require(l_RobloxGui_0.Modules.Flags.FIntSafetyBubbleTransparencyPercent) * 0.01;
local v10 = true;
local v11 = math.max(v8 * l_CurrentCamera_0.HeadScale, 0.1);
local v12 = nil;
initDummy = function()
    v12 = v6(Vector3.new(0, 8.8, -50.5), (Vector3.new(0, 180, 0)));
    v12.Parent = l_Workspace_0;
end;
local function v18(_, v14)
    if v14 then
        local l_Magnitude_0 = ((l_CurrentCamera_0.CFrame * l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head)).Position - v12.HumanoidRootPart.Position).Magnitude;
        local _ = 0;
        local v17 = v11 * 0.75;
        return (math.clamp(if l_Magnitude_0 < v17 then v9 else (1 - (l_Magnitude_0 - v17) / (v11 - v17)) * v9, 0, 1));
    else
        return 0;
    end;
end;
EnableSafetyBubbleDummy = function()
    initDummy();
    l_RunService_0.Stepped:Connect(function()
        local l_v12_Children_0 = v12:GetChildren();
        if l_UserGameSettings_0.VRSafetyBubbleMode == Enum.VRSafetyBubbleMode.Anyone then
            v10 = false;
        else
            v10 = true;
        end;
        for _, v21 in ipairs(game.Players:GetPlayers()) do
            if v21.Character then
                local v22 = v18(v21, v10);
                v12.Head.Face.Transparency = v22;
                for v23 = 1, #l_v12_Children_0 do
                    if l_v12_Children_0[v23]:IsA("Part") then
                        l_v12_Children_0[v23].Transparency = v22;
                    end;
                end;
            end;
        end;
    end);
end;
return EnableSafetyBubbleDummy;
