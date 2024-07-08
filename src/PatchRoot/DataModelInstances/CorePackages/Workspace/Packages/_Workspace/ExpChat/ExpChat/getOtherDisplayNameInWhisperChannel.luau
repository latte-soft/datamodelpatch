local l_Players_0 = game:GetService("Players");
return function(v1, v2)
    for _, v4 in ipairs(v1:GetChildren()) do
        if v4:IsA("TextSource") then
            local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v4.UserId);
            if l_l_Players_0_PlayerByUserId_0 and l_l_Players_0_PlayerByUserId_0 ~= v2 then
                return l_l_Players_0_PlayerByUserId_0.DisplayName;
            end;
        end;
    end;
    return nil;
end;
