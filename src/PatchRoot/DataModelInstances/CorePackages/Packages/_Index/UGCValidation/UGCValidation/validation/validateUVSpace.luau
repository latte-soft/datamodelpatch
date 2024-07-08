local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Analytics);
local _ = require(l_Parent_0.util.Types);
local v4 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local v5 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local function v13(v6)
    local v7 = nil;
    local v8 = nil;
    if not v5() then
        local l_status_0, l_result_0 = pcall(function()
            return l_UGCValidationService_0:ValidateUVSpace(v6.contentId);
        end);
        v7 = l_status_0;
        v8 = l_result_0;
    else
        local l_status_1, l_result_1 = pcall(function()
            return l_UGCValidationService_0:ValidateEditableMeshUVSpace(v6.editableMesh);
        end);
        v7 = l_status_1;
        v8 = l_result_1;
    end;
    if v7 then
        if v8 then
            return true;
        else
            v2.reportFailure(v2.ErrorType.validateUVSpace_InvalidUVSpace);
            return false, {
                string.format("Detected modified UV values for '%s'. The original UV map for this model can't be altered.", v6.fullName)
            };
        end;
    else
        v2.reportFailure(v2.ErrorType.validateUVSpace_FailedToExecute);
        return false, {
            string.format("Failed to execute validateUVSpace check on '%s'. Make sure the UV maps exists and try again.", v6.fullName)
        };
    end;
end;
local function v17(v14)
    local l_status_2, l_result_2 = pcall(function()
        return l_UGCValidationService_0:ValidateUVSpace(v14);
    end);
    if l_status_2 then
        if l_result_2 then
            return true;
        else
            v2.reportFailure(v2.ErrorType.validateUVSpace_InvalidUVSpace);
            return false, {
                "Your mesh has UVs defined outside 0-1 space. This can lead to texturing discrepancies and violates UGC upload requirements."
            };
        end;
    else
        v2.reportFailure(v2.ErrorType.validateUVSpace_FailedToExecute);
        return false, {
            "Failed to execute validateUVSpace check"
        };
    end;
end;
if not v4() then
    return v17;
else
    return v13;
end;
