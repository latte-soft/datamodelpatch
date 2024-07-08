return function(v0, v1)
    local v2 = v0 and v0.UserSpecificSettings;
    if v1 and v2 then
        if not v2[v1.userId] then
            if not v1.partOrModel or not v2[v1.partOrModel:GetFullName()] then
                return v0;
            else
                return v2[v1.partOrModel:GetFullName()];
            end;
        else
            return v2[v1.userId];
        end;
    else
        return v0;
    end;
end;
