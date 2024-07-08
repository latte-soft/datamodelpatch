local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.Analytics);
local v3 = require(l_Parent_0.Constants);
local v4 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v5 = require(l_Parent_0.util.prettyPrintVector3);
local v6 = require(l_Parent_0.util.floatEquals);
local v7 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local v8 = require(l_Parent_0.flags.getFFlagCheckOrientationOnAllAttachments);
local function v18(v9, v10, v11)
    local v12 = v10.Size / 2;
    local v13 = v9.CFrame.Position / v12;
    local l_min_0 = v11.min;
    local l_max_0 = v11.max;
    for _, v17 in {
        "X", 
        "Y", 
        "Z"
    }, nil, nil do
        if not (v13[v17] >= l_min_0[v17]) or l_max_0[v17] < v13[v17] then
            v2.reportFailure(v2.ErrorType.validateBodyPartChildAttachmentBounds_InvalidAttachmentPosition);
            if not v7() then
                return false, {
                    string.format("Attachment (%s) in %s, is at [%s] but must be within [%s] to [%s]", v9.Name, v10.Name, v5(v9.CFrame.Position), v5(l_min_0 * v12), v5(l_max_0 * v12))
                };
            else
                return false, {
                    string.format("Attachment (%s) in %s is placed at a position [%s] that is outside the valid range of ([%s] to [%s]). You need to adjust the attachment position.", v9.Name, v10.Name, v5(v9.CFrame.Position), v5(l_min_0 * v12), v5(l_max_0 * v12))
                };
            end;
        end;
    end;
    return true;
end;
local function v27(v19, _, v21)
    local v22 = v4.new();
    local l_v19_FirstChild_0 = v19:FindFirstChild(v21.rigAttachmentToParent.name);
    assert(l_v19_FirstChild_0);
    v22:updateReasons(v18(l_v19_FirstChild_0, v19, v21.rigAttachmentToParent.bounds));
    for v24, v25 in pairs(v21.otherAttachments) do
        local l_v19_FirstChild_1 = v19:FindFirstChild(v24);
        assert(l_v19_FirstChild_1);
        v22:updateReasons(v18(l_v19_FirstChild_1, v19, v25.bounds));
    end;
    return v22:getFinalResults();
end;
local function v36(v28)
    local v29 = v4.new();
    for _, v31 in v28:GetDescendants() do
        if not v8() then
            local v32 = false;
            if v31.ClassName == "Attachment" then
                v32 = string.find(v31.Name, "RigAttachment");
            end;
            if not v32 then
                continue;
            end;
        elseif not (v31.ClassName == "Attachment") then
            continue;
        end;
        local v33, v34, v35 = v31.CFrame:ToOrientation();
        if not (not (not v6(v33, 0) or not v6(v34, 0)) and v6(v35, 0)) then
            v2.reportFailure(v2.ErrorType.validateBodyPartChildAttachmentBounds_AttachmentRotated);
            if not v7() then
                v29:updateReasons(false, {
                    (("Attachment %*.%* should not be rotatedformat(v31.Parent.Name, v31.Name))
                });
            else
                v29:updateReasons(false, {
                    string.format("Detected rotation in Attachment '%s'. You must reset all rotation values for this attachment to zero.", v31:GetFullName())
                });
            end;
        end;
    end;
    return v29:getFinalResults();
end;
local function v46(v37, v38)
    local l_assetTypeEnum_0 = v38.assetTypeEnum;
    local l_isServer_0 = v38.isServer;
    local v41 = v3.ASSET_TYPE_INFO[l_assetTypeEnum_0];
    assert(v41);
    local v42 = v4.new();
    v42:updateReasons(v36(v37));
    if Enum.AssetType.DynamicHead == l_assetTypeEnum_0 then
        v42:updateReasons(v27(v37, l_isServer_0, v41.subParts.Head));
    else
        for v43, v44 in pairs(v41.subParts) do
            local l_v37_FirstChild_0 = v37:FindFirstChild(v43);
            assert(l_v37_FirstChild_0);
            v42:updateReasons(v27(l_v37_FirstChild_0, l_isServer_0, v44));
        end;
    end;
    return v42:getFinalResults();
end;
local function v55(v47, v48, v49)
    local v50 = v3.ASSET_TYPE_INFO[v48];
    assert(v50);
    local v51 = v4.new();
    v51:updateReasons(v36(v47));
    if Enum.AssetType.DynamicHead == v48 then
        v51:updateReasons(v27(v47, v49, v50.subParts.Head));
    else
        for v52, v53 in pairs(v50.subParts) do
            local l_v47_FirstChild_0 = v47:FindFirstChild(v52);
            assert(l_v47_FirstChild_0);
            v51:updateReasons(v27(l_v47_FirstChild_0, v49, v53));
        end;
    end;
    return v51:getFinalResults();
end;
if not v7() then
    return v55;
else
    return v46;
end;
