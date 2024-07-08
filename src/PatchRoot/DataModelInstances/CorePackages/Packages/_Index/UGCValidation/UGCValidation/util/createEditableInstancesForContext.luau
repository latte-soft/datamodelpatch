local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Constants);
local l_AssetService_0 = game:GetService("AssetService");
local _ = require(l_Parent_0.util.Types);
local v4 = require(l_Parent_0.util.destroyEditableInstances);
local function v20(v5, v6, v7, v8, v9, v10)
    local v11 = true;
    if v7 ~= "EditableMesh" then
        v11 = v7 == "EditableImage";
    end;
    assert(v11, "Wrong class type provided to getOrCreateEditableInstances");
    local v12 = v6[v5.ClassName];
    if v12 then
        for _, v14 in v12, nil, nil do
            local v15 = v5[v14];
            local l_v5_FirstChildOfClass_0 = v5:FindFirstChildOfClass(v7);
            local v17 = false;
            if not (l_v5_FirstChildOfClass_0 and v9) then
                if v15 and v15 ~= "" then
                    l_v5_FirstChildOfClass_0 = v10[v15];
                    if not l_v5_FirstChildOfClass_0 then
                        local l_status_0, l_result_0 = pcall(function()
                            if v7 == "EditableMesh" then
                                return l_AssetService_0:CreateEditableMeshStripSkinningAsync(v15);
                            else
                                return l_AssetService_0:CreateEditableImageAsync(v15);
                            end;
                        end);
                        if l_status_0 then
                            v17 = true;
                            l_v5_FirstChildOfClass_0 = l_result_0;
                            v10[v15] = l_v5_FirstChildOfClass_0;
                        else
                            return l_status_0, l_result_0;
                        end;
                    end;
                else
                    continue;
                end;
            end;
            if not v8[v5] then
                v8[v5] = {};
            end;
            v8[v5][v14] = {
                instance = l_v5_FirstChildOfClass_0, 
                created = v17
            };
        end;
    end;
    return true;
end;
return function(v21, v22)
    local l_MESH_CONTENT_ID_FIELDS_0 = v1.MESH_CONTENT_ID_FIELDS;
    local l_TEXTURE_CONTENT_ID_FIELDS_0 = v1.TEXTURE_CONTENT_ID_FIELDS;
    local v25 = {
        editableMeshes = {}, 
        editableImages = {}
    };
    local v26 = {};
    for _, v28 in v21, nil, nil do
        local l_v28_Descendants_0 = v28:GetDescendants();
        table.insert(l_v28_Descendants_0, v28);
        for _, v31 in pairs(l_v28_Descendants_0) do
            local v32, v33 = v20(v31, l_MESH_CONTENT_ID_FIELDS_0, "EditableMesh", v25.editableMeshes, v22, v26);
            if v32 then
                local v34, v35 = v20(v31, l_TEXTURE_CONTENT_ID_FIELDS_0, "EditableImage", v25.editableImages, v22, v26);
                v32 = v34;
                v33 = v35;
                if not v32 then
                    v4(v25.editableMeshes, v25.editableImages);
                    return false, {
                        v33
                    };
                end;
            else
                v4(v25.editableMeshes, v25.editableImages);
                return false, {
                    v33
                };
            end;
        end;
    end;
    return true, v25;
end;
