local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_Players_0 = game:GetService("Players");
local l_VRService_0 = game:GetService("VRService");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v5 = require(l_RobloxGui_0.Modules.Common.AvatarUtil);
local v6 = require(l_RobloxGui_0.Modules.Common.ConnectionUtil);
local v7 = game:DefineFastFlag("DebugImmersionModeNonVR", false);
local v8 = game:DefineFastFlag("UpdateAvatarGestures", false);
local v9 = game:DefineFastFlag("AvatarGesturesTelemetry", false);
local v10 = game:DefineFastInt("VRAvatarGesturesAnalyticsThrottleHundrethsPercent", 0);
local v11 = {};
v11.__index = v11;
v11.new = function()
    local v12 = setmetatable({}, v11);
    v12.connections = v6.new();
    v12.VRPlayers = {};
    v12.connections:connect("AvatarGestures", l_VRService_0:GetPropertyChangedSignal("AvatarGestures"), function()
        v12:onAvatarGesturesChanged();
    end);
    if l_VRService_0.AvatarGestures then
        v12:onAvatarGesturesChanged();
    end;
    return v12;
end;
cleanCharacter = function(v13)
    if v13.Character then
        local l_Humanoid_0 = v13.Character:FindFirstChild("Humanoid");
        if l_Humanoid_0 then
            for _, v16 in pairs({
                "TrackedIKLeftHand", 
                "TrackedIKRightHand", 
                "TrackedIKHead"
            }) do
                local l_l_Humanoid_0_FirstChild_0 = l_Humanoid_0:FindFirstChild(v16);
                if l_l_Humanoid_0_FirstChild_0 then
                    l_l_Humanoid_0_FirstChild_0:Destroy();
                end;
            end;
        end;
        for _, v19 in pairs({
            "TrackedLeftHand", 
            "TrackedRightHand", 
            "TrackedHead"
        }) do
            local l_FirstChild_0 = v13.Character:FindFirstChild(v19);
            if l_FirstChild_0 then
                l_FirstChild_0:Destroy();
            end;
        end;
    end;
end;
v11.onPlayerChanged = function(v21, v22, v23)
    v21.VRPlayers[v22] = v23 or nil;
    if not v23 then
        cleanCharacter(v22);
        return ;
    else
        if not v21.avatarUtil then
            v21.avatarUtil = v5.new();
        end;
        v21.avatarUtil:connectPlayerCharacterChanges(v22, function(v24)
            v21:onCharacterChanged(v24);
        end);
        return ;
    end;
end;
v11.onPlayerAdded = function(v25, v26)
    if v9 and next(v25.VRPlayers) ~= nil then
        l_RbxAnalyticsService_0:ReportInfluxSeries("VRAvatarGestures", {
            placeId = game.PlaceId, 
            calledFrom = "ServerPlayerAddedWithVRPlayer", 
            playerUserID = v26.UserId
        }, v10);
    end;
end;
v11.onAvatarGesturesChanged = function(v27)
    if not v8 then
        if not l_VRService_0.AvatarGestures then
            for _, v29 in pairs(l_Players_0:GetPlayers()) do
                if v29.Character then
                    local l_Humanoid_1 = v29.Character:FindFirstChild("Humanoid");
                    if l_Humanoid_1 then
                        for _, v32 in pairs({
                            "VRIKLeftHand", 
                            "VRIKRightHand", 
                            "VRIKHead"
                        }) do
                            local l_l_Humanoid_1_FirstChild_0 = l_Humanoid_1:FindFirstChild(v32);
                            if l_l_Humanoid_1_FirstChild_0 then
                                l_l_Humanoid_1_FirstChild_0:Destroy();
                            end;
                        end;
                    end;
                    for _, v35 in pairs({
                        "VRGesturesLeftHand", 
                        "VRGesturesRightHand", 
                        "VRGesturesHead"
                    }) do
                        local l_FirstChild_1 = v29.Character:FindFirstChild(v35);
                        if l_FirstChild_1 then
                            l_FirstChild_1:Destroy();
                        end;
                    end;
                end;
            end;
            return ;
        elseif v27.avatarUtil then
            for _, v38 in pairs(l_Players_0:GetPlayers()) do
                if v38.Character then
                    v27:onCharacterChanged(v38.Character);
                end;
            end;
            return ;
        else
            v27.avatarUtil = v5.new();
            v27.connections:connect("PlayerAdded", l_Players_0.PlayerAdded, function(v39)
                v27.avatarUtil:connectPlayerCharacterChanges(v39, function(v40)
                    v27:onCharacterChanged(v40);
                end);
            end);
            for _, v42 in pairs(l_Players_0:GetPlayers()) do
                v27.avatarUtil:connectPlayerCharacterChanges(v42, function(v43)
                    v27:onCharacterChanged(v43);
                end);
            end;
            return ;
        end;
    elseif not l_VRService_0.AvatarGestures then
        for v44 in pairs(v27.VRPlayers) do
            v27:onPlayerChanged(v44, false);
        end;
        v27.connections:disconnectAll();
        v27.connections:connect("AvatarGestures", l_VRService_0:GetPropertyChangedSignal("AvatarGestures"), function()
            v27:onAvatarGesturesChanged();
        end);
        return ;
    else
        local l_AvatarGesturesVRPlayer_0 = l_RobloxReplicatedStorage_0:FindFirstChild("AvatarGesturesVRPlayer");
        if not l_AvatarGesturesVRPlayer_0 then
            l_AvatarGesturesVRPlayer_0 = Instance.new("RemoteEvent");
            l_AvatarGesturesVRPlayer_0.Name = "AvatarGesturesVRPlayer";
            l_AvatarGesturesVRPlayer_0.Parent = l_RobloxReplicatedStorage_0;
        end;
        v27.connections:connect("VRPlayerOnServerEvent", l_AvatarGesturesVRPlayer_0.OnServerEvent, function(v46, v47)
            v27:onPlayerChanged(v46, v47);
        end);
        v27.connections:connect("PlayerAdded", l_Players_0.PlayerAdded, function(v48)
            v27:onPlayerAdded(v48);
        end);
        v27.connections:connect("PlayerRemoving", l_Players_0.PlayerRemoving, function(v49)
            v27:onPlayerChanged(v49, false);
        end);
        return ;
    end;
end;
v11.findOrCreateColliders = function(_, v51, v52)
    local l_l_Players_0_PlayerFromCharacter_0 = l_Players_0:GetPlayerFromCharacter(v52);
    local v54 = nil;
    v54 = if not v8 then "VRGestures" .. v51 else "Tracked" .. v51;
    local l_v52_FirstChild_0 = v52:FindFirstChild(v54);
    if not l_v52_FirstChild_0 then
        l_v52_FirstChild_0 = Instance.new("Part");
        l_v52_FirstChild_0.Name = v54;
        l_v52_FirstChild_0.Transparency = 1;
        l_v52_FirstChild_0.CanCollide = false;
        l_v52_FirstChild_0.Parent = v52;
        l_v52_FirstChild_0:SetNetworkOwner(l_l_Players_0_PlayerFromCharacter_0);
    end;
    local l_l_v52_FirstChild_0_FirstChild_0 = l_v52_FirstChild_0:FindFirstChild(v54 .. "Attachment");
    if not l_l_v52_FirstChild_0_FirstChild_0 then
        l_l_v52_FirstChild_0_FirstChild_0 = Instance.new("Attachment");
        l_l_v52_FirstChild_0_FirstChild_0.Name = v54 .. "Attachment";
        l_l_v52_FirstChild_0_FirstChild_0.Parent = l_v52_FirstChild_0;
    end;
    local l_l_v52_FirstChild_0_FirstChild_1 = l_v52_FirstChild_0:FindFirstChild(v54 .. "AlignPosition");
    if not l_l_v52_FirstChild_0_FirstChild_1 then
        l_l_v52_FirstChild_0_FirstChild_1 = Instance.new("AlignPosition");
        l_l_v52_FirstChild_0_FirstChild_1.Name = v54 .. "AlignPosition";
        l_l_v52_FirstChild_0_FirstChild_1.Mode = Enum.PositionAlignmentMode.OneAttachment;
        l_l_v52_FirstChild_0_FirstChild_1.Attachment0 = l_l_v52_FirstChild_0_FirstChild_0;
        l_l_v52_FirstChild_0_FirstChild_1.RigidityEnabled = true;
        l_l_v52_FirstChild_0_FirstChild_1.Parent = l_v52_FirstChild_0;
    end;
    local l_l_v52_FirstChild_0_FirstChild_2 = l_v52_FirstChild_0:FindFirstChild(v54 .. "AlignOrientation");
    if not l_l_v52_FirstChild_0_FirstChild_2 then
        l_l_v52_FirstChild_0_FirstChild_2 = Instance.new("AlignOrientation");
        l_l_v52_FirstChild_0_FirstChild_2.Name = v54 .. "AlignOrientation";
        l_l_v52_FirstChild_0_FirstChild_2.Mode = Enum.OrientationAlignmentMode.OneAttachment;
        l_l_v52_FirstChild_0_FirstChild_2.Attachment0 = l_l_v52_FirstChild_0_FirstChild_0;
        l_l_v52_FirstChild_0_FirstChild_2.RigidityEnabled = true;
        l_l_v52_FirstChild_0_FirstChild_2.Parent = l_v52_FirstChild_0;
    end;
    local l_v52_FirstChild_1 = v52:FindFirstChild(v51);
    if not l_v52_FirstChild_1 then
        l_v52_FirstChild_0.Size = Vector3.new(1, 1, 1);
        l_v52_FirstChild_0.CFrame = v52.WorldPivot;
        l_l_v52_FirstChild_0_FirstChild_1.Position = v52.WorldPivot.Position;
        l_l_v52_FirstChild_0_FirstChild_2.CFrame = v52.WorldPivot;
    else
        l_v52_FirstChild_0.Size = l_v52_FirstChild_1.Size;
        l_v52_FirstChild_0.CFrame = l_v52_FirstChild_1.CFrame;
        l_l_v52_FirstChild_0_FirstChild_1.Position = l_v52_FirstChild_1.Position;
        l_l_v52_FirstChild_0_FirstChild_2.CFrame = l_v52_FirstChild_1.CFrame;
    end;
    local l_Humanoid_2 = v52:FindFirstChild("Humanoid");
    if l_Humanoid_2 then
        local v61 = nil;
        v61 = if not v8 then "VRIK" .. v51 else "TrackedIK" .. v51;
        local l_l_Humanoid_2_FirstChild_0 = l_Humanoid_2:FindFirstChild(v61);
        if not l_l_Humanoid_2_FirstChild_0 then
            l_l_Humanoid_2_FirstChild_0 = Instance.new("IKControl");
            l_l_Humanoid_2_FirstChild_0.Name = v61;
        end;
        l_l_Humanoid_2_FirstChild_0.SmoothTime = 0.1;
        l_l_Humanoid_2_FirstChild_0.Parent = l_Humanoid_2;
        l_l_Humanoid_2_FirstChild_0.Target = l_v52_FirstChild_0;
    end;
end;
v11.createHandCollider = function(v63, v64, v65)
    v63:findOrCreateColliders(v64 .. "Hand", v65);
    local l_v65_FirstChild_0 = v65:FindFirstChild(v64 .. "Hand");
    local l_Humanoid_3 = v65:FindFirstChild("Humanoid");
    if l_Humanoid_3 then
        local _ = "VRIK" .. v64 .. "Hand";
        local l_l_Humanoid_3_FirstChild_0 = l_Humanoid_3:FindFirstChild(if not v8 then "VRIK" .. v64 .. "Hand" else "TrackedIK" .. v64 .. "Hand");
        if l_l_Humanoid_3_FirstChild_0 then
            l_l_Humanoid_3_FirstChild_0.Type = Enum.IKControlType.Transform;
            local l_v65_FirstChild_1 = v65:FindFirstChild(v64 .. "UpperArm");
            if l_v65_FirstChild_1 then
                l_l_Humanoid_3_FirstChild_0.ChainRoot = l_v65_FirstChild_0;
                coroutine.wrap(function()
                    task.wait(0.1);
                    l_l_Humanoid_3_FirstChild_0.ChainRoot = l_v65_FirstChild_1;
                end)();
            end;
            if l_v65_FirstChild_0 then
                l_l_Humanoid_3_FirstChild_0.EndEffector = l_v65_FirstChild_0;
            end;
            l_l_Humanoid_3_FirstChild_0.Priority = 1;
        end;
    end;
    if l_v65_FirstChild_0 then
        local l_RagdollBallSocket_0 = l_v65_FirstChild_0:FindFirstChild("RagdollBallSocket");
        if l_RagdollBallSocket_0 then
            l_RagdollBallSocket_0.LimitsEnabled = false;
        end;
    end;
end;
v11.createHeadCollider = function(v72, v73)
    v72:findOrCreateColliders("Head", v73);
    local l_Head_0 = v73:FindFirstChild("Head");
    local l_Humanoid_4 = v73:FindFirstChild("Humanoid");
    if l_Humanoid_4 then
        local _ = nil;
        local l_l_Humanoid_4_FirstChild_0 = l_Humanoid_4:FindFirstChild(not v8 and "VRIKHead" or "TrackedIKHead");
        if l_l_Humanoid_4_FirstChild_0 then
            l_l_Humanoid_4_FirstChild_0.Type = Enum.IKControlType.Rotation;
            local l_UpperTorso_0 = v73:FindFirstChild("UpperTorso");
            if l_UpperTorso_0 then
                l_l_Humanoid_4_FirstChild_0.ChainRoot = l_UpperTorso_0;
            end;
            if l_Head_0 then
                l_l_Humanoid_4_FirstChild_0.EndEffector = l_Head_0;
            end;
        end;
    end;
end;
v11.onCharacterChanged = function(v79, v80)
    local l_l_Players_0_PlayerFromCharacter_1 = l_Players_0:GetPlayerFromCharacter(v80);
    if not v8 then
        if not (not l_l_Players_0_PlayerFromCharacter_1.VREnabled and not v7 or not l_VRService_0.AvatarGestures) then
            v79:createHandCollider("Left", v80);
            v79:createHandCollider("Right", v80);
            v79:createHeadCollider(v80);
        end;
    elseif not (not v79.VRPlayers[l_l_Players_0_PlayerFromCharacter_1] or not l_VRService_0.AvatarGestures) then
        v79:createHandCollider("Left", v80);
        v79:createHandCollider("Right", v80);
        v79:createHeadCollider(v80);
        return ;
    end;
end;
return v11;
