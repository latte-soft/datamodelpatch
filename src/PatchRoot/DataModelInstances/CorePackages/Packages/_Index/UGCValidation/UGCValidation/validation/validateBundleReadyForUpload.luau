local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local v2 = require(l_Parent_0.flags.getFFlagUGCValidateFullBody);
local v3 = require(l_Parent_0.flags.getFFlagUGCValidateFixAccessories);
local v4 = require(l_Parent_0.flags.getFFlagUGCValidateHandleRestrictedUserIds);
local v5 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local v6 = require(l_Parent_0.Parent.Promise);
local v7 = require(l_Parent_0.ConstantsInterface);
local _ = require(l_Parent_0.util.BundlesMetadata);
local _ = require(l_Parent_0.util.Types);
local v10 = require(l_Parent_0.util.getRestrictedUserTable);
local v11 = require(l_Parent_0.util.createEditableInstancesForContext);
local v12 = require(l_Parent_0.util.destroyEditableInstances);
local v13 = require(l_Parent_0.util.createUGCBodyPartFolders);
local v14 = require(l_Parent_0.util.fixUpPreValidation);
local v15 = require(l_Parent_0.validation.validateInternal);
local v16 = require(l_Parent_0.validation.validateFullBody);
local v17 = {
    Enum.AssetType.DynamicHead, 
    Enum.AssetType.Torso, 
    Enum.AssetType.LeftArm, 
    Enum.AssetType.RightArm, 
    Enum.AssetType.LeftLeg, 
    Enum.AssetType.RightLeg, 
    Enum.AssetType.HairAccessory, 
    Enum.AssetType.EyebrowAccessory, 
    Enum.AssetType.EyelashAccessory
};
local function v21(v18)
    v18 = v18:Clone();
    for _, v20 in v18:GetDescendants() do
        if not (not v20:IsA("Motor6D") and v20.Name ~= "OriginalSize") or v20.Name == "OriginalPosition" then
            v20:Destroy();
        elseif v20:IsA("Weld") and v20.Name == "AccessoryWeld" then
            v20:Destroy();
        elseif not (not (not (not v20:IsA("MeshPart") or v20.Parent:IsA("Accessory")) and v20.TextureID == "") or v20:FindFirstChildWhichIsA("SurfaceAppearance")) then
            Instance.new("SurfaceAppearance").Parent = v20;
        end;
    end;
    return v18;
end;
return function(v22, v23, v24, v25, v26, v27)
    v25 = v25 or function()
    end;
    assert(v25 ~= nil, "Luau");
    if v22:IsA("Model") then
        local v28 = v13(if not v3() then v21(v22) else v14(v22), v23, v24, false);
        local v29 = {};
        local v30 = {};
        for v31, v32 in v23[v24].allowedAssetTypeSettings, nil, nil do
            local v33 = assert(Enum.AssetType[v31], "Asset type name doesn't map to an enum item");
            if v32.isEligibleForUpload then
                local v34 = true;
                if v32.minimumQuantity ~= 0 then
                    v34 = v32.minimumQuantity == 1;
                end;
                assert(v34, "Invalid minimum quantity, createUGCBodyParts folder is a dictionary and will only ever give one.");
                v34 = true;
                if v32.maximumQuantity ~= 0 then
                    v34 = v32.maximumQuantity == 1;
                end;
                assert(v34, "Invalid maximum quantity, createUGCBodyParts folder is a dictionary and will only ever give one.");
                local v35 = v28[v33];
                v34 = v35 and v35[1];
                if not (v32.minimumQuantity == 0) or v34 ~= nil then
                    table.insert(v30, {
                        assetType = v33, 
                        instance = v34, 
                        settings = v32, 
                        status = v34 == nil and "finished" or "pending"
                    });
                    if v34 == nil then
                        table.insert(v29, {
                            assetType = v33, 
                            error = {
                                type = "notFound"
                            }
                        });
                    end;
                end;
            end;
        end;
        table.sort(v30, function(v36, v37)
            return (table.find(v17, v36.assetType) or math.huge) < (table.find(v17, v37.assetType) or math.huge);
        end);
        local v38 = {
            errors = v29, 
            pieces = v30
        };
        v25(v38);
        return v6.each(v30, function(v39, v40)
            if v39.status == "finished" then
                return ;
            else
                assert(v39.instance ~= nil, "Unfinished piece doesn't have an instnace");
                local v41 = nil;
                local v42 = nil;
                if not v1() then
                    local v43, v44 = v15(false, {
                        v39.instance
                    }, v39.assetType, false, false, if not v4() then {} else v10(), nil);
                    v41 = v43;
                    v42 = v44;
                else
                    local v45 = {
                        v39.instance
                    };
                    local v46 = {
                        instances = v45, 
                        assetTypeEnum = v39.assetType, 
                        allowUnreviewedAssets = false, 
                        restrictedUserIds = if not v4() then {} else v10(), 
                        isServer = false, 
                        isAsync = false, 
                        allowEditableInstances = v26, 
                        bypassFlags = v27
                    };
                    if not v5() then
                        local v47, v48 = v15(v46);
                        v41 = v47;
                        v42 = v48;
                    else
                        local v49, v50 = v11(v45, v26);
                        if v49 then
                            v46.editableMeshes = v50.editableMeshes;
                            v46.editableImages = v50.editableImages;
                            local v51, v52 = v15(v46);
                            v41 = v51;
                            v42 = v52;
                            v12(v46.editableMeshes, v46.editableImages);
                        else
                            v42 = v50;
                            v41 = false;
                        end;
                    end;
                end;
                v38 = table.clone(v38);
                v38.errors = table.clone(v38.errors);
                if not v41 then
                    assert(v42 ~= nil, "Failure without errors");
                    for _, v54 in v42, nil, nil do
                        table.insert(v38.errors, {
                            assetType = v39.assetType, 
                            error = {
                                type = "message", 
                                message = v54
                            }
                        });
                    end;
                end;
                v38.pieces = table.clone(v38.pieces);
                v38.pieces[v40].status = "finished";
                v25(v38);
                return ;
            end;
        end):andThen(function()
            if v2() and v24 == "Body" then
                local function v59(v55)
                    local v56 = {};
                    for _, v58 in v55, nil, nil do
                        if v7.isBodyPart(v58.assetType) then
                            table.insert(v56, {
                                assetTypeEnum = v58.assetType, 
                                allSelectedInstances = if not v58.instance then {} else {
                                    v58.instance
                                }
                            });
                        end;
                    end;
                    return v56;
                end;
                local v60 = nil;
                local v61 = nil;
                local v62 = v59(v38.pieces);
                if not v1() then
                    local v63, v64 = v16(v62, false);
                    v60 = v63;
                    v61 = v64;
                else
                    local v65 = {
                        fullBodyData = v62, 
                        isServer = false, 
                        allowEditableInstances = v26, 
                        bypassFlags = v27
                    };
                    if not v5() then
                        local v66, v67 = v16(v65);
                        v60 = v66;
                        v61 = v67;
                    else
                        local v68 = {};
                        for _, v70 in v62, nil, nil do
                            for _, v72 in v70.allSelectedInstances, nil, nil do
                                table.insert(v68, v72);
                            end;
                        end;
                        local v73, v74 = v11(v68, v26);
                        if v73 then
                            v65.editableMeshes = v74.editableMeshes;
                            v65.editableImages = v74.editableImages;
                            local v75, v76 = v16(v65);
                            v60 = v75;
                            v61 = v76;
                            v12(v65.editableMeshes, v65.editableImages);
                        else
                            v61 = v74;
                            v60 = false;
                        end;
                    end;
                end;
                if not v60 then
                    v38 = table.clone(v38);
                    v38.errors = table.clone(v38.errors);
                    assert(v61 and #v61 > 0, "There should always be a reason for failure");
                    for _, v78 in v61, nil, nil do
                        table.insert(v38.errors, {
                            assetType = nil, 
                            error = {
                                type = "message", 
                                message = v78
                            }
                        });
                    end;
                end;
                v25(v38);
            end;
        end):andThen(function()
            return v38;
        end);
    else
        return v6.resolve({
            errors = {
                {
                    assetType = nil, 
                    error = {
                        type = "message", 
                        message = "Invalid root instance, must be a model"
                    }
                }
            }, 
            pieces = {}
        });
    end;
end;
