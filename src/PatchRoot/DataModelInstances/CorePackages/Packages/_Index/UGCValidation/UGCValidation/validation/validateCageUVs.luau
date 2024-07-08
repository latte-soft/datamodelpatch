local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.util.pcallDeferred);
local v3 = require(l_Parent_0.flags.getFFlagUGCValidationShouldYield);
local v4 = require(l_Parent_0.Analytics);
local v5 = require(l_Parent_0.Constants);
local v6 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local v7 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateBodyParts);
local v8 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateCalculateUniqueUV);
local v9 = require(l_Parent_0.flags.getFIntUniqueUVTolerance);
local v10 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local function v31(v12, v13, v14)
    local l_isServer_0 = v14.isServer;
    if v7() then
        local v16 = assert(v5.WRAP_TARGET_CAGE_MESH_UV_COUNTS[v13.Parent.Name], "WrapTarget is not parented to a MeshPart");
        local v17 = nil;
        local v18 = nil;
        local v19 = nil;
        if not v8() then
            if not v10() or not v3() then
                local l_status_0, l_result_0 = pcall(function()
                    for v20 = 0, v9() do
                        if not l_UGCValidationService_0:ValidateUniqueUVCount(v12.contentId, v16 + v20) then
                            if not (not (v20 ~= 0 and v16 - v20 >= 0) or not l_UGCValidationService_0:ValidateUniqueUVCount(v12.contentId, v16 - v20)) then
                                return true;
                            end;
                        else
                            return true;
                        end;
                    end;
                    return false;
                end);
                v17 = l_status_0;
                v18 = l_result_0;
            else
                local v24, v25 = v2(function()
                    for v23 = 0, v9() do
                        if not l_UGCValidationService_0:ValidateEditableMeshUniqueUVCount(v12.editableMesh, v16 + v23) then
                            if not (not (v23 ~= 0 and v16 - v23 >= 0) or not l_UGCValidationService_0:ValidateEditableMeshUniqueUVCount(v12.editableMesh, v16 - v23)) then
                                return true;
                            end;
                        else
                            return true;
                        end;
                    end;
                    return false;
                end, v14);
                v17 = v24;
                v18 = v25;
            end;
        elseif not v10() or not v3() then
            local l_status_1, l_result_1 = pcall(function()
                v19 = l_UGCValidationService_0:CalculateUniqueUVCount(v12.contentId);
                return math.abs(v19 - v16) <= v9();
            end);
            v17 = l_status_1;
            v18 = l_result_1;
        else
            local v28, v29 = v2(function()
                v19 = l_UGCValidationService_0:CalculateEditableMeshUniqueUVCount(v12.editableMesh);
                return math.abs(v19 - v16) <= v9();
            end, v14);
            v17 = v28;
            v18 = v29;
        end;
        if v17 then
            if v18 then
                return true;
            else
                v4.reportFailure(v4.ErrorType.validateCageUVs_TestPassed);
                return false, {
                    string.format("%s.%s ( %s ) should have %d unique UVs, but has %d. Please make sure the mesh has the required number of unique UVs and try again.", v13:GetFullName(), v12.fieldName, not v12.contentId and "" or v12.contentId, v16, v19)
                };
            end;
        else
            local v30 = string.format("Failed to execute UV check for '%s'. Make sure the UV map exists and try again.", v13:GetFullName());
            if l_isServer_0 then
                error(v30);
            end;
            v4.reportFailure(v4.ErrorType.validateCageUVs_TestExecutedSuccessfully);
            return false, {
                v30
            };
        end;
    else
        return true;
    end;
end;
local function v46(v32, v33, v34, v35)
    if v7() then
        local v36 = assert(v5.WRAP_TARGET_CAGE_MESH_UV_COUNTS[v33.Parent.Name], "WrapTarget is not parented to a MeshPart");
        local v37 = nil;
        local v38 = nil;
        local v39 = nil;
        if not v8() then
            local l_status_2, l_result_2 = pcall(function()
                for v40 = 0, v9() do
                    if not l_UGCValidationService_0:ValidateUniqueUVCount(v32, v36 + v40) then
                        if not (not (v40 ~= 0 and v36 - v40 >= 0) or not l_UGCValidationService_0:ValidateUniqueUVCount(v32, v36 - v40)) then
                            return true;
                        end;
                    else
                        return true;
                    end;
                end;
                return false;
            end);
            v37 = l_status_2;
            v38 = l_result_2;
        else
            local l_status_3, l_result_3 = pcall(function()
                v39 = l_UGCValidationService_0:CalculateUniqueUVCount(v32);
                return math.abs(v39 - v36) <= v9();
            end);
            v37 = l_status_3;
            v38 = l_result_3;
        end;
        if v37 then
            if v38 then
                return true;
            else
                v4.reportFailure(v4.ErrorType.validateCageUVs_TestPassed);
                if not v8() then
                    return false, {
                        string.format("%s.%s ( %s ) should have %d unique UVs", v33:GetFullName(), v34, v32, v36)
                    };
                else
                    return false, {
                        string.format("%s.%s ( %s ) should have %d unique UVs, but has %d", v33:GetFullName(), v34, v32, v36, v39)
                    };
                end;
            end;
        else
            local v45 = string.format("Failed to read mesh %s.%s ( %s )", v33:GetFullName(), v34, v32);
            if v35 then
                error(v45);
            end;
            v4.reportFailure(v4.ErrorType.validateCageUVs_TestExecutedSuccessfully);
            return false, {
                v45
            };
        end;
    else
        return true;
    end;
end;
if not v6() then
    return v46;
else
    return v31;
end;
