local l_script_0 = script;
local v1 = require(l_script_0.flags.getFFlagUseUGCValidationContext);
local v2 = require(l_script_0.flags.getFFlagUGCValidationShouldYield);
local v3 = require(l_script_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local v4 = require(l_script_0.Analytics);
local v5 = require(l_script_0.Constants);
local v6 = require(l_script_0.util.BundlesMetadata);
local v7 = require(l_script_0.util.canUploadBundlesAsync);
local v8 = require(l_script_0.util.createUGCBodyPartFolders);
local v9 = require(l_script_0.util.isLayeredClothing);
local v10 = require(l_script_0.util.RigidOrLayeredAllowed);
local _ = require(l_script_0.util.Types);
local v12 = require(l_script_0.util.createEditableInstancesForContext);
local v13 = require(l_script_0.util.destroyEditableInstances);
local v14 = require(l_script_0.validation.validateInternal);
local v15 = require(l_script_0.validation.validateLayeredClothingAccessoryMeshPartAssetFormat);
local v16 = require(l_script_0.validation.validateLegacyAccessoryMeshPartAssetFormat);
local v17 = require(l_script_0.validation.validateFullBody);
local v18 = require(l_script_0.validation.validateBundleReadyForUpload);
local v19 = require(l_script_0.validation.validateDynamicHeadMeshPartFormat);
local v90 = {
    validate = function(v20, v21, v22, v23, v24, v25, v26, v27, v28, v29)
        v4.setMetadata({
            entrypoint = "validate", 
            assetType = v21.Name, 
            isServer = v22
        });
        if not v1() then
            local v30, v31 = v14(false, v20, v21, v22, v23, v24, v25, v26);
            return v30, v31;
        else
            local v32 = nil;
            local v33 = nil;
            if v3() then
                local v34, v35 = v12(v20, v27);
                v32 = v34;
                v33 = v35;
                if not v32 then
                    if not v22 then
                        return v32, v33;
                    else
                        error(v33[1]);
                    end;
                end;
            end;
            local v36 = {
                instances = v20, 
                assetTypeEnum = v21, 
                allowUnreviewedAssets = v23, 
                restrictedUserIds = v24, 
                isServer = v22, 
                token = v25, 
                universeId = v26, 
                isAsync = false, 
                allowEditableInstances = v27, 
                bypassFlags = v28
            };
            if v2() then
                v36.lastTickSeconds = tick();
                v36.shouldYield = v29;
            end;
            if v3() then
                v36.editableMeshes = v33.editableMeshes;
                v36.editableImages = v33.editableImages;
            end;
            local v37, v38 = v14(v36);
            if v3() then
                v13(v36.editableMeshes, v36.editableImages);
            end;
            return v37, v38;
        end;
    end, 
    validateAsync = function(v39, v40, v41, v42, v43, v44)
        v4.setMetadata({
            entrypoint = "validateAsync", 
            assetType = v40.Name, 
            isServer = v42
        });
        if not v1() then
            coroutine.wrap(function()
                v41(v14(true, v39, v40, v42, v43, v44, ""));
            end)();
            return ;
        else
            local v45 = nil;
            local v46 = nil;
            if v3() then
                local v47, v48 = v12(v39);
                v45 = v47;
                v46 = v48;
                if not v45 then
                    if not v42 then
                        v41(v45, v46);
                    else
                        error(v46[1]);
                    end;
                end;
            end;
            local v49 = {
                instances = v39, 
                assetTypeEnum = v40, 
                allowUnreviewedAssets = v43, 
                restrictedUserIds = v44, 
                isServer = v42, 
                token = "", 
                isAsync = true
            };
            if v3() then
                v49.editableMeshes = v46.editableMeshes;
                v49.editableImages = v46.editableImages;
            end;
            coroutine.wrap(function()
                v41(v14(v49));
                if v3() then
                    v13(v49.editableMeshes, v49.editableImages);
                end;
            end)();
            return ;
        end;
    end, 
    validateMeshPartFormat = function(v50, v51, v52, v53, v54)
        v4.setMetadata({
            entrypoint = "validateMeshPartFormat", 
            assetType = v51.Name, 
            isServer = v52
        });
        assert(Enum.AssetType.DynamicHead == v51);
        if not v1() then
            return v19(v50, v52, v53, v54);
        else
            local v55 = nil;
            local v56 = nil;
            if v3() then
                local v57, v58 = v12(v50);
                v55 = v57;
                v56 = v58;
                if not v55 then
                    if not v52 then
                        return v55, v56;
                    else
                        error(v56[1]);
                    end;
                end;
            end;
            local v59 = {
                instances = v50, 
                assetTypeEnum = v51, 
                allowUnreviewedAssets = v53, 
                restrictedUserIds = v54, 
                isServer = v52
            };
            if v3() then
                v59.editableMeshes = v56.editableMeshes;
                v59.editableImages = v56.editableImages;
            end;
            local v60, v61 = v19(v59);
            if v3() then
                v13(v59.editableMeshes, v59.editableImages);
            end;
            return v60, v61;
        end;
    end, 
    validateAsyncMeshPartFormat = function(v62, v63, v64, v65, v66, v67)
        v4.setMetadata({
            entrypoint = "validateAsyncMeshPartFormat", 
            assetType = v63.Name, 
            isServer = v65
        });
        assert(Enum.AssetType.DynamicHead == v63);
        if not v1() then
            coroutine.wrap(function()
                v64(v19(v62, v65, v66, v67));
            end)();
            return ;
        else
            local v68 = nil;
            local v69 = nil;
            if v3() then
                local v70, v71 = v12(v62);
                v68 = v70;
                v69 = v71;
                if not v68 then
                    if not v65 then
                        v64(v68, v69);
                    else
                        error(v69[1]);
                    end;
                end;
            end;
            local v72 = {
                instances = v62, 
                assetTypeEnum = v63, 
                allowUnreviewedAssets = v66, 
                restrictedUserIds = v67, 
                isServer = v65
            };
            if v3() then
                v72.editableMeshes = v69.editableMeshes;
                v72.editableImages = v69.editableImages;
            end;
            coroutine.wrap(function()
                v64(v19(v72));
                if v3() then
                    v13(v72.editableMeshes, v72.editableImages);
                end;
            end)();
            return ;
        end;
    end, 
    validateMeshPartAssetFormat2 = function(v73, v74, v75, v76, v77, _)
        v4.setMetadata({
            entrypoint = "validateMeshPartAssetFormat2", 
            assetType = v75.Name, 
            isServer = v76
        });
        if not v1() then
            if not v9(v73[1]) then
                return v16(v73, v74, v75, v76);
            else
                return v15(v73, v74, v75, v76, v77);
            end;
        else
            local v79 = nil;
            local v80 = nil;
            if v3() then
                local v81, v82 = v12(v73);
                v79 = v81;
                v80 = v82;
                if not v79 then
                    if not v76 then
                        return v79, v80;
                    else
                        error(v80[1]);
                    end;
                end;
            end;
            local v83 = {
                instances = v73, 
                assetTypeEnum = v75, 
                allowUnreviewedAssets = v77, 
                isServer = v76
            };
            if v3() then
                v83.editableMeshes = v80.editableMeshes;
                v83.editableImages = v80.editableImages;
            end;
            local v84 = nil;
            local v85 = nil;
            if not v9(v73[1]) then
                local v86, v87 = v16(v74, v83);
                v84 = v86;
                v85 = v87;
            else
                local v88, v89 = v15(v74, v83);
                v84 = v88;
                v85 = v89;
            end;
            if v3() then
                v13(v83.editableMeshes, v83.editableImages);
            end;
            return v84, v85;
        end;
    end, 
    validateBundleReadyForUpload = v18, 
    util = {
        BundlesMetadata = v6, 
        createUGCBodyPartFolders = v8, 
        canUploadBundlesAsync = v7
    }
};
v90.util.isLayeredClothingAllowed = v10.isLayeredClothingAllowed;
v90.util.isRigidAccessoryAllowed = v10.isRigidAccessoryAllowed;
v90.validateFullBody = function(v91, v92, v93, v94, v95)
    v4.setMetadata({
        entrypoint = "validateFullBody", 
        assetType = "", 
        isServer = v92
    });
    if not v1() then
        return v17(v91, v92);
    else
        local v96 = nil;
        local v97 = nil;
        if v3() then
            local v98 = {};
            for _, v100 in v91, nil, nil do
                for _, v102 in v100.allSelectedInstances, nil, nil do
                    table.insert(v98, v102);
                end;
            end;
            local v103, v104 = v12(v98, v93);
            v96 = v103;
            v97 = v104;
            if not v96 then
                if not v92 then
                    return v96, v97;
                else
                    error(v97[1]);
                end;
            end;
        end;
        local v105 = {
            fullBodyData = v91, 
            isServer = v92, 
            allowEditableInstances = v93, 
            bypassFlags = v94
        };
        if v2() then
            v105.lastTickSeconds = tick();
            v105.shouldYield = v95;
        end;
        if v3() then
            v105.editableMeshes = v97.editableMeshes;
            v105.editableImages = v97.editableImages;
        end;
        local v106, v107 = v17(v105);
        if v3() then
            v13(v105.editableMeshes, v105.editableImages);
        end;
        return v106, v107;
    end;
end;
v90.GUIDAttributeName = v5.GUIDAttributeName;
return v90;
