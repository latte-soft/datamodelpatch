local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.Constants);
local v3 = require(l_Parent_0.validation.validateTextureSize);
local v4 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v5 = require(l_Parent_0.util.ParseContentIds);
local v6 = require(l_Parent_0.util.getEditableImageFromContext);
local v7 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local v8 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local function v19(v9, v10)
    local v11 = v4.new();
    local v12 = v5.parse(v9, v2.TEXTURE_CONTENT_ID_FIELDS, v10);
    local v13 = {};
    for _, v15 in v12, nil, nil do
        local v16 = {
            fullName = v15.instance:GetFullName(), 
            fieldName = v15.fieldName, 
            contentId = v15.instance[v15.fieldName]
        };
        if v8() then
            local v17, v18 = v6(v15.instance, v15.fieldName, v10);
            if v17 then
                v16.editableImage = v18;
            else
                return false, {
                    "Failed to load texture data"
                };
            end;
        end;
        if not v13[v15.id] then
            v11:updateReasons(v3(v16, nil, v10));
            if v15.id then
                v13[v15.id] = true;
            end;
        end;
    end;
    return v11:getFinalResults();
end;
local function v27(v20, v21)
    local v22 = v4.new();
    local v23 = v5.parse(v20, v2.TEXTURE_CONTENT_ID_FIELDS);
    local v24 = {};
    for _, v26 in v23, nil, nil do
        if not v24[v26.id] then
            v22:updateReasons(v3(v26.instance[v26.fieldName], nil, v21));
            v24[v26.id] = true;
        end;
    end;
    return v22:getFinalResults();
end;
if not v7() then
    return v27;
else
    return v19;
end;
