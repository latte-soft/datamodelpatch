local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.Analytics);
local v4 = require(l_Parent_0.util.ParseContentIds);
local v5 = require(l_Parent_0.util.getMeshMinMax);
local function v11(v6, v7, v8)
    local function _(v9)
        return (not not v9.context and v9.context .. " mesh " or "mesh ") .. v4.tryGetAssetIdFromContentId(v9.contentId);
    end;
    return string.format("%s is more than max difference %.2f in size compared to the other mesh %s. You need to edit the model to adjust its size", (not not v6.context and v6.context .. " mesh " or "mesh ") .. v4.tryGetAssetIdFromContentId(v6.contentId), v8, (not not v7.context and v7.context .. " mesh " or "mesh ") .. v4.tryGetAssetIdFromContentId(v7.contentId));
end;
local function v17(v12, v13, v14)
    local function _(v15)
        return (not not v15.context and v15.context .. " mesh " or "mesh ") .. v4.tryGetAssetIdFromContentId(v15.id);
    end;
    return string.format("%s is more than %.2f different in size to %s", (not not v12.context and v12.context .. " mesh " or "mesh ") .. v4.tryGetAssetIdFromContentId(v12.id), v14, (not not v13.context and v13.context .. " mesh " or "mesh ") .. v4.tryGetAssetIdFromContentId(v13.id));
end;
local function v30(v18, v19, v20, v21)
    local v22, v23, v24, v25 = v5(v18, v21);
    if v22 then
        local v26, v27, v28, v29 = v5(v19, v21);
        if v26 then
            if not (v20 >= (v24 - v28).Magnitude) or v20 < (v25 - v29).Magnitude then
                v3.reportFailure(v3.ErrorType.validateMeshComparison);
                return false, {
                    v11(v18, v19, v20)
                };
            else
                return true;
            end;
        else
            return v26, v27;
        end;
    else
        return v22, v23;
    end;
end;
local function v43(v31, v32, v33, v34)
    local v35, v36, v37, v38 = v5(v31.id, v34, v31.scale);
    if v35 then
        local v39, v40, v41, v42 = v5(v32.id, v34, v32.scale);
        if v39 then
            if not (v33 >= (v37 - v41).Magnitude) or v33 < (v38 - v42).Magnitude then
                v3.reportFailure(v3.ErrorType.validateMeshComparison);
                return false, {
                    v17(v31, v32, v33)
                };
            else
                return true;
            end;
        else
            return v39, v40;
        end;
    else
        return v35, v36;
    end;
end;
if not v1() then
    return v43;
else
    return v30;
end;
