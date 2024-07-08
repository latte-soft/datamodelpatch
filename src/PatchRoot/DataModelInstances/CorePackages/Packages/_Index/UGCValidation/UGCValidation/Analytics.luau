local l_Parent_0 = script.Parent;
local l_RunService_0 = game:GetService("RunService");
local v2 = if not l_RunService_0:IsStudio() then nil else game:GetService("StudioService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v4 = require(l_Parent_0.flags.getFFlagUGCValidationAnalytics);
local v5 = require(l_Parent_0.flags.getFFlagUGCValidateTestInactiveControls);
local v6 = require(l_Parent_0.flags.getFFlagUGCValidateAccessoriesScaleType);
local v7 = require(l_Parent_0.flags.getFFlagUGCValidationFixResetPhysicsError);
local function v12(...)
    local v8 = {};
    for v9 = 1, select("#", ...) do
        for v10, v11 in select(v9, ...) do
            v8[v10] = v11;
        end;
    end;
    return v8;
end;
local v13 = {
    ErrorType = {
        validateAccessoryName = "validateAccessoryName", 
        validateAssetBounds_AssetSizeTooBig = "validateAssetBounds_AssetSizeTooBig", 
        validateAssetBounds_AssetSizeTooSmall = "validateAssetBounds_AssetSizeTooSmall", 
        validateAssetBounds_InconsistentAvatarPartScaleType = "validateAssetBounds_InconsistentAvatarPartScaleType", 
        validateAssetBounds_InvalidAvatarPartScaleType = not v6() and "validateAssetBounds_InvalidAvatarPartScaleType" or nil, 
        validateScaleType_InvalidAvatarPartScaleType = if not v6() then nil else "validateScaleType_InvalidAvatarPartScaleType", 
        validateAssetCreator_DependencyNotOwnedByCreator = "validateAssetCreator_DependencyNotOwnedByCreator", 
        validateAssetCreator_FailedToLoad = "validateAssetCreator_FailedToLoad", 
        validateAssetCreator_TooManyDependencies = "validateAssetCreator_TooManyDependencies", 
        validateAttributes = "validateAttributes", 
        validateBodyPartChildAttachmentBounds_AttachmentRotated = "validateBodyPartChildAttachmentBounds_AttachmentRotated", 
        validateBodyPartChildAttachmentBounds_InvalidAttachmentPosition = "validateBodyPartChildAttachmentBounds_InvalidAttachmentPosition", 
        validateBodyPartCollisionFidelity = "validateBodyPartCollisionFidelity", 
        validateBodyPartMeshBounds_FailedToLoadMesh = "validateBodyPartMeshBounds_FailedToLoadMesh", 
        validateCageMeshIntersection_AverageOuterCageToMeshVertDistances = "validateCageMeshIntersection_AverageOuterCageToMeshVertDistances", 
        validateCageMeshIntersection_FailedToExecute = "validateCageMeshIntersection_FailedToExecute", 
        validateCageMeshIntersection_Intersection = "validateCageMeshIntersection_Intersection", 
        validateCageMeshIntersection_InvalidRefMeshId = "validateCageMeshIntersection_InvalidRefMeshId", 
        validateCageMeshIntersection_IrrelevantCageModified = "validateCageMeshIntersection_IrrelevantCageModified", 
        validateCageMeshIntersection_OuterCageFarExtendedFromMesh = "validateCageMeshIntersection_OuterCageFarExtendedFromMesh", 
        validateCageNonManifoldAndHoles_CageHoles = "validateCageNonManifoldAndHoles_CageHoles", 
        validateCageNonManifoldAndHoles_FailedToExecute = "validateCageNonManifoldAndHoles_FailedToExecute", 
        validateCageNonManifoldAndHoles_NonManifold = "validateCageNonManifoldAndHoles_NonManifold", 
        validateCageUVs_TestExecutedSuccessfully = "validateCageUVs_TestExecutedSuccessfully", 
        validateCageUVs_TestPassed = "validateCageUVs_TestPassed", 
        validateCageUVTriangleArea_FailedToLoadMesh = "validateCageUVTriangleArea_FailedToLoadMesh", 
        validateCageUVTriangleArea_ZeroAreaTriangle = "validateCageUVTriangleArea_ZeroAreaTriangle", 
        validateCageUVValues_FailedToLoadMesh = "validateCageUVValues_FailedToLoadMesh", 
        validateCageUVValues_UnexpectedUVValue = "validateCageUVValues_UnexpectedUVValue", 
        validateCanLoad = "validateCanLoad", 
        validateDependencies_IsNotApproved = "validateDependencies_IsNotApproved", 
        validateDependencies_IsRestrictedUserId = "validateDependencies_IsRestrictedUserId", 
        validateDependencies_IsReviewing = "validateDependencies_IsReviewing", 
        validateDependencies_ParseFailure = "validateDependencies_ParseFailure", 
        validateDescendantMeshMetrics_FailedToCalculateTriangles = "validateDescendantMeshMetrics_FailedToCalculateTriangles", 
        validateDescendantMeshMetrics_FailedToLoadMesh = "validateDescendantMeshMetrics_FailedToLoadMesh", 
        validateDescendantMeshMetrics_HasSkinnedMeshMismatch = "validateDescendantMeshMetrics_HasSkinnedMeshMismatch", 
        validateDescendantMeshMetrics_NoSkinningInfo = "validateDescendantMeshMetrics_NoSkinningInfo", 
        validateDescendantMeshMetrics_TooFarFromOrigin = "validateDescendantMeshMetrics_TooFarFromOrigin", 
        validateDescendantMeshMetrics_TooManyTriangles = "validateDescendantMeshMetrics_TooManyTriangles", 
        validateDynamicHeadMeshPartFormat_FailedToLoadMesh = "validateDynamicHeadMeshPartFormat_FailedToLoadMesh", 
        validateDynamicHeadMeshPartFormat_ValidateDynamicHeadMesh = "validateDynamicHeadMeshPartFormat_ValidateDynamicHeadMesh", 
        validateFullBody_IncorrectAssetTypeSet = "validateFullBody_IncorrectAssetTypeSet", 
        validateFullBody_InstancesMissing = "validateFullBody_InstancesMissing", 
        validateFullBodyCageDeletion_FailedToExecute = "validateFullBodyCageDeletion_FailedToExecute", 
        validateFullBodyCageDeletion_GeometryRemoved = "validateFullBodyCageDeletion_GeometryRemoved", 
        validateHSR_HSRDataNotReady = "validateHSR_HSRDataNotReady", 
        validateHSR_NoWrapLayer = "validateHSR_NoWrapLayer", 
        validateInstanceTree = "validateInstanceTree", 
        validateInstanceTree_InvalidDescendants = "validateInstanceTree_InvalidDescendants", 
        validateLayeredClothingAccessory_AssetTypeNotAllowedAsLayeredClothing = "validateLayeredClothingAccessory_AssetTypeNotAllowedAsLayeredClothing", 
        validateLayeredClothingAccessory_FailedToLoadMesh = "validateLayeredClothingAccessory_FailedToLoadMesh", 
        validateLayeredClothingAccessory_NoInnerCageId = "validateLayeredClothingAccessory_NoInnerCageId", 
        validateLayeredClothingAccessory_NoMeshId = "validateLayeredClothingAccessory_NoMeshId", 
        validateLayeredClothingAccessory_NoOuterCageId = "validateLayeredClothingAccessory_NoOuterCageId", 
        validateLayeredClothingAccessory_NoWrapLayer = "validateLayeredClothingAccessory_NoWrapLayer", 
        validateLayeredClothingAccessoryMeshPartAssetFormatMatch_MeshIdMismatch = "validateLayeredClothingAccessoryMeshPartAssetFormatMatch_MeshIdMismatch", 
        validateLayeredClothingAccessoryMeshPartAssetFormatMatch_TextureIdMismatch = "validateLayeredClothingAccessoryMeshPartAssetFormatMatch_TextureIdMismatch", 
        validateLegacyAccessoryMeshPartAssetFormatMatch_MeshIdMismatch = "validateLegacyAccessoryMeshPartAssetFormatMatch_MeshIdMismatch", 
        validateLegacyAccessoryMeshPartAssetFormatMatch_TextureIdMismatch = "validateLegacyAccessoryMeshPartAssetFormatMatch_TextureIdMismatch", 
        validateLimbsAndTorso_FolderInfoMismatch = "validateLimbsAndTorso_FolderInfoMismatch", 
        validateLimbsAndTorso_R6FolderHasChildren = "validateLimbsAndTorso_R6FolderHasChildren", 
        validateLimbsAndTorso_TopLevelFolders = "validateLimbsAndTorso_TopLevelFolders", 
        validateMaterials = "validateMaterials", 
        validateMeshBounds_FailedToExecute = "validateMeshBounds_FailedToExecute", 
        validateMeshBounds_FailedToLoadMesh = "validateMeshBounds_FailedToLoadMesh", 
        validateMeshBounds_TooLarge = "validateMeshBounds_TooLarge", 
        validateMeshComparison = "validateMeshComparison", 
        validateMeshPartAccessory_FailedToLoadMesh = "validateMeshPartAccessory_FailedToLoadMesh", 
        validateMeshPartAccessory_NoMeshId = "validateMeshPartAccessory_NoMeshId", 
        validateMeshPartBodyPart_ValidateWithSchema = "validateMeshPartBodyPart_ValidateWithSchema", 
        validateMeshTriangleArea_FailedToLoadMesh = "validateMeshTriangleArea_FailedToLoadMesh", 
        validateMeshTriangleArea_NoArea = "validateMeshTriangleArea_NoArea", 
        validateMeshTriangles_FailedToExecute = "validateMeshTriangles_FailedToExecute", 
        validateMeshTriangles_FailedToLoadMesh = "validateMeshTriangles_FailedToLoadMesh", 
        validateMeshTriangles_TooManyTriangles = "validateMeshTriangles_TooManyTriangles", 
        validateMeshVertexColors_FailedToLoadMesh = "validateMeshVertexColors_FailedToLoadMesh", 
        validateMeshVertexColors_NonNeutralVertexColors = "validateMeshVertexColors_NonNeutralVertexColors", 
        validateMisMatchUV_FailedToExecute = "validateMisMatchUV_FailedToExecute", 
        validateMisMatchUV_UVMismatch = "validateMisMatchUV_UVMismatch", 
        validateModeration_AssetsHaveNotPassedModeration = "validateModeration_AssetsHaveNotPassedModeration", 
        validateModeration_CouldNotFetchModerationDetails = "validateModeration_CouldNotFetchModerationDetails", 
        validateModeration_FailedToParse = "validateModeration_FailedToParse", 
        validateModeration_ValidateUser = "validateModeration_ValidateUser", 
        validateOverlappingVertices_FailedToExecute = "validateOverlappingVertices_FailedToExecute", 
        validateOverlappingVertices_OverlappingVertices = "validateOverlappingVertices_OverlappingVertices", 
        validatePackage_FailedToParse = "validatePackage_FailedToParse", 
        validateProperties_PropertyDoesNotExist = "validateProperties_PropertyDoesNotExist", 
        validateProperties_PropertyMismatch = "validateProperties_PropertyMismatch", 
        validateSingleInstance_MultipleInstances = "validateSingleInstance_MultipleInstances", 
        validateSingleInstance_ZeroInstances = "validateSingleInstance_ZeroInstances", 
        validateSurfaceAppearances_MeshPartHasTexture = "validateSurfaceAppearances_MeshPartHasTexture", 
        validateSurfaceAppearances_MissingSurfaceAppearance = "validateSurfaceAppearances_MissingSurfaceAppearance", 
        validateTags = "validateTags", 
        validateTextureSize_FailedToExecute = "validateTextureSize_FailedToExecute", 
        validateTextureSize_FailedToLoadTexture = "validateTextureSize_FailedToLoadTexture", 
        validateTextureSize_InvalidTextureId = "validateTextureSize_InvalidTextureId", 
        validateTextureSize_TextureTooBig = "validateTextureSize_TextureTooBig", 
        validateThumbnailConfiguration_InvalidTarget = "validateThumbnailConfiguration_InvalidTarget", 
        validateThumbnailConfiguration_OutsideView = "validateThumbnailConfiguration_OutsideView", 
        validateUVSpace_FailedToExecute = "validateUVSpace_FailedToExecute", 
        validateUVSpace_InvalidUVSpace = "validateUVSpace_InvalidUVSpace"
    }
};
if v5() then
    v13.ErrorType.validateDynamicHeadMeshPartFormat_ValidateDynamicHeadMeshControls = "validateDynamicHeadMeshPartFormat_ValidateDynamicHeadMeshControls";
end;
if v7() then
    v13.ErrorType.resetPhysicsData_FailedToLoadMesh = "resetPhysicsData_FailedToLoadMesh";
    v13.ErrorType.validateFullBody_MeshIdsMissing = "validateFullBody_MeshIdsMissing";
end;
setmetatable(v13.ErrorType, {
    __index = function(_, v15)
        return (("UNREGISTERED_%*"):format(v15));
    end
});
v13.metadata = {};
v13.setMetadata = function(v16)
    if v4() then
        local v17 = {};
        for v18, v19 in v16, nil, nil do
            v17[v18] = tostring(v19);
        end;
        v13.metadata = v17;
        return ;
    else
        return ;
    end;
end;
v13.reportFailure = function(v20, v21)
    if v4() then
        l_RbxAnalyticsService_0:SendEventDeferred(not l_RunService_0:IsStudio() and "rcc" or "studio", "ugcValidation", "failure", (v12(v13.metadata, v21 or {}, {
            errorType = v20, 
            studioSid = l_RbxAnalyticsService_0:GetSessionId(), 
            clientId = l_RbxAnalyticsService_0:GetClientId(), 
            placeId = game.PlaceId, 
            userId = not v2 and 0 or v2:GetUserId()
        })));
        return ;
    else
        return ;
    end;
end;
v13.reportThumbnailing = function(v22, v23)
    if v4() then
        l_RbxAnalyticsService_0:SendEventDeferred(not l_RunService_0:IsStudio() and "rcc" or "studio", "ugcValidation", "thumbnailing", (v12(v13.metadata, v23 or {}, {
            time = v22, 
            studioSid = l_RbxAnalyticsService_0:GetSessionId(), 
            clientId = l_RbxAnalyticsService_0:GetClientId(), 
            placeId = game.PlaceId, 
            userId = not v2 and 0 or v2:GetUserId()
        })));
        return ;
    else
        return ;
    end;
end;
return v13;
