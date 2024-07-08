local l_Players_0 = game:GetService("Players");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local _ = game:GetService("StarterPlayer");
local l_Common_0 = l_CoreGui_0:FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Common");
local l_RagdollRigging_0 = require(l_Common_0:FindFirstChild("RagdollRigging"));
local l_HumanoidReadyUtil_0 = require(l_Common_0:FindFirstChild("HumanoidReadyUtil"));
local l_game_EngineFeature_0 = game:GetEngineFeature("AvatarJointUpgradeFeature");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
if not l_LocalPlayer_0 then
    l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v9 = l_RobloxReplicatedStorage_0:WaitForChild("DeathType", math.huge);
if not v9 or not l_game_EngineFeature_0 and v9.Value ~= "Ragdoll" then
    return ;
else
    local v10 = nil;
    if not l_game_EngineFeature_0 then
        v10 = l_RobloxReplicatedStorage_0:WaitForChild("OnRagdoll", math.huge);
        if not (v10 and v10:IsA("RemoteEvent")) then
            return ;
        end;
    end;
    local function v15(v11, v12)
        if not l_game_EngineFeature_0 then
            local v13 = l_RagdollRigging_0.disableMotors(v11, v12.RigType);
            local l_Animator_0 = v12:FindFirstChildWhichIsA("Animator");
            if l_Animator_0 then
                l_Animator_0:ApplyJointVelocities(v13);
            end;
            v10:FireServer(v12);
            wait(0.1);
            l_RagdollRigging_0.easeJointFriction_OLD(v11, 0.85);
        elseif v9.Value == "Ragdoll" then
            l_RagdollRigging_0.disableMotors(v11, v12.RigType);
            return ;
        end;
    end;
    l_HumanoidReadyUtil_0.registerHumanoidReady(function(v16, v17, v18)
        local v19 = nil;
        local v20 = nil;
        local function _()
            v19:Disconnect();
            v20:Disconnect();
        end;
        v20 = v18.Died:Connect(function()
            v19:Disconnect();
            v20:Disconnect();
            if v9.Value == "Ragdoll" then
                delay(2, function()
                    l_RagdollRigging_0.disableParticleEmittersAndFadeOut(v17, 0.4);
                end);
            end;
            if v16 == l_LocalPlayer_0 then
                v15(v17, v18);
            end;
        end);
        v19 = v16.CharacterRemoving:Connect(function(v22)
            if v22 == v17 then
                v19:Disconnect();
                v20:Disconnect();
            end;
        end);
    end);
    return ;
end;
