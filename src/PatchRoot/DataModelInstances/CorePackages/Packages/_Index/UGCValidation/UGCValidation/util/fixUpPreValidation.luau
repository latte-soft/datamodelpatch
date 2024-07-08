return function(v0)
    v0 = v0:Clone();
    local l_v0_Descendants_0 = v0:GetDescendants();
    table.insert(l_v0_Descendants_0, v0);
    for _, v3 in l_v0_Descendants_0, nil, nil do
        if v3.Parent ~= nil and (not ((not v3:IsA("Motor6D") and v3.Name ~= "OriginalSize") and v3.Name ~= "OriginalPosition") or v3:IsA("Weld") and v3.Name == "AccessoryWeld") then
            v3:Destroy();
        else
            if v3:IsA("BasePart") then
                v3.Velocity = Vector3.zero;
                v3.RotVelocity = Vector3.zero;
            end;
            local v4 = not not v3.Parent and v3.Parent:IsA("Accessory");
            if not (not (not (not v3:IsA("MeshPart") or v4) and v3.TextureID == "") or v3:FindFirstChildWhichIsA("SurfaceAppearance")) then
                Instance.new("SurfaceAppearance").Parent = v3;
            end;
        end;
    end;
    return v0;
end;
