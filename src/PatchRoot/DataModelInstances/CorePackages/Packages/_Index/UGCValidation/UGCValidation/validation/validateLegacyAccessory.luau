local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.Constants);
local v3 = require(l_Parent_0.validation.validateInstanceTree);
local v4 = require(l_Parent_0.validation.validateMeshTriangles);
local v5 = require(l_Parent_0.validation.validateModeration);
local v6 = require(l_Parent_0.validation.validateMaterials);
local v7 = require(l_Parent_0.validation.validateTags);
local v8 = require(l_Parent_0.validation.validateMeshBounds);
local v9 = require(l_Parent_0.validation.validateTextureSize);
local v10 = require(l_Parent_0.validation.validateProperties);
local v11 = require(l_Parent_0.validation.validateAttributes);
local v12 = require(l_Parent_0.validation.validateMeshVertColors);
local v13 = require(l_Parent_0.validation.validateSingleInstance);
local v14 = require(l_Parent_0.validation.validateCanLoad);
local v15 = require(l_Parent_0.validation.validateThumbnailConfiguration);
local v16 = require(l_Parent_0.validation.validateAccessoryName);
local v17 = require(l_Parent_0.validation.validateScaleType);
local v18 = require(l_Parent_0.util.createAccessorySchema);
local v19 = require(l_Parent_0.util.getAttachment);
local v20 = require(l_Parent_0.util.getAccessoryScale);
local v21 = require(l_Parent_0.util.getEditableMeshFromContext);
local v22 = require(l_Parent_0.util.getEditableImageFromContext);
local v23 = require(l_Parent_0.flags.getFFlagUGCValidateMeshVertColors);
local v24 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local v25 = require(l_Parent_0.flags.getFFlagUGCValidateThumbnailConfiguration);
local v26 = require(l_Parent_0.flags.getFFlagUGCValidationNameCheck);
local v27 = require(l_Parent_0.flags.getFFlagUGCValidateAccessoriesScaleType);
local v28 = game:DefineFastFlag("LegacyAccessoryCheckAvatarPartScaleType", false);
local v29 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local function v64(v30)
    local l_instances_0 = v30.instances;
    local l_assetTypeEnum_0 = v30.assetTypeEnum;
    local l_isServer_0 = v30.isServer;
    local l_allowUnreviewedAssets_0 = v30.allowUnreviewedAssets;
    local v35 = v2.ASSET_TYPE_INFO[l_assetTypeEnum_0];
    local v36 = nil;
    local v37 = nil;
    local v38, v39 = v13(l_instances_0, v30);
    v36 = v38;
    v37 = v39;
    if v36 then
        v38 = l_instances_0[1];
        local v40, v41 = v3(v18(v35.attachmentNames), v38);
        v36 = v40;
        v37 = v41;
        if v36 then
            if not (not v26() or not l_isServer_0) then
                v40, v41 = v16(v38);
                v36 = v40;
                v37 = v41;
                if not v36 then
                    return false, v37;
                end;
            end;
            v40 = v38:FindFirstChild("Handle");
            v41 = v40:FindFirstChildOfClass("SpecialMesh");
            local v42 = {
                fullName = v41:GetFullName(), 
                fieldName = "MeshId", 
                contentId = v41.MeshId, 
                context = v38.Name
            };
            local l_Scale_0 = v41.Scale;
            local v44 = v19(v40, v35.attachmentNames);
            local v45 = assert(v35.bounds[v44.Name], "Could not find bounds for " .. v44.Name);
            local v46 = true;
            v37 = {};
            local v47 = false;
            if v42.contentId ~= nil then
                v47 = v42.contentId ~= "";
            end;
            if v29() then
                local v48, v49 = v21(v41, "MeshId", v30);
                if not v48 then
                    if v42.contentId then
                        return false, {
                            string.format("Failed to load mesh for legacy accessory '%s'. Make sure mesh exists and try again.", v38.Name)
                        };
                    else
                        v47 = false;
                        v46 = false;
                        table.insert(v37, {
                            string.format("Missing meshId on legacy accessory '%s'. Make sure you are using a valid meshId and try again.\n", v38.Name)
                        });
                    end;
                end;
                v42.editableMesh = v49;
                v47 = true;
            end;
            local v50 = {
                fullName = v41:GetFullName(), 
                fieldName = "TextureId", 
                contentId = v41.TextureId
            };
            if not v29() then
                if l_isServer_0 then
                    local v51 = nil;
                    local v52 = nil;
                    local v53 = {};
                    local v54, v55 = v14(v41.TextureId);
                    v51 = v54;
                    v53 = v55;
                    v54, v55 = v14(v41.MeshId);
                    v52 = v54;
                    v53 = v55;
                    if not (v51 and v52) then
                        error(string.format("Failed to load children assets (Meshes, Textures, etc.) for '%s'. Make sure the assets exist and try again.", v38.Name));
                    end;
                end;
            else
                local v56, v57 = v22(v41, "TextureId", v30);
                if v56 then
                    v50.editableImage = v57;
                else
                    return false, {
                        string.format("Failed to load texture for legacy accessory '%s'. Make sure texture exists and try again.", v38.Name)
                    };
                end;
            end;
            local v58 = {};
            local v59, v60 = v6(v38);
            v36 = v59;
            v58 = v60;
            if not v36 then
                table.insert(v37, table.concat(v58, "\n"));
                v46 = false;
            end;
            v59, v60 = v10(v38);
            v36 = v59;
            v58 = v60;
            if not v36 then
                table.insert(v37, table.concat(v58, "\n"));
                v46 = false;
            end;
            v59, v60 = v7(v38);
            v36 = v59;
            v58 = v60;
            if not v36 then
                table.insert(v37, table.concat(v58, "\n"));
                v46 = false;
            end;
            v59, v60 = v11(v38);
            v36 = v59;
            v58 = v60;
            if not v36 then
                table.insert(v37, table.concat(v58, "\n"));
                v46 = false;
            end;
            v59, v60 = v9(v50, nil, v30);
            v36 = v59;
            v58 = v60;
            if not v36 then
                table.insert(v37, table.concat(v58, "\n"));
                v46 = false;
            end;
            if v27() then
                v59 = v40:FindFirstChild("AvatarPartScaleType");
                if not (not v59 or not v59:IsA("StringValue")) then
                    local v61;
                    v60, v61 = v17(v59);
                    v36 = v60;
                    v58 = v61;
                    if not v36 then
                        table.insert(v37, table.concat(v58, "\n"));
                        v46 = false;
                    end;
                end;
            end;
            if v25() then
                v59, v60 = v15(v38, v40, v42, l_Scale_0);
                v36 = v59;
                v58 = v60;
                if not v36 then
                    table.insert(v37, table.concat(v58, "\n"));
                    v46 = false;
                end;
            end;
            v59 = not l_isServer_0;
            if l_allowUnreviewedAssets_0 then
                v59 = false;
            end;
            if v59 then
                local v62;
                v60, v62 = v5(v38, {});
                v36 = v60;
                v58 = v62;
                if not v36 then
                    table.insert(v37, table.concat(v58, "\n"));
                    v46 = false;
                end;
            end;
            if v47 then
                if not (not v28 or not v40:FindFirstChild("AvatarPartScaleType")) then
                    v60 = v20(v40, v44);
                    v45 = {
                        size = v45.size / v60, 
                        offset = if not v45.offset then nil else v45.offset / v60
                    };
                end;
                local v63;
                v60, v63 = v8(v40, v44, v42, l_Scale_0, v45, l_assetTypeEnum_0.Name, v30);
                v36 = v60;
                v58 = v63;
                if not v36 then
                    table.insert(v37, table.concat(v58, "\n"));
                    v46 = false;
                end;
                v60, v63 = v4(v42, nil, v30);
                v36 = v60;
                v58 = v63;
                if not v36 then
                    table.insert(v37, table.concat(v58, "\n"));
                    v46 = false;
                end;
                if v23() then
                    v60, v63 = v12(v42, false, v30);
                    v36 = v60;
                    v58 = v63;
                    if not v36 then
                        table.insert(v37, table.concat(v58, "\n"));
                        v46 = false;
                    end;
                end;
            end;
            return v46, v37;
        else
            return false, v37;
        end;
    else
        return false, v37;
    end;
end;
local function v93(v65, v66, v67, v68)
    local v69 = v2.ASSET_TYPE_INFO[v66];
    local v70 = nil;
    local v71 = nil;
    local v72, v73 = v13(v65);
    v70 = v72;
    v71 = v73;
    if v70 then
        v72 = v65[1];
        local v74, v75 = v3(v18(v69.attachmentNames), v72);
        v70 = v74;
        v71 = v75;
        if v70 then
            if not (not v26() or not v67) then
                v74, v75 = v16(v72);
                v70 = v74;
                v71 = v75;
                if not v70 then
                    return false, v71;
                end;
            end;
            v74 = v72:FindFirstChild("Handle");
            v75 = v74:FindFirstChildOfClass("SpecialMesh");
            local l_MeshId_0 = v75.MeshId;
            local l_Scale_1 = v75.Scale;
            local l_TextureId_0 = v75.TextureId;
            local v79 = v19(v74, v69.attachmentNames);
            local v80 = assert(v69.bounds[v79.Name], "Could not find bounds for " .. v79.Name);
            if v67 then
                local v81 = nil;
                local v82 = nil;
                local v83 = {};
                local v84, v85 = v14(l_TextureId_0);
                v81 = v84;
                v83 = v85;
                v84, v85 = v14(l_MeshId_0);
                v82 = v84;
                v83 = v85;
                if not (v81 and v82) then
                    error("Failed to load asset");
                end;
            end;
            local v86 = {};
            local v87 = true;
            v71 = {};
            local v88, v89 = v6(v72);
            v70 = v88;
            v86 = v89;
            if not v70 then
                table.insert(v71, table.concat(v86, "\n"));
                v87 = false;
            end;
            v88, v89 = v10(v72);
            v70 = v88;
            v86 = v89;
            if not v70 then
                table.insert(v71, table.concat(v86, "\n"));
                v87 = false;
            end;
            v88, v89 = v7(v72);
            v70 = v88;
            v86 = v89;
            if not v70 then
                table.insert(v71, table.concat(v86, "\n"));
                v87 = false;
            end;
            v88, v89 = v11(v72);
            v70 = v88;
            v86 = v89;
            if not v70 then
                table.insert(v71, table.concat(v86, "\n"));
                v87 = false;
            end;
            v88, v89 = v9(l_TextureId_0);
            v70 = v88;
            v86 = v89;
            if not v70 then
                table.insert(v71, table.concat(v86, "\n"));
                v87 = false;
            end;
            if v27() then
                v88 = v74:FindFirstChild("AvatarPartScaleType");
                if not (not v88 or not v88:IsA("StringValue")) then
                    local v90;
                    v89, v90 = v17(v88);
                    v70 = v89;
                    v86 = v90;
                    if not v70 then
                        table.insert(v71, table.concat(v86, "\n"));
                        v87 = false;
                    end;
                end;
            end;
            if v25() then
                v88, v89 = v15(v72, v74, l_MeshId_0, l_Scale_1);
                v70 = v88;
                v86 = v89;
                if not v70 then
                    table.insert(v71, table.concat(v86, "\n"));
                    v87 = false;
                end;
            end;
            v88 = not v67;
            if v68 then
                v88 = false;
            end;
            if v88 then
                local v91;
                v89, v91 = v5(v72, {});
                v70 = v89;
                v86 = v91;
                if not v70 then
                    table.insert(v71, table.concat(v86, "\n"));
                    v87 = false;
                end;
            end;
            if l_MeshId_0 == "" then
                table.insert(v71, "Mesh must contain valid MeshId");
                v87 = false;
            else
                if not (not v28 or not v74:FindFirstChild("AvatarPartScaleType")) then
                    v89 = v20(v74, v79);
                    v80 = {
                        size = v80.size / v89, 
                        offset = if not v80.offset then nil else v80.offset / v89
                    };
                end;
                local v92;
                v89, v92 = v8(v74, v79, l_MeshId_0, l_Scale_1, v80, v66.Name);
                v70 = v89;
                v86 = v92;
                if not v70 then
                    table.insert(v71, table.concat(v86, "\n"));
                    v87 = false;
                end;
                v89, v92 = v4(l_MeshId_0);
                v70 = v89;
                v86 = v92;
                if not v70 then
                    table.insert(v71, table.concat(v86, "\n"));
                    v87 = false;
                end;
                if v23() then
                    v89, v92 = v12(l_MeshId_0, false);
                    v70 = v89;
                    v86 = v92;
                    if not v70 then
                        table.insert(v71, table.concat(v86, "\n"));
                        v87 = false;
                    end;
                end;
            end;
            return v87, v71;
        else
            return false, v71;
        end;
    else
        return false, v71;
    end;
end;
if not v24() then
    return v93;
else
    return v64;
end;
