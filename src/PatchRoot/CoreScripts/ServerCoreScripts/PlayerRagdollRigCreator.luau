local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_StarterPlayer_0 = game:GetService("StarterPlayer");
local l_Common_0 = l_CoreGui_0:FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Common");
local l_game_EngineFeature_0 = game:GetEngineFeature("AvatarJointUpgradeFeature");
local l_game_EngineFeature_1 = game:GetEngineFeature("AvatarJointUpgradeDefaultOnFeature");
local function _()
    if not l_game_EngineFeature_0 then
        return false;
    elseif not l_game_EngineFeature_1 then
        return l_StarterPlayer_0.AvatarJointUpgrade == Enum.AvatarJointUpgrade.Enabled;
    else
        return l_StarterPlayer_0.AvatarJointUpgrade ~= Enum.AvatarJointUpgrade.Disabled;
    end;
end;
local l_RagdollRigging_0 = require(l_Common_0:FindFirstChild("RagdollRigging"));
local l_HumanoidReadyUtil_0 = require(l_Common_0:FindFirstChild("HumanoidReadyUtil"));
local v10 = (function()
    if game:GetEngineFeature("PolicyInfoForServerRobloxOnlyAsyncEnabled") then
        local l_DefaultAvatarDeathType_0 = game:GetService("PolicyService"):GetPolicyInfoForServerRobloxOnlyAsync().DefaultAvatarDeathType;
        if l_DefaultAvatarDeathType_0 == nil then
            error("PolicyService did not have death type policy");
        end;
        return l_DefaultAvatarDeathType_0;
    else
        return game:DefineFastString("DeathTypeValue", "Classic");
    end;
end)();
local l_StringValue_0 = Instance.new("StringValue");
l_StringValue_0.Name = "DeathType";
l_StringValue_0.Value = v10;
l_StringValue_0.Parent = l_RobloxReplicatedStorage_0;
if not l_game_EngineFeature_0 and v10 ~= "Ragdoll" then
    return ;
else
    local v12 = {};
    if not l_game_EngineFeature_0 then
        local l_RemoteEvent_0 = Instance.new("RemoteEvent");
        l_RemoteEvent_0.Name = "OnRagdoll";
        l_RemoteEvent_0.OnServerEvent:Connect(function(v14, v15)
            if v15 and v12[v14] == v15 then
                local v16 = v15 and v15.Parent;
                if not (not v16 or not v16:IsA("Model")) then
                    l_RagdollRigging_0.disableMotors(v16, v15.RigType);
                end;
                v12[v14] = nil;
            end;
        end);
        l_RemoteEvent_0.Parent = l_RobloxReplicatedStorage_0;
    end;
    l_HumanoidReadyUtil_0.registerHumanoidReady(function(v17, v18, v19)
        if l_game_EngineFeature_0 then
            if not (v19.RigType == Enum.HumanoidRigType.R15) or not (not not l_game_EngineFeature_0 and if l_game_EngineFeature_1 then l_StarterPlayer_0.AvatarJointUpgrade ~= Enum.AvatarJointUpgrade.Disabled else l_StarterPlayer_0.AvatarJointUpgrade == Enum.AvatarJointUpgrade.Enabled) then
                if v10 == "Ragdoll" then
                    l_RagdollRigging_0.createRagdollJoints(v18, v19.RigType, false);
                end;
            else
                l_RagdollRigging_0.createRagdollJoints(v18, v19.RigType, not not l_game_EngineFeature_0 and if l_game_EngineFeature_1 then l_StarterPlayer_0.AvatarJointUpgrade ~= Enum.AvatarJointUpgrade.Disabled else l_StarterPlayer_0.AvatarJointUpgrade == Enum.AvatarJointUpgrade.Enabled);
            end;
        end;
        if v10 ~= "Ragdoll" then
            return ;
        else
            local v20 = nil;
            local function _()
                v20:Disconnect();
                if v12[v17] == v19 then
                    v12[v17] = nil;
                end;
            end;
            v20 = v17.CharacterRemoving:Connect(function(v22)
                if v22 == v18 then
                    v20:Disconnect();
                    if v12[v17] == v19 then
                        v12[v17] = nil;
                    end;
                end;
            end);
            v19.BreakJointsOnDeath = false;
            if not l_game_EngineFeature_0 then
                l_RagdollRigging_0.createRagdollJoints(v18, v19.RigType, not not l_game_EngineFeature_0 and if l_game_EngineFeature_1 then l_StarterPlayer_0.AvatarJointUpgrade ~= Enum.AvatarJointUpgrade.Disabled else l_StarterPlayer_0.AvatarJointUpgrade == Enum.AvatarJointUpgrade.Enabled);
            end;
            v12[v17] = v19;
            if l_game_EngineFeature_0 then
                v19.Died:Connect(function()
                    v12[v17] = nil;
                    local l_Parent_0 = v19.Parent;
                    if not (not l_Parent_0 or not l_Parent_0:IsA("Model")) then
                        l_RagdollRigging_0.disableMotors(l_Parent_0, v19.RigType);
                        if not not l_game_EngineFeature_0 and if l_game_EngineFeature_1 then l_StarterPlayer_0.AvatarJointUpgrade ~= Enum.AvatarJointUpgrade.Disabled else l_StarterPlayer_0.AvatarJointUpgrade == Enum.AvatarJointUpgrade.Enabled then
                            l_RagdollRigging_0.easeNongraphicJointFriction(l_Parent_0, 0.85);
                        end;
                    end;
                end);
            end;
            return ;
        end;
    end);
    return ;
end;
