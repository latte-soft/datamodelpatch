local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local v2 = require(l_Parent_0.flags.getFFlagUGCValidateFullBody);
local v3 = require(l_Parent_0.flags.getFFlagUGCValidationFixResetPhysicsError);
local v4 = require(l_Parent_0.Analytics);
local v5 = require(l_Parent_0.Constants);
local v6 = require(l_Parent_0.ConstantsInterface);
local _ = require(l_Parent_0.util.Types);
local v8 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v9 = require(l_Parent_0.util.validateWithSchema);
local v10 = require(l_Parent_0.validation.validateAssetBounds);
local v11 = require(l_Parent_0.validation.validateSingleInstance);
local v12 = require(l_Parent_0.util.createDynamicHeadMeshPartSchema);
local v13 = require(l_Parent_0.util.createLimbsAndTorsoSchema);
local v14 = require(l_Parent_0.util.resetPhysicsData);
local v15 = require(l_Parent_0.util.ParseContentIds);
local _ = function(v16, v17)
    for _, v19 in v16, nil, nil do
        if v19.Name == v17 then
            return v19;
        end;
    end;
    return nil;
end;
local function v31(v21, v22, v23)
    for _, v25 in v21, nil, nil do
        if Enum.AssetType.DynamicHead == v25.assetTypeEnum then
            if v11(v25.allSelectedInstances, v23) then
                if not v9(v12(v23), v25.allSelectedInstances[1]).success then
                    return false;
                end;
            else
                return false;
            end;
        else
            for _, v27 in v22, nil, nil do
                local v28;
                for _, v30 in v25.allSelectedInstances, nil, nil do
                    if v30.Name == v27 then
                        v28 = v30;
                        goto label0 --[[  true, false  ]];
                    end;
                end;
                v28 = nil;
                ::label0::;
                if v28 then
                    if not v9(v13(v25.assetTypeEnum, v27, v23), v28).success then
                        return false;
                    end;
                else
                    return false;
                end;
            end;
        end;
    end;
    return true;
end;
local function v41(v32, v33)
    for _, v35 in v32, nil, nil do
        if Enum.AssetType.DynamicHead == v35.assetTypeEnum then
            if v11(v35.allSelectedInstances) then
                if not v9(v12(), v35.allSelectedInstances[1]).success then
                    return false;
                end;
            else
                return false;
            end;
        else
            for _, v37 in v33, nil, nil do
                local v38;
                for _, v40 in v35.allSelectedInstances, nil, nil do
                    if v40.Name == v37 then
                        v38 = v40;
                        goto label1 --[[  true, false  ]];
                    end;
                end;
                v38 = nil;
                ::label1::;
                if v38 then
                    if not v9(v13(v35.assetTypeEnum, v37), v38).success then
                        return false;
                    end;
                else
                    return false;
                end;
            end;
        end;
    end;
    return true;
end;
local function v48(v42)
    local v43 = {};
    local v44 = #v6.getBodyPartAssets();
    local v45 = 0;
    for _, v47 in v42, nil, nil do
        if v6.isBodyPart(v47.assetTypeEnum) then
            if not v43[v47.assetTypeEnum] then
                v43[v47.assetTypeEnum] = true;
                v45 = v45 + 1;
            else
                return false;
            end;
        else
            return false;
        end;
    end;
    return v45 == v44;
end;
local function v59(v49, v50)
    local v51 = {};
    for _, v53 in v50, nil, nil do
        if Enum.AssetType.DynamicHead == v53.assetTypeEnum then
            v51[v53.allSelectedInstances[1].Name] = v53.allSelectedInstances[1];
        else
            local v54;
            for _, v56 in v53.allSelectedInstances, nil, nil do
                if v56.Name == v49 then
                    v54 = v56;
                    goto label2 --[[  true, false  ]];
                end;
            end;
            v54 = nil;
            ::label2::;
            for _, v58 in v54:GetChildren() do
                v51[v58.Name] = v58;
            end;
        end;
    end;
    return v51;
end;
local function v67(v60)
    local v61 = {
        MeshPart = {
            "MeshId"
        }
    };
    local v62 = {
        MeshPart = {
            MeshId = true
        }
    };
    for _, v64 in v60, nil, nil do
        for _, v66 in v64.allSelectedInstances, nil, nil do
            if not v15.parseWithErrorCheck({}, {}, v66, v61, v62) then
                v4.reportFailure(v4.ErrorType.validateFullBody_MeshIdsMissing);
                return false, {
                    "Unable to run full body validation due to previous errors detected while processing individual body parts"
                };
            end;
        end;
    end;
    return true;
end;
local function v74(v68, v69, v70)
    local v71 = if not v70 then nil else v70.isServer;
    if v48(v68) then
        if v31(v68, v69, v70) then
            if v3() then
                local v72, v73 = v67(v68);
                if not v72 then
                    return false, v73;
                end;
            end;
            return true;
        else
            v4.reportFailure(v4.ErrorType.validateFullBody_InstancesMissing);
            return false, {
                "Unable to run full body validation due to previous errors detected while processing individual body parts."
            };
        end;
    else
        v4.reportFailure(v4.ErrorType.validateFullBody_IncorrectAssetTypeSet);
        if v71 then
            error("Full body check did not receive the correct set of body part Asset Types (i.e. Head, Torso, LeftArm, RightArm, LeftLeg, RightLeg). Make sure the body model is valid and try again.");
        end;
        return false, {
            "Full body check did not receive the correct set of body part Asset Types (i.e. Head, Torso, LeftArm, RightArm, LeftLeg, RightLeg). Make sure the body model is valid and try again."
        };
    end;
end;
local function v80(v75, v76, v77)
    if v48(v75) then
        if v41(v75, v77) then
            if v3() then
                local v78, v79 = v67(v75);
                if not v78 then
                    return false, v79;
                end;
            end;
            return true;
        else
            v4.reportFailure(v4.ErrorType.validateFullBody_InstancesMissing);
            return false, {
                "Unable to run full body validation due to previous errors detected while processing individual body parts"
            };
        end;
    else
        v4.reportFailure(v4.ErrorType.validateFullBody_IncorrectAssetTypeSet);
        if v76 then
            error("Full body check did not receive the correct set of body part Asset Types");
        end;
        return false, {
            "Full body check did not receive the correct set of body part Asset Types"
        };
    end;
end;
local function v86(v81)
    for _, v83 in v81.fullBodyData, nil, nil do
        local v84, v85 = v14(v83.allSelectedInstances, v81);
        if not v84 then
            return false, {
                v85
            };
        end;
    end;
    return true;
end;
local function v93(v87, v88)
    for _, v90 in v87, nil, nil do
        if not v3() then
            v14(v90.allSelectedInstances);
        else
            local v91, v92 = v14(v90.allSelectedInstances, v88);
            if not v91 then
                return false, {
                    v92
                };
            end;
        end;
    end;
    return true;
end;
local function v105(v94)
    if v2() then
        assert(v94.fullBodyData ~= nil, "fullBodyData required in validationContext for validateFullBody");
        local l_fullBodyData_0 = v94.fullBodyData;
        local l_isServer_0 = v94.isServer;
        local v97 = {
            v5.FOLDER_NAMES.R15ArtistIntent
        };
        if l_isServer_0 then
            table.insert(v97, v5.FOLDER_NAMES.R15Fixed);
        end;
        local v98, v99 = v74(l_fullBodyData_0, v97, v94);
        if v98 then
            local v100, v101 = v86(v94);
            v98 = v100;
            v99 = v101;
            if v98 then
                v100 = v8.new();
                for _, v103 in v97, nil, nil do
                    local v104 = v59(v103, l_fullBodyData_0);
                    assert(v104);
                    v100:updateReasons(v10(v104, nil, v94));
                end;
                return v100:getFinalResults();
            else
                return false, v99;
            end;
        else
            return false, v99;
        end;
    else
        return true;
    end;
end;
local function v117(v106, v107)
    if v2() then
        local v108 = {
            v5.FOLDER_NAMES.R15ArtistIntent
        };
        if v107 then
            table.insert(v108, v5.FOLDER_NAMES.R15Fixed);
        end;
        local v109, v110 = v80(v106, v107, v108);
        if v109 then
            if not v3() then
                v93(v106);
            else
                local v111, v112 = v93(v106, v107);
                v109 = v111;
                v110 = v112;
                if not v109 then
                    return false, v110;
                end;
            end;
            local v113 = v8.new();
            for _, v115 in v108, nil, nil do
                local v116 = v59(v115, v106);
                assert(v116);
                v113:updateReasons(v10(v116, nil, nil, v107));
            end;
            return v113:getFinalResults();
        else
            return false, v110;
        end;
    else
        return true;
    end;
end;
if not v1() then
    return v117;
else
    return v105;
end;
