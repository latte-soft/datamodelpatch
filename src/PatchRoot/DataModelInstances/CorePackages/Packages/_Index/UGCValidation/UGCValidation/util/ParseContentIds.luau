local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Constants);
local v2 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v3 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local v4 = require(l_Parent_0.flags.getFFlagAddUGCValidationForPackage);
local v5 = require(l_Parent_0.flags.getFFlagFixPackageIDFieldName);
local v6 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local v7 = {};
local function _(v8)
    return (string.match(v8, "^rbxassetid://(%d+)$"));
end;
local function v11(v10)
    v10 = string.match(v10, "^https?://www%.(.+)") or string.match(v10, "^https?://(.+)");
    if v10 then
        v10 = string.match(v10, "^sitetest%d%.robloxlabs(.+)") or string.match(v10, "^roblox(.+)");
        if v10 then
            return (string.match(v10, "^%.com/asset/%?id=(%d+)$"));
        else
            return nil;
        end;
    else
        return nil;
    end;
end;
local function v13(v12)
    v12 = string.match(v12, "^https?://assetdelivery%.(.+)");
    if v12 then
        v12 = string.match(v12, "^sitetest%d%.robloxlabs(.+)") or string.match(v12, "^roblox(.+)");
        if v12 then
            return (string.match(v12, "^%.com/v1/asset/%?id=(%d+)$"));
        else
            return nil;
        end;
    else
        return nil;
    end;
end;
local function v16(v14)
    local v15 = nil;
    if v4() then
        v15 = tonumber(v14);
        if v15 ~= nil then
            if not v5() then
                return v15;
            else
                return (tostring(v15));
            end;
        end;
    end;
    v15 = string.match(v14, "^rbxassetid://(%d+)$");
    if v15 ~= nil then
        return v15;
    else
        v15 = v11(v14);
        if v15 ~= nil then
            return v15;
        else
            v15 = v13(v14);
            if v15 ~= nil then
                return v15;
            else
                return nil;
            end;
        end;
    end;
end;
local function _(v17, v18, v19)
    if v19 then
        if v19.allowEditableInstances then
            local v20 = v19.editableImages[v17];
            if not v20 or not v20[v18] then
                local v21 = v19.editableMeshes[v17];
                if not v21 or not v21[v18] then
                    return false;
                else
                    return true;
                end;
            else
                return true;
            end;
        else
            return false;
        end;
    else
        return false;
    end;
end;
local function v35(v23, v24, v25, v26, v27, v28, v29)
    local v30 = v26[v27];
    if v30 == "" then
        if not v28 then
            if not (not v3() or not v6()) then
                local v31;
                if v29 then
                    if v29.allowEditableInstances then
                        local v32 = v29.editableImages[v26];
                        if not v32 or not v32[v27] then
                            local v33 = v29.editableMeshes[v26];
                            v31 = not not v33 and (v33[v27] and true or false);
                        else
                            v31 = true;
                        end;
                    else
                        v31 = false;
                    end;
                else
                    v31 = false;
                end;
                if not (not v31 or not v25) then
                    table.insert(v25, {
                        fieldName = v27, 
                        instance = v26
                    });
                end;
            end;
            return true;
        else
            return false, {
                string.format("%s.%s cannot be empty", v26:GetFullName(), v27)
            };
        end;
    else
        local v34 = v16(v30);
        if v34 == nil then
            if not v3() then
                return false, {
                    string.format("Could not parse ContentId %s in %s.%s", v30, v26:GetFullName(), v27)
                };
            else
                return false, {
                    string.format("Could not parse ContentId %s in %s.%s. Please make sure you are using a valid URL with a valid ID.", v30, v26:GetFullName(), v27)
                };
            end;
        else
            if v24[v34] == nil then
                v24[v34] = {
                    fieldName = v27, 
                    instance = v26
                };
                table.insert(v23, v34);
            end;
            if v25 then
                table.insert(v25, {
                    fieldName = v27, 
                    instance = v26, 
                    id = v34
                });
            end;
            return true;
        end;
    end;
end;
local function v52(v36, v37, v38, v39, v40, v41, v42)
    v40 = v40 or v1.CONTENT_ID_FIELDS;
    local v43 = v2.new();
    local l_v39_Descendants_0 = v39:GetDescendants();
    table.insert(l_v39_Descendants_0, v39);
    for _, v46 in pairs(l_v39_Descendants_0) do
        local v47 = v40[v46.ClassName];
        if v47 then
            local v48 = v41 and v41[v46.ClassName];
            for _, v50 in ipairs(v47) do
                local v51 = v48 and v48[v50];
                if not v3() then
                    v43:updateReasons(v35(v36, v37, v38, v46, v50, v51));
                else
                    v43:updateReasons(v35(v36, v37, v38, v46, v50, v51, v42));
                end;
            end;
        end;
    end;
    return v43:getFinalResults();
end;
v7.tryGetAssetIdFromContentId = function(v53)
    return (v16(v53));
end;
v7.parseWithErrorCheck = function(v54, v55, v56, v57, v58)
    return v52(v54, v55, nil, v56, v57, v58);
end;
v7.parse = function(v59, v60, v61)
    local v62 = {};
    local v63 = {};
    local v64 = {};
    local _ = nil;
    assert(if not v3() then v52(v63, v62, v64, v59, v60) else v52(v63, v62, v64, v59, v60, nil, v61));
    return v64;
end;
return v7;
