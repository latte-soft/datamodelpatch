local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local v4 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local function v15(v5)
    local v6 = nil;
    v6 = if not v4() then l_UGCValidationService_0:GetMeshVerts(v5.contentId) else l_UGCValidationService_0:GetEditableMeshVerts(v5.editableMesh);
    local l_huge_0 = math.huge;
    local v8 = -math.huge;
    local l_huge_1 = math.huge;
    local v10 = -math.huge;
    local l_huge_2 = math.huge;
    local v12 = -math.huge;
    for v13 = 1, #v6 do
        local v14 = v6[v13];
        l_huge_0 = math.min(l_huge_0, v14.X);
        l_huge_1 = math.min(l_huge_1, v14.Y);
        l_huge_2 = math.min(l_huge_2, v14.Z);
        v8 = math.max(v8, v14.X);
        v10 = math.max(v10, v14.Y);
        v12 = math.max(v12, v14.Z);
    end;
    return (Vector3.new(v8 - l_huge_0, v10 - l_huge_1, v12 - l_huge_2));
end;
local function v26(v16)
    local l_l_UGCValidationService_0_MeshVerts_0 = l_UGCValidationService_0:GetMeshVerts(v16);
    local l_huge_3 = math.huge;
    local v19 = -math.huge;
    local l_huge_4 = math.huge;
    local v21 = -math.huge;
    local l_huge_5 = math.huge;
    local v23 = -math.huge;
    for v24 = 1, #l_l_UGCValidationService_0_MeshVerts_0 do
        local v25 = l_l_UGCValidationService_0_MeshVerts_0[v24];
        l_huge_3 = math.min(l_huge_3, v25.X);
        l_huge_4 = math.min(l_huge_4, v25.Y);
        l_huge_5 = math.min(l_huge_5, v25.Z);
        v19 = math.max(v19, v25.X);
        v21 = math.max(v21, v25.Y);
        v23 = math.max(v23, v25.Z);
    end;
    return (Vector3.new(v19 - l_huge_3, v21 - l_huge_4, v23 - l_huge_5));
end;
if not v3() then
    return v26;
else
    return v15;
end;
