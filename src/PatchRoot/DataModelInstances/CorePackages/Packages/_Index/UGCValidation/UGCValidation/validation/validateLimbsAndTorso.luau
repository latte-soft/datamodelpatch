local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local v2 = require(l_Parent_0.Constants);
local v3 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local v4 = require(l_Parent_0.validation.validateMeshPartBodyPart);
local v5 = require(l_Parent_0.validation.validateTags);
local v6 = require(l_Parent_0.validation.validateProperties);
local v7 = require(l_Parent_0.validation.validateAttributes);
local v8 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v9 = require(l_Parent_0.util.createLimbsAndTorsoSchema);
local _ = require(l_Parent_0.util.Types);
local _ = function(v11, v12)
    for _, v14 in pairs(v11) do
        if v14.Name == v12 then
            return v14;
        end;
    end;
    return nil;
end;
local function v23(v16, v17)
    if #v16 == #v17 then
        for _, v19 in v17, nil, nil do
            local v20;
            for _, v22 in pairs(v16) do
                if v22.Name == v19 then
                    v20 = v22;
                    goto label0 --[[  true, false  ]];
                end;
            end;
            v20 = nil;
            ::label0::;
            if not v20 or v20.ClassName ~= "Folder" then
                return false;
            end;
        end;
        return true;
    else
        return false;
    end;
end;
local function _(v24, v25)
    local l_v24_FullName_0 = v24:GetFullName();
    local v27, v28 = string.find(l_v24_FullName_0, v25 .. "%.");
    assert(v27 and v28);
    return (string.sub(l_v24_FullName_0, v28 + 1, #l_v24_FullName_0));
end;
local function v35(v30, v31)
    local v32 = v8.new();
    for v33, v34 in v30, nil, nil do
        if not (v31[v33] ~= nil) or v31[v33] ~= v34 then
            v1.reportFailure(v1.ErrorType.validateLimbsAndTorso_FolderInfoMismatch);
            if not v3() then
                v32:updateReasons(false, {
                    (("%* has a different value in different folders"):format(v33))
                });
            else
                v32:updateReasons(false, {
                    (("Attribute %* has a different values in different children folders. You need to use the same value in all folders."):format(v33))
                });
            end;
        end;
    end;
    return v32:getFinalResults();
end;
local function v54(v36, v37)
    if #v37 == 1 then
        return true;
    else
        local v38 = nil;
        local v39 = v8.new();
        for _, v41 in v37, nil, nil do
            if v41 ~= v2.FOLDER_NAMES.R6 then
                local v42;
                for _, v44 in pairs(v36) do
                    if v44.Name == v41 then
                        v42 = v44;
                        goto label1 --[[  true, false  ]];
                    end;
                end;
                v42 = nil;
                ::label1::;
                assert(v42);
                local v45 = {};
                for _, v47 in v42:GetDescendants() do
                    local v48 = v2.CONTENT_ID_FIELDS[v47.ClassName];
                    if v48 then
                        for _, v50 in v48, nil, nil do
                            local l_v47_FullName_0 = v47:GetFullName();
                            local v52, v53 = string.find(l_v47_FullName_0, v41 .. "%.");
                            assert(v52 and v53);
                            v45[string.sub(l_v47_FullName_0, v53 + 1, #l_v47_FullName_0) .. "." .. v50] = v47[v50];
                        end;
                    end;
                end;
                if v38 then
                    v39:updateReasons(v35(v38, v45));
                    v39:updateReasons(v35(v45, v38));
                else
                    v38 = v45;
                end;
            end;
        end;
        return v39:getFinalResults();
    end;
end;
local function v58(v55, v56)
    local v57 = v8.new();
    if #v55:GetChildren() > 0 then
        v1.reportFailure(v1.ErrorType.validateLimbsAndTorso_R6FolderHasChildren);
        v57:updateReasons(false, {
            string.format("Deprecated R6 folder for '%s' should be empty. You need to clear that folder and try again.", v56.Name)
        });
    end;
    v57:updateReasons(v5(v55));
    v57:updateReasons(v6(v55));
    v57:updateReasons(v7(v55));
    return v57:getFinalResults();
end;
local function v61(v59)
    local v60 = v8.new();
    if #v59:GetChildren() > 0 then
        v1.reportFailure(v1.ErrorType.validateLimbsAndTorso_R6FolderHasChildren);
        v60:updateReasons(false, {
            (("%* Folder should have no childrenformat(v2.FOLDER_NAMES.R6))
        });
    end;
    v60:updateReasons(v5(v59));
    v60:updateReasons(v6(v59));
    v60:updateReasons(v7(v59));
    return v60:getFinalResults();
end;
local function v78(v62)
    assert(v62.instances ~= nil, "instances required in validationContext for validateLimbsAndTorso");
    local l_instances_0 = v62.instances;
    assert(v62.assetTypeEnum ~= nil, "assetTypeEnum required in validationContext for validateLimbsAndTorso");
    local l_assetTypeEnum_0 = v62.assetTypeEnum;
    local l_isServer_0 = v62.isServer;
    local v66 = {
        v2.FOLDER_NAMES.R15ArtistIntent
    };
    if l_isServer_0 then
        table.insert(v66, v2.FOLDER_NAMES.R15Fixed);
        table.insert(v66, v2.FOLDER_NAMES.R6);
    end;
    if v23(l_instances_0, v66) then
        for _, v68 in v66, nil, nil do
            local v69;
            for _, v71 in pairs(l_instances_0) do
                if v71.Name == v68 then
                    v69 = v71;
                    goto label2 --[[  true, false  ]];
                end;
            end;
            v69 = nil;
            ::label2::;
            local v72 = nil;
            local v73 = nil;
            if v68 == v2.FOLDER_NAMES.R6 then
                local v74, v75 = v58(v69, l_assetTypeEnum_0);
                v72 = v74;
                v73 = v75;
            else
                local v76, v77 = v4(v69, v9(l_assetTypeEnum_0, v68, v62), v62);
                v72 = v76;
                v73 = v77;
            end;
            if not v72 then
                return v72, v73;
            end;
        end;
        return v54(l_instances_0, v66);
    else
        v1.reportFailure(v1.ErrorType.validateLimbsAndTorso_TopLevelFolders);
        return false, {
            "Incorrect hierarchy for asset with the following missing folders: " .. table.concat(v66, ", ")
        };
    end;
end;
local function v97(v79, v80, v81, v82, v83, v84)
    local v85 = {
        v2.FOLDER_NAMES.R15ArtistIntent
    };
    if v81 then
        table.insert(v85, v2.FOLDER_NAMES.R15Fixed);
        table.insert(v85, v2.FOLDER_NAMES.R6);
    end;
    if v23(v79, v85) then
        for _, v87 in v85, nil, nil do
            local v88;
            for _, v90 in pairs(v79) do
                if v90.Name == v87 then
                    v88 = v90;
                    goto label3 --[[  true, false  ]];
                end;
            end;
            v88 = nil;
            ::label3::;
            local v91 = nil;
            local v92 = nil;
            if v87 == v2.FOLDER_NAMES.R6 then
                local v93, v94 = v61(v88);
                v91 = v93;
                v92 = v94;
            else
                local v95, v96 = v4(v88, v9(v80, v87), v80, v81, v82, v83, v84);
                v91 = v95;
                v92 = v96;
            end;
            if not v91 then
                return v91, v92;
            end;
        end;
        return v54(v79, v85);
    else
        v1.reportFailure(v1.ErrorType.validateLimbsAndTorso_TopLevelFolders);
        return false, {
            "Incorrect hierarchy selection, folders required: " .. table.concat(v85, ", ")
        };
    end;
end;
if not v3() then
    return v97;
else
    return v78;
end;
