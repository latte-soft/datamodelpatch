local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local v2 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local v3 = require(l_Parent_0.flags.getFFlagDebugUGCDisableSurfaceAppearanceTests);
local v4 = require(l_Parent_0.flags.getFFlagUGCValidateBodyPartsCollisionFidelity);
local v5 = require(l_Parent_0.flags.getFFlagUGCValidateBodyPartsModeration);
local v6 = require(l_Parent_0.flags.getFFlagUGCValidationFixResetPhysicsError);
local v7 = require(l_Parent_0.validation.validateBodyPartMeshBounds);
local v8 = require(l_Parent_0.validation.validateAssetBounds);
local v9 = require(l_Parent_0.validation.validateBodyPartChildAttachmentBounds);
local v10 = require(l_Parent_0.validation.validateDependencies);
local v11 = require(l_Parent_0.validation.validateDescendantMeshMetrics);
local v12 = require(l_Parent_0.validation.validateDescendantTextureMetrics);
local v13 = require(l_Parent_0.validation.validateSurfaceAppearances);
local v14 = require(l_Parent_0.validation.validateMaterials);
local v15 = require(l_Parent_0.validation.validateTags);
local v16 = require(l_Parent_0.validation.validateProperties);
local v17 = require(l_Parent_0.validation.validateAttributes);
local v18 = require(l_Parent_0.validation.validateHSR);
local v19 = require(l_Parent_0.validation.validateBodyPartCollisionFidelity);
local v20 = require(l_Parent_0.validation.validateModeration);
local v21 = require(l_Parent_0.validation.validateAssetTransparency);
local v22 = require(l_Parent_0.util.validateWithSchema);
local v23 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v24 = require(l_Parent_0.util.resetPhysicsData);
local _ = require(l_Parent_0.util.Types);
local function v41(v26, v27, v28)
    local l_isServer_0 = v28.isServer;
    local l_assetTypeEnum_0 = v28.assetTypeEnum;
    local l_allowUnreviewedAssets_0 = v28.allowUnreviewedAssets;
    local v32 = not not v28.bypassFlags and v28.bypassFlags.skipSnapshot;
    local l_restrictedUserIds_0 = v28.restrictedUserIds;
    if not v6() then
        local v34, v35 = v24({
            v26
        }, v28);
        if not v34 then
            return false, {
                v35
            };
        end;
    end;
    local v36 = v22(v27, v26);
    if v36.success then
        if not v3() then
            local v37, v38 = v13(v26);
            if not v37 then
                return v37, v38;
            end;
        end;
        local v39, v40 = v10(v26, v28);
        if v39 then
            if v6() then
                v39, v40 = v24({
                    v26
                }, v28);
                if not v39 then
                    return false, {
                        v40
                    };
                end;
            end;
            v39 = v23.new();
            v39:updateReasons(v7(v26, v28));
            v39:updateReasons(v9(v26, v28));
            v39:updateReasons(v8(nil, v26, v28));
            v39:updateReasons(v11(v26, v28));
            v39:updateReasons(v12(v26, v28));
            v39:updateReasons(v18(v26, v28));
            if not v32 then
                v39:updateReasons(v21(v26, l_assetTypeEnum_0, l_isServer_0));
            end;
            v39:updateReasons(v14(v26));
            v39:updateReasons(v16(v26));
            if v4() then
                v39:updateReasons(v19(v26));
            end;
            v39:updateReasons(v15(v26));
            v39:updateReasons(v17(v26));
            if v5() then
                v40 = not l_isServer_0;
                if l_allowUnreviewedAssets_0 then
                    v40 = false;
                end;
                if v40 then
                    v39:updateReasons(v20(v26, l_restrictedUserIds_0));
                end;
            end;
            return v39:getFinalResults();
        else
            return v39, v40;
        end;
    else
        v1.reportFailure(v1.ErrorType.validateMeshPartBodyPart_ValidateWithSchema);
        return false, {
            string.format("Body part '%s' does not follow R15 schema. The specific issues are: ", v26.Name), 
            v36.message
        };
    end;
end;
local function v54(v42, v43, v44, v45, v46, v47, v48)
    if not v6() then
        v24({
            v42
        });
    end;
    local v49 = v22(v43, v42);
    if v49.success then
        if not v3() then
            local v50, v51 = v13(v42);
            if not v50 then
                return v50, v51;
            end;
        end;
        local v52, v53 = v10(v42, v45, v46, v47, v48);
        if v52 then
            if v6() then
                v52, v53 = v24({
                    v42
                }, v45);
                if not v52 then
                    return false, {
                        v53
                    };
                end;
            end;
            v52 = v23.new();
            v52:updateReasons(v7(v42, v44, v45));
            v52:updateReasons(v9(v42, v44, v45));
            v52:updateReasons(v8(nil, v42, v44, v45));
            v52:updateReasons(v11(v42, v44, v45));
            v52:updateReasons(v12(v42, v45));
            v52:updateReasons(v18(v42));
            v52:updateReasons(v21(v42, v44, v45));
            v52:updateReasons(v14(v42));
            v52:updateReasons(v16(v42));
            if v4() then
                v52:updateReasons(v19(v42));
            end;
            v52:updateReasons(v15(v42));
            v52:updateReasons(v17(v42));
            if v5() then
                v53 = not v45;
                if v46 then
                    v53 = false;
                end;
                if v53 then
                    v52:updateReasons(v20(v42, v47));
                end;
            end;
            return v52:getFinalResults();
        else
            return v52, v53;
        end;
    else
        v1.reportFailure(v1.ErrorType.validateMeshPartBodyPart_ValidateWithSchema);
        return false, {
            v49.message
        };
    end;
end;
if not v2() then
    return v54;
else
    return v41;
end;
