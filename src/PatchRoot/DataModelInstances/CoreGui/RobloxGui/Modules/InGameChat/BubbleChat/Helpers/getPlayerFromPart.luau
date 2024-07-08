local l_Players_0 = game:GetService("Players");
return function(v1)
    if v1 then
        for _, v3 in pairs(l_Players_0:GetPlayers()) do
            local l_Character_0 = v3.Character;
            if not (not l_Character_0 or not v1:IsDescendantOf(l_Character_0)) then
                return v3;
            end;
        end;
        return nil;
    else
        return nil;
    end;
end;
