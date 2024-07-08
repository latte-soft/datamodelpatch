local l_VRService_0 = game:GetService("VRService");
return function()
    local l_l_VRService_0_UserCFrame_0 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.Floor);
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    if not l_CurrentCamera_0 then
        return CFrame.new(0, 0, 0);
    else
        return l_l_VRService_0_UserCFrame_0.Rotation + l_l_VRService_0_UserCFrame_0.Position * l_CurrentCamera_0.HeadScale;
    end;
end;
