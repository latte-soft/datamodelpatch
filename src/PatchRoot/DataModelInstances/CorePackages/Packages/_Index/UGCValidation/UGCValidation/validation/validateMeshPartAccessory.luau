local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.Analytics);
local v3 = require(l_Parent_0.Constants);
local v4 = require(l_Parent_0.validation.validateInstanceTree);
local v5 = require(l_Parent_0.validation.validateMeshTriangles);
local v6 = require(l_Parent_0.validation.validateModeration);
local v7 = require(l_Parent_0.validation.validateMaterials);
local v8 = require(l_Parent_0.validation.validateTags);
local v9 = require(l_Parent_0.validation.validateMeshBounds);
local v10 = require(l_Parent_0.validation.validateTextureSize);
local v11 = require(l_Parent_0.validation.validateProperties);
local v12 = require(l_Parent_0.validation.validateAttributes);
local v13 = require(l_Parent_0.validation.validateMeshVertColors);
local v14 = require(l_Parent_0.validation.validateSingleInstance);
local v15 = require(l_Parent_0.validation.validateCanLoad);
local v16 = require(l_Parent_0.validation.validateThumbnailConfiguration);
local v17 = require(l_Parent_0.validation.validateAccessoryName);
local v18 = require(l_Parent_0.validation.validateSurfaceAppearances);
local v19 = require(l_Parent_0.validation.validateScaleType);
local v20 = require(l_Parent_0.util.createMeshPartAccessorySchema);
local v21 = require(l_Parent_0.util.getAttachment);
local v22 = require(l_Parent_0.util.getMeshSize);
local v23 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v24 = require(l_Parent_0.util.getEditableMeshFromContext);
local v25 = require(l_Parent_0.util.getEditableImageFromContext);
local v26 = require(l_Parent_0.flags.getFFlagUGCValidateMeshVertColors);
local v27 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local v28 = require(l_Parent_0.flags.getFFlagUGCValidateThumbnailConfiguration);
local v29 = require(l_Parent_0.flags.getFFlagUGCValidationNameCheck);
local v30 = require(l_Parent_0.flags.getFFlagUGCValidateAccessoriesScaleType);
local v31 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local function v68(v32)
    assert(v32.assetTypeEnum ~= nil, "assetTypeEnum required in validationContext for validateMeshPartAccessory");
    local l_instances_0 = v32.instances;
    local l_assetTypeEnum_0 = v32.assetTypeEnum;
    local l_isServer_0 = v32.isServer;
    local l_allowUnreviewedAssets_0 = v32.allowUnreviewedAssets;
    local v37 = v3.ASSET_TYPE_INFO[l_assetTypeEnum_0];
    local v38 = nil;
    local v39 = nil;
    local v40, v41 = v14(l_instances_0, v32);
    v38 = v40;
    v39 = v41;
    if v38 then
        v40 = l_instances_0[1];
        local v42, v43 = v4(v20(v37.attachmentNames), v40);
        v38 = v42;
        v39 = v43;
        if v38 then
            if not (not v29() or not l_isServer_0) then
                v42, v43 = v17(v40);
                v38 = v42;
                v39 = v43;
                if not v38 then
                    return false, v39;
                end;
            end;
            v42 = v40:FindFirstChild("Handle");
            v43 = {
                fullName = v42:GetFullName(), 
                fieldName = "MeshId", 
                contentId = v42.MeshId, 
                context = v40.Name
            };
            local v44 = v23.new();
            local v45 = false;
            if v43.contentId ~= nil then
                v45 = v43.contentId ~= "";
            end;
            if v31() then
                local v46, v47 = v24(v42, "MeshId", v32);
                if not v46 then
                    if v43.contentId then
                        v2.reportFailure(v2.ErrorType.validateMeshPartAccessory_FailedToLoadMesh);
                        return false, {
                            string.format("Failed to load mesh for accessory '%s'. Make sure mesh exists and try again.", v40.Name)
                        };
                    else
                        v45 = false;
                        v2.reportFailure(v2.ErrorType.validateMeshPartAccessory_NoMeshId);
                        v44:updateReasons(false, {
                            string.format("Accessory MeshPart '%s' must contain a valid meshId. Make sure the mesh referred to by the meshId exists and try again.", v42:GetFullName())
                        });
                    end;
                end;
                v43.editableMesh = v47;
                v45 = true;
            end;
            local l_TextureID_0 = v42.TextureID;
            local v49 = {
                fullName = v42:GetFullName(), 
                fieldName = "TextureID", 
                contentId = l_TextureID_0
            };
            if not v31() then
                if l_isServer_0 then
                    local v50 = true;
                    local v51 = nil;
                    local v52 = {};
                    if l_TextureID_0 ~= "" then
                        local v53, v54 = v15(l_TextureID_0);
                        v50 = v53;
                        v52 = v54;
                    end;
                    local v55, v56 = v15(v42.MeshId);
                    v51 = v55;
                    v52 = v56;
                    if not (v50 and v51) then
                        error(string.format("Failed to load children assets (Meshes, Textures, etc.) for '%s'. Make sure the assets exist and try again.", v40.Name));
                    end;
                end;
            else
                local v57 = nil;
                local v58 = nil;
                if l_TextureID_0 ~= "" then
                    local v59, v60 = v25(v42, "TextureID", v32);
                    v57 = v59;
                    v58 = v60;
                    if v57 then
                        v49.editableImage = v58;
                    else
                        return false, {
                            string.format("Failed to load texture for accessory '%s'. Make sure texture exists and try again.", v40.Name)
                        };
                    end;
                end;
            end;
            local l_status_0, l_result_0 = pcall(v22, v43);
            if l_status_0 then
                local v63 = v42.Size / l_result_0;
                local v64 = v21(v42, v37.attachmentNames);
                assert(v64);
                local v65 = assert(v37.bounds[v64.Name], "Could not find bounds for " .. v64.Name);
                v44:updateReasons(v7(v40));
                v44:updateReasons(v11(v40));
                v44:updateReasons(v8(v40));
                v44:updateReasons(v12(v40));
                v44:updateReasons(v10(v49, true, v32));
                if v28() then
                    v44:updateReasons(v16(v40, v42, v43, v63));
                end;
                local v66 = not l_isServer_0;
                if l_allowUnreviewedAssets_0 then
                    v66 = false;
                end;
                if v66 then
                    v44:updateReasons(v6(v40, {}));
                end;
                if v45 then
                    v44:updateReasons(v9(v42, v64, v43, v63, v65, l_assetTypeEnum_0.Name, v32));
                    v44:updateReasons(v5(v43, nil, v32));
                    if v26() then
                        v44:updateReasons(v13(v43, false, v32));
                    end;
                end;
                v44:updateReasons(v18(v40));
                if v30() then
                    local l_AvatarPartScaleType_0 = v42:FindFirstChild("AvatarPartScaleType");
                    if not (not l_AvatarPartScaleType_0 or not l_AvatarPartScaleType_0:IsA("StringValue")) then
                        v44:updateReasons(v19(l_AvatarPartScaleType_0));
                    end;
                end;
                return v44:getFinalResults();
            else
                v2.reportFailure(v2.ErrorType.validateMeshPartAccessory_FailedToLoadMesh);
                return false, {
                    string.format("Failed to load mesh for accessory '%s'. Make sure mesh exists and try again.", v40.Name)
                };
            end;
        else
            return false, v39;
        end;
    else
        return false, v39;
    end;
end;
local function v96(v69, v70, v71, v72)
    local v73 = v3.ASSET_TYPE_INFO[v70];
    local v74 = nil;
    local v75 = nil;
    local v76, v77 = v14(v69);
    v74 = v76;
    v75 = v77;
    if v74 then
        v76 = v69[1];
        local v78, v79 = v4(v20(v73.attachmentNames), v76);
        v74 = v78;
        v75 = v79;
        if v74 then
            if not (not v29() or not v71) then
                v78, v79 = v17(v76);
                v74 = v78;
                v75 = v79;
                if not v74 then
                    return false, v75;
                end;
            end;
            v78 = v76:FindFirstChild("Handle");
            v79 = v78.MeshId;
            local l_status_1, l_result_1 = pcall(v22, v79);
            if l_status_1 then
                local v82 = v78.Size / l_result_1;
                local l_TextureID_1 = v78.TextureID;
                local v84 = v21(v78, v73.attachmentNames);
                assert(v84);
                local v85 = assert(v73.bounds[v84.Name], "Could not find bounds for " .. v84.Name);
                if v71 then
                    local v86 = true;
                    local v87 = nil;
                    local v88 = {};
                    if l_TextureID_1 ~= "" then
                        local v89, v90 = v15(l_TextureID_1);
                        v86 = v89;
                        v88 = v90;
                    end;
                    local v91, v92 = v15(v79);
                    v87 = v91;
                    v88 = v92;
                    if not (v86 and v87) then
                        error("Failed to load asset");
                    end;
                end;
                local v93 = v23.new();
                v93:updateReasons(v7(v76));
                v93:updateReasons(v11(v76));
                v93:updateReasons(v8(v76));
                v93:updateReasons(v12(v76));
                v93:updateReasons(v10(l_TextureID_1, true));
                if v28() then
                    v93:updateReasons(v16(v76, v78, v79, v82));
                end;
                local v94 = not v71;
                if v72 then
                    v94 = false;
                end;
                if v94 then
                    v93:updateReasons(v6(v76, {}));
                end;
                if v79 == "" then
                    v2.reportFailure(v2.ErrorType.validateMeshPartAccessory_NoMeshId);
                    v93:updateReasons(false, {
                        "Mesh must contain valid MeshId"
                    });
                else
                    v93:updateReasons(v9(v78, v84, v79, v82, v85, v70.Name));
                    v93:updateReasons(v5(v79));
                    if v26() then
                        v93:updateReasons(v13(v79, false));
                    end;
                end;
                v93:updateReasons(v18(v76));
                if v30() then
                    local l_AvatarPartScaleType_1 = v78:FindFirstChild("AvatarPartScaleType");
                    if not (not l_AvatarPartScaleType_1 or not l_AvatarPartScaleType_1:IsA("StringValue")) then
                        v93:updateReasons(v19(l_AvatarPartScaleType_1));
                    end;
                end;
                return v93:getFinalResults();
            else
                v2.reportFailure(v2.ErrorType.validateMeshPartAccessory_FailedToLoadMesh);
                return false, {
                    "Failed to read mesh"
                };
            end;
        else
            return false, v75;
        end;
    else
        return false, v75;
    end;
end;
if not v27() then
    return v96;
else
    return v68;
end;
