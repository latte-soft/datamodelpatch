local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.flags.getFFlagUGCLCQualityReplaceLua);
local v3 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local v4 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local _ = require(l_Parent_0.util.Types);
local v6 = require(l_Parent_0.util.pcallDeferred);
local v7 = require(l_Parent_0.flags.getFFlagUGCValidationShouldYield);
local v8 = require(l_Parent_0.Analytics);
local v9 = require(l_Parent_0.Constants);
local function v26(v10, v11, v12)
    local l_isServer_0 = v12.isServer;
    if not v4() then
        if v10.contentId == "" then
            if not v11 then
                v8.reportFailure(v8.ErrorType.validateTextureSize_InvalidTextureId);
                return false, {
                    string.format("Invalid textureID used in mesh '%s'. Make sure the texture exists and try again.", v10.fullName)
                };
            else
                return true;
            end;
        end;
    elseif not v10.editableImage then
        if not v11 then
            v8.reportFailure(v8.ErrorType.validateTextureSize_InvalidTextureId);
            return false, {
                string.format("Invalid textureID used in mesh '%s'. Make sure the texture exists and try again.", v10.fullName)
            };
        else
            return true;
        end;
    end;
    if not v2() then
        local v14 = nil;
        local v15 = nil;
        if not v4() or not v7() then
            local l_status_0, l_result_0 = pcall(function()
                return l_UGCValidationService_0:GetTextureSize(v10.contentId);
            end);
            v14 = l_status_0;
            v15 = l_result_0;
        else
            local v18, v19 = v6(function()
                return l_UGCValidationService_0:GetEditableImageSize(v10.editableImage);
            end, v12);
            v14 = v18;
            v15 = v19;
        end;
        if v14 then
            if not (v9.MAX_TEXTURE_SIZE >= v15.X) or v9.MAX_TEXTURE_SIZE < v15.Y then
                v8.reportFailure(v8.ErrorType.validateTextureSize_TextureTooBig);
                return false, {
                    string.format("Texture resolution %dx%d px found in '%s' is higher than max size supported value of %dx%d px. You need to reduce the texture resolution", v15.X, v15.Y, v10.fullName, v9.MAX_TEXTURE_SIZE, v9.MAX_TEXTURE_SIZE)
                };
            end;
        else
            if not (not (l_isServer_0 ~= nil) or not l_isServer_0) then
                error(string.format("Failed to load texture data for '%s'. Make sure the texture exists and try again.", v10.fullName));
            end;
            v8.reportFailure(v8.ErrorType.validateTextureSize_FailedToLoadTexture);
            return false, {
                string.format("Failed to load texture data for '%s'. Make sure the texture exists and try again.", v10.fullName)
            };
        end;
    else
        local v20 = nil;
        local v21 = nil;
        if not v4() or not v7() then
            local l_status_1, l_result_1 = pcall(function()
                return l_UGCValidationService_0:ValidateTextureSize(v10.contentId);
            end);
            v20 = l_status_1;
            v21 = l_result_1;
        else
            local v24, v25 = v6(function()
                return l_UGCValidationService_0:ValidateEditableImageSize(v10.editableImage);
            end, v12);
            v20 = v24;
            v21 = v25;
        end;
        if v20 then
            if not v21 then
                v8.reportFailure(v8.ErrorType.validateTextureSize_TextureTooBig);
                return false, {
                    "Your textures exceeds the max texture size limit for UGC upload requirements."
                };
            end;
        else
            if not (not (l_isServer_0 ~= nil) or not l_isServer_0) then
                error("Failed to execute validateTextureSize check");
            end;
            v8.reportFailure(v8.ErrorType.validateTextureSize_FailedToExecute);
            return false, {
                "Failed to execute validateTextureSize check"
            };
        end;
    end;
    return true;
end;
local function v34(v27, v28, v29)
    if v27 == "" then
        if not v28 then
            v8.reportFailure(v8.ErrorType.validateTextureSize_InvalidTextureId);
            return false, {
                "Mesh must contain valid TextureId"
            };
        else
            return true;
        end;
    else
        if not v2() then
            local l_status_2, l_result_2 = pcall(function()
                return l_UGCValidationService_0:GetTextureSize(v27);
            end);
            if l_status_2 then
                if not (v9.MAX_TEXTURE_SIZE >= l_result_2.X) or v9.MAX_TEXTURE_SIZE < l_result_2.Y then
                    v8.reportFailure(v8.ErrorType.validateTextureSize_TextureTooBig);
                    return false, {
                        string.format("Texture size is %dx%d px, but the limit is %dx%d px", l_result_2.X, l_result_2.Y, v9.MAX_TEXTURE_SIZE, v9.MAX_TEXTURE_SIZE)
                    };
                end;
            else
                if not (not (v29 ~= nil) or not v29) then
                    error("Failed to load texture data " .. tostring(l_result_2));
                end;
                v8.reportFailure(v8.ErrorType.validateTextureSize_FailedToLoadTexture);
                return false, {
                    "Failed to load texture data", 
                    l_result_2
                };
            end;
        else
            local l_status_3, l_result_3 = pcall(function()
                return l_UGCValidationService_0:ValidateTextureSize(v27);
            end);
            if l_status_3 then
                if not l_result_3 then
                    v8.reportFailure(v8.ErrorType.validateTextureSize_TextureTooBig);
                    return false, {
                        "Your textures exceeds the max texture size limit for UGC upload requirements."
                    };
                end;
            else
                if not (not (v29 ~= nil) or not v29) then
                    error("Failed to execute validateTextureSize check");
                end;
                v8.reportFailure(v8.ErrorType.validateTextureSize_FailedToExecute);
                return false, {
                    "Failed to execute validateTextureSize check"
                };
            end;
        end;
        return true;
    end;
end;
if not v3() then
    return v34;
else
    return v26;
end;
