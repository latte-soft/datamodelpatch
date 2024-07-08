local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.util.pcallDeferred);
local v4 = require(l_Parent_0.flags.getFFlagUGCValidationShouldYield);
local v5 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local v6 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local v7 = require(l_Parent_0.util.calculateMinMax);
local function v18(v8, v9, v10)
    local v11 = nil;
    local v12 = nil;
    if not v6() or not v4() then
        local l_status_0, l_result_0 = pcall(function()
            return l_UGCValidationService_0:GetMeshVerts(v8.contentId);
        end);
        v11 = l_status_0;
        v12 = l_result_0;
    else
        local v15, v16 = v3(function()
            return l_UGCValidationService_0:GetEditableMeshVerts(v8.editableMesh);
        end, v10);
        v11 = v15;
        v12 = v16;
    end;
    if v11 then
        return true, nil, v12;
    else
        local v17 = "Failed to read mesh: " .. v8.fullName;
        if v9 then
            error(v17);
        end;
        return false, {
            v17
        };
    end;
end;
local function v24(v19, v20)
    local l_status_1, l_result_1 = pcall(function()
        return l_UGCValidationService_0:GetMeshVerts(v19);
    end);
    if l_status_1 then
        return true, nil, l_result_1;
    else
        local v23 = "Failed to read mesh: " .. tostring(v19);
        if v20 then
            error(v23);
        end;
        return false, {
            v23
        };
    end;
end;
local function v34(v25, v26)
    local v27 = nil;
    local v28 = nil;
    for _, v30 in pairs(v25) do
        local v31 = if not v26 then v30 else v30 * v26;
        local v32, v33 = v7(v27, v28, v31, v31);
        v27 = v32;
        v28 = v33;
    end;
    return v27, v28;
end;
local function v42(v35, v36)
    local v37, v38, v39 = v18(v35, v36.isServer, v36);
    if v37 then
        if not v39 or #v39 == 0 then
            return false, {
                "Mesh: " .. v35.fullName .. " contains no verts"
            };
        else
            local v40, v41 = v34(v39, v35.scale);
            return true, nil, v40, v41;
        end;
    else
        return v37, v38;
    end;
end;
local function v51(v43, v44, v45)
    local v46, v47, v48 = v24(v43, v44);
    if v46 then
        if not v48 or #v48 == 0 then
            return false, {
                "Mesh: " .. tostring(v43) .. " contains no verts"
            };
        else
            local v49, v50 = v34(v48, v45);
            return true, nil, v49, v50;
        end;
    else
        return v46, v47;
    end;
end;
if not v5() then
    return v51;
else
    return v42;
end;
