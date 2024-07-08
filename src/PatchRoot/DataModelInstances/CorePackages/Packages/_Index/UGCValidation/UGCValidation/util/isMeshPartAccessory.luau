return function(v0)
    if v0:IsA("Accessory") then
        local l_Handle_0 = v0:FindFirstChild("Handle");
        if not (not l_Handle_0 or not l_Handle_0:IsA("MeshPart")) then
            return true;
        end;
    end;
    return false;
end;
