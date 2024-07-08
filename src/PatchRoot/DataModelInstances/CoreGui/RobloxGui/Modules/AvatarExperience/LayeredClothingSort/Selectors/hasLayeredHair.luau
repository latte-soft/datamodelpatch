local function v5(v0)
    local l_Humanoid_0 = v0.Humanoid;
    if l_Humanoid_0 then
        for _, v3 in (l_Humanoid_0:GetAccessories()), nil, nil do
            local l_MeshPart_0 = v3:FindFirstChildWhichIsA("MeshPart");
            if not ((not l_MeshPart_0 or not l_MeshPart_0:FindFirstChild("HairAttachment")) or not l_MeshPart_0:FindFirstChildWhichIsA("WrapLayer")) then
                return true;
            end;
        end;
        return false;
    else
        return false;
    end;
end;
return function(v6)
    local l_CurrentCharacter_0 = v6.AvatarExperience.AvatarScene.Character.CurrentCharacter;
    if l_CurrentCharacter_0 then
        return (v5(l_CurrentCharacter_0));
    else
        return false;
    end;
end;
