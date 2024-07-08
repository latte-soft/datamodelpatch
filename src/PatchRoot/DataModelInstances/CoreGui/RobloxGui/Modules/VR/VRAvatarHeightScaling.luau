local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_VRService_0 = game:GetService("VRService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_Players_0 = game:GetService("Players");
local v4 = require(l_RobloxGui_0.Modules.Common.AvatarUtil);
local v5 = {};
v5.__index = v5;
v5.new = function()
    local v6 = setmetatable({}, v5);
    v6.avatarUtil = v4.new();
    l_VRService_0:GetPropertyChangedSignal("AutomaticScaling"):Connect(function()
        v6:onScalingChanged();
    end);
    l_UserGameSettings_0:GetPropertyChangedSignal("PlayerHeight"):Connect(function()
        v6:onPlayerHeightChanged();
    end);
    l_VRService_0.UserCFrameChanged:Connect(function(v7, _)
        if v7 == Enum.UserCFrame.Floor then
            v6:onPlayerHeightChanged();
        end;
    end);
    v6:onScalingChanged();
    return v6;
end;
v5.setHeadScale = function(v9, v10)
    if l_VRService_0.AutomaticScaling ~= Enum.VRScaling.World then
        return ;
    else
        local l_v9_SubjectHeight_0 = v9:GetSubjectHeight(v10);
        if not l_v9_SubjectHeight_0 or l_v9_SubjectHeight_0 <= 0 then
            return ;
        else
            local v12 = -l_VRService_0:GetUserCFrame(Enum.UserCFrame.Floor).Position.Y;
            local v13 = nil;
            v13 = if v12 < 0.8 * l_UserGameSettings_0.PlayerHeight then l_v9_SubjectHeight_0 / l_UserGameSettings_0.PlayerHeight else l_v9_SubjectHeight_0 / v12;
            local l_CurrentCamera_0 = workspace.CurrentCamera;
            if l_CurrentCamera_0 then
                l_CurrentCamera_0.HeadScale = v13;
                return ;
            else
                return ;
            end;
        end;
    end;
end;
v5.GetSubjectHeight = function(_, v16)
    local l_Humanoid_0 = v16:FindFirstChild("Humanoid");
    if l_Humanoid_0 and l_Humanoid_0:GetState() == Enum.HumanoidStateType.Dead then
        return ;
    else
        local v18 = not not l_Humanoid_0 and l_Humanoid_0.RootPart or v16:FindFirstChild("HumanoidRootPart");
        if not v18 or not l_Humanoid_0 then
            return nil;
        else
            local l_HipHeight_0 = l_Humanoid_0.HipHeight;
            if l_Humanoid_0.RigType == Enum.HumanoidRigType.R6 then
                l_HipHeight_0 = 2;
            end;
            if not l_Humanoid_0.AutomaticScalingEnabled then
                return ((v18.Size.Y / 2 + l_HipHeight_0) + 2) + l_Humanoid_0.CameraOffset.Y;
            else
                return ((v18.Size.Y / 2 + l_HipHeight_0) + (v18.Size.Y / 2 + 0.5)) + l_Humanoid_0.CameraOffset.Y;
            end;
        end;
    end;
end;
v5.onPlayerHeightChanged = function(v20)
    if not (not l_Players_0.LocalPlayer or not l_Players_0.LocalPlayer.Character) then
        v20:setHeadScale(l_Players_0.LocalPlayer.Character);
    end;
end;
v5.onScalingChanged = function(v21)
    if l_VRService_0.AutomaticScaling == Enum.VRScaling.World then
        if not v21.characterChangedConnection then
            v21.characterChangedConnection = v21.avatarUtil:connectLocalCharacterChanges(function(v22)
                v21:setHeadScale(v22);
            end);
            return ;
        end;
    elseif v21.characterChangedConnection then
        v21.characterChangedConnection:Disconnect();
        v21.characterChangedConnection = nil;
    end;
end;
return v5.new();
