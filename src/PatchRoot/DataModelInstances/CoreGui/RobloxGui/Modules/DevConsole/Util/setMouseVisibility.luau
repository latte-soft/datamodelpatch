local l_UserInputService_0 = game:GetService("UserInputService");
local l_VRService_0 = game:GetService("VRService");
return function(v2)
    if not v2 then
        if not l_VRService_0.VREnabled then
            l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None;
            return ;
        else
            l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide;
            return ;
        end;
    else
        l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceShow;
        return ;
    end;
end;
