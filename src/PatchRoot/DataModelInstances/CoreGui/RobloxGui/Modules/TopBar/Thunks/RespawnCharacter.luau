local l_Players_0 = game:GetService("Players");
return function(v1)
    local v2 = v1:getState();
    if not v2.respawn.customCallback then
        local l_Character_0 = l_Players_0.LocalPlayer.Character;
        if l_Character_0 ~= nil then
            local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
            if not (not (l_Humanoid_0 ~= nil) or not l_Humanoid_0:IsA("Humanoid")) then
                l_Humanoid_0.Health = 0;
            end;
        end;
        return ;
    else
        v2.respawn.customCallback:Fire();
        return ;
    end;
end;
