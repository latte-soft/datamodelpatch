local v0 = {};
local function v6(v1)
    local v2 = {};
    local l_Head_0 = v1:FindFirstChild("Head");
    if l_Head_0 then
        for _, v5 in pairs(l_Head_0:GetChildren()) do
            if v5:IsA("Attachment") then
                v2[v5.Name] = true;
            end;
        end;
    end;
    return v2;
end;
local function _(v7, v8, v9, v10, v11)
    return v11 * Vector3.new(v7 * v10.X, v8 * v10.Y, v9 * v10.Z);
end;
local function v16(v13, v14, v15)
    return Vector3.new(math.min(v15.X, v13.X), math.min(v15.Y, v13.Y), (math.min(v15.Z, v13.Z))), (Vector3.new(math.max(v15.X, v14.X), math.max(v15.Y, v14.Y), (math.max(v15.Z, v14.Z))));
end;
local function v31(v17, v18, v19, v20, v21, v22)
    local v23 = v19.Size / 2;
    local v24 = nil;
    for v25 = -1, 1, 2 do
        for v26 = -1, 1, 2 do
            for v27 = -1, 1, 2 do
                v24 = v19.CFrame * Vector3.new(v25 * v23.X, v26 * v23.Y, v27 * v23.Z);
                if not (not v21 or not v22) then
                    local v28 = v21:Inverse() * v24;
                    v24 = v21 * Vector3.new(v28.X, math.max(v22, v28.Y), v28.Z);
                end;
                local v29, v30 = v16(v17, v18, v20 * v24);
                v17 = v29;
                v18 = v30;
            end;
        end;
    end;
    return v17, v18;
end;
local function _()
    return Vector3.new(math.huge, math.huge, math.huge), (Vector3.new(-math.huge, -math.huge, -math.huge));
end;
local function v33(v34, v35, v36, v37, v38)
    if not v38 then
        v38 = "";
    end;
    assert(v38, "indent is non-nil. Silence type checker.");
    v38 = v38 .. "  ";
    for _, v40 in pairs(v36:GetChildren()) do
        if v40:IsA("BasePart") then
            local v41, v42 = v31(v34, v35, v40, v37);
            v34 = v41;
            v35 = v42;
        end;
        local v43, v44 = v33(v34, v35, v40, v37, v38);
        v34 = v43;
        v35 = v44;
    end;
    return v34, v35;
end;
v0.CalculateModelExtents = function(v45, v46)
    local v47, v48 = v33(Vector3.new(math.huge, math.huge, math.huge), Vector3.new(-math.huge, -math.huge, -math.huge), v45, v46:Inverse(), "  ");
    return v47, v48;
end;
v0.CalculateHeadExtents = function(v49, v50)
    local v51 = Vector3.new(math.huge, math.huge, math.huge);
    local v52 = Vector3.new(-math.huge, -math.huge, -math.huge);
    local l_v51_0 = v51;
    local l_v52_0 = v52;
    v51 = v49:FindFirstChild("Head");
    if v51 then
        v52 = v50:Inverse();
        local v55 = -v51.Size.Y / 2;
        local v56, v57 = v31(l_v51_0, l_v52_0, v51, v52);
        l_v51_0 = v56;
        l_v52_0 = v57;
        v56 = v6(v49);
        for _, v59 in pairs(v49:GetChildren()) do
            if v59:IsA("Accoutrement") then
                local l_Handle_0 = v59:FindFirstChild("Handle");
                if l_Handle_0 then
                    local l_Attachment_0 = l_Handle_0:FindFirstChildWhichIsA("Attachment");
                    if not (l_Attachment_0 and not v56[l_Attachment_0.Name]) then
                        local v62, v63 = v31(l_v51_0, l_v52_0, l_Handle_0, v52, v51.CFrame, v55);
                        l_v51_0 = v62;
                        l_v52_0 = v63;
                    end;
                end;
            end;
        end;
        return l_v51_0, l_v52_0;
    else
        return l_v51_0, l_v52_0;
    end;
end;
v0.CalculateBodyPartsExtents = function(v64, v65)
    local v66 = Vector3.new(math.huge, math.huge, math.huge);
    local v67 = Vector3.new(-math.huge, -math.huge, -math.huge);
    local l_v66_0 = v66;
    local l_v67_0 = v67;
    v66 = v64:Inverse();
    for _, v71 in pairs(v65) do
        local v72, v73 = v31(l_v66_0, l_v67_0, v71, v66, v64);
        l_v66_0 = v72;
        l_v67_0 = v73;
    end;
    return l_v66_0, l_v67_0;
end;
v0.AllocateDebugExtentParts = function()
    local v74 = {};
    for v75 = 1, 8 do
        local l_Part_0 = Instance.new("Part");
        l_Part_0.Parent = workspace;
        l_Part_0.Name = "DebugExtentPart" .. tostring(v75);
        l_Part_0.Shape = Enum.PartType.Ball;
        l_Part_0.Size = Vector3.new(0.25, 0.25, 0.25);
        l_Part_0.Anchored = true;
        l_Part_0.CanCollide = false;
        v74[#v74 + 1] = l_Part_0;
    end;
    return v74;
end;
v0.PositionDebugExtentParts = function(v77, v78, v79, v80)
    for v81 = 0, 1 do
        for v82 = 0, 1 do
            for v83 = 0, 1 do
                v77[((v81 + v82 * 2) + v83 * 4) + 1].Position = v80 * Vector3.new(v81 == 0 and v78.X or v79.X, v82 == 0 and v78.Y or v79.Y, v83 == 0 and v78.Z or v79.Z);
            end;
        end;
    end;
end;
return v0;
