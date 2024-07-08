local l_VRService_0 = game:GetService("VRService");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v6 = require(l_RobloxGui_0.Modules.Common.ConnectionUtil);
local v7 = require(l_RobloxGui_0.Modules.Common.AvatarUtil);
local v8 = game:DefineFastFlag("DebugImmersionModeNonVR", false);
local v9 = game:DefineFastFlag("UpdateAvatarGestures", false);
local v10 = game:DefineFastFlag("AvatarGesturesTelemetry", false);
local v11 = game:DefineFastInt("VRAvatarGesturesAnalyticsThrottleHundrethsPercent", 0);
local v12 = nil;
local l_status_0, l_result_0 = pcall(function()
    return UserSettings():IsUserFeatureEnabled("UserFixVRAvatarGesturesSeats");
end);
v12 = l_status_0 and l_result_0;
l_status_0 = {};
l_status_0.__index = l_status_0;
l_status_0.new = function()
    local v15 = setmetatable({}, l_status_0);
    v15.partCFrameMap = {};
    v15.connections = v6.new();
    v15.analyticsSendEnabled = true;
    v15.connections:connect("AvatarGestures", l_VRService_0:GetPropertyChangedSignal("AvatarGestures"), function()
        v15:onAvatarGesturesChanged();
    end);
    if l_VRService_0.AvatarGestures then
        v15:onAvatarGesturesChanged();
    end;
    return v15;
end;
l_status_0.onCharacterChanged = function(v16, v17)
    local l_Humanoid_0 = v17:FindFirstChild("Humanoid");
    if l_Humanoid_0 then
        local v19 = nil;
        v19 = if not v9 then {
            "VRIKLeftHand", 
            "VRIKRightHand", 
            "VRIKHead"
        } else {
            "TrackedIKLeftHand", 
            "TrackedIKRightHand", 
            "TrackedIKHead"
        };
        for _, v21 in pairs(v19) do
            local l_l_Humanoid_0_FirstChild_0 = l_Humanoid_0:FindFirstChild(v21);
            if l_l_Humanoid_0_FirstChild_0 then
                l_l_Humanoid_0_FirstChild_0.SmoothTime = 0;
            end;
        end;
        if v12 then
            local l_CurrentCamera_0 = workspace.CurrentCamera;
            if l_CurrentCamera_0 then
                local function v28(v24)
                    local v25 = l_CurrentCamera_0.CameraSubject and l_CurrentCamera_0.CameraSubject:IsA("VehicleSeat");
                    local v26 = (l_CurrentCamera_0.CFrame.Position - l_CurrentCamera_0.Focus.Position).Magnitude <= 5;
                    local l_TrackedIKHead_0 = l_Humanoid_0:FindFirstChild("TrackedIKHead");
                    if l_TrackedIKHead_0 then
                        if (not v24 or v25) or not v26 then
                            l_TrackedIKHead_0.Type = Enum.IKControlType.Rotation;
                        else
                            l_TrackedIKHead_0.Type = Enum.IKControlType.Transform;
                            return ;
                        end;
                    end;
                end;
                v28(l_Humanoid_0.Sit);
                v16.connections:connect("Seated", l_Humanoid_0.Seated, function(v29)
                    v28(v29);
                    if v29 and (l_CurrentCamera_0.CFrame.Position - l_CurrentCamera_0.Focus.Position).Magnitude <= 5 then
                        l_VRService_0:RecenterUserHeadCFrame();
                    end;
                end);
            else
                return ;
            end;
        end;
        return ;
    else
        return ;
    end;
end;
l_status_0.onAvatarGesturesChanged = function(v30)
    if not l_VRService_0.AvatarGestures then
        if not (not v9 or not l_VRService_0.VREnabled and not v8) then
            local l_AvatarGesturesVRPlayer_0 = l_RobloxReplicatedStorage_0:FindFirstChild("AvatarGesturesVRPlayer");
            if l_AvatarGesturesVRPlayer_0 then
                l_AvatarGesturesVRPlayer_0:FireServer(false);
            end;
        end;
        v30.connections:disconnectAll();
        v30.connections:connect("AvatarGestures", l_VRService_0:GetPropertyChangedSignal("AvatarGestures"), function()
            v30:onAvatarGesturesChanged();
        end);
    else
        if not v9 then
            v30:connectInputCFrames();
        end;
        if not (not l_VRService_0.VREnabled and not v8) then
            if v9 then
                local v32 = l_RobloxReplicatedStorage_0:WaitForChild("AvatarGesturesVRPlayer", 5);
                if v32 then
                    v32:FireServer(true);
                    v30:connectInputCFrames();
                else
                    warn("VRService.AvatarGestures failed to connect to server");
                    return ;
                end;
            end;
            if v30.avatarUtil then
                if not (not l_Players_0.LocalPlayer or not l_Players_0.LocalPlayer.Character) then
                    v30:onCharacterChanged(l_Players_0.LocalPlayer.Character);
                end;
            else
                v30.avatarUtil = v7.new();
                v30.avatarUtil:connectLocalCharacterChanges(function(v33)
                    v30:onCharacterChanged(v33);
                end);
            end;
            if not (not v10 or not v30.analyticsSendEnabled) then
                v30.analyticsSendEnabled = nil;
                l_RbxAnalyticsService_0:ReportInfluxSeries("VRAvatarGestures", {
                    placeId = game.PlaceId, 
                    calledFrom = "ClientJoined"
                }, v11);
                return ;
            end;
        end;
    end;
end;
l_status_0.updateCFrames = function(_, v35, v36)
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    if l_Players_0.LocalPlayer then
        local l_Character_0 = l_LocalPlayer_0.Character;
        if l_LocalPlayer_0.Character then
            local l_l_Character_0_FirstChild_0 = l_Character_0:FindFirstChild(v35);
            if l_l_Character_0_FirstChild_0 then
                local l_CurrentCamera_1 = workspace.CurrentCamera;
                if l_CurrentCamera_1 then
                    if l_l_Character_0_FirstChild_0:FindFirstChild(v35 .. "Attachment") then
                        local l_l_l_Character_0_FirstChild_0_FirstChild_0 = l_l_Character_0_FirstChild_0:FindFirstChild(v35 .. "AlignPosition");
                        if l_l_l_Character_0_FirstChild_0_FirstChild_0 then
                            local l_l_l_Character_0_FirstChild_0_FirstChild_1 = l_l_Character_0_FirstChild_0:FindFirstChild(v35 .. "AlignOrientation");
                            if l_l_l_Character_0_FirstChild_0_FirstChild_1 then
                                if not l_VRService_0.VREnabled then
                                    local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                                    local v44 = nil;
                                    local _ = false;
                                    v44 = if not if not v9 then v35 ~= "VRGesturesHead" else v35 ~= "TrackedHead" then l_HumanoidRootPart_0.CFrame * v36 else ((l_HumanoidRootPart_0.CFrame * v36) * CFrame.Angles(0, 0, (math.rad(time() * 30)))) * CFrame.new(1, 0, -0.5);
                                    if l_HumanoidRootPart_0 then
                                        l_l_l_Character_0_FirstChild_0_FirstChild_0.Position = v44.Position;
                                        l_l_l_Character_0_FirstChild_0_FirstChild_1.CFrame = v44;
                                    end;
                                else
                                    v36 = v36.Rotation + v36.Position * l_CurrentCamera_1.HeadScale;
                                    local v46 = l_CurrentCamera_1.CFrame * v36;
                                    local l_Head_0 = l_Character_0:FindFirstChild("Head");
                                    if not ((l_CurrentCamera_1.CFrame.Position - l_CurrentCamera_1.Focus.Position).Magnitude > 5) or not l_Head_0 then
                                        l_l_l_Character_0_FirstChild_0_FirstChild_0.Position = v46.Position;
                                        local _ = false;
                                        if not if not v9 then v35 ~= "VRGesturesHead" else v35 ~= "TrackedHead" then
                                            l_l_l_Character_0_FirstChild_0_FirstChild_1.CFrame = v46;
                                        else
                                            l_l_l_Character_0_FirstChild_0_FirstChild_1.CFrame = v46 * CFrame.Angles(1.5707963267948966, 0, 0);
                                        end;
                                    else
                                        local l_l_VRService_0_UserCFrame_0 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
                                        local v50 = (l_CurrentCamera_1.CFrame * (l_l_VRService_0_UserCFrame_0.Rotation + l_l_VRService_0_UserCFrame_0.Position * l_CurrentCamera_1.HeadScale)) * CFrame.new(0, 0, 0.5);
                                        local _ = false;
                                        if not if not v9 then v35 ~= "VRGesturesHead" else v35 ~= "TrackedHead" then
                                            local l_CFrame_0 = l_Character_0.PrimaryPart.CFrame;
                                            l_l_l_Character_0_FirstChild_0_FirstChild_0.Position = (l_CFrame_0 * CFrame.new(0, l_CFrame_0.Position.Y * 0.25, -l_CFrame_0.Position.Y * 0.125)).Position;
                                            l_l_l_Character_0_FirstChild_0_FirstChild_1.CFrame = l_CFrame_0 * v36;
                                        else
                                            local v53 = l_Head_0.CFrame:ToWorldSpace(v50:ToObjectSpace(v46));
                                            l_l_l_Character_0_FirstChild_0_FirstChild_0.Position = v53.Position;
                                            l_l_l_Character_0_FirstChild_0_FirstChild_1.CFrame = v53 * CFrame.Angles(1.5707963267948966, 0, 0);
                                        end;
                                    end;
                                end;
                                l_l_Character_0_FirstChild_0.CFrame = CFrame.new(l_l_l_Character_0_FirstChild_0_FirstChild_0.Position) * l_l_l_Character_0_FirstChild_0_FirstChild_1.CFrame.Rotation;
                                return ;
                            else
                                return ;
                            end;
                        else
                            return ;
                        end;
                    else
                        return ;
                    end;
                else
                    return ;
                end;
            else
                return ;
            end;
        else
            return ;
        end;
    else
        return ;
    end;
end;
l_status_0.steppedCframes = function(v54)
    for v55, v56 in pairs(v54.partCFrameMap) do
        v54:updateCFrames(v55, v56);
    end;
end;
l_status_0.connectInputCFrames = function(v57)
    if not v9 then
        if not l_VRService_0.VREnabled then
            if v8 then
                v57.connections:connect("NonVRSimulateInput", l_RunService_0.RenderStepped, function(_)
                    v57.partCFrameMap.VRGesturesLeftHand = CFrame.new(-0.5, 0, -0.5);
                    v57.partCFrameMap.VRGesturesRightHand = CFrame.new(0.5, 0, -0.5);
                    v57.partCFrameMap.VRGesturesHead = CFrame.new(0, 1, 0);
                end);
            end;
        else
            v57.connections:connect("UserCFrameChanged", l_VRService_0.UserCFrameChanged, function(v59, v60)
                if v59 == Enum.UserCFrame.LeftHand then
                    v57.partCFrameMap.VRGesturesLeftHand = v60;
                    return ;
                elseif v59 == Enum.UserCFrame.RightHand then
                    v57.partCFrameMap.VRGesturesRightHand = v60;
                    return ;
                else
                    if v59 == Enum.UserCFrame.Head then
                        v57.partCFrameMap.VRGesturesHead = v60;
                    end;
                    return ;
                end;
            end);
        end;
    elseif not l_VRService_0.VREnabled then
        if v8 then
            v57.connections:connect("NonVRSimulateInput", l_RunService_0.RenderStepped, function(_)
                v57.partCFrameMap.TrackedLeftHand = CFrame.new(-0.5, 0, -0.5);
                v57.partCFrameMap.TrackedRightHand = CFrame.new(0.5, 0, -0.5);
                v57.partCFrameMap.TrackedHead = CFrame.new(0, 1, 0);
            end);
        end;
    else
        v57.connections:connect("UserCFrameChanged", l_VRService_0.UserCFrameChanged, function(v62, v63)
            if v62 == Enum.UserCFrame.LeftHand then
                v57.partCFrameMap.TrackedLeftHand = v63;
                return ;
            elseif v62 == Enum.UserCFrame.RightHand then
                v57.partCFrameMap.TrackedRightHand = v63;
                return ;
            else
                if v62 == Enum.UserCFrame.Head then
                    v57.partCFrameMap.TrackedHead = v63;
                end;
                return ;
            end;
        end);
    end;
    if not (not l_VRService_0.VREnabled and not v8) then
        v57.connections:connect("RenderStepped", l_RunService_0.RenderStepped, function(_)
            v57:steppedCframes();
        end);
    end;
end;
return l_status_0.new();
