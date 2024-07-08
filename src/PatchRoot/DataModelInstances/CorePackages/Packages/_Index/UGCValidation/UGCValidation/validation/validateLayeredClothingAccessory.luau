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
local v15 = require(l_Parent_0.validation.validateHSR);
local v16 = require(l_Parent_0.validation.validateUVSpace);
local v17 = require(l_Parent_0.validation.validateCanLoad);
local v18 = require(l_Parent_0.validation.validateThumbnailConfiguration);
local v19 = require(l_Parent_0.validation.validateAccessoryName);
local v20 = require(l_Parent_0.validation.validateScaleType);
local v21 = require(l_Parent_0.validation.validateOverlappingVertices);
local v22 = require(l_Parent_0.validation.validateMisMatchUV);
local v23 = require(l_Parent_0.validation.validateCageMeshIntersection);
local v24 = require(l_Parent_0.validation.validateCageNonManifoldAndHoles);
local v25 = require(l_Parent_0.validation.validateFullBodyCageDeletion);
local v26 = require(l_Parent_0.util.RigidOrLayeredAllowed);
local v27 = require(l_Parent_0.util.createLayeredClothingSchema);
local v28 = require(l_Parent_0.util.getAttachment);
local v29 = require(l_Parent_0.util.getMeshSize);
local v30 = require(l_Parent_0.util.getEditableMeshFromContext);
local v31 = require(l_Parent_0.util.getEditableImageFromContext);
local v32 = require(l_Parent_0.flags.getFFlagUGCLCQualityReplaceLua);
local v33 = require(l_Parent_0.flags.getFFlagUGCLCQualityValidation);
local v34 = require(l_Parent_0.flags.getFFlagUGCValidateMeshVertColors);
local v35 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local v36 = require(l_Parent_0.flags.getFFlagUGCValidateThumbnailConfiguration);
local v37 = require(l_Parent_0.flags.getFFlagUGCValidationNameCheck);
local v38 = require(l_Parent_0.flags.getFFlagUGCValidateAccessoriesScaleType);
local v39 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local function v91(v40)
    local l_instances_0 = v40.instances;
    local l_assetTypeEnum_0 = v40.assetTypeEnum;
    local l_isServer_0 = v40.isServer;
    local l_allowUnreviewedAssets_0 = v40.allowUnreviewedAssets;
    if v26.isLayeredClothingAllowed(l_assetTypeEnum_0) then
        local v45 = v3.ASSET_TYPE_INFO[l_assetTypeEnum_0];
        local v46 = nil;
        local v47 = nil;
        local v48, v49 = v14(l_instances_0, v40);
        v46 = v48;
        v47 = v49;
        if v46 then
            v48 = l_instances_0[1];
            local v50, v51 = v4(v27(v45.attachmentNames), v48);
            v46 = v50;
            v47 = v51;
            if v46 then
                if not (not v37() or not l_isServer_0) then
                    v50, v51 = v19(v48);
                    v46 = v50;
                    v47 = v51;
                    if not v46 then
                        return false, v47;
                    end;
                end;
                v50 = true;
                v47 = {};
                v51 = v48:FindFirstChild("Handle");
                local v52 = {
                    fullName = v51:GetFullName(), 
                    fieldName = "MeshId", 
                    contentId = v51.MeshId, 
                    context = v48.Name
                };
                local v53 = false;
                if v52.contentId ~= nil then
                    v53 = v52.contentId ~= "";
                end;
                if v39() then
                    local v54, v55 = v30(v51, "MeshId", v40);
                    if not v54 then
                        if v52.contentId then
                            v2.reportFailure(v2.ErrorType.validateLayeredClothingAccessory_FailedToLoadMesh);
                            return false, {
                                string.format("Failed to load mesh for layered clothing accessory '%s'. Make sure mesh exists and try again.", v48.Name)
                            };
                        else
                            v53 = false;
                            v2.reportFailure(v2.ErrorType.validateLayeredClothingAccessory_NoMeshId);
                            v50 = false;
                            table.insert(v47, {
                                string.format("Missing meshId on layered clothing accessory '%s'. Make sure you are using a valid meshId and try again.\n", v48.Name)
                            });
                        end;
                    end;
                    v52.editableMesh = v55;
                    v53 = true;
                end;
                local l_TextureID_0 = v51.TextureID;
                local v57 = {
                    fullName = v51:GetFullName(), 
                    fieldName = "TextureID", 
                    contentId = l_TextureID_0
                };
                if not v39() then
                    if l_isServer_0 then
                        local v58 = true;
                        local v59 = nil;
                        local v60 = {};
                        if l_TextureID_0 ~= "" then
                            local v61, v62 = v17(l_TextureID_0);
                            v58 = v61;
                            v60 = v62;
                        end;
                        local v63, v64 = v17(v51.MeshId);
                        v59 = v63;
                        v60 = v64;
                        if not (v58 and v59) then
                            error(string.format("Failed to load children assets (Meshes, Textures, etc.) for '%s'. Make sure the assets exist and try again.", v48.Name));
                        end;
                    end;
                else
                    local v65 = nil;
                    local v66 = nil;
                    if l_TextureID_0 ~= "" then
                        local v67, v68 = v31(v51, "TextureID", v40);
                        v65 = v67;
                        v66 = v68;
                        if v65 then
                            v57.editableImage = v66;
                        else
                            return false, {
                                string.format("Failed to load texture for layered clothing accessory '%s'. Make sure texture exists and try again.", v48.Name)
                            };
                        end;
                    end;
                end;
                local l_status_0, l_result_0 = pcall(v29, v52);
                if l_status_0 then
                    local v71 = v51.Size / l_result_0;
                    local v72 = v28(v51, v45.attachmentNames);
                    local l_LC_BOUNDS_0 = v3.LC_BOUNDS;
                    if not (not v45.layeredClothingBounds or not v45.layeredClothingBounds[v72.Name]) then
                        l_LC_BOUNDS_0 = v45.layeredClothingBounds[v72.Name];
                    end;
                    local v74 = {};
                    local v75, v76 = v7(v48);
                    v46 = v75;
                    v74 = v76;
                    if not v46 then
                        table.insert(v47, table.concat(v74, "\n"));
                        v50 = false;
                    end;
                    v75, v76 = v11(v48);
                    v46 = v75;
                    v74 = v76;
                    if not v46 then
                        table.insert(v47, table.concat(v74, "\n"));
                        v50 = false;
                    end;
                    v75, v76 = v8(v48);
                    v46 = v75;
                    v74 = v76;
                    if not v46 then
                        table.insert(v47, table.concat(v74, "\n"));
                        v50 = false;
                    end;
                    v75, v76 = v12(v48);
                    v46 = v75;
                    v74 = v76;
                    if not v46 then
                        table.insert(v47, table.concat(v74, "\n"));
                        v50 = false;
                    end;
                    v75, v76 = v10(v57, true, v40);
                    v46 = v75;
                    v74 = v76;
                    if not v46 then
                        table.insert(v47, table.concat(v74, "\n"));
                        v50 = false;
                    end;
                    if v38() then
                        v75 = v51:FindFirstChild("AvatarPartScaleType");
                        if not (not v75 or not v75:IsA("StringValue")) then
                            local v77;
                            v76, v77 = v20(v75);
                            v46 = v76;
                            v74 = v77;
                            if not v46 then
                                table.insert(v47, table.concat(v74, "\n"));
                                v50 = false;
                            end;
                        end;
                    end;
                    if v36() then
                        v75, v76 = v18(v48, v51, v52, v71);
                        v46 = v75;
                        v74 = v76;
                        if not v46 then
                            table.insert(v47, table.concat(v74, "\n"));
                            v50 = false;
                        end;
                    end;
                    v75 = v51:FindFirstChildOfClass("WrapLayer");
                    if v75 == nil then
                        v2.reportFailure(v2.ErrorType.validateLayeredClothingAccessory_NoWrapLayer);
                        table.insert(v47, string.format("Missing WrapLayer on layered clothing accessory %s. You need to create a child WrapLayer and try again.", v48.Name));
                        v50 = false;
                    else
                        local v78;
                        v76, v78 = v15(v75, v40);
                        v46 = v76;
                        v74 = v78;
                        if not v46 then
                            table.insert(v47, table.concat(v74, "\n"));
                            v50 = false;
                        end;
                    end;
                    v75 = not l_isServer_0;
                    if l_allowUnreviewedAssets_0 then
                        v75 = false;
                    end;
                    if v75 then
                        local v79;
                        v76, v79 = v6(v48, {});
                        v46 = v76;
                        v74 = v79;
                        if not v46 then
                            table.insert(v47, table.concat(v74, "\n"));
                            v50 = false;
                        end;
                    end;
                    if v53 then
                        local v80;
                        v76, v80 = v9(v51, v72, v52, v71, l_LC_BOUNDS_0, l_assetTypeEnum_0.Name, v40);
                        v46 = v76;
                        v74 = v80;
                        if not v46 then
                            table.insert(v47, table.concat(v74, "\n"));
                            v50 = false;
                        end;
                        v76, v80 = v5(v52, nil, v40);
                        v46 = v76;
                        v74 = v80;
                        if not v46 then
                            table.insert(v47, table.concat(v74, "\n"));
                            v50 = false;
                        end;
                        if v34() then
                            v76, v80 = v13(v52, false, v40);
                            v46 = v76;
                            v74 = v80;
                            if not v46 then
                                table.insert(v47, table.concat(v74, "\n"));
                                v50 = false;
                            end;
                        end;
                        if v32() then
                            v76, v80 = v16(v52);
                            v46 = v76;
                            v74 = v80;
                            if not v46 then
                                table.insert(v47, table.concat(v74, "\n"));
                                v50 = false;
                            end;
                        end;
                    end;
                    if v33() then
                        v76 = v51:FindFirstChildOfClass("WrapLayer");
                        local v81 = {
                            fullName = v76:GetFullName() .. " InnerCage", 
                            fieldName = "ReferenceMeshId", 
                            contentId = v76.ReferenceMeshId, 
                            context = v48.Name
                        };
                        local v82 = {
                            fullName = v76:GetFullName() .. " OuterCage", 
                            fieldName = "CageMeshId", 
                            contentId = v76.CageMeshId, 
                            context = v48.Name
                        };
                        local v83 = false;
                        if v81.contentId ~= "" then
                            v83 = v81.contentId ~= nil;
                        end;
                        if v39() then
                            local v84, v85 = v30(v76, "ReferenceMeshId", v40);
                            if not v84 then
                                if v81.contentId then
                                    return false, {
                                        string.format("Failed to load inner cage mesh for layered clothing accessory '%s'. Make sure mesh exists and try again.", v48.Name)
                                    };
                                else
                                    v83 = false;
                                    v2.reportFailure(v2.ErrorType.validateLayeredClothingAccessory_NoInnerCageId);
                                    v50 = false;
                                    table.insert(v47, {
                                        string.format("Missing inner cage (i.e. invalid meshId) on layered clothing accessory '%s'. Make sure you are using a valid meshId and try again.\n", v48.Name)
                                    });
                                end;
                            end;
                            v81.editableMesh = v85;
                            v83 = true;
                        end;
                        local v86 = false;
                        if v82.contentId ~= "" then
                            v86 = v82.contentId ~= nil;
                        end;
                        if v39() then
                            local v87, v88 = v30(v76, "CageMeshId", v40);
                            if not v87 then
                                if v82.contentId then
                                    return false, {
                                        string.format("Failed to load outer cage mesh for layered clothing accessory '%s'. Make sure mesh exists and try again.", v48.Name)
                                    };
                                else
                                    v2.reportFailure(v2.ErrorType.validateLayeredClothingAccessory_NoOuterCageId);
                                    v50 = false;
                                    table.insert(v47, {
                                        string.format("Missing outer cage (i.e. invalid meshId) on layered clothing accessory '%s'. Make sure you are using a valid meshId and try again.\n", v48.Name)
                                    });
                                end;
                            end;
                            v82.editableMesh = v88;
                            v86 = true;
                        end;
                        if not (not v83 or not v86) then
                            local v89, v90 = v21(v81, v40);
                            v46 = v89;
                            v74 = v90;
                            if not v46 then
                                table.insert(v47, table.concat(v74, "\n"));
                                v50 = false;
                            end;
                            v89, v90 = v21(v82, v40);
                            v46 = v89;
                            v74 = v90;
                            if not v46 then
                                table.insert(v47, table.concat(v74, "\n"));
                                v50 = false;
                            end;
                            v89, v90 = v22(v81, v82);
                            v46 = v89;
                            v74 = v90;
                            if not v46 then
                                table.insert(v47, table.concat(v74, "\n"));
                                v50 = false;
                            end;
                            v89, v90 = v23(v81, v82, v52, v40);
                            v46 = v89;
                            v74 = v90;
                            if not v46 then
                                table.insert(v47, "" .. table.concat(v74, "\n\n"));
                                v50 = false;
                            end;
                            v89, v90 = v24(v81);
                            v46 = v89;
                            v74 = v90;
                            if not v46 then
                                table.insert(v47, table.concat(v74, "\n\n"));
                                v50 = false;
                            end;
                            v89, v90 = v24(v82);
                            v46 = v89;
                            v74 = v90;
                            if not v46 then
                                table.insert(v47, table.concat(v74, "\n\n"));
                                v50 = false;
                            end;
                            v89, v90 = v25(v81, v40);
                            v46 = v89;
                            v74 = v90;
                            if not v46 then
                                table.insert(v47, table.concat(v74, "\n"));
                                v50 = false;
                            end;
                            v89, v90 = v25(v82, v40);
                            v46 = v89;
                            v74 = v90;
                            if not v46 then
                                table.insert(v47, table.concat(v74, "\n"));
                                v50 = false;
                            end;
                        end;
                    end;
                    return v50, v47;
                else
                    v2.reportFailure(v2.ErrorType.validateLayeredClothingAccessory_FailedToLoadMesh);
                    return false, {
                        string.format("Failed to load mesh for layered clothing accessory '%s'. Make sure mesh exists and try again.", v48.Name)
                    };
                end;
            else
                return false, v47;
            end;
        else
            return false, v47;
        end;
    else
        v2.reportFailure(v2.ErrorType.validateLayeredClothingAccessory_AssetTypeNotAllowedAsLayeredClothing);
        return false, {
            string.format("Asset type '%s' is not a layered clothing category. It can only be used with rigid accessories.", l_assetTypeEnum_0.Name)
        };
    end;
end;
local function v128(v92, v93, v94, v95)
    if v26.isLayeredClothingAllowed(v93) then
        local v96 = v3.ASSET_TYPE_INFO[v93];
        local v97 = nil;
        local v98 = nil;
        local v99, v100 = v14(v92);
        v97 = v99;
        v98 = v100;
        if v97 then
            v99 = v92[1];
            local v101, v102 = v4(v27(v96.attachmentNames), v99);
            v97 = v101;
            v98 = v102;
            if v97 then
                if not (not v37() or not v94) then
                    v101, v102 = v19(v99);
                    v97 = v101;
                    v98 = v102;
                    if not v97 then
                        return false, v98;
                    end;
                end;
                v101 = v99:FindFirstChild("Handle");
                v102 = v101.MeshId;
                local l_status_1, l_result_1 = pcall(v29, v102);
                if l_status_1 then
                    local v105 = v101.Size / l_result_1;
                    local l_TextureID_1 = v101.TextureID;
                    local v107 = v28(v101, v96.attachmentNames);
                    local l_LC_BOUNDS_1 = v3.LC_BOUNDS;
                    if not (not v96.layeredClothingBounds or not v96.layeredClothingBounds[v107.Name]) then
                        l_LC_BOUNDS_1 = v96.layeredClothingBounds[v107.Name];
                    end;
                    if v94 then
                        local v109 = true;
                        local v110 = nil;
                        local v111 = {};
                        if l_TextureID_1 ~= "" then
                            local v112, v113 = v17(l_TextureID_1);
                            v109 = v112;
                            v111 = v113;
                        end;
                        local v114, v115 = v17(v102);
                        v110 = v114;
                        v111 = v115;
                        if not (v109 and v110) then
                            error("Failed to load asset");
                        end;
                    end;
                    local v116 = {};
                    local v117 = true;
                    v98 = {};
                    local v118, v119 = v7(v99);
                    v97 = v118;
                    v116 = v119;
                    if not v97 then
                        table.insert(v98, table.concat(v116, "\n"));
                        v117 = false;
                    end;
                    v118, v119 = v11(v99);
                    v97 = v118;
                    v116 = v119;
                    if not v97 then
                        table.insert(v98, table.concat(v116, "\n"));
                        v117 = false;
                    end;
                    v118, v119 = v8(v99);
                    v97 = v118;
                    v116 = v119;
                    if not v97 then
                        table.insert(v98, table.concat(v116, "\n"));
                        v117 = false;
                    end;
                    v118, v119 = v12(v99);
                    v97 = v118;
                    v116 = v119;
                    if not v97 then
                        table.insert(v98, table.concat(v116, "\n"));
                        v117 = false;
                    end;
                    v118, v119 = v10(l_TextureID_1, true);
                    v97 = v118;
                    v116 = v119;
                    if not v97 then
                        table.insert(v98, table.concat(v116, "\n"));
                        v117 = false;
                    end;
                    if v38() then
                        v118 = v101:FindFirstChild("AvatarPartScaleType");
                        if not (not v118 or not v118:IsA("StringValue")) then
                            local v120;
                            v119, v120 = v20(v118);
                            v97 = v119;
                            v116 = v120;
                            if not v97 then
                                table.insert(v98, table.concat(v116, "\n"));
                                v117 = false;
                            end;
                        end;
                    end;
                    if v36() then
                        v118, v119 = v18(v99, v101, v102, v105);
                        v97 = v118;
                        v116 = v119;
                        if not v97 then
                            table.insert(v98, table.concat(v116, "\n"));
                            v117 = false;
                        end;
                    end;
                    v118 = v101:FindFirstChildOfClass("WrapLayer");
                    if v118 == nil then
                        v2.reportFailure(v2.ErrorType.validateLayeredClothingAccessory_NoWrapLayer);
                        table.insert(v98, "Could not find WrapLayer");
                        v117 = false;
                    else
                        local v121;
                        v119, v121 = v15(v118);
                        v97 = v119;
                        v116 = v121;
                        if not v97 then
                            table.insert(v98, table.concat(v116, "\n"));
                            v117 = false;
                        end;
                    end;
                    v118 = not v94;
                    if v95 then
                        v118 = false;
                    end;
                    if v118 then
                        local v122;
                        v119, v122 = v6(v99, {});
                        v97 = v119;
                        v116 = v122;
                        if not v97 then
                            table.insert(v98, table.concat(v116, "\n"));
                            v117 = false;
                        end;
                    end;
                    if v102 == "" then
                        v2.reportFailure(v2.ErrorType.validateLayeredClothingAccessory_NoMeshId);
                        table.insert(v98, "Mesh must contain valid MeshId");
                        v117 = false;
                    else
                        local v123;
                        v119, v123 = v9(v101, v107, v102, v105, l_LC_BOUNDS_1, v93.Name);
                        v97 = v119;
                        v116 = v123;
                        if not v97 then
                            table.insert(v98, table.concat(v116, "\n"));
                            v117 = false;
                        end;
                        v119, v123 = v5(v102);
                        v97 = v119;
                        v116 = v123;
                        if not v97 then
                            table.insert(v98, table.concat(v116, "\n"));
                            v117 = false;
                        end;
                        if v34() then
                            v119, v123 = v13(v102, false);
                            v97 = v119;
                            v116 = v123;
                            if not v97 then
                                table.insert(v98, table.concat(v116, "\n"));
                                v117 = false;
                            end;
                        end;
                        if v32() then
                            v119, v123 = v16(v102);
                            v97 = v119;
                            v116 = v123;
                            if not v97 then
                                table.insert(v98, table.concat(v116, "\n"));
                                v117 = false;
                            end;
                        end;
                    end;
                    if v33() then
                        v119 = v101:FindFirstChildOfClass("WrapLayer");
                        local l_ReferenceMeshId_0 = v119.ReferenceMeshId;
                        local l_CageMeshId_0 = v119.CageMeshId;
                        if l_ReferenceMeshId_0 == "" then
                            v2.reportFailure(v2.ErrorType.validateLayeredClothingAccessory_NoInnerCageId);
                            table.insert(v98, "InnerCages must contain valid MeshId.");
                            v117 = false;
                        elseif l_CageMeshId_0 == "" then
                            v2.reportFailure(v2.ErrorType.validateLayeredClothingAccessory_NoOuterCageId);
                            table.insert(v98, "OuterCages must contain valid MeshId.");
                            v117 = false;
                        else
                            local v126, v127 = v21(l_ReferenceMeshId_0, "InnerCage");
                            v97 = v126;
                            v116 = v127;
                            if not v97 then
                                table.insert(v98, table.concat(v116, "\n"));
                                v117 = false;
                            end;
                            v126, v127 = v21(l_CageMeshId_0, "OuterCage");
                            v97 = v126;
                            v116 = v127;
                            if not v97 then
                                table.insert(v98, table.concat(v116, "\n"));
                                v117 = false;
                            end;
                            v126, v127 = v22(l_ReferenceMeshId_0, l_CageMeshId_0);
                            v97 = v126;
                            v116 = v127;
                            if not v97 then
                                table.insert(v98, table.concat(v116, "\n"));
                                v117 = false;
                            end;
                            v126, v127 = v23(l_ReferenceMeshId_0, l_CageMeshId_0, v102);
                            v97 = v126;
                            v116 = v127;
                            if not v97 then
                                table.insert(v98, "" .. table.concat(v116, "\n\n"));
                                v117 = false;
                            end;
                            v126, v127 = v24(l_ReferenceMeshId_0, "InnerCage");
                            v97 = v126;
                            v116 = v127;
                            if not v97 then
                                table.insert(v98, table.concat(v116, "\n\n"));
                                v117 = false;
                            end;
                            v126, v127 = v24(l_CageMeshId_0, "OuterCage");
                            v97 = v126;
                            v116 = v127;
                            if not v97 then
                                table.insert(v98, table.concat(v116, "\n\n"));
                                v117 = false;
                            end;
                            v126, v127 = v25(l_ReferenceMeshId_0, "InnerCage");
                            v97 = v126;
                            v116 = v127;
                            if not v97 then
                                table.insert(v98, table.concat(v116, "\n"));
                                v117 = false;
                            end;
                            v126, v127 = v25(l_CageMeshId_0, "OuterCage");
                            v97 = v126;
                            v116 = v127;
                            if not v97 then
                                table.insert(v98, table.concat(v116, "\n"));
                                v117 = false;
                            end;
                        end;
                    end;
                    return v117, v98;
                else
                    v2.reportFailure(v2.ErrorType.validateLayeredClothingAccessory_FailedToLoadMesh);
                    return false, {
                        "Failed to read mesh"
                    };
                end;
            else
                return false, v98;
            end;
        else
            return false, v98;
        end;
    else
        v2.reportFailure(v2.ErrorType.validateLayeredClothingAccessory_AssetTypeNotAllowedAsLayeredClothing);
        return false, {
            "Asset type cannot be validated as Layered Clothing"
        };
    end;
end;
if not v35() then
    return v128;
else
    return v91;
end;
