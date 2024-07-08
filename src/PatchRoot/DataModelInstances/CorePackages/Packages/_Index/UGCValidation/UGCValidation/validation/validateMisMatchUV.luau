local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Analytics);
local _ = require(l_Parent_0.util.Types);
local v4 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local v5 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local function v14(v6, v7)
    assert(v6.context == v7.context);
    local v8 = nil;
    local v9 = nil;
    if not v5() then
        local l_status_0, l_result_0 = pcall(function()
            return l_UGCValidationService_0:ValidateMisMatchUV(v6.contentId, v7.contentId);
        end);
        v8 = l_status_0;
        v9 = l_result_0;
    else
        local l_status_1, l_result_1 = pcall(function()
            return l_UGCValidationService_0:ValidateEditableMeshMisMatchUV(v6.editableMesh, v7.editableMesh);
        end);
        v8 = l_status_1;
        v9 = l_result_1;
    end;
    if v8 then
        if v9 then
            return true;
        else
            v2.reportFailure(v2.ErrorType.validateMisMatchUV_UVMismatch);
            return false, {
                string.format("Inner and Outer cage UV for '%s' are mismatched. The Roblox provided cage template should be used to create inner and outer cages with no modifications to the UV map.", v6.context)
            };
        end;
    else
        v2.reportFailure(v2.ErrorType.validateMisMatchUV_FailedToExecute);
        return false, {
            string.format("Failed to execute UV mismatch check for '%s'. Make sure UV map exists and try again.", v6.context)
        };
    end;
end;
local function v19(v15, v16)
    local l_status_2, l_result_2 = pcall(function()
        return l_UGCValidationService_0:ValidateMisMatchUV(v15, v16);
    end);
    if l_status_2 then
        if l_result_2 then
            return true;
        else
            v2.reportFailure(v2.ErrorType.validateMisMatchUV_UVMismatch);
            return false, {
                "Inner and Outer cage UV mismatched. Original cage template should be used and no modification to the UV map."
            };
        end;
    else
        v2.reportFailure(v2.ErrorType.validateMisMatchUV_FailedToExecute);
        return false, {
            "Failed to execute validateMisMatchUV check"
        };
    end;
end;
if not v4() then
    return v19;
else
    return v14;
end;
