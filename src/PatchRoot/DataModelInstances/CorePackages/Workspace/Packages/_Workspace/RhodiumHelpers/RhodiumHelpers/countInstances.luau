return function(v0, v1)
    local v2 = 0;
    for _, v4 in pairs(v0:GetChildren()) do
        if not (v1 and not v4:IsA(v1)) then
            v2 = v2 + 1;
        end;
    end;
    return v2;
end;
