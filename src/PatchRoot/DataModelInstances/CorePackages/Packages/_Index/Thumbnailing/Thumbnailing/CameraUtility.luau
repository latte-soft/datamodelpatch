local v0 = {};
local v1 = require(script.Parent.CFrameUtility);
local v2 = require(script.Parent.VectorUtility);
local v3 = require(script.Parent.CharacterUtility);
v0.DefaultHeadMarginScale = 1.1;
v0.DefaultBodyMarginScale = 1.1;
v0.DefaultBodyPartMarginScale = 1.2;
v0.XRotForFullBody = 15;
v0.XRotForCloseup = 0;
v0.DistanceScaleForFullBody = 1;
local v4 = CFrame.fromEulerAnglesYXZ(-0.3490658503988659, 0.3490658503988659, 0);
local v5 = CFrame.fromEulerAnglesYXZ(-0.3490658503988659, -0.3490658503988659, 0);
local v6 = CFrame.Angles(0.4363323129985824, 0.4363323129985824, 0);
local v7 = CFrame.Angles(0, 1.5707963267948966, 0);
local v8 = CFrame.Angles(0, -1.5707963267948966, 0);
v0.GetCameraCFrame = function(v9, v10)
    return CFrame.lookAt(v9 * v10, v9.Position);
end;
v0.CreateThumbnailCamera = function()
    local l_Camera_0 = Instance.new("Camera");
    l_Camera_0.Name = "ThumbnailCamera";
    l_Camera_0.CameraType = Enum.CameraType.Scriptable;
    l_Camera_0.Parent = workspace:GetChildren()[1];
    return l_Camera_0;
end;
v0.CalculateBaseDistanceToCamera = function(v12, v13, v14, v15)
    return (math.max((v14.X - v13.X) / 2, (v14.Y - v13.Y) / 2) * v15) / math.tan(v12 / 2);
end;
v0.SetupCamera = function(v16, v17)
    if v17.optFieldOfView then
        v16.FieldOfView = v17.optFieldOfView;
    end;
    local v18 = v0.CalculateBaseDistanceToCamera(math.rad(v17.optFieldOfViewForDistanceScale or v16.FieldOfView), v17.minExtent, v17.maxExtent, v17.extentScale);
    if v17.optCameraDistanceScale then
        v18 = v18 * v17.optCameraDistanceScale;
    end;
    v16.CFrame = v0.GetCameraCFrame(v1.AdjustTargetCFrameWithExtents(v17.targetCFrame, v17.minExtent, v17.maxExtent), (v2.Vector3FromXYRotPlusDistance(v17.optCameraXRot or 0, v17.optCameraYRot or 0, v18)));
end;
v0.SetupBodyPartCamera = function(v19, v20, v21, v22)
    local v23 = {};
    if #v21 > 0 then
        for _, v25 in pairs(v21) do
            local l_v19_FirstChild_0 = v19:FindFirstChild(v25, true);
            if l_v19_FirstChild_0 then
                table.insert(v23, l_v19_FirstChild_0);
            end;
        end;
    end;
    local v27 = if not v20 then v4 else v5 * v19:FindFirstChild("HumanoidRootPart").CFrame;
    local v28, v29 = v3.CalculateBodyPartsExtents(v27, v23);
    v0.SetupCamera(v22, {
        optFieldOfView = 30, 
        targetCFrame = v27, 
        minExtent = v28, 
        maxExtent = v29, 
        extentScale = v0.DefaultBodyPartMarginScale
    });
end;
v0.SetupHeadCamera = function(v30, v31)
    local v32 = CFrame.fromEulerAnglesYXZ(0.2617993877991494, 0.5235987755982988, 0) * v1.CalculateTargetCFrame(v30:FindFirstChild("Head").CFrame);
    local v33, v34 = v3.CalculateHeadExtents(v30, v32);
    v0.SetupCamera(v31, {
        optFieldOfView = 30, 
        targetCFrame = v32, 
        minExtent = v33, 
        maxExtent = v34, 
        extentScale = 1.1
    });
end;
local function _(v35)
    local l_MeshPart_0 = v35:FindFirstChildWhichIsA("MeshPart");
    if l_MeshPart_0 then
        assert(l_MeshPart_0, "Assert handle is not nil to silence type checker");
        return l_MeshPart_0:FindFirstChild("LeftFootAttachment") ~= nil;
    else
        return false;
    end;
end;
local function _(v38)
    local l_MeshPart_1 = v38:FindFirstChildWhichIsA("MeshPart");
    if l_MeshPart_1 then
        assert(l_MeshPart_1, "Assert handle is not nil to silence type checker");
        return l_MeshPart_1:FindFirstChild("RightFootAttachment") ~= nil;
    else
        return false;
    end;
end;
local function _(v41)
    local l_MeshPart_2 = v41:FindFirstChildWhichIsA("MeshPart");
    local v43;
    if l_MeshPart_2 then
        assert(l_MeshPart_2, "Assert handle is not nil to silence type checker");
        v43 = l_MeshPart_2:FindFirstChild("LeftFootAttachment") ~= nil;
    else
        v43 = false;
    end;
    if not v43 then
        l_MeshPart_2 = v41:FindFirstChildWhichIsA("MeshPart");
        if l_MeshPart_2 then
            assert(l_MeshPart_2, "Assert handle is not nil to silence type checker");
            v43 = l_MeshPart_2:FindFirstChild("RightFootAttachment") ~= nil;
        else
            v43 = false;
        end;
        if not v43 then
            return v6;
        else
            return v8;
        end;
    else
        return v7;
    end;
end;
v0.SetupAccessoryCamera = function(v45, v46)
    local l_v45_Children_0 = v45:GetChildren();
    assert(#l_v45_Children_0 == 1, "Assert SetupMeshPartAccessoryCamera accessoryModel only has accessory as a child.");
    local v48 = l_v45_Children_0[1];
    local l_Handle_0 = v48:FindFirstChild("Handle");
    assert(l_Handle_0, "Assert Accessory has handle for camera setup.");
    l_Handle_0.CFrame = CFrame.new();
    local l_CFrame_0 = l_Handle_0.CFrame;
    local l_MeshPart_3 = v48:FindFirstChildWhichIsA("MeshPart");
    local v52;
    if l_MeshPart_3 then
        assert(l_MeshPart_3, "Assert handle is not nil to silence type checker");
        v52 = l_MeshPart_3:FindFirstChild("LeftFootAttachment") ~= nil;
    else
        v52 = false;
    end;
    local v53;
    if not v52 then
        l_MeshPart_3 = v48:FindFirstChildWhichIsA("MeshPart");
        if l_MeshPart_3 then
            assert(l_MeshPart_3, "Assert handle is not nil to silence type checker");
            v52 = l_MeshPart_3:FindFirstChild("RightFootAttachment") ~= nil;
        else
            v52 = false;
        end;
        v53 = if not v52 then v6 else v8;
    else
        v53 = v7;
    end;
    local v54 = l_CFrame_0 * v53;
    l_CFrame_0, v53 = v3.CalculateModelExtents(v45, v54);
    v0.SetupCamera(v46, {
        optFieldOfView = 20, 
        targetCFrame = v54, 
        minExtent = l_CFrame_0, 
        maxExtent = v53, 
        extentScale = 1.1
    });
end;
return v0;
