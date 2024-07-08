local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local v3 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local _ = require(l_Parent_0.util.Types);
local v5 = require(l_Parent_0.util.pcallDeferred);
local v6 = require(l_Parent_0.flags.getFFlagUGCValidationShouldYield);
local v7 = require(l_Parent_0.Analytics);
local function v17(v8, v9)
    local l_isServer_0 = v9.isServer;
    local v11 = nil;
    local v12 = nil;
    if not v3() or not v6() then
        local l_status_0, l_result_0 = pcall(function()
            return l_UGCValidationService_0:ValidateOverlappingVertices(v8.contentId);
        end);
        v11 = l_status_0;
        v12 = l_result_0;
    else
        local v15, v16 = v5(function()
            return l_UGCValidationService_0:ValidateEditableMeshOverlappingVertices(v8.editableMesh);
        end, v9);
        v11 = v15;
        v12 = v16;
    end;
    if v11 then
        if v12 then
            return true;
        else
            v7.reportFailure(v7.ErrorType.validateOverlappingVertices_OverlappingVertices);
            return false, {
                string.format("Detected two or more vertices in model mesh '%s' sharing near identical positions. You need to position vertices further apart from each other.", v8.fullName)
            };
        end;
    else
        if not (not (l_isServer_0 ~= nil) or not l_isServer_0) then
            error(string.format("Failed to execute overlapping mesh vertex check for '%s'. Make sure mesh exists and try again.", v8.fullName));
        end;
        v7.reportFailure(v7.ErrorType.validateOverlappingVertices_FailedToExecute);
        return false, {
            string.format("Failed to execute overlapping mesh vertex check for '%s'. Make sure mesh exists and try again.", v8.fullName)
        };
    end;
end;
local function v23(v18, v19, v20)
    local l_status_1, l_result_1 = pcall(function()
        return l_UGCValidationService_0:ValidateOverlappingVertices(v18);
    end);
    if l_status_1 then
        if l_result_1 then
            return true;
        else
            v7.reportFailure(v7.ErrorType.validateOverlappingVertices_OverlappingVertices);
            return false, {
                string.format("%s has multiple vertices sharing identical or near-identical positions.", v19)
            };
        end;
    else
        if not (not (v20 ~= nil) or not v20) then
            error(string.format("Failed to execute validateOverlappingVertices check for %s", v19));
        end;
        v7.reportFailure(v7.ErrorType.validateOverlappingVertices_FailedToExecute);
        return false, {
            string.format("Failed to execute validateOverlappingVertices check for %s", v19)
        };
    end;
end;
if not v2() then
    return v23;
else
    return v17;
end;
