local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local v1 = game:DefineFastFlag("UGCValidationAddThumbnailFrustumCheckingv2", false);
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v4 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local v5 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local v6 = require(l_Parent_0.Analytics);
local function v15(v7, v8, v9, v10)
    local l_ThumbnailConfiguration_0 = v7:FindFirstChild("ThumbnailConfiguration");
    if l_ThumbnailConfiguration_0 then
        local l_ThumbnailCameraTarget_0 = l_ThumbnailConfiguration_0:FindFirstChild("ThumbnailCameraTarget");
        if l_ThumbnailCameraTarget_0.Value ~= v8 then
            v6.reportFailure(v6.ErrorType.validateThumbnailConfiguration_InvalidTarget);
            return false, {
                string.format("Invalid target asset for thumbnail generation. Expected it to be '%s'.", v8:GetFullName())
            };
        elseif not (not game:GetEngineFeature("EngineUGCValidateThumbnailerMeshInFrustum") or not v1) then
            local l_CFrame_0 = l_ThumbnailCameraTarget_0.Value.CFrame;
            local v14 = l_CFrame_0 * l_ThumbnailConfiguration_0:FindFirstChild("ThumbnailCameraValue").Value;
            if not v5() then
                if l_UGCValidationService_0:CheckMeshInCameraFrustum(v9.contentId, v10, l_CFrame_0, v14) == false then
                    v6.reportFailure(v6.ErrorType.validateThumbnailConfiguration_OutsideView);
                    return false, {
                        string.format("Asset '%s' is positioned outside the thumbnail camera view. You need to reposition the asset at the center of the camera view and try again.", v9.fullName)
                    };
                end;
            elseif l_UGCValidationService_0:CheckEditableMeshInCameraFrustum(v9.editableMesh, v10, l_CFrame_0, v14) == false then
                v6.reportFailure(v6.ErrorType.validateThumbnailConfiguration_OutsideView);
                return false, {
                    string.format("Asset '%s' is positioned outside the thumbnail camera view. You need to reposition the asset at the center of the camera view and try again.", v9.fullName)
                };
            end;
        end;
    end;
    return true;
end;
local function v23(v16, v17, v18, v19)
    local l_ThumbnailConfiguration_1 = v16:FindFirstChild("ThumbnailConfiguration");
    if l_ThumbnailConfiguration_1 then
        local l_ThumbnailCameraTarget_1 = l_ThumbnailConfiguration_1:FindFirstChild("ThumbnailCameraTarget");
        if l_ThumbnailCameraTarget_1.Value ~= v17 then
            v6.reportFailure(v6.ErrorType.validateThumbnailConfiguration_InvalidTarget);
            return false, {
                string.format("ThumbnailCameraTarget.Value must be %s", v17:GetFullName())
            };
        elseif not (not game:GetEngineFeature("EngineUGCValidateThumbnailerMeshInFrustum") or not v1) then
            local l_CFrame_1 = l_ThumbnailCameraTarget_1.Value.CFrame;
            if l_UGCValidationService_0:CheckMeshInCameraFrustum(v18, v19, l_CFrame_1, l_CFrame_1 * l_ThumbnailConfiguration_1:FindFirstChild("ThumbnailCameraValue").Value) == false then
                v6.reportFailure(v6.ErrorType.validateThumbnailConfiguration_OutsideView);
                return false, {
                    "Item must be fully within view of thumbnail camera"
                };
            end;
        end;
    end;
    return true;
end;
if not v4() then
    return v23;
else
    return v15;
end;
