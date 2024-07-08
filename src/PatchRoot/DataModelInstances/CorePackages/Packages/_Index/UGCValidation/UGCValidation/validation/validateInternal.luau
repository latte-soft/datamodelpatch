local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local v3 = require(l_Parent_0.flags.getFFlagAddUGCValidationForPackage);
local v4 = require(l_Parent_0.flags.getFFlagUGCValidationMeshPartAccessoryUploads);
local v5 = require(l_Parent_0.ConstantsInterface);
local v6 = require(l_Parent_0.util.isMeshPartAccessory);
local v7 = require(l_Parent_0.util.isLayeredClothing);
local v8 = require(l_Parent_0.validation.validateLayeredClothingAccessory);
local v9 = require(l_Parent_0.validation.validateLegacyAccessory);
local v10 = require(l_Parent_0.validation.validateMeshPartAccessory);
local v11 = require(l_Parent_0.validation.validateLimbsAndTorso);
local v12 = require(l_Parent_0.validation.validateDynamicHeadMeshPartFormat);
local v13 = require(l_Parent_0.validation.validatePackage);
local function v16(v14)
    local l_assetTypeEnum_0 = v14.assetTypeEnum;
    assert(v5.isBodyPart(l_assetTypeEnum_0));
    if Enum.AssetType.DynamicHead == l_assetTypeEnum_0 then
        return v12(v14);
    else
        return v11(v14);
    end;
end;
local function v24(_, v18, v19, v20, v21, v22, v23)
    assert(v5.isBodyPart(v19));
    if Enum.AssetType.DynamicHead == v19 then
        return v12(v18, v20, v21, v22, v23);
    else
        return v11(v18, v19, v20, v21, v22, v23);
    end;
end;
local function v29(v25)
    local l_instances_0 = v25.instances;
    local l_assetTypeEnum_1 = v25.assetTypeEnum;
    if not v5.isBodyPart(l_assetTypeEnum_1) then
        if v3() and l_assetTypeEnum_1 == Enum.AssetType.Model then
            return v13(v25);
        elseif not v4() then
            if not v7(l_instances_0[1]) then
                return v9(v25);
            else
                return v8(v25);
            end;
        else
            local v28 = l_instances_0[1];
            if not v6(v28) then
                return v9(v25);
            elseif not v7(v28) then
                return v10(v25);
            else
                return v8(v25);
            end;
        end;
    else
        return v16(v25);
    end;
end;
local function v39(v30, v31, v32, v33, v34, v35, v36, v37)
    if not v5.isBodyPart(v32) then
        if v3() and v32 == Enum.AssetType.Model then
            return v13(v31, v33, v35, v36);
        elseif not v4() then
            if not v7(v31[1]) then
                return v9(v31, v32, v33, v34);
            else
                return v8(v31, v32, v33, v34);
            end;
        else
            local v38 = v31[1];
            if not v6(v38) then
                return v9(v31, v32, v33, v34);
            elseif not v7(v38) then
                return v10(v31, v32, v33, v34);
            else
                return v8(v31, v32, v33, v34);
            end;
        end;
    else
        return v24(v30, v31, v32, v33, v34, v35, v37);
    end;
end;
if not v2() then
    return v39;
else
    return v29;
end;
