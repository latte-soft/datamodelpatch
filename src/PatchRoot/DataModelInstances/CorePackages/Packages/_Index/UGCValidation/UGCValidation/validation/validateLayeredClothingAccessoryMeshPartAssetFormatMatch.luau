local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local v2 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
return function(v3, v4)
    local l_Handle_0 = v3:FindFirstChild("Handle");
    assert(l_Handle_0 and l_Handle_0:IsA("MeshPart"));
    local l_Handle_1 = v4:FindFirstChild("Handle");
    assert(l_Handle_1 and l_Handle_1:IsA("MeshPart"));
    if l_Handle_0.MeshId ~= l_Handle_1.MeshId then
        v1.reportFailure(v1.ErrorType.validateLayeredClothingAccessoryMeshPartAssetFormatMatch_MeshIdMismatch);
        if not v2() then
            return false, {
                "MeshPart.MeshId did not match SpecialMesh.MeshId"
            };
        else
            return false, {
                string.format("Model meshId mismatch between MeshPart.MeshId and SpecialMesh.MeshId for %s. You need to match the meshIds and try again.", v3.Name)
            };
        end;
    elseif l_Handle_0.TextureID ~= l_Handle_1.TextureID then
        v1.reportFailure(v1.ErrorType.validateLayeredClothingAccessoryMeshPartAssetFormatMatch_TextureIdMismatch);
        if not v2() then
            return false, {
                "MeshPart.TextureID did not match SpecialMesh.TextureId"
            };
        else
            return false, {
                string.format("Model textureId mismatch between MeshPart.TextureID and SpecialMesh.TextureId for %s. You need to match the textureIds and try again.", v3.Name)
            };
        end;
    else
        return true;
    end;
end;
