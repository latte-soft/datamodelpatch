local v0 = {};
local l_InsertService_0 = game:GetService("InsertService");
local v2 = {
    R6 = true, 
    R15 = true, 
    R15ArtistIntent = true
};
v0.CharacterPartNames = {
    R6 = {
        HumanoidRootPart = true, 
        Head = true, 
        Torso = true, 
        ["Left Arm"] = true, 
        ["Left Leg"] = true, 
        ["Right Arm"] = true, 
        ["Right Leg"] = true, 
        CharacterMesh = true
    }, 
    R15 = {
        HumanoidRootPart = true, 
        Head = true, 
        UpperTorso = true, 
        LowerTorso = true, 
        LeftUpperLeg = true, 
        LeftLowerLeg = true, 
        LeftFoot = true, 
        RightUpperLeg = true, 
        RightLowerLeg = true, 
        RightFoot = true, 
        LeftUpperArm = true, 
        LeftLowerArm = true, 
        LeftHand = true, 
        RightUpperArm = true, 
        RightLowerArm = true, 
        RightHand = true
    }
};
v0.R15PartNameToEnum = {
    Head = Enum.BodyPartR15.Head, 
    UpperTorso = Enum.BodyPartR15.UpperTorso, 
    LowerTorso = Enum.BodyPartR15.LowerTorso, 
    LeftUpperLeg = Enum.BodyPartR15.LeftUpperLeg, 
    LeftLowerLeg = Enum.BodyPartR15.LeftLowerLeg, 
    LeftFoot = Enum.BodyPartR15.LeftFoot, 
    RightUpperLeg = Enum.BodyPartR15.RightUpperLeg, 
    RightLowerLeg = Enum.BodyPartR15.RightLowerLeg, 
    RightFoot = Enum.BodyPartR15.RightFoot, 
    LeftUpperArm = Enum.BodyPartR15.LeftUpperArm, 
    LeftLowerArm = Enum.BodyPartR15.LeftLowerArm, 
    LeftHand = Enum.BodyPartR15.LeftHand, 
    RightUpperArm = Enum.BodyPartR15.RightUpperArm, 
    RightLowerArm = Enum.BodyPartR15.RightLowerArm, 
    RightHand = Enum.BodyPartR15.RightHand
};
v0.CharacterPartNames.All = {};
for v3, _ in pairs(v0.CharacterPartNames.R6) do
    v0.CharacterPartNames.All[v3] = true;
end;
for v5, _ in pairs(v0.CharacterPartNames.R15) do
    v0.CharacterPartNames.All[v5] = true;
end;
local function _(v7, v8)
    if v8 == nil then
        v8 = true;
    end;
    local v9 = l_InsertService_0:LoadLocalAsset(v7);
    local l_Humanoid_0 = v9:FindFirstChild("Humanoid");
    assert(l_Humanoid_0, "Assert Humanoid is not nil to silence type checker");
    l_Humanoid_0.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
    if v8 then
        v9.Parent = workspace;
    end;
    return v9;
end;
v0.LoadR15Mannequin = function(v12)
    local l_v12_0 = v12;
    if l_v12_0 == nil then
        l_v12_0 = true;
    end;
    local v14 = l_InsertService_0:LoadLocalAsset("rbxasset://models/Thumbnails/Mannequins/R15.rbxm");
    local l_Humanoid_1 = v14:FindFirstChild("Humanoid");
    assert(l_Humanoid_1, "Assert Humanoid is not nil to silence type checker");
    l_Humanoid_1.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
    if l_v12_0 then
        v14.Parent = workspace;
    end;
    return v14;
end;
v0.LoadR6Mannequin = function(v16)
    local l_v16_0 = v16;
    if l_v16_0 == nil then
        l_v16_0 = true;
    end;
    local v18 = l_InsertService_0:LoadLocalAsset("rbxasset://models/Thumbnails/Mannequins/R6.rbxm");
    local l_Humanoid_2 = v18:FindFirstChild("Humanoid");
    assert(l_Humanoid_2, "Assert Humanoid is not nil to silence type checker");
    l_Humanoid_2.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
    if l_v16_0 then
        v18.Parent = workspace;
    end;
    return v18;
end;
v0.LoadRthroMannequin = function(v20)
    local l_v20_0 = v20;
    if l_v20_0 == nil then
        l_v20_0 = true;
    end;
    local v22 = l_InsertService_0:LoadLocalAsset("rbxasset://models/Thumbnails/Mannequins/Rthro.rbxm");
    local l_Humanoid_3 = v22:FindFirstChild("Humanoid");
    assert(l_Humanoid_3, "Assert Humanoid is not nil to silence type checker");
    l_Humanoid_3.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
    if l_v20_0 then
        v22.Parent = workspace;
    end;
    return v22;
end;
v0.LoadMannequinForScaleType = function(v24, v25)
    if v24 == "Classic" then
        return v0.LoadR15Mannequin(v25);
    else
        return v0.LoadRthroMannequin(v25);
    end;
end;
v0.AssertObjectsFormat = function(v26)
    local v27 = false;
    for _, v29 in v26, nil, nil do
        assert(v29:IsA("Folder"), "object should always be a Folder");
        if v2[v29.Name] then
            v27 = true;
            for _, v31 in v29:GetChildren() do
                assert(v0.CharacterPartNames.All[v31.Name], string.format("Name of %s of Folder %s does not exist in CharacterParts", v31.Name, v29.Name));
            end;
        end;
    end;
    assert(v27, "objects does not have at least one of R15ArtistIntent, R15, and R6 folders");
end;
v0.CreateBodyPartMannequin = function(v32, v33)
    local v34 = false;
    local v35 = false;
    local v36 = "Classic";
    v0.AssertObjectsFormat(v32);
    for _, v38 in v32, nil, nil do
        if not (v38.Name ~= "R15") or v38.Name == "R15ArtistIntent" then
            v34 = true;
            local l_v38_FirstChild_0 = v38:FindFirstChild("AvatarPartScaleType", true);
            if l_v38_FirstChild_0 then
                v36 = l_v38_FirstChild_0.Value;
                break;
            else
                break;
            end;
        end;
    end;
    for _, v41 in v32, nil, nil do
        if v41.Name == "R15ArtistIntent" then
            v35 = true;
            break;
        end;
    end;
    local v42 = nil;
    v42 = if not v34 then v0.LoadR6Mannequin(v33) else v0.LoadMannequinForScaleType(v36, v33);
    local l_Humanoid_4 = v42:FindFirstChildOfClass("Humanoid");
    l_Humanoid_4.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
    local l_BodyTypeScale_0 = l_Humanoid_4:FindFirstChild("BodyTypeScale");
    if l_BodyTypeScale_0 == nil then
        l_BodyTypeScale_0 = Instance.new("NumberValue");
        l_BodyTypeScale_0.Name = "BodyTypeScale";
        l_BodyTypeScale_0.Value = 0;
        l_BodyTypeScale_0.Parent = l_Humanoid_4;
    end;
    local l_BodyProportionScale_0 = l_Humanoid_4:FindFirstChild("BodyProportionScale");
    if l_BodyProportionScale_0 == nil then
        l_BodyProportionScale_0 = Instance.new("NumberValue");
        l_BodyProportionScale_0.Name = "BodyProportionScale";
        l_BodyProportionScale_0.Value = 0;
        l_BodyProportionScale_0.Parent = l_Humanoid_4;
    end;
    if v36 == "ProportionsNormal" then
        l_BodyTypeScale_0.Value = 1;
        l_BodyProportionScale_0.Value = 0;
    elseif v36 == "ProportionsSlender" then
        l_BodyTypeScale_0.Value = 1;
        l_BodyProportionScale_0.Value = 1;
    end;
    return v34, v35, v42;
end;
v0.SetupBodyPartMannequin = function(v46, v47, v48, v49, v50)
    v0.AssertObjectsFormat(v49);
    local v51 = false;
    if v50 then
        game:GetObjects(v50)[1].Parent = v48;
    end;
    local function v57(v52, v53, v54)
        for _, v56 in pairs(v52:GetChildren()) do
            assert(v56:IsA("BasePart"), "Only BaseParts should be in Folders");
            if string.find(v56.Name, "Right") then
                v51 = true;
            end;
            v48:FindFirstChild("Humanoid"):ReplaceBodyPartR15(v0.R15PartNameToEnum[v56.Name], v56);
            table.insert(v53, v56.Name);
            table.insert(v54, v56);
        end;
    end;
    local v58 = "R15";
    if not (not v46 or not v47) then
        v58 = "R15ArtistIntent";
    end;
    local v59 = {};
    local v60 = {};
    for _, v62 in pairs(v49) do
        if not (not v46 or v62.Name ~= v58) or not v46 and v62.Name == "R6" then
            v57(v62, v60, v59);
        elseif not string.find(v62.Name, "R15") then
            v62.Parent = v48;
        end;
    end;
    if v46 then
        local l_HumanoidRootPart_0 = v48:FindFirstChild("HumanoidRootPart");
        v48.PrimaryPart = l_HumanoidRootPart_0;
        l_HumanoidRootPart_0.CFrame = CFrame.new((Vector3.new(0, 5, 0))) * CFrame.Angles(0, 3.141592653589793, 0);
        l_HumanoidRootPart_0.Anchored = true;
        v48:FindFirstChildOfClass("Humanoid"):BuildRigFromAttachments();
    end;
    return v51, v60;
end;
v0.CreateHeadModel = function(v64)
    local l_Model_0 = Instance.new("Model");
    v64.Name = "Head";
    v64.Parent = l_Model_0;
    local l_Humanoid_5 = Instance.new("Humanoid");
    l_Humanoid_5.RigType = Enum.HumanoidRigType.R15;
    l_Humanoid_5.Parent = l_Model_0;
    l_Humanoid_5.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
    return l_Model_0;
end;
return v0;
