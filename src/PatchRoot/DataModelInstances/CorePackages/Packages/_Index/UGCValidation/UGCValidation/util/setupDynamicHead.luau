local l_Players_0 = game:GetService("Players");
local v1 = {
    LeftArm = 11714033534, 
    LeftLeg = 11714035598, 
    RightArm = 11714037276, 
    RightLeg = 11714039415, 
    Torso = 11714041015
};
local v2 = {
    "Head", 
    "Torso", 
    "LeftLeg", 
    "RightLeg", 
    "RightArm", 
    "LeftArm"
};
local v3 = Color3.fromRGB(163, 162, 165);
local function v26()
    local l_HumanoidDescription_0 = Instance.new("HumanoidDescription");
    for _, v6 in v2, nil, nil do
        l_HumanoidDescription_0[v6 .. "Color"] = v3;
    end;
    local l_l_Players_0_HumanoidModelFromDescription_0 = l_Players_0:CreateHumanoidModelFromDescription(l_HumanoidDescription_0, Enum.HumanoidRigType.R15);
    l_l_Players_0_HumanoidModelFromDescription_0:FindFirstChild("Humanoid").DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
    local function _(v8, v9)
        return game:GetObjectsAllOrNone("https://assetdelivery.roblox.com/v1/asset/?id=" .. tostring(v9) .. "&expectedAssetType=" .. v8);
    end;
    local _ = function(v11, v12)
        for _, v14 in pairs(v11) do
            if v14.Name == v12 then
                return v14;
            end;
        end;
        return nil;
    end;
    for v16, v17 in v1, nil, nil do
        local l_game_ObjectsAllOrNone_0 = game:GetObjectsAllOrNone("https://assetdelivery.roblox.com/v1/asset/?id=" .. tostring(v17) .. "&expectedAssetType=" .. v16);
        if l_game_ObjectsAllOrNone_0 then
            local v19;
            for _, v21 in pairs(l_game_ObjectsAllOrNone_0) do
                if v21.Name == "R15ArtistIntent" then
                    v19 = v21;
                    goto label0 --[[  true, false  ]];
                end;
            end;
            v19 = nil;
            ::label0::;
            if v19 then
                for _, v23 in v19:GetChildren() do
                    local l_SurfaceAppearance_0 = v23:FindFirstChildWhichIsA("SurfaceAppearance");
                    if l_SurfaceAppearance_0 then
                        l_SurfaceAppearance_0:Destroy();
                    end;
                    local l_l_l_Players_0_HumanoidModelFromDescription_0_FirstChild_0 = l_l_Players_0_HumanoidModelFromDescription_0:FindFirstChild(v23.Name);
                    if l_l_l_Players_0_HumanoidModelFromDescription_0_FirstChild_0 then
                        l_l_l_Players_0_HumanoidModelFromDescription_0_FirstChild_0:Destroy();
                    end;
                    v23.Parent = l_l_Players_0_HumanoidModelFromDescription_0;
                end;
            else
                return nil;
            end;
        else
            return nil;
        end;
    end;
    l_l_Players_0_HumanoidModelFromDescription_0:PivotTo(CFrame.new(l_l_Players_0_HumanoidModelFromDescription_0:GetPivot().Position, l_l_Players_0_HumanoidModelFromDescription_0:GetPivot().Position + Vector3.new(0, 0, -1)));
    return l_l_Players_0_HumanoidModelFromDescription_0;
end;
local function _(v27, v28)
    v27:FindFirstChild("Head"):Destroy();
    v28.Parent = v27;
    v27:FindFirstChild("Humanoid"):BuildRigFromAttachments();
end;
local function v33(v30)
    for _, v32 in v30:GetChildren() do
        if v32:IsA("MeshPart") and v32.Name ~= "Head" then
            v32.Transparency = 1;
        end;
    end;
end;
return function(v34)
    local v35 = v26();
    if v35 then
        v35:FindFirstChild("Head"):Destroy();
        v34.Parent = v35;
        v35:FindFirstChild("Humanoid"):BuildRigFromAttachments();
        v33(v35);
        return v35;
    else
        return nil;
    end;
end;
