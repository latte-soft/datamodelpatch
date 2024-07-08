local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.util.pcallDeferred);
local v4 = require(l_Parent_0.flags.getFFlagUGCValidationShouldYield);
local v5 = require(l_Parent_0.Analytics);
local v6 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local v7 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local function v17(v8, v9)
    local l_isServer_0 = v9.isServer;
    local v11 = nil;
    local v12 = nil;
    if not v7() or not v4() then
        local l_status_0, l_result_0 = pcall(function()
            return l_UGCValidationService_0:ValidateFullBodyCageDeletion(v8.contentId);
        end);
        v11 = l_status_0;
        v12 = l_result_0;
    else
        local v15, v16 = v3(function()
            return l_UGCValidationService_0:ValidateEditableMeshFullBodyCageDeletion(v8.editableMesh);
        end, v9);
        v11 = v15;
        v12 = v16;
    end;
    if v11 then
        if v12 then
            return true;
        else
            v5.reportFailure(v5.ErrorType.validateFullBodyCageDeletion_GeometryRemoved);
            return false, {
                string.format("Missing cage for '%s'. You need to provide a cage mesh for each of the 15 body parts making up the R15 body.", v8.fullName)
            };
        end;
    else
        if not (not (l_isServer_0 ~= nil) or not l_isServer_0) then
            error(string.format("Failed to execute body cage detection for '%s'. Make sure the cage mesh exists and try again.", v8.fullName));
        end;
        v5.reportFailure(v5.ErrorType.validateFullBodyCageDeletion_FailedToExecute);
        return false, {
            string.format("Failed to execute cage detection for '%s'. Make sure the cage mesh exists and try again.", v8.fullName)
        };
    end;
end;
local function v23(v18, v19, v20)
    local l_status_1, l_result_1 = pcall(function()
        return l_UGCValidationService_0:ValidateFullBodyCageDeletion(v18);
    end);
    if l_status_1 then
        if l_result_1 then
            return true;
        else
            v5.reportFailure(v5.ErrorType.validateFullBodyCageDeletion_GeometryRemoved);
            return false, {
                string.format("Some %s geometry has been removed. This will result in layering issues.", v19)
            };
        end;
    else
        if not (not (v20 ~= nil) or not v20) then
            error("Failed to execute validateFullBodyCageDeletion check");
        end;
        v5.reportFailure(v5.ErrorType.validateFullBodyCageDeletion_FailedToExecute);
        return false, {
            "Failed to execute validateFullBodyCageDeletion check"
        };
    end;
end;
if not v6() then
    return v23;
else
    return v17;
end;
