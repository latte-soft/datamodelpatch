local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.util.pcallDeferred);
local v3 = require(l_Parent_0.flags.getFFlagUGCValidationShouldYield);
local v4 = require(l_Parent_0.Analytics);
local v5 = require(l_Parent_0.Constants);
local v6 = require(l_Parent_0.validation.validateMeshComparison);
local v7 = require(l_Parent_0.util.getMeshSize);
local v8 = require(l_Parent_0.util.getEditableMeshFromContext);
local v9 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v10 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local v11 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local function v21(v12, v13, v14, v15, v16, v17)
    local v18 = {
        fullName = v12:GetFullName(), 
        contentId = v14, 
        fieldName = v13, 
        context = v16, 
        scale = v15
    };
    if v11() then
        local v19, v20 = v8(v12, v13, v17);
        if v19 then
            v18.editableMesh = v20;
        else
            return false, v18;
        end;
    end;
    return true, v18;
end;
local function v25(v22, v23, v24)
    if not v22:IsA("WrapTarget") then
        if not v22:IsA("MeshPart") then
            return false;
        else
            return v21(v22, "MeshId", v22.MeshId, v23, v22.Name, v24);
        end;
    else
        return v21(v22, "CageMeshId", v22.CageMeshId, v23, v22.ClassName, v24);
    end;
end;
local function _(v26)
    if not v26:IsA("WrapTarget") then
        if not v26:IsA("MeshPart") then
            return nil;
        else
            return v26.MeshId;
        end;
    else
        return v26.CageMeshId;
    end;
end;
local function v36(v28, v29, v30)
    local v31, v32 = v25(v29, v28, v30);
    if v31 then
        local l_WrapTarget_0 = v29:FindFirstChildWhichIsA("WrapTarget");
        assert(l_WrapTarget_0, "Missing WrapTarget child for " .. v29.Name);
        local v34, v35 = v25(l_WrapTarget_0, v28, v30);
        if v34 then
            return v6(v32, v35, v5.RenderVsWrapMeshMaxDiff, v30);
        else
            return false, {
                "Failed to load mesh data"
            };
        end;
    else
        return false, {
            "Failed to load mesh data"
        };
    end;
end;
local function v42(v37, v38, v39)
    local v40 = if not v38:IsA("WrapTarget") then if v38:IsA("MeshPart") then v38.MeshId else nil else v38.CageMeshId;
    assert(v40);
    local l_WrapTarget_1 = v38:FindFirstChildWhichIsA("WrapTarget");
    assert(l_WrapTarget_1, "Missing WrapTarget child for " .. v38.Name);
    return v6({
        id = v40, 
        scale = v37, 
        context = v38.Name
    }, {
        id = if not l_WrapTarget_1:IsA("WrapTarget") then if l_WrapTarget_1:IsA("MeshPart") then l_WrapTarget_1.MeshId else nil else l_WrapTarget_1.CageMeshId, 
        scale = v37, 
        context = l_WrapTarget_1.ClassName
    }, v5.RenderVsWrapMeshMaxDiff, v39);
end;
local function v54(v43, v44)
    local v45 = {
        fullName = v43:GetFullName(), 
        fieldName = "MeshId", 
        contentId = v43.MeshId, 
        context = v43.Name
    };
    if v11() then
        local v46, v47 = v8(v43, "MeshId", v44);
        if v46 then
            v45.editableMesh = v47;
        else
            return false, {
                string.format("Mesh for '%s' failed to load. Make sure the mesh exists and try again.", v45.fullName)
            };
        end;
    end;
    local v48 = nil;
    local v49 = nil;
    if not v3() then
        local l_status_0, l_result_0 = pcall(v7, v45);
        v48 = l_status_0;
        v49 = l_result_0;
    else
        local v52, v53 = v2(function()
            return v7(v45);
        end, v44);
        v48 = v52;
        v49 = v53;
    end;
    if v48 then
        return true, nil, v49;
    else
        v4.reportFailure(v4.ErrorType.validateBodyPartMeshBounds_FailedToLoadMesh);
        if v44.isServer then
            error("Failed to read mesh");
        end;
        return false, {
            "Failed to read mesh"
        };
    end;
end;
local function v59(v55, v56)
    local l_status_1, l_result_1 = pcall(v7, v55.MeshId);
    if l_status_1 then
        return true, nil, l_result_1;
    else
        v4.reportFailure(v4.ErrorType.validateBodyPartMeshBounds_FailedToLoadMesh);
        if v56 then
            error("Failed to read mesh");
        end;
        return false, {
            "Failed to read mesh"
        };
    end;
end;
local function v67(v60, v61)
    local v62, v63, v64 = v54(v60, v61);
    if v62 and v64 then
        local v65 = v60.Size / v64;
        local v66 = v9.new();
        v66:updateReasons(v36(v65, v60, v61));
        return v66:getFinalResults();
    else
        return v62, v63;
    end;
end;
local function v76(v68, _, v70)
    local v71, v72, v73 = v59(v68, v70);
    if v71 and v73 then
        local v74 = v68.Size / v73;
        local v75 = v9.new();
        v75:updateReasons(v42(v74, v68, v70));
        return v75:getFinalResults();
    else
        return v71, v72;
    end;
end;
local function v84(v77, v78)
    local l_assetTypeEnum_0 = v78.assetTypeEnum;
    local v80 = v5.ASSET_TYPE_INFO[l_assetTypeEnum_0];
    if Enum.AssetType.DynamicHead == l_assetTypeEnum_0 then
        return v67(v77, v78);
    else
        local v81 = v9.new();
        for v82 in pairs(v80.subParts) do
            local l_v77_FirstChild_0 = v77:FindFirstChild(v82);
            assert(l_v77_FirstChild_0);
            v81:updateReasons(v67(l_v77_FirstChild_0, v78));
        end;
        return v81:getFinalResults();
    end;
end;
local function v93(v85, v86, v87)
    local v88 = v5.ASSET_TYPE_INFO[v86];
    if Enum.AssetType.DynamicHead == v86 then
        return v76(v85, v88.subParts.Head, v87);
    else
        local v89 = v9.new();
        for v90, v91 in pairs(v88.subParts) do
            local l_v85_FirstChild_0 = v85:FindFirstChild(v90);
            assert(l_v85_FirstChild_0);
            v89:updateReasons(v76(l_v85_FirstChild_0, v91, v87));
        end;
        return v89:getFinalResults();
    end;
end;
if not v10() then
    return v93;
else
    return v84;
end;
