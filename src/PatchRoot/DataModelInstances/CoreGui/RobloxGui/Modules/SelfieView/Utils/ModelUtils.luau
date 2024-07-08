local l_CollectionService_0 = game:GetService("CollectionService");
local l_game_EngineFeature_0 = game:GetEngineFeature("AvatarJointUpgradeFeature");
local v2 = game:DefineFastFlag("SelfViewLookUpHumanoidByType", false);
local v3 = {
    Accessory = "Accessory", 
    CharacterMesh = "CharacterMesh", 
    Decal = "Decal", 
    MeshPart = "MeshPart", 
    Pants = "Pants", 
    Part = "Part", 
    Shirt = "Shirt", 
    ShirtGraphic = "ShirtGraphic", 
    SpecialMesh = "SpecialMesh", 
    SurfaceAppearance = "SurfaceAppearance"
};
local function v5(v4)
    if v4 == nil then
        return ;
    else
        return (v4:FindFirstChildWhichIsA("FaceControls", true));
    end;
end;
local function v10(v6, v7)
    if not (v6 ~= nil) or v7 == nil then
        return nil;
    else
        for _, v9 in (v6:GetDescendants()), nil, nil do
            if v9:IsA("Motor6D") and (not (v9.Part1 ~= v7) or v9.Name == "Neck") then
                return v9;
            end;
        end;
        return nil;
    end;
end;
local function v16(v11, v12, v13)
    for _, v15 in (v13:GetDescendants()), nil, nil do
        if not (not (v15.Name == v11) or not v15:IsA(v12)) then
            return v15;
        end;
    end;
    return nil;
end;
local function v20(v17)
    if v17 then
        local v18 = nil;
        local v19 = if v17 == nil then nil else v17:FindFirstChildWhichIsA("FaceControls", true);
        if v19 ~= nil then
            v18 = v19.Parent;
        end;
        if not v18 then
            v18 = v16("Head", "MeshPart", v17);
        end;
        if not v18 then
            v18 = v16("Head", "Part", v17);
        end;
        return v18;
    else
        return nil;
    end;
end;
local function v26(v21, v22)
    local v23 = nil;
    local v24 = nil;
    if v22 > 0 then
        if not v2 then
            v24 = v21:WaitForChild("Humanoid", v22);
        else
            local v25 = v21:WaitForChild("Humanoid", v22);
            v24 = if not v25:IsA("Humanoid") then v21:FindFirstChildWhichIsA("Humanoid") else v25;
        end;
    else
        v24 = if not v2 then v21:FindFirstChild("Humanoid") else v21:FindFirstChildWhichIsA("Humanoid");
    end;
    if v24 ~= nil then
        v23 = if v22 > 0 then v24:WaitForChild("Animator", v22) else v24:FindFirstChild("Animator");
    end;
    if v23 == nil then
        v23 = v21:FindFirstChildWhichIsA("Animator", true);
    end;
    return v23;
end;
local v27 = {
    "Head", 
    "UpperTorso", 
    "LowerTorso", 
    "Torso", 
    "LeftFoot", 
    "LeftLowerLeg", 
    "LeftUpperLeg", 
    "RightFoot", 
    "RightLowerLeg", 
    "RightUpperLeg", 
    "LeftHand", 
    "LeftLowerArm", 
    "LeftUpperArm", 
    "RightHand", 
    "RightLowerArm", 
    "RightUpperArm"
};
local function v32(v28, v29)
    for _, v31 in ipairs(v28:GetDescendants()) do
        if not v31:IsA("Decal") then
            if not v31:IsA("MeshPart") then
                if not (not v31:IsA("Part") or not (v31.Parent and v31.Parent:IsA("Accessory")) and not table.find(v27, v31.Name)) then
                    v31.Transparency = 0;
                end;
            elseif not (not (v31.Parent and v31.Parent:IsA("Accessory")) and not table.find(v27, v31.Name)) then
                if table.find(v29, v31.MeshId) then
                    v31.Transparency = v29[v31.MeshId];
                else
                    v29[v31.MeshId] = v31.Transparency;
                end;
            end;
        else
            v31.Transparency = 0;
        end;
    end;
end;
local function v34(v33)
    if not (v33:IsA("MeshPart") or v33:IsA("Part")) and not v33:IsA("Decal") then
        if v3[v33.ClassName] then
            return true;
        end;
    elseif v33.Transparency < 1 then
        return true;
    end;
    return false;
end;
local function v38(v35)
    for _, v37 in ipairs(v35:GetDescendants()) do
        if v37:IsA("Motor6D") then
            v37.C0 = CFrame.new(v37.C0.Position);
            v37.C1 = CFrame.new(v37.C1.Position);
        end;
    end;
end;
local function _(v39, v40)
    local l_v39_FirstChild_0 = v39:FindFirstChild(v40);
    if l_v39_FirstChild_0 then
        l_v39_FirstChild_0:Destroy();
    end;
end;
local function v47(v43)
    local l_Animate_0 = v43:FindFirstChild("Animate");
    if l_Animate_0 then
        l_Animate_0:Destroy();
    end;
    l_Animate_0 = v43:FindFirstChild("Health");
    if l_Animate_0 then
        l_Animate_0:Destroy();
    end;
    for _, v46 in pairs(v43:GetDescendants()) do
        if v46:IsA("BaseScript") then
            v46:Destroy();
        end;
    end;
end;
local function v56(v48)
    for _, v50 in ipairs((l_CollectionService_0:GetTags(v48))) do
        l_CollectionService_0:RemoveTag(v48, v50);
    end;
    for _, v52 in ipairs(v48:GetDescendants()) do
        for _, v54 in ipairs((l_CollectionService_0:GetTags(v52))) do
            l_CollectionService_0:RemoveTag(v52, v54);
        end;
    end;
    local _ = l_CollectionService_0:GetTags(v48);
end;
local v57 = {
    Accessory = "Accessory", 
    Animator = "Animator", 
    Attachment = "Attachment", 
    AnimationConstraint = if not l_game_EngineFeature_0 then nil else "AnimationConstraint", 
    BallSocketConstraint = if not l_game_EngineFeature_0 then nil else "BallSocketConstraint", 
    BodyColors = "BodyColors", 
    CharacterMesh = "CharacterMesh", 
    Decal = "Decal", 
    FaceControls = "FaceControls", 
    Humanoid = "Humanoid", 
    HumanoidDescription = "HumanoidDescription", 
    MeshPart = "MeshPart", 
    Motor6D = "Motor6D", 
    NumberValue = "NumberValue", 
    Pants = "Pants", 
    Part = "Part", 
    Shirt = "Shirt", 
    ShirtGraphic = "ShirtGraphic", 
    SpecialMesh = "SpecialMesh", 
    StringValue = "StringValue", 
    SurfaceAppearance = "SurfaceAppearance", 
    Vector3Value = "Vector3Value", 
    WrapTarget = "WrapTarget", 
    Weld = "Weld", 
    WrapLayer = "WrapLayer", 
    WeldConstraint = "WeldConstraint", 
    AccessoryWeld = "AccessoryWeld", 
    PackageLink = "PackageLink"
};
local function v58(v59)
    for _, v61 in v59:GetChildren() do
        if v61:IsA("Script") then
            v61.Disabled = true;
            v61.Parent = nil;
        end;
        v58(v61);
    end;
end;
local function v62(v63)
    for _, v65 in v63:GetChildren() do
        if not (not (((v65:IsA("GuiObject") or v65:IsA("ScreenGui")) or v65:IsA("BillboardGui")) or v65:IsA("AdGui")) and not v65:IsA("SurfaceGui")) then
            v65.Parent = nil;
        end;
        v62(v65);
    end;
end;
local function v66(v67)
    for _, v69 in v67:GetChildren() do
        if not v57[v69.ClassName] then
            v69.Parent = nil;
        end;
        v66(v69);
    end;
end;
return {
    getFaceControls = v5, 
    getNeck = v10, 
    getHead = v20, 
    getAnimator = v26, 
    updateTransparency = v32, 
    shouldMarkCloneDirtyForDescendant = v34, 
    resetPartOrientation = v38, 
    removeScripts = v47, 
    removeTags = v56, 
    sanitizeCharacter = function(v70)
        if v70 then
            v66(v70);
            return ;
        else
            return ;
        end;
    end, 
    isValidAvatar = function(v71)
        if v26(v71, 10) then
            local v72;
            if v71 then
                local v73 = nil;
                local v74 = if v71 == nil then nil else v71:FindFirstChildWhichIsA("FaceControls", true);
                if v74 ~= nil then
                    v73 = v74.Parent;
                end;
                if not v73 then
                    v73 = v16("Head", "MeshPart", v71);
                end;
                if not v73 then
                    v73 = v16("Head", "Part", v71);
                end;
                v72 = v73;
            else
                v72 = nil;
            end;
            if v72 then
                return true;
            else
                return false;
            end;
        else
            return false;
        end;
    end, 
    hasDynamicHead = function(v75)
        return if v75 == nil then nil else v75:FindFirstChildWhichIsA("FaceControls", true) ~= nil;
    end
};
