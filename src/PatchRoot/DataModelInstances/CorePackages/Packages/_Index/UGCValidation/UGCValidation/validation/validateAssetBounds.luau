local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.flags.getFFlagUGCValidateFullBody);
local v2 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local v3 = require(l_Parent_0.flags.getFFlagUGCValidateMinBoundsOnlyMesh);
local v4 = require(l_Parent_0.flags.getFFlagUGCValidationRefactorAssetTraversal);
local v5 = require(l_Parent_0.flags.getFFlagUGCValidateAccessoriesScaleType);
local v6 = require(l_Parent_0.Analytics);
local v7 = require(l_Parent_0.Constants);
local v8 = require(l_Parent_0.ConstantsInterface);
local v9 = require(l_Parent_0.util.prettyPrintVector3);
local v10 = require(l_Parent_0.util.calculateMinMax);
local _ = require(l_Parent_0.util.Types);
local v12 = require(l_Parent_0.util.AssetTraversalUtils);
local v13 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v14 = require(l_Parent_0.validation.validateScaleType);
local v15 = nil;
v15 = if not v4() then {
    [Enum.AssetType.DynamicHead] = {
        root = "Head"
    }, 
    [Enum.AssetType.Torso] = {
        root = "LowerTorso", 
        children = {
            UpperTorso = {}
        }
    }, 
    [Enum.AssetType.LeftArm] = {
        root = "LeftUpperArm", 
        children = {
            LeftLowerArm = {
                children = {
                    LeftHand = {}
                }
            }
        }
    }, 
    [Enum.AssetType.RightArm] = {
        root = "RightUpperArm", 
        children = {
            RightLowerArm = {
                children = {
                    RightHand = {}
                }
            }
        }
    }, 
    [Enum.AssetType.LeftLeg] = {
        root = "LeftUpperLeg", 
        children = {
            LeftLowerLeg = {
                children = {
                    LeftFoot = {}
                }
            }
        }
    }, 
    [Enum.AssetType.RightLeg] = {
        root = "RightUpperLeg", 
        children = {
            RightLowerLeg = {
                children = {
                    RightFoot = {}
                }
            }
        }
    }
} else v12.assetHierarchy;
local v16 = {
    root = "LowerTorso", 
    children = {
        UpperTorso = {
            children = {
                Head = v15[Enum.AssetType.DynamicHead], 
                LeftUpperArm = v15[Enum.AssetType.LeftArm], 
                RightUpperArm = v15[Enum.AssetType.RightArm]
            }
        }, 
        LeftUpperLeg = v15[Enum.AssetType.LeftLeg], 
        RightUpperLeg = v15[Enum.AssetType.RightLeg]
    }
};
local function v29(v17, v18, v19, v20)
    local v21, v22 = v10(v20.minMeshCorner, v20.maxMeshCorner, v19:PointToWorldSpace(-(v18.Size / 2)), v19:PointToWorldSpace(-(v18.Size / 2)));
    v20.minMeshCorner = v21;
    v20.maxMeshCorner = v22;
    v21, v22 = v10(v20.minMeshCorner, v20.maxMeshCorner, v19:PointToWorldSpace(v18.Size / 2), v19:PointToWorldSpace(v18.Size / 2));
    v20.minMeshCorner = v21;
    v20.maxMeshCorner = v22;
    for _, v24 in v8.getAttachments(v17, v18.Name) do
        local l_v18_FirstChild_0 = v18:FindFirstChild(v24);
        assert(l_v18_FirstChild_0);
        if string.match(l_v18_FirstChild_0.Name, "RigAttachment$") ~= nil then
            local v26 = v19 * l_v18_FirstChild_0.CFrame;
            local v27, v28 = v10(v20.minRigAttachment, v20.maxRigAttachment, v26.Position, v26.Position);
            v20.minRigAttachment = v27;
            v20.maxRigAttachment = v28;
        end;
    end;
    v21, v22 = v10(v20.minOverall, v20.maxOverall, v20.minMeshCorner, v20.maxMeshCorner);
    v20.minOverall = v21;
    v20.maxOverall = v22;
    v21, v22 = v10(v20.minOverall, v20.maxOverall, v20.minRigAttachment, v20.maxRigAttachment);
    v20.minOverall = v21;
    v20.maxOverall = v22;
end;
local function v30(v31, v32, v33, v34, v35, v36, v37, v38)
    if v1() then
        assert((v31 ~= nil) ~= ((v32 and v33) ~= nil));
    end;
    local v39 = nil;
    v39 = if not not v1() and v31 then v31[v36] else v32:FindFirstChild(v36);
    assert(v39);
    local l_v35_0 = v35;
    if not v34 then
        l_v35_0 = CFrame.new();
    else
        local v41 = nil;
        v41 = if not not v1() and v31 then v31[v34] else v32:FindFirstChild(v34);
        assert(v41);
        local v42 = v8.getRigAttachmentToParent(v33, v36);
        local l_v41_FirstChild_0 = v41:FindFirstChild(v42);
        assert(l_v41_FirstChild_0);
        local l_v39_FirstChild_0 = v39:FindFirstChild(v42);
        assert(l_v39_FirstChild_0);
        l_v35_0 = (l_v35_0 * l_v41_FirstChild_0.CFrame) * l_v39_FirstChild_0.CFrame:Inverse();
    end;
    v29(v33, v39, l_v35_0, v38);
    if v37.children then
        for v45, v46 in v37.children, nil, nil do
            v30(v31, v32, v33, v36, l_v35_0, v45, v46, v38);
        end;
    end;
end;
local function v56(v47, v48, v49, v50)
    if v1() then
        assert((v47 ~= nil) ~= ((v48 and v49) ~= nil));
    end;
    if not v1() or not v47 then
        local v51 = v7.ASSET_TYPE_INFO[v49];
        assert(v51);
        if Enum.AssetType.DynamicHead == v49 then
            return v50(v48);
        else
            for v52 in pairs(v51.subParts) do
                local l_v48_FirstChild_0 = v48:FindFirstChild(v52);
                assert(l_v48_FirstChild_0);
                if not v50(l_v48_FirstChild_0) then
                    return false;
                end;
            end;
        end;
    else
        for _, v55 in v47, nil, nil do
            if not v50(v55) then
                return false;
            end;
        end;
    end;
    return true;
end;
local function v65(v57, v58, v59)
    if v1() then
        assert((v57 ~= nil) ~= ((v58 and v59) ~= nil));
    end;
    local v60 = nil;
    if v56(v57, v58, v59, function(v61)
        local l_AvatarPartScaleType_0 = v61:FindFirstChild("AvatarPartScaleType");
        assert(l_AvatarPartScaleType_0);
        if v60 then
            if not v5() then
                return v60 == l_AvatarPartScaleType_0.Value;
            else
                return v60.Value == l_AvatarPartScaleType_0.Value;
            end;
        else
            v60 = if not v5() then l_AvatarPartScaleType_0.Value else l_AvatarPartScaleType_0;
            return true;
        end;
    end) then
        if not v5() then
            if v7.AvatarPartScaleTypes[v60] then
                return true, nil, v60;
            else
                v6.reportFailure(v6.ErrorType.validateAssetBounds_InvalidAvatarPartScaleType);
                return false, {
                    "The Value of all MeshParts AvatarPartScaleType children must be either Classic, ProportionsSlender, or ProportionsNormal"
                }, nil;
            end;
        else
            local v63, v64 = v14(v60);
            return v63, v64, if not v63 then nil else v60.Value;
        end;
    else
        v6.reportFailure(v6.ErrorType.validateAssetBounds_InconsistentAvatarPartScaleType);
        if not v2() then
            return false, {
                "All MeshParts must have the same Value in their AvatarPartScaleType child"
            }, nil;
        else
            return false, {
                "All MeshParts must have the same value in their AvatarPartScaleType child. Please verify the values match."
            }, nil;
        end;
    end;
end;
local function v70(v66, v67, v68)
    local v69 = false;
    if v67.X <= v66.X then
        v69 = false;
        if v67.Y <= v66.Y then
            v69 = v67.Z <= v66.Z;
        end;
    end;
    if v69 then
        return true;
    else
        v6.reportFailure(v6.ErrorType.validateAssetBounds_AssetSizeTooSmall);
        if not v2() then
            return false, {
                if not v1() or v68 then string.format("Asset size is [%s], which is too small Min size is [%s]", v9(v66), v9(v67))
            };
        else
            return false, {
                if not v1() or v68 then string.format("%s asset size is smaller than the min allowed bounding size of '%s'. You need to scale up or remodel the asset.", v68.Name, v9(v67)) else string.format("Full body size is smaller than the min allowed bounding size of '%s'. You need to scale up or remodel the asset.", v9(v67))
            };
        end;
    end;
end;
local function v75(v71, v72, v73)
    local v74 = false;
    if v71.X <= v72.X then
        v74 = false;
        if v71.Y <= v72.Y then
            v74 = v71.Z <= v72.Z;
        end;
    end;
    if v74 then
        return true;
    else
        v6.reportFailure(v6.ErrorType.validateAssetBounds_AssetSizeTooBig);
        if not v2() then
            return false, {
                if not v1() or v73 then string.format("Asset size is [%s], which is too big Max size is [%s]", v9(v71), v9(v72))
            };
        else
            return false, {
                if not v1() or v73 then string.format("%s asset size is larger than the max allowed bounding size of '%s'. You need to scale down or remodel the asset.", v73.Name, v9(v72)) else string.format("Full body size is larger than the max allowed bounding size of '%s'. You need to scale down or remodel the asset.", v9(v72))
            };
        end;
    end;
end;
return if not v2() then function(v76, v77, v78, _)
    if v1() then
        assert((v76 ~= nil) ~= ((v77 and v78) ~= nil));
    end;
    local v80 = {};
    if not v1() or not v76 then
        if Enum.AssetType.DynamicHead == v78 then
            if not v4() then
                v29(v78, v77, CFrame.new(), v80);
            else
                v12.calculateBounds(v78, v77, CFrame.new(), v80);
            end;
        else
            local v81 = v15[v78];
            if not v4() then
                v30(nil, v77, v78, nil, CFrame.new(), v81.root, v81, v80);
            else
                v12.traverseHierarchy(nil, v77, v78, nil, CFrame.new(), v81.root, v81, v80);
            end;
        end;
    elseif not v4() then
        v30(v76, nil, nil, nil, CFrame.new(), v16.root, v16, v80);
    else
        v12.traverseHierarchy(v76, nil, nil, nil, CFrame.new(), v16.root, v16, v80);
    end;
    local v82, v83, v84 = v65(v76, v77, v78);
    if v82 then
        local v85 = if v1() then nil else v7.ASSET_TYPE_INFO[v78];
        local v86 = v13.new();
        local v87 = nil;
        local v88 = nil;
        if v1() then
            if not v76 then
                v87 = v7.ASSET_TYPE_INFO[v78].bounds[v84].minSize;
                v88 = v7.ASSET_TYPE_INFO[v78].bounds[v84].maxSize;
            else
                local v89, v90 = v8.calculateFullBodyBounds(v84);
                v87 = v89;
                v88 = v90;
            end;
        end;
        v86:updateReasons(v70(if not v3() then v80.maxOverall - v80.minOverall else v80.maxMeshCorner - v80.minMeshCorner, if not v1() then v85.bounds[v84].minSize else v87, v78));
        v86:updateReasons(v75(v80.maxOverall - v80.minOverall, if not v1() then v85.bounds[v84].maxSize else v88, v78));
        return v86:getFinalResults();
    else
        return v82, v83;
    end;
end else function(v91, v92, v93)
    local v94 = if not v93 then nil else v93.assetTypeEnum;
    if v1() then
        assert((v91 ~= nil) ~= ((v92 and v94) ~= nil));
    end;
    local v95 = {};
    if not v1() or not v91 then
        if Enum.AssetType.DynamicHead == v94 then
            if not v4() then
                v29(v94, v92, CFrame.new(), v95);
            else
                v12.calculateBounds(v94, v92, CFrame.new(), v95);
            end;
        else
            local v96 = v15[v94];
            if not v4() then
                v30(nil, v92, v94, nil, CFrame.new(), v96.root, v96, v95);
            else
                v12.traverseHierarchy(nil, v92, v94, nil, CFrame.new(), v96.root, v96, v95);
            end;
        end;
    elseif not v4() then
        v30(v91, nil, nil, nil, CFrame.new(), v16.root, v16, v95);
    else
        v12.traverseHierarchy(v91, nil, nil, nil, CFrame.new(), v16.root, v16, v95);
    end;
    local v97, v98, v99 = v65(v91, v92, v94);
    if v97 then
        local v100 = if v1() then nil else v7.ASSET_TYPE_INFO[v94];
        local v101 = v13.new();
        local v102 = nil;
        local v103 = nil;
        if v1() then
            if not v91 then
                v102 = v7.ASSET_TYPE_INFO[v94].bounds[v99].minSize;
                v103 = v7.ASSET_TYPE_INFO[v94].bounds[v99].maxSize;
            else
                local v104, v105 = v8.calculateFullBodyBounds(v99);
                v102 = v104;
                v103 = v105;
            end;
        end;
        v101:updateReasons(v70(if not v3() then v95.maxOverall - v95.minOverall else v95.maxMeshCorner - v95.minMeshCorner, if not v1() then v100.bounds[v99].minSize else v102, v94));
        v101:updateReasons(v75(v95.maxOverall - v95.minOverall, if not v1() then v100.bounds[v99].maxSize else v103, v94));
        return v101:getFinalResults();
    else
        return v97, v98;
    end;
end;
